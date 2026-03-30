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



