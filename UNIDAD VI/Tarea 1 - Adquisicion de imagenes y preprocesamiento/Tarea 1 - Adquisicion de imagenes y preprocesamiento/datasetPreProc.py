# import fiftyone as fo
# import fiftyone.zoo as foz


# Download latest version
#path = kagglehub.dataset_download("msambare/fer2013")
# dataset = foz.load_zoo_dataset("quickstart")
# session = fo.launch_app(dataset, port=5151)

# session.wait()  # Esto evita que la sesión se cierre automáticamente

import fiftyone as fo
import os
import cv2
import albumentations as A

# Directorio raíz donde se encuentran los datos organizados por carpetas de emociones
dataset_dir = "./fer2013_raw"

# Función para cargar imágenes desde carpetas etiquetadas (una carpeta por clase)
def cargar_dataset(ruta):
    nombre = os.path.basename(ruta)  # Nombre del conjunto (train o test)
    return fo.Dataset.from_dir(
        dataset_dir=ruta,
        dataset_type=fo.types.ImageClassificationDirectoryTree,  # Carga etiquetas desde la estructura de carpetas
        name=nombre
    )

# Cargar datasets de entrenamiento y prueba
train_dataset = cargar_dataset(os.path.join(dataset_dir, "train"))
test_dataset = cargar_dataset(os.path.join(dataset_dir, "test"))

# Crear un nuevo dataset combinando train y test
dataset = fo.Dataset(name="fer2013_full")
dataset.add_samples(train_dataset)  # Añadir muestras de entrenamiento
dataset.add_samples(test_dataset)   # Añadir muestras de prueba

# Definir las transformaciones de aumento de datos usando Albumentations
transform = A.Compose([
    A.Rotate(limit=25, p=0.8),  # Rotar aleatoriamente hasta 25 grados
    A.RandomScale(scale_limit=0.2, p=0.8),  # Escalar aleatoriamente ±20%
    A.RandomBrightnessContrast(brightness_limit=0.3, contrast_limit=0.3, p=0.9),  # Cambiar brillo y contraste
    A.HorizontalFlip(p=0.5),  # Voltear horizontalmente
])

# Directorio donde se guardarán las imágenes aumentadas
output_dir = "fer2013_augmented"
os.makedirs(output_dir, exist_ok=True)

new_samples = []  # Lista para almacenar las nuevas muestras generadas

# Aplicar transformaciones y guardar nuevas imágenes
for i, sample in enumerate(dataset):
    label = sample.ground_truth.label  # Obtener la etiqueta de la emoción
    label_dir = os.path.join(output_dir, label)  # Crear subcarpeta por clase
    os.makedirs(label_dir, exist_ok=True)

    # Leer y convertir imagen
    img = cv2.imread(sample.filepath)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

    # Aplicar transformaciones
    transformed = transform(image=img)["image"]
    transformed = cv2.cvtColor(transformed, cv2.COLOR_RGB2BGR)

    # Guardar imagen transformada en carpeta correspondiente
    filename = f"{i:05d}.jpg"
    new_path = os.path.join(label_dir, filename)
    cv2.imwrite(new_path, transformed)

    # Crear nuevo sample con la misma etiqueta
    new_sample = fo.Sample(filepath=new_path)
    new_sample["ground_truth"] = fo.Classification(label=label)
    new_sample.tags.append("augmented")  # Etiqueta adicional para identificar muestras aumentadas
    new_samples.append(new_sample)

# Crear un nuevo dataset con las imágenes aumentadas
processed_dataset = fo.Dataset(name="fer2013_augmented")
processed_dataset.add_samples(new_samples)

# Iniciar aplicación de FiftyOne para visualizar las muestras
session = fo.launch_app(processed_dataset, port=5151)
session.wait()