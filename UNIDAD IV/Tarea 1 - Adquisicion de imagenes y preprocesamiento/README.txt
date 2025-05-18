Institución: Instituto Tecnológico de Culiacán. 
Carrera: Ingeniería en Sistemas Computacionales. 
Materia: Inteligencia Artificial. 
Profesor: Zuriel Dathan Mora Félix. 
Equipo: García Pérez José Ángel, Verdugo Bermúdez Sebastián. 
Tarea: "Adquisición y Preprocesamiento de Imágenes para la Clasificación de Emociones"

Propósito
El propósito de este proyecto es desarrollar un sistema que prepare adecuadamente el dataset FER-2013, aplicando técnicas de preprocesamiento y visualización de imágenes con el objetivo de facilitar el entrenamiento futuro de modelos que clasifiquen emociones faciales de manera precisa. Esto se logra mediante la organización de imágenes por clases emocionales, aplicación de aumentos de datos, y validación visual con la herramienta FiftyOne.

Objetivos
Como objetivo general se busca preparar y enriquecer el dataset FER-2013 para entrenar un modelo que identifique emociones faciales. Los objetivos específicos incluyen: realizar la carga estructurada de imágenes por clase emocional, aplicar aumentos de datos (data augmentation) para mejorar la diversidad del conjunto de entrenamiento, y visualizar y validar los datos usando la herramienta FiftyOne.

Alcance y Límites
Este proyecto se basa en el uso del dataset FER-2013 y bibliografía académica relacionada con el reconocimiento de emociones, así como en documentación técnica de las herramientas utilizadas. No abarca el entrenamiento final del modelo ni el análisis emocional profundo, ya que en esta fase el enfoque principal es la preparación y visualización de datos.

Herramientas y Método
Se utilizó Python como lenguaje principal, acompañado de las siguientes librerías: OpenCV para el manejo de imágenes, Albumentations para aplicar transformaciones de aumento de datos, y FiftyOne para crear datasets y visualizarlos de forma interactiva. El procedimiento fue el siguiente: primero, se cargó el dataset FER-2013 ya organizado en carpetas por emoción. Luego, se aplicaron transformaciones aleatorias como rotación, escalado, cambio de brillo/contraste y volteo horizontal, lo que permite enriquecer los datos con nuevas variaciones. Las imágenes procesadas se guardaron en nuevas carpetas según su emoción. Finalmente, se creó un nuevo dataset con todas las imágenes aumentadas y se utilizó FiftyOne para abrir una interfaz gráfica que facilita la revisión, exploración y validación visual del contenido.

Explicación del Código
El código inicia importando las librerías necesarias: FiftyOne para gestión de datasets, OpenCV para leer y escribir imágenes, Albumentations para aplicar aumentos, y os para manipulación de archivos. Luego, se define la ruta raíz donde se encuentran las imágenes originales del dataset FER-2013. Con la función cargar_dataset, se carga automáticamente el conjunto de imágenes organizadas en carpetas, donde cada carpeta representa una clase emocional como “feliz”, “triste”, “enojado”, etc. Posteriormente, se combinan los conjuntos de entrenamiento y prueba en uno solo llamado fer2013_full.

Después, se define un conjunto de transformaciones usando Albumentations: rotaciones aleatorias, escalados, modificaciones de brillo y contraste, y volteo horizontal. Estas transformaciones se aplican a cada imagen original y se guarda una nueva versión aumentada en un directorio de salida. Cada imagen generada se almacena también como una nueva muestra con su correspondiente etiqueta emocional y una marca adicional “augmented” para identificar que fue generada a partir de una transformación. Una vez creadas todas las muestras aumentadas, se construye un nuevo dataset llamado fer2013_augmented y se visualiza utilizando FiftyOne, que permite explorar el dataset con filtros, etiquetas y navegación por imagen.

Evaluación
Los criterios de éxito para esta etapa del proyecto incluyen: correcta organización de las imágenes por clase emocional, aplicación exitosa de los aumentos definidos, funcionalidad de la visualización mediante la herramienta FiftyOne, y facilidad para explorar y validar la información. La validación se realiza observando los resultados dentro de la interfaz visual, revisando que cada imagen esté bien etiquetada y categorizada.

Viabilidad
Desde el punto de vista técnico, el uso de Python y librerías de código abierto como FiftyOne, OpenCV y Albumentations hace que el proyecto sea totalmente viable. En lo económico, los costos son mínimos ya que todo el software es gratuito. En lo operativo, el sistema es accesible desde cualquier computadora con Python y navegador web, lo que permite que estudiantes o investigadores puedan utilizarlo sin barreras técnicas.

Conclusión
Este proyecto constituye una base sólida para el entrenamiento de modelos de clasificación de emociones, enfocándose en el preprocesamiento, enriquecimiento y validación visual del dataset FER-2013. Gracias al uso de herramientas especializadas como FiftyOne y Albumentations, se logra un entorno bien estructurado y amigable para futuros desarrollos en reconocimiento facial emocional mediante inteligencia artificial.
