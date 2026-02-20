# SQL server

Es un sistema de gestion de base de datos relacionales eso significa que trabaja con tablas que se conectan entre si.

- **DDL ( Data Definicion language )** 
    - CREATE
    - ALTER
    - DROP
    - TRUNCATE

- **DML ( Data MAnipulation language )**  
    - INSERT
    - UPDATE
    - DELATE

- **DQL ( Date Query Language )**
    - SELECT

- **DCL ( Data Control Language )**
    - GARANT
    - REVOKE

- **TPL (Transaction Control Language)**
    - COMMIT
    - ROLLBACK


Oracle -> PL/SQL  
SQL server -> TSQL "*Transact SQL*"  
Postgress -> PSQL

# Gobierno de datos

## Ofuscacion
es uan tecnica para proteger los datos no todos podrian ver todo, por ejemplo numeros de terjetas de credito o numeros de telefonos, esos datos deberian estar afuscado para que nadie externo los pueda leer. ej:

|Nombre|Telefono|
|:--:|:--:|
|Juan|xxxxx20|
|Joaquin|xxxxx30|

Esto sirve por si un desarollador necesita hacer cambios pero el no deberia ver los numeros de telefono entonces se les aplica este formato pueden ser x o *

- Calidad de datos
- Seguridad de datos
- Complimineto normativo
- Roles y responsabilidad
    - Usuario -> Rol -> Privilegio


# Estructuras de almacenamiento

### 1.1 Datos como un activo organizacional

Los datos por si solos no representan nada.

### 1.2 Administracion de datos

**Normalizacion** para exitar la redundancia de datos  *investigar*

## tipos de llaves (key)

- **llave primaria - llave primaria compuesta** la primaria es el identificador unico, y la primaria compuesta utilizas 2 columnas para identificar algo
- **llave Foranea** la union de las tablas es la referencia la primary key en otra tabla  

# Tipos de tablas

- **fuerte** por su sola existe no depende de otra
- **debil** no tiene sentido sin el dato de otra tabla depende de otra tabla
 
## COBIT

Todo tiene que cumplir lo que dice cobit es una asociacion que hace audiotia y rige como se maneja todo lo que se desarolla "cubo cobit".

### 1.3 Administracion de base de datos
existen administradores y de darolladores

- ***DBMS*** Es el administrador de base da datos, tiene un suclo de vida la administracion
- **Configuracion y intalacion.-** ver donde se guardadran los datos cuanta RAM utilizara
- **Seguridad.-** Se basa en el principio *minimo privilegio* 
- **Disponibilidad y backups.-** en el caso si el servidor falle tienes que tener a la mano un backup

# ¿Que es SQl server?

gestiona datos para transacciones y analisis

- **Transacciones OLTP** son transacciones rapidas optimizadas para leer escribir modificar borrar de maneara rapida
- **Analisis OLAP** son super consultas que son el resultado de sumer muchas cantidades de datos o analizar un gran volumen de datos


Atiende peticiones de clientes.  

La base de datos tiene que estar ordenada u normalizada.

***La base de la normalizacion es que no sea redundante.***

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
    |_______Fichero de log ( .ldf )

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

# Un data center por dentro

Un data enter cuenta con un sitema de gestion de respaldo de energia, hace que nunca pare aunque se corte la energia. Tienen autonomia y un cierto timpo de vida lo minimo es de 30 min, para hacer respaldos o usar protocolos para apagado del servidor.

Sistemas de climatzacion un data center tine uqe estar bien refrigerados con dstintos metodos ya que los componentes necesitan estar refrigerados para no dañarse.

Seguridad fisica, nadie ingre a toda la insfrecstructura sin autorizacion, y en el caso que haya hay un protocolo de ingreso

<Servidor de coneccion remoto EXPONER>

Existen 3 tipos de hambientes:
- **Area de energia** donde estan los respaldos de energia, alimenta a los IDF y MDF
- **Area de comunicaciones** donde estan todas las conexciones de la institucion la maprte mas importante, comunica al datacenter con el usuario *MDF* Main distribution frame

<investigar IDF MDF>

- **Area de servidores** Deben ser seguros y no dejar pasar a cualquiera asi por asi, tiene que estar bien refrigerados.

---

la difernecia entre gestor de base de datos y un administrador de  base de datos es que un gestor solo administra ingormacion y el administrador hace mejoras en los sistemas optimiza, y siempre monitoriea la base de datos.

# Manipulacion de datos

Un dataset es una tabla procesada, un data set se puede generar por una consulta

# Componentes de SQL

### Comandos:
- DDL
    - CREATE
    - DROP
    - ALTER

- DML
    - INSERT
    - UPDATE
    - DELATE
    - SELECT

<que es un predicado>

- DCL
    - REVOKE
    - GARANT
    - DENY

- TCL
    - COMMIT
    - ROLBACK
    - SAVEPOINT
    - SET TRANSACTION



