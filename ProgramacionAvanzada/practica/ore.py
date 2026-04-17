grafo = {
    "A":["B","E","D"],
    "B":["A"],
    "C":["B","D"],
    "D":["E","C","A"]
}


def is_h(grafo):
    n = len(grafo)
    if n < 3:
        return False
    
    nodos = list(grafo.keys())
    
    for i in range(len(nodos)):
        for j in range(i+1,len(nodos)):
            u = nodos[i]
            v = nodos[j]
            
            if u not in grafo[v]:
                grado_u, grado_v = len(grafo[u]),len(grafo[v])
                
                if grado_u+grado_v<n:
                    return False
                
    return True

print(is_h(grafo))
                    
            
                
                
        
        
        
is_h(grafo)