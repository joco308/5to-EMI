def casaDelMedio(n):
    if n<3:return -1
    for i in range(2,n+1):
        s1 = n*(n+1)/2
        s2 = (n*(n+1)-i*i(i+1))/2
        return i if s1==s2 else -1   