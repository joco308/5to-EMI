# Algoritmos Greedy (Voraces)
Paradigma de resolucion de problemas, elije la  mejor opcion local de cada paso no le importa el pasado solo mira el precente
## Cracteristicas

- **Miope:** no considera consecuencias futuras
- **Decendente:* reduce el problema en cada etapa
- No considera deciciones pasadas

## Componentes

- Conjunto de cantidatos (C)
- Candidatos seleccionados (S)
- Canditatos rechazados (R)
- Funcion de seleccion
- Funcion de factivilidad
- Funcion solucion
- Funcion objetivo

## Conduciones de aplicacion
### Subestructura optima

La solucion optima global incluye soluciones optimas de subproblemas

### Propiedad de seleccion Greedy

Elecciones locales llevan al optimo global

### Necesidad de demostracion

Induccion algo inducio a llegar a ese punto y se contradice si es que no es la optima

## Ejemplos de aplicacion

### Cambio de monedas

- **Objetivo .-** Minimo numero de monedas

- **Criterio .-** Moneda de mayor valor posible

- **Optimalidad .-** Depende del sistema monetario

### Problrma de mochila

- **Fraeccionada (Continua):** Greedy es optimo (ratio beneficio/peso)

- **Entera (Discreta):** Greedy no garantiza el optimo

### Planificacion de tareas

- **Minimizar tiempo de espera:** Orden de duracion
- **Maximizar tareas (plazos):** Orden por tiempo de finalizacion

### Cadenas

- Formacion de string lexicograficamente mayor

## Algoritmos de Grafos 

### Arbol de expansion minima

- Algoritmo de Prim
- Algoritmo de Kruskal

### Caminos minimos

- Algoridmo de Dijkstra

### Codificacion de huffman

- Comprension de datos prefijada

## Analisis y limitaciones

### Ventajas

- Faciles de implementar
- Eficiencia temporal (Polinomiales)

### Desventajas

- No siempre se encentra la solucion optima
- Pueden dar soluciones suboptimas localmente

### Alternativas

- Progrmacion Dinamica
- Backtracking / Busqueda Completa

## Busqueda amplitut

Utilizamos una cola la cual empezamos con el raiz pondemos en la cola sus hijos, y de la cola sacamos sus hijos y iteramos asi hata que encontremos el numero buscado o la cola este vacia


## Busqueda en profundidad

Utiliza una pila, entramos a raiz y ponemos en la pila sus hijos y asi buscamos en progundida 

## Busqueda con retroceso



## Busqueda en profundidad progresiva



## Busqueda en bidireccional en amplitud
<investigar estos 3 y hacer un video>

# Grafos

<investigar que es u grafo>

## Tipos de grafos

- Simple 
- Multigrafo
- Pseudografo
- Ponderado
- Dirigido
- Multigrafo dirigido

## Grado de un vetice 

Es el numero de aristas que inciden que salen de el
y el grado del grafo es la sumatoria

## Camino, cadenas y ciclos

### Cadena

Que todos los verives esten conectados

### Camino

Tiene un nodo de inicio y nodos intermedios para llegar a su nodo destino

### Ciclo

Se forman bucles o ciclos entre nodos

### Cadena cerrada

todos los nodos se conectan y se cierra el ciclo

### Conexo

<investigar>

## Caminos euclerianos y civlos auquerianos
### camino eugleriano

Es aquel que rocore todo el grafo sin repetir una coneccion, esto se cumplira siempre y cunedo

esto se cumplira siempre y cundo un grafo no tenga mas de 2 vertices con garado impar

### Civlo euleriano

Es aquel siclo que recore todo el grafo sin repetir una coneccion este se cumplirra solo cuando todos losm vertices del grafo son grado par

![grafo Eucleriano]("./src/grafo-eucleriano.png")

## Red
Es un par (N,E) en un conjunto X, donde N es un conjunto no vacio de puntos de x, E es un subconjunto de aristas $NxN$, en el que no hay elemenos repetidos ni de la forma (ni, ni) A una res se le pueden asociar funciones capaces de dar valores espeficicos de cada una de las aristas

## Red no dirigida 

Es una red coyo subconjunto de E esta formado por aristas no dirigidas

## REd dirigida 

Es una red cuyo subconjunto de aristas E esta formado por aristas dirigidas


### Cuello de botalla
Es el minomo de las capacidades reciduales de las aristas de P


<completar>

|n|Nodos resueltos conectados directamente a nodos no resueltos|Nodo no resulto mas cecano conectado|Distancia total involucrada|N-esimo nodo mas cercano|Distancia minima|Ultima coneccion|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
1|O|A|2|A|2|O-A
2-3|O-A|C-B|4-4|B|4|A-B
4|A-B-C|D-E-E|9-7-8|E|7|B-E
5|A-B-E|D-D-D|9-8-8|D|8|B-D
6|D-E|T-T|13-14|T|13|D-T


