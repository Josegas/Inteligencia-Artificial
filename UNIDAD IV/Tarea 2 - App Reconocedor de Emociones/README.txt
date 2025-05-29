Detector de Emociones con Deep Learning (FER2013)

Este proyecto implementa un sistema de detección de emociones faciales usando una red neuronal convolucional (CNN) entrenada sobre el dataset FER2013. Permite entrenar, evaluar y realizar inferencia en tiempo real de emociones a partir de imágenes o webcam.

Tabla de Contenidos
-------------------
- Descripción General
- Estructura del Proyecto
- Requisitos y Librerías
- Dataset Utilizado
- Funcionamiento de las Clases Principales
- Entrenamiento del Modelo
- Evaluación y Pruebas
- Inferencia en Tiempo Real
- Reconocimiento Facial
- Créditos

Descripción General
------------------
Este sistema detecta emociones en rostros humanos a partir de imágenes o video en tiempo real. Utiliza una CNN personalizada (Deep_Emotion) entrenada con el dataset FER2013 y emplea el clasificador Haar Cascade (haarcascade_frontalface_default.xml) para la detección de rostros.

Estructura del Proyecto
----------------------
- cnn_modelo.py: Define la arquitectura de la CNN Deep_Emotion.
- data_loaders.py: Carga y preprocesa las imágenes para PyTorch.
- config.py: Configuración global de rutas, hiperparámetros y etiquetas.
- entrenarModelo.py: Script para entrenar el modelo.
- probar_modelo.py: Script para evaluar el modelo en el set de test.
- preProcesarDataset.py: Preprocesa y aumenta el dataset usando Albumentations y FiftyOne.
- webCam_DTEmociones.py: Realiza inferencia en tiempo real usando la webcam.
- haarcascade_frontalface_default.xml: Archivo XML para la detección de rostros con OpenCV.
- fer2013_raw/: Carpeta con el dataset original (train/test).
- fer2013_augmented_data/: Carpeta con imágenes aumentadas para entrenamiento.
- models/: Carpeta donde se guardan los pesos del modelo entrenado.

Requisitos y Librerías
----------------------
- Python 3.8+
- PyTorch: Framework principal para deep learning.
- Torchvision: Transforms y utilidades para imágenes.
- Albumentations: Aumento de datos para imágenes.
- FiftyOne: Visualización y manejo de datasets.
- OpenCV: Detección de rostros y manejo de imágenes.
- Pillow: Procesamiento de imágenes.
- NumPy: Operaciones numéricas.
- Matplotlib/Seaborn: Visualización de resultados y matrices de confusión.
- scikit-learn: Métricas de evaluación.

Instala las dependencias principales con:
pip install torch torchvision albumentations fiftyone opencv-python pillow numpy matplotlib seaborn scikit-learn

Dataset Utilizado
-----------------
- FER2013: Dataset de emociones faciales con imágenes de 48x48 píxeles en escala de grises, dividido en carpetas por emoción (angry, disgust, fear, happy, neutral, sad, surprise).
  Link Dataset: https://www.kaggle.com/datasets/msambare/fer2013
- Haar Cascade: Se utiliza el archivo haarcascade_frontalface_default.xml de OpenCV para la detección de rostros en imágenes y video.

Funcionamiento de las Clases Principales
----------------------------------------
- Deep_Emotion (cnn_modelo.py): Clase que define la arquitectura de la CNN para clasificación de emociones. Recibe imágenes de 1 canal (48x48) y predice una de las 7 emociones.
- EmotionDataset (data_loaders.py): Dataset personalizado de PyTorch que carga imágenes desde carpetas organizadas por emoción y aplica transformaciones.
- get_dataloaders (data_loaders.py): Devuelve los DataLoaders de entrenamiento y validación/test listos para usar en PyTorch.

Entrenamiento del Modelo
------------------------
1. Preprocesa y aumenta el dataset con preProcesarDataset.py.
2. Entrena el modelo ejecutando entrenarModelo.py. Los pesos se guardan en la carpeta models/.

Evaluación y Pruebas
--------------------
- Ejecuta probar_modelo.py para evaluar el modelo entrenado sobre el set de test. Se muestra la precisión, el reporte de clasificación y la matriz de confusión.

Inferencia en Tiempo Real
-------------------------
- Ejecuta webCam_DTEmociones.py para detectar emociones en tiempo real usando la webcam. El sistema detecta rostros, los preprocesa y muestra la emoción predicha sobre el video.

Reconocimiento Facial
---------------------
- El sistema utiliza el archivo haarcascade_frontalface_default.xml de OpenCV para localizar rostros antes de la inferencia de emociones.

Créditos
--------
- Basado en el dataset FER2013 y el clasificador Haar Cascade de OpenCV.
- Autores: Sebastian Verdugo Bermudez 
           Jose Angel Garcia Perez
- Proyecto académico para la materia de Inteligencia Artificial.
