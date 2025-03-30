import os
import numpy as np
import pandas as pd
from kaggle.api.kaggle_api_extended import KaggleApi
import nltk
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, precision_score, recall_score
import tkinter as tk
from tkinter import messagebox
import re

# Descargar recursos necesarios de NLTK
nltk.download('stopwords')
nltk.download('punkt')

# Ruta del dataset
path = "spam-assassin-email-classification-dataset"
dataset_file = os.path.join(path, "spam_assassin.csv")

# Descargar el dataset de Kaggle si no existe
if not os.path.exists(dataset_file):
    print("El archivo 'spam_assassin.csv' no se encontró. Intentando descargar el dataset...")
    try:
        api = KaggleApi()
        api.authenticate()
        api.dataset_download_files("ganiyuolalekan/" + path, path=path, unzip=True)
        print("Dataset descargado y descomprimido correctamente.")
    except Exception as e:
        print(f"Error al descargar el dataset: {e}")
        exit()

# Verificar nuevamente si el archivo existe
if not os.path.exists(dataset_file):
    print("El archivo 'spam_assassin.csv' no se encuentra en la ruta especificada. Por favor, descárgalo manualmente desde:")
    print("https://www.kaggle.com/datasets/ganiyuolalekan/spam-assassin-email-classification-dataset")
    exit()

# Cargar los datos
df = pd.read_csv(dataset_file)

# Limpieza de datos
df.drop_duplicates(inplace=True)
df.dropna(subset=['text'], inplace=True)
df = df.reset_index(drop=True)  # IMPORTANTE: Resetear índices

# Función mejorada de preprocesamiento
def preprocess_text(text):
    text = str(text).lower()  # Asegurarse que es string
    text = re.sub(r'[^\w\s]', ' ', text)  # Reemplazar símbolos con espacio
    text = re.sub(r'\s+', ' ', text).strip()  # Eliminar espacios extra
    return text

# Aplicar preprocesamiento
df['text'] = df['text'].apply(preprocess_text)

# Verificar textos vacíos
empty_texts = df[df['text'] == '']
print(f"Textos vacíos después del preprocesamiento: {len(empty_texts)}")

# Vectorización
vectorizer = CountVectorizer(stop_words='english')
X = vectorizer.fit_transform(df['text'])

# Verificar vocabulario
vocab = vectorizer.get_feature_names_out()
print(f"Vocabulario creado ({len(vocab)} palabras)")

# Dividir datos (conservando la alineación de índices)
X_train, X_test, y_train, y_test = train_test_split(
    X, df['target'], test_size=0.2, random_state=42)

# Calcular probabilidades
p_spam = df['target'].mean()
p_no_spam = 1 - p_spam

# Separar en spam y no spam
mask_spam = (df['target'] == 1).values
mask_no_spam = (df['target'] == 0).values
X_spam = X[mask_spam]
X_no_spam = X[mask_no_spam]

# Calcular frecuencias
frec_spam = X_spam.sum(axis=0).A1
frec_no_spam = X_no_spam.sum(axis=0).A1
total_palabras_spam = frec_spam.sum()
total_palabras_no_spam = frec_no_spam.sum()

# Probabilidades con suavizado Laplace
alpha = 1
p_palabra_spam = (frec_spam + alpha) / (total_palabras_spam + alpha * len(vocab))
p_palabra_no_spam = (frec_no_spam + alpha) / (total_palabras_no_spam + alpha * len(vocab))

