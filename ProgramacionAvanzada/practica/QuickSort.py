def quick_sort(lista):
    if len(lista) <= 1 :
        return lista
    
    mitad = len(lista)//2

    izquierda = [x for x in lista if x < lista[mitad]]
    centro = [x for x in lista if x == lista[mitad]]
    derecha = [x for x in lista if x > lista[mitad]]
    

    return quick_sort(izquierda)+centro+quick_sort(derecha)

if __name__ == "__main__":
    lista = [38, 27, 43, 3, 9, 82, 10]

    print("Lista original:", lista)
    lista_ordenada = quick_sort(lista)
    print("Lista ordenada:", lista_ordenada)

    

    

