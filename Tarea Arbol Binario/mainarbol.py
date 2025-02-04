from arbol import Arbol
arbol_numeros = Arbol()
arbol_numeros.agregar(1984)
arbol_numeros.agregar(60)
arbol_numeros.agregar(10)
arbol_numeros.agregar(20)
arbol_numeros.agregar(10)
arbol_numeros.agregar(25)
arbol_numeros.agregar(59)
arbol_numeros.agregar(64)
arbol_numeros.agregar(10)
arbol_numeros.agregar(19)
arbol_numeros.agregar(23)
arbol_numeros.agregar(18)
arbol_numeros.agregar(1)
arbol_numeros.agregar(2013)
arbol_numeros.inorden()
arbol_numeros.preorden()
arbol_numeros.postorden()


busqueda = int(input("Ingresa un número para buscar en el árbol: "))
n = arbol_numeros.buscarpublic(busqueda)

if n is None:
    print(f"{busqueda} no existe en el arbol")
else:
    print(f"{busqueda} sí existe en el arbol")
