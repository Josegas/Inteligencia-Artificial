from pyswip import Prolog

# Crear la instancia de Prolog
prolog = Prolog()

# Cargar el archivo Prolog
prolog.consult("OrientadorVocacional.pl")

# Hacer una consulta
resultados = list(prolog.query("orientar"))

# Mostrar resultados
for resultado in resultados:
    print(resultado)