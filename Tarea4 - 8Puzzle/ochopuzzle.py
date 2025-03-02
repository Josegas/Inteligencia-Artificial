# pylint: disable=W0621
import heapq
import time


class Puzzle:
    def __init__(self, tablero, padre=None, movimiento="", profundidad=0, costo=0):
        self.tablero = tablero
        self.padre = padre
        self.movimiento = movimiento
        self.profundidad = profundidad
        self.costo = costo
        self.casilla_vacia = self.encontrar_vacia()

    def encontrar_vacia(self):
        for i in range(3):
            for j in range(3):
                if self.tablero[i][j] == 0:
                    return (i, j)
        return None

    def movimientos_posibles(self):
        movimientos = []
        x, y = self.casilla_vacia
        direcciones = {"Arriba": (x-1, y), "Abajo": (x+1, y),
                       "Izquierda": (x, y-1), "Derecha": (x, y+1)}

        for movimiento, (nueva_x, nueva_y) in direcciones.items():
            if 0 <= nueva_x < 3 and 0 <= nueva_y < 3:
                nuevo_tablero = [fila[:] for fila in self.tablero]
                nuevo_tablero[x][y], nuevo_tablero[nueva_x][nueva_y] = nuevo_tablero[nueva_x][nueva_y], nuevo_tablero[x][y]
                movimientos.append(
                    Puzzle(nuevo_tablero, self, movimiento, self.profundidad + 1))

        return movimientos

    def __lt__(self, otro):
        return self.costo < otro.costo

    def __eq__(self, otro):
        return self.tablero == otro.tablero

    def __hash__(self):
        return hash(str(self.tablero))


def distancia_manhattan(tablero, objetivo):
    distancia = 0
    lista_objetivo = sum(objetivo, [])  # Aplanar el tablero objetivo
    for i in range(3):
        for j in range(3):
            if tablero[i][j] != 0:
                x, y = divmod(lista_objetivo.index(tablero[i][j]), 3)
                distancia += abs(i - x) + abs(j - y)
    return distancia


def astar(inicio, objetivo):
    tiempo_inicio = time.time()
    estado_inicial = Puzzle(inicio)
    lista_objetivo = sum(objetivo, [])
    cola_prioridad = []
    heapq.heappush(cola_prioridad, (0, estado_inicial))
    visitados = set()

    while cola_prioridad:
        _, actual = heapq.heappop(cola_prioridad)

        if actual.tablero == objetivo:
            camino = []
            estados = []
            while actual.padre:
                camino.append(actual.movimiento)
                estados.append(actual.tablero)
                actual = actual.padre
            estados.append(actual.tablero)  # Añadir el estado inicial
            camino = camino[::-1]  # Invertir el camino
            estados = estados[::-1]  # Invertir los estados

            tiempo_fin = time.time()
            print(f"Solucion encontrada en {len(camino)} movimientos:")
            for estado in estados:
                print(estado)
            print(
                f"Tiempo de ejecucion: {round(tiempo_fin - tiempo_inicio, 6)} segundos")
            return camino

        visitados.add(actual)

        for vecino in actual.movimientos_posibles():
            if vecino in visitados:
                continue
            vecino.costo = vecino.profundidad + \
                distancia_manhattan(vecino.tablero, objetivo)
            heapq.heappush(cola_prioridad, (vecino.costo, vecino))

    return None


# Prueba del algoritmo
tablero_inicial = [[5, 2, 3], [7, 6, 0], [1, 8, 4]]
tablero_objetivo = [[1, 2, 3], [4, 5, 6], [7, 8, 0]]
solucion = astar(tablero_inicial, tablero_objetivo)
print("Movimientos realizados:", solucion)
