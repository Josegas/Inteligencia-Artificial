# Clasificador de Spam con Reglas Heurísticas y Naive Bayes

# Descripción

Este proyecto implementa un clasificador de correos electrónicos como spam o no spam utilizando una combinación de reglas heurísticas y el modelo de Naive Bayes. El clasificador se entrena utilizando un conjunto de datos de Kaggle y evalúa los correos electrónicos en función de su contenido textual y patrones específicos asociados al spam.

# Funcionalidades:
- Preprocesamiento de textos: Convierte el texto a minúsculas, elimina caracteres especiales y elimina espacios innecesarios.
- Vectorización: Usa el CountVectorizer de scikit-learn para transformar los textos en vectores de características basados en las palabras presentes en cada correo electrónico.
- Modelo Naive Bayes: Calcula la probabilidad de que un correo sea spam o no spam utilizando el modelo de Naive Bayes con suavizado de Laplace.
- Reglas Heurísticas: Aplica un conjunto de reglas basadas en patrones comunes de spam (por ejemplo, palabras clave como "ganador", "oferta", "gratis", dominios sospechosos, etc.).
- Interfaz gráfica: Utiliza tkinter para crear una interfaz gráfica donde los usuarios pueden ingresar el contenido de un correo y obtener una clasificación de si es spam o no spam.

# Dataset Utilizado:
El conjunto de datos utilizado es el *Spam Assassin Email Classification Dataset*, disponible en Kaggle. Este conjunto contiene ejemplos de correos electrónicos clasificados como spam o no spam, lo que permite entrenar un clasificador de texto.

Enlace al conjunto de datos:  
[Spam Assassin Email Classification Dataset](https://www.kaggle.com/datasets/ganiyuolalekan/spam-assassin-email-classification-dataset)

# Librerías Utilizadas

Este proyecto utiliza varias librerías de Python para el procesamiento de datos, la creación del modelo y la interfaz gráfica.

# 1. pandas:
   - Utilizada para la manipulación de datos y la carga del dataset.
   - Permite manejar el dataset en forma de DataFrame para facilitar su preprocesamiento.

# 2. numpy:
   - Utilizada para operaciones matemáticas y manipulaciones de matrices, como el cálculo de probabilidades.

# 3. scikit-learn:
   - CountVectorizer: Convierte los correos electrónicos en vectores numéricos basados en las palabras presentes en los textos.
   - train_test_split: Divide el conjunto de datos en un conjunto de entrenamiento y uno de prueba.
   - Naive Bayes: Implementación del modelo Naive Bayes para clasificación.

# 4. nltk:
   - stopwords: Librería de procesamiento de lenguaje natural para eliminar palabras comunes (como "y", "el", "de") que no aportan valor al análisis.
   - punkt: Tokenizador que divide el texto en palabras o frases.

# 5. tkinter:
   - Utilizada para crear la interfaz gráfica de usuario (GUI), permitiendo a los usuarios ingresar un texto y clasificarlo como spam o no spam.

# 6. re (Expresiones regulares):
   - Se utiliza para identificar patrones comunes de spam (como la presencia de palabras clave o URLs sospechosas) en los correos electrónicos.