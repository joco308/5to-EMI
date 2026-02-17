# SQL server
- DDL
- DML
- TCL
- TPL

Oracle -> PL/SQL  
SQL server -> TSQL "*Transact SQL*"  
Postgress -> PSQL
# Gobierno de datos
"ofuscacion"
- Calidad de datos
- Seguridad de datos
- Complimineto normativo
- Roles y responsabilidad
    - Usuario -> Rol -> Privilegio

# Estructuras de almacenamiento
### 1.1 Datos como un activo organizacional
Los datos por si solos no representan nada.
### 1.2 Administracion de datos
**Normalizacion** para exitar la redundancia de datos  
*investigar*
## tipos de llaves (key)
- llave primaria
- llave secundaria
    - fuerte
    - debil
 
## COBIT
TODO tiene que cumplir lo que dice cobit es una asociacion que hace audiotia y rige como se maneja todo lo que se desarolla "cubo cobit".
### 1.3 Administracion de base de datos
existen administradores y de sarolladores
- ***DBMS*** Es el administrador de base da datos, para que sea administrador tiene que poder hacer
    - DDL
    - DML
        - QMC -> SELECT
    - DCL
    - TCL
    - DQL

# ¿Que es SQl server?

gestiona datos para transacciones y analisis

- Transacciones OLTP
- Analisis OLAP

Atiende peticiones de clientes.  

La base de datos tiene que estar ordenada u normalizada.

La base de la normalizacion es que no sea redundante.

### Disccionario de datos
es los tipos de datos que tiene un base de datos es el elemento madre para deciir en otras palabaras es el recetario de la bace de datos, porque es la documentacion, sirbe para entender y administrar la base de datos esto se hace dentrod e cada tambla y de cada atributo

## Herramientas de SQL server
- Consola interactiva
    - Configuracion de sql
    - seguridad
    - creacion y diceño de base de deatos
    - actividades de mantenimiento
        - Backup
        - Exportacion
        - Monitorizacion
        - Log

### Maneja:

- MSSQLServer
- SQLServerAgent
- Microsoft Distributed Transcoion ..
- Microsoft search

## Estructira de una base de datos
 
    DataBase
    |_______Fichero de datos ( .mdf .ndf )  
            |______Datos
            |______Tablas, Indices
    |_______Fichero de log

Se puede eliminar registrros de tablas relaciones pero NO de una tabla relacion

la informacion y los analizis y estadisticas vienen de tablas relacionales

## Estructura de una base de datos
- Tablas
    - Formas por columnas con tipos de registros
    - Las columnas pueden ser funcioles SQL
- Multitud de tipos por dejecto
    - int, decimal, money, datatime, nvarchar, ntect, image...
    - PErmite añadir propios


|id|Nombre|Apellido|Celular|
|:--:|:----:|:-------:|:--:|
|Primary kay|Char|char|int|

## ADO









