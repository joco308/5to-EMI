def ordenamiento_partes(lista):
    if len(lista) <=1:
        return lista
    
    lista_ordenada = []

    izquierda = ordenamiento_partes(lista[:len(lista)//2])
    derecha = ordenamiento_partes(lista[len(lista)//2:])

    i = j = 0  

    while i < len(izquierda) and j < len(derecha):
        if izquierda[i] < derecha[j]:
            lista_ordenada.append(izquierda[i])
            i += 1
        else:
            lista_ordenada.append(derecha[j])
            j += 1

    lista_ordenada.extend(izquierda[i:])
    lista_ordenada.extend(derecha[j:])

    return lista_ordenada

if __name__ == "__main__":
    lista = [38, 27, 43, 3, 9, 82, 10]

    print("Lista original:", lista)
    lista_ordenada = ordenamiento_partes(lista)
    print("Lista ordenada:", lista_ordenada)

    