# Sistema de Reglas Mejorado
class SpamRules:
    @staticmethod
    def check_spam_rules(text):
        # Lista de dominios sospechosos
        suspicious_domains = ['offer', 'prize', 'win', 'free', 'discount', 
                            'click', 'bonus', 'deal', 'promo', 'security',
                            'alert', 'verify', 'account', 'bank', 'login']
        
        # Patrones básicos seguros (sin paréntesis complejos)
        patterns = {
            # Patrones originales simplificados
            'excessive_caps': r'[A-Z]{4,}',
            'urgent_language': r'(urgent|immediate|action required|limited time)',
            'money_mention': r'(\$\d+|\d+\s*(dollars|usd|euros))',
            'suspicious_url': r'(bit\.ly|goo\.gl|tinyurl|shorte\.st)',
            'unusual_sender': r'@(' + '|'.join(suspicious_domains) + ')\.',
            'spam_keywords': r'(winner|prize|award|free|guarantee|risk-free)',
            
            # Patrones de phishing simplificados
            'phishing_greeting': r'(dear customer|valued member|account holder|dear user)',
            'account_alert': r'(account alert|account suspension|account verification|security alert)',
            'login_request': r'(log in|sign in|verify|update your account|update your information)',
            'fake_threat': r'(suspend|close your account|terminate|unauthorized access)',
            'phishing_domain': r'\.(xyz|info|top|gq|tk|cf|ml|ga|pw|cc|club|site)',
            'impersonation': r'(security team|security department|customer support|account support)',
            'time_limit': r'(within \d+ hours|expires in|limited time)'
        }
        
        # Contador de coincidencias seguro
        rule_matches = {}
        for name, pattern in patterns.items():
            try:
                rule_matches[name] = len(re.findall(pattern, text, re.IGNORECASE))
            except:
                rule_matches[name] = 0
                print(f"Error en patrón: {name} - {pattern}")
        
        # Pesos seguros
        weights = {
            'excessive_caps': 0.5,
            'urgent_language': 1.0,
            'money_mention': 1.2,
            'suspicious_url': 2.0,
            'unusual_sender': 2.5,
            'spam_keywords': 0.8,
            'phishing_greeting': 1.5,
            'account_alert': 2.0,
            'login_request': 1.8,
            'fake_threat': 2.5,
            'phishing_domain': 3.0,
            'impersonation': 2.0,
            'time_limit': 1.5
        }
        
        # Cálculo seguro de puntuación
        total_score = 0
        for name, count in rule_matches.items():
            if name in ['excessive_caps', 'spam_keywords']:
                total_score += min(count, 5) * weights[name]
            else:
                total_score += min(count, 3) * weights[name]
        
        # Detección de phishing (patrones clave)
        phishing_keywords = ['phishing_greeting', 'account_alert', 'login_request',
                            'fake_threat', 'phishing_domain', 'impersonation']
        phishing_score = sum(rule_matches[key] * weights[key] for key in phishing_keywords)
        
        return phishing_score >= 4.0 or total_score >= 5.0

# Función de predicción
def predecir_spam(texto):
    # Preprocesamiento
    texto_procesado = preprocess_text(texto)
    
    # 1. Verificación de reglas heurísticas
    reglas_spam = SpamRules.check_spam_rules(texto)
    
    # 2. Predicción del modelo Naive Bayes
    texto_vectorizado = vectorizer.transform([texto_procesado])
    palabras_presentes = texto_vectorizado.nonzero()[1]
    
    log_prob_spam = np.log(p_spam)
    log_prob_no_spam = np.log(p_no_spam)
    
    for palabra_idx in palabras_presentes:
        log_prob_spam += np.log(p_palabra_spam[palabra_idx])
        log_prob_no_spam += np.log(p_palabra_no_spam[palabra_idx])
    
    prob_spam = np.exp(log_prob_spam)
    prob_no_spam = np.exp(log_prob_no_spam)
    prob_modelo = prob_spam / (prob_spam + prob_no_spam)
    
    # Combinación inteligente (70% modelo, 30% reglas)
    combined_score = 0.7 * prob_modelo + 0.3 * float(reglas_spam)
    
    # Umbral ajustado para reducir falsos positivos
    return combined_score > 0.65

# Predecir usando los índices correctos
y_pred = [predecir_spam(texto) for texto in df.loc[y_test.index, 'text']]

# Métricas
accuracy = accuracy_score(y_test, y_pred)
precision = precision_score(y_test, y_pred)
recall = recall_score(y_test, y_pred)

print(f"\nMétricas de evaluación:")
print(f"Accuracy: {accuracy:.4f}")
print(f"Precision: {precision:.4f}")
print(f"Recall: {recall:.4f}")

# Interfaz gráfica
def predecir_spam_interface():
    root = tk.Tk()
    root.title("Clasificador de Spam")

    def clasificar_correo():
        texto = texto_entrada.get("1.0", tk.END).strip()
        print(texto)
        if not texto:
            messagebox.showwarning("Advertencia", "Por favor ingrese un texto para clasificar")
            return
            
        if predecir_spam(texto):
            messagebox.showinfo("Resultado", "Este correo es SPAM.")
        else:
            messagebox.showinfo("Resultado", "Este correo NO es SPAM.")

    etiqueta = tk.Label(root, text="Introduce el contenido del correo:")
    etiqueta.pack()

    texto_entrada = tk.Text(root, width=50, height=10)
    texto_entrada.pack()

    boton_clasificar = tk.Button(root, text="Clasificar Correo", command=clasificar_correo)
    boton_clasificar.pack()

    root.mainloop()

# Iniciar interfaz
print("\nIniciando interfaz gráfica...")
predecir_spam_interface()