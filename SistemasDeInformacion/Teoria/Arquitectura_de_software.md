# Arquitectura de software

Es el diseño de m,as alto nivel de la estructura de un sistema osea la base del sistema define componentes (Modulos), las propiedades de esos modulos y como se comuinian entre si.

Divide el problema gigante en pequeños trozos que simplifican el problema y cada uno de esos trosos son los modulos esos modulos deben hace una sola cosa.

Permite hacer mantenimiento si sacas un modulo y pones otro modulo no se rompe nada.


## Componente (Modulo)

es una unidad de software indemendiente, sustituible y encapsulada con un interfaz clara que defina que datos recivir y que hacer con esos datos y tambien que tipos de datos entregar, eso se encarga la interfaz que se define afuera del componente

```
Interfaz 

Se declara afuera del componente define que funciones debe entregar el componente que parametro recibe cada una y que retorna lo mas importante
```

Un componente es un sitema entero que debe cumpolir ciertos criterios para cumplir el `clean code` coodigo limpio y buenas practicas 

## Principios buenas practicas `clean code`

1. **Principio de caja negra .-** Nadie deveria ver como es el modulo por dentro nisiquiera otros modulos solo deve recibir y entregar datos

2. **Principio alta cohecion .-** El modulo solo debe hacer 1 sola cosa efocarse en esa ej: un modulo que sea gestion de usuarios que envie fectura esta mal solo enfocarce en su funcion

3. **Principio bajo acoplamiento .-** Un modulo deberia ser independiante, como fichas de lego no estar solada, si un modulo falla que no afecte a los demas esto se logra comunicando modulos con los parametros de dan las interfaces

4. **Principio inyeccion de dependencias .-** No fabriques tus propias herrameintas si necesitas cosas pr ejemplo una base de datos no hagas que el modulo cree una







