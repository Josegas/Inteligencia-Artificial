from nodo import Nodo


class Arbol:
    def __init__(self, raiz=None):
        if raiz is not None:
            self.raiz = Nodo(raiz)  # Si recibe un valor, crea un nodo raíz
        else:
            self.raiz = None  # Si no, deja el árbol vacío

    # INSERTAR DATOS EN EL ARBOL

    def insertar_recursivo(self, nodo, dato):
        if dato < nodo.dato:
            if nodo.izquierda is None:
                nodo.izquierda = Nodo(dato)
            else:
                self.insertar_recursivo(nodo.izquierda, dato)
        else:
            if nodo.derecha is None:
                nodo.derecha = Nodo(dato)
            else:
                self.insertar_recursivo(nodo.derecha, dato)
    # IMPRIMIR EL ARBOL EN ORDEN RECURSIVO

    def inorden_recursivo(self, nodo):
        if nodo is not None:
            self.inorden_recursivo(nodo.izquierda)
            print(nodo.dato, end=", ")
            self.inorden_recursivo(nodo.derecha)
    # IMPRIMIR EL ARBOL EN PREORDEN RECURSIVO

    def preorden_recursivo(self, nodo):
        if nodo is not None:
            print(nodo.dato, end=", ")
            self.preorden_recursivo(nodo.izquierda)
            self.preorden_recursivo(nodo.derecha)
    # IMPRIMIR EL ARBOL EN POSTORDEN RECURSIVO

    def postorden_recursivo(self, nodo):
        if nodo is not None:
            self.postorden_recursivo(nodo.izquierda)
            self.postorden_recursivo(nodo.derecha)
            print(nodo.dato, end=", ")
    # BUSCAR UN DATO EN EL ARBOL

    def buscar(self, nodo, busqueda):
        if nodo is None:
            return None
        if nodo.dato == busqueda:
            return nodo
        if busqueda < nodo.dato:
            return self.buscar(nodo.izquierda, busqueda)
        else:
            return self.buscar(nodo.derecha, busqueda)

 # Funciones publicas para probar el arbol

    def agregar(self, dato):
        if self.raiz is None:
            self.raiz = Nodo(dato)
        else:
            self.insertar_recursivo(self.raiz, dato)

    def inorden(self):
        print("Imprimiendo árbol inorden: ")
        self.inorden_recursivo(self.raiz)
        print("")

    def preorden(self):
        print("Imprimiendo árbol preorden: ")
        self.preorden_recursivo(self.raiz)
        print("")

    def postorden(self):
        print("Imprimiendo árbol postorden: ")
        self.postorden_recursivo(self.raiz)
        print("")

    def buscarpublic(self, busquedap):
        return self.buscar(self.raiz, busquedap)

    # Método adicional que revisa si el árbol está vacío
    def vacio(self):
        return "vacío" if self.raiz is None else "no vacío"
