import fiftyone as fo

# Solo carga el dataset existente por nombre
dataset = fo.load_dataset("fer2013_augmented")

# Lanzar la app para visualizar
session = fo.launch_app(dataset, port=5151)
session.wait()