# Integrantes equipo:  
García Pérez José Ángel  
Verdugo Bermúdez Sebastián  

# Resolución del Puzzle de 8 Piezas con A*  

Este programa implementa el algoritmo A* para resolver el juego puzzle de 8 piezas. Utilizamos la heurística de la distancia Manhattan para encontrar la solución óptima, es decir, la secuencia de movimientos más corta para ordenar el tablero desde un estado inicial hasta un estado objetivo.  

# Funcionalidades:  

-Resolución del puzzle: Encuentra la secuencia de movimientos para ordenar el tablero.  
-Distancia Manhattan: Calcula la distancia estimada entre el estado actual y el objetivo. 
-Visualización de pasos: Muestra cada estado del tablero desde el inicio hasta la solución.  
-Tiempo de ejecución: Mide el tiempo que tarda el algoritmo en encontrar la solución.  

# Métodos principales:  

-movimientos_posibles(): Genera todos los movimientos válidos desde el estado actual.  
-distancia_manhattan(): Calcula la heurística para estimar el costo de llegar al objetivo.  
-astar(): Implementa el algoritmo A* para encontrar la solución.  

# Ejemplo de uso:  

# Definir tablero inicial y objetivo
tablero_inicial = [[5, 2, 3], [7, 6, 0], [1, 8, 4]]
tablero_objetivo = [[1, 2, 3], [4, 5, 6], [7, 8, 0]]

# Resolvemos el puzzle
solucion = astar(tablero_inicial, tablero_objetivo)
print("Movimientos realizados:", solucion)

Solucion encontrada en 10 movimientos:  
[[5, 2, 3], [7, 6, 0], [1, 8, 4]]  
[[5, 2, 3], [7, 6, 4], [1, 8, 0]]  
...  
[[1, 2, 3], [4, 5, 6], [7, 8, 0]]  
Tiempo de ejecución: 0.001234 segundos  
Movimientos realizados: ['Arriba', 'Izquierda', 'Abajo', ...]  