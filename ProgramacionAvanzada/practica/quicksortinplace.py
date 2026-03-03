def quicksort_inplace(arr, bajo, alto):
    if bajo < alto:
        # pi es el índice de partición
        pi = particion(arr, bajo, alto)

        # Llamadas recursivas sobre las mitades
        quicksort_inplace(arr, bajo, pi - 1)
        quicksort_inplace(arr, pi + 1, alto)

def particion(arr, bajo, alto):
    # Elegimos el último elemento como pivote fijo
    pivote = arr[alto]
    i = bajo - 1  # Índice del elemento más pequeño

    for j in range(bajo, alto):
        # Si el elemento actual es menor o igual al pivote
        if arr[j] <= pivote:
            i += 1
            # Intercambio (swap) in-place
            arr[i], arr[j] = arr[j], arr[i]

    # Colocamos el pivote en su posición correcta
    arr[i + 1], arr[alto] = arr[alto], arr[i + 1]
    return i + 1

# Ejemplo de uso:
mi_lista = [10, 7, 8, 9, 1, 5]
quicksort_inplace(mi_lista, 0, len(mi_lista) - 1)
print(f"Lista ordenada: {mi_lista}")
