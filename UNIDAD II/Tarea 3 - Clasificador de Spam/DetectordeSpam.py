from sklearn.metrics import accuracy_score, precision_score, recall_score
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
import numpy as np
import pandas as pd
from kaggle.api.kaggle_api_extended import KaggleApi
import nltk
# Ajusta la ruta si es necesario

# nltk.data.path.append(r"C:\Users\Jose Garcia\AppData\Roaming\nltk_data")
# nltk.download('punkt')
# nltk.data.find('tokenizers/punkt')
nltk.download('punkt_tab')

# Descargar el dataset de Kaggle
api = KaggleApi()
api.authenticate()
path = "spam-assassin-email-classification-dataset"
api.dataset_download_files("ganiyuolalekan/" + path, path=path, unzip=True)

# Cargar los datos
df = pd.read_csv(path + "/spam_assassin.csv")

# Borrar emails duplicados y manejar valores nulos
df.drop_duplicates(inplace=True)
df.dropna(subset=['text'], inplace=True)

# Convertir el texto a minúsculas y eliminar caracteres especiales
df['text'] = df['text'].str.lower().str.replace(r'[^\w\s]', '', regex=True)

# Eliminar palabras vacías
nltk.download('stopwords')
stop_words = set(stopwords.words('english'))
df['text'] = df['text'].apply(lambda x: ' '.join(
    [word for word in x.split() if word not in stop_words]))

# Tokenizar
nltk.download('punkt')
df['text'] = df['text'].apply(lambda x: ' '.join(
    word_tokenize(x)))  # Convertir tokens a texto

# Convertir la columna 'spam' a 0 y 1 si es necesario
if 'spam' in df.columns:
    df['spam'] = df['spam'].map({'ham': 0, 'spam': 1})
    df.dropna(subset=['spam'], inplace=True)
else:
    print("⚠️ La columna 'spam' no existe en el dataset")

# **Vectorización con TF-IDF**
vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform(df['text'])

# **Dividir datos en entrenamiento y prueba**
X_train, X_test, y_train, y_test = train_test_split(
    X, df['target'], test_size=0.2, random_state=42)

# Calcular P(Spam) = número de correos spam / total de correos
p_spam = df['target'].mean()  # Esto equivale a sum(df['spam']) / len(df)
p_no_spam = 1 - p_spam


# Unir tokens de nuevo en texto (para CountVectorizer)
df['text_joined'] = df['text'].apply(lambda x: ' '.join(x))

# Vectorizar (contar frecuencias de palabras)
vectorizer = CountVectorizer()
X = vectorizer.fit_transform(df['text_joined'])
vocabulario = vectorizer.get_feature_names_out()

# Separar en spam y no spam
X_spam = X[df['target'] == 1]  # Datos de spam
X_no_spam = X[df['target'] == 0]  # Datos de no spam

# Calcular frecuencias de palabras en spam y no spam
frec_spam = X_spam.sum(axis=0).A1  # Suma por palabra en spam
frec_no_spam = X_no_spam.sum(axis=0).A1  # Suma por palabra en no spam

# Total de palabras en spam y no spam
total_palabras_spam = frec_spam.sum()
total_palabras_no_spam = frec_no_spam.sum()

# Calcular P(palabra|spam) y P(palabra|no_spam) con suavizado de Laplace (evitar divisiones por cero)
alpha = 1  # Suavizado (Laplace)
p_palabra_spam = (frec_spam + alpha) / \
    (total_palabras_spam + alpha * len(vocabulario))
p_palabra_no_spam = (frec_no_spam + alpha) / \
    (total_palabras_no_spam + alpha * len(vocabulario))


def predecir_spam(texto):
    # Vectorizar el texto (usando el mismo vocabulario)
    texto_vectorizado = vectorizer.transform([texto])
    # Índices de palabras presentes
    palabras_presentes = texto_vectorizado.nonzero()[1]

    # Calcular log-probabilidades (para evitar underflow numérico)
    log_prob_spam = np.log(p_spam)
    log_prob_no_spam = np.log(p_no_spam)

    for palabra_idx in palabras_presentes:
        log_prob_spam += np.log(p_palabra_spam[palabra_idx])
        log_prob_no_spam += np.log(p_palabra_no_spam[palabra_idx])

    # Convertir log-probs a probabilidades
    prob_spam = np.exp(log_prob_spam)
    prob_no_spam = np.exp(log_prob_no_spam)

    # Normalizar
    prob_spam_normalizada = prob_spam / (prob_spam + prob_no_spam)
    return prob_spam_normalizada > 0.5  # Clasificar como spam si > 50%


# Predecir sobre el conjunto de prueba
y_pred = [predecir_spam(' '.join(texto)) for texto in df['text']]

# Métricas de evaluación

accuracy = accuracy_score(df['target'], y_pred)
precision = precision_score(df['target'], y_pred)
recall = recall_score(df['target'], y_pred)

print(f"Accuracy: {accuracy:.2f}")
# Correos clasificados como spam que son spam
print(f"Precision: {precision:.2f}")
print(f"Recall: {recall:.2f}")  # De todos los spam reales, cuántos detectamos

correo_ejemplo = "win free money now"
# Probablemente devuelva True
print("¿Es spam?", predecir_spam(correo_ejemplo))
