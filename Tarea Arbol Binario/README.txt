#Integrantes equipo:
Garcia Pérez José Ángel 
Verdugo Bermúdez Sebastián

#Árbol Binario de Búsqueda 

Este programa implementa un Árbol Binario de Búsqueda (ABB) en Python.  
Permite agregar datos y ordenarlos de distintas formas, además de buscar elementos y verificar si el árbol está vacío.  

#Funcionalidades:

Agregar datos al árbol automáticamente.  
Ordenar los datos con recorridos inorden, preorden y postorden.  
Buscar si un número está en el árbol.  
Comprobar si el árbol está vacío.  

# Métodos principales:

agregar(dato) 	Agrega un nuevo número al árbol. 
esVacio()  	Verifica si el árbol está vacío. 
buscar(valor) 	Busca un número en el árbol. 
inorden() 	Muestra los datos en orden ascendente. 
preorden() 	Muestra los datos en orden de inserción. 
postorden() 	Muestra los datos desde las hojas hasta la raíz. 

#Ejemplo de uso:

from arbol import Arbol

arbol = Arbol()
print(arbol.esVacio())  # True (el árbol está vacío)

arbol.agregar(10)
arbol.agregar(5)
arbol.agregar(15)

print(arbol.esVacio())  # False
print(arbol.buscar(5))  # True (el número está en el árbol)

arbol.inorden()   # 5, 10, 15
arbol.preorden()  # 10, 5, 15
arbol.postorden() # 5, 15, 10