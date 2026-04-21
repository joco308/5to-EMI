-- ============================================================
-- SCRIPT: Esquema de base de datos
-- MOTOR:  SQL Server
-- NOTAS:  Nombres sin acentos ni enies, sin corchetes,
--         PKs con IDENTITY, FKs con nombres descriptivos,
--         create_at y update_at con valores por defecto.
-- ============================================================

CREATE TABLE Dominios (
    id_dominio   INT            NOT NULL IDENTITY(1,1),
    dominio      NVARCHAR(100)  NOT NULL,
    create_at    DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at    DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Dominios PRIMARY KEY (id_dominio)
);

CREATE TABLE Sub_dominios (
    id_sub_dominio  INT            NOT NULL IDENTITY(1,1),
    id_dominio      INT            NOT NULL,
    detalle         NVARCHAR(100)  NOT NULL,
    create_at       DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at       DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Sub_dominios    PRIMARY KEY (id_sub_dominio),
    CONSTRAINT FK_Sub_dominios_id_dominio
        FOREIGN KEY (id_dominio) REFERENCES Dominios (id_dominio)
);

CREATE TABLE Roles (
    id_rol      INT            NOT NULL IDENTITY(1,1),
    nombre_rol  NVARCHAR(50)   NOT NULL,
    salario     INT            NOT NULL,
    create_at   DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at   DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Roles PRIMARY KEY (id_rol)
);

CREATE TABLE Direccion (
    id_direccion  INT            NOT NULL IDENTITY(1,1),
    id_zona       INT            NOT NULL,   -- FK -> Sub_dominios
    calle         NVARCHAR(100)  NOT NULL,
    n_casa        INT            NOT NULL,
    create_at     DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at     DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Direccion      PRIMARY KEY (id_direccion),
    CONSTRAINT FK_Direccion_id_zona
        FOREIGN KEY (id_zona) REFERENCES Sub_dominios (id_sub_dominio)
);

CREATE TABLE Estado_calidad (
    id_estado_calidad  INT            NOT NULL IDENTITY(1,1),
    estado_calidad     NVARCHAR(100)  NOT NULL,
    create_at          DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at          DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Estado_calidad PRIMARY KEY (id_estado_calidad)
);

CREATE TABLE Usuario_trabajador (
    id_usuario          INT            NOT NULL IDENTITY(1,1),
    id_estado_civil     INT            NOT NULL,   -- FK -> Sub_dominios
    id_grado_academico  INT            NOT NULL,   -- FK -> Sub_dominios
    id_genero           INT            NOT NULL,   -- FK -> Sub_dominios
    id_direccion        INT            NOT NULL,   -- FK -> Direccion
    id_rol              INT            NOT NULL,   -- FK -> Roles
    id_pais             INT            NOT NULL,   -- FK -> Sub_dominios
    contrasena_hash     NVARCHAR(60)   NOT NULL,
    correo              NVARCHAR(100)  NOT NULL,
    ci                  INT            NOT NULL,
    nombre_usuario      NVARCHAR(100)  NOT NULL,
    fecha_nacimiento    DATE           NOT NULL,
    create_at           DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at           DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Usuario_trabajador               PRIMARY KEY (id_usuario),
    CONSTRAINT FK_Usuario_trabajador_estado_civil
        FOREIGN KEY (id_estado_civil)    REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Usuario_trabajador_grado_academico
        FOREIGN KEY (id_grado_academico) REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Usuario_trabajador_genero
        FOREIGN KEY (id_genero)          REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Usuario_trabajador_pais
        FOREIGN KEY (id_pais)            REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Usuario_trabajador_direccion
        FOREIGN KEY (id_direccion)       REFERENCES Direccion (id_direccion),
    CONSTRAINT FK_Usuario_trabajador_rol
        FOREIGN KEY (id_rol)             REFERENCES Roles (id_rol)
);

CREATE TABLE Provedores (
    id_proveedor  INT            NOT NULL IDENTITY(1,1),
    id_empresa    INT            NOT NULL,   -- FK -> Sub_dominios
    id_producto   INT            NOT NULL,   -- FK -> Sub_dominios
    nit           INT            NOT NULL,
    nombre        NVARCHAR(50)   NOT NULL,
    create_at     DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at     DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Provedores              PRIMARY KEY (id_proveedor),
    CONSTRAINT FK_Provedores_empresa
        FOREIGN KEY (id_empresa)  REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Provedores_producto
        FOREIGN KEY (id_producto) REFERENCES Sub_dominios (id_sub_dominio)
);

CREATE TABLE Recursos (
    id_recurso   INT            NOT NULL IDENTITY(1,1),
    id_proveedor INT            NOT NULL,   -- FK -> Provedores
    id_tipo      INT            NOT NULL,   -- FK -> Sub_dominios
    nombre       NVARCHAR(100)  NOT NULL,
    descripcion  NVARCHAR(300)  NULL,
    create_at    DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at    DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Recursos           PRIMARY KEY (id_recurso),
    CONSTRAINT FK_Recursos_proveedor
        FOREIGN KEY (id_proveedor) REFERENCES Provedores (id_proveedor),
    CONSTRAINT FK_Recursos_tipo
        FOREIGN KEY (id_tipo)      REFERENCES Sub_dominios (id_sub_dominio)
);

CREATE TABLE Uniformes (
    id_uniforme      INT            NOT NULL IDENTITY(1,1),
    nombre_uniforme  NVARCHAR(100)  NOT NULL,
    talla            INT            NOT NULL,
    descripcion      NVARCHAR(300)  NULL,
    create_at        DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at        DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Uniformes PRIMARY KEY (id_uniforme)
);

CREATE TABLE Asignacion_uniformes (
    id_asignacion_uniforme  INT            NOT NULL IDENTITY(1,1),
    id_usuario              INT            NOT NULL,   -- FK -> Usuario_trabajador
    id_uniforme             INT            NOT NULL,   -- FK -> Uniformes
    fecha_entrega           DATE           NOT NULL,
    fecha_devolucion        DATE           NULL,
    estado                  NVARCHAR(50)   NOT NULL,
    create_at               DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at               DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Asignacion_uniformes          PRIMARY KEY (id_asignacion_uniforme),
    CONSTRAINT FK_Asignacion_uniformes_usuario
        FOREIGN KEY (id_usuario)  REFERENCES Usuario_trabajador (id_usuario),
    CONSTRAINT FK_Asignacion_uniformes_uniforme
        FOREIGN KEY (id_uniforme) REFERENCES Uniformes (id_uniforme)
);

CREATE TABLE Capacitaciones (
    id_capacitacion  INT            NOT NULL IDENTITY(1,1),
    nombre           NVARCHAR(100)  NOT NULL,
    descripcion      NVARCHAR(300)  NULL,
    fecha            DATE           NOT NULL,
    create_at        DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at        DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Capacitaciones PRIMARY KEY (id_capacitacion)
);

CREATE TABLE Carreras_usuario (
    id_carrera  INT  NOT NULL,   -- FK -> Sub_dominios
    id_usuario  INT  NOT NULL,   -- FK -> Usuario_trabajador
    CONSTRAINT PK_Carreras_usuario PRIMARY KEY (id_carrera, id_usuario),
    CONSTRAINT FK_Carreras_usuario_carrera
        FOREIGN KEY (id_carrera) REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Carreras_usuario_usuario
        FOREIGN KEY (id_usuario) REFERENCES Usuario_trabajador (id_usuario)
);

CREATE TABLE Cliente (
    id_cliente          INT            NOT NULL IDENTITY(1,1),
    id_empresa          INT            NOT NULL,   -- FK -> Sub_dominios
    id_direccion        INT            NOT NULL,   -- FK -> Direccion
    nombre_cliente      NVARCHAR(100)  NOT NULL,
    contacto_emergencia NVARCHAR(50)   NULL,
    create_at           DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at           DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Cliente              PRIMARY KEY (id_cliente),
    CONSTRAINT FK_Cliente_empresa
        FOREIGN KEY (id_empresa)   REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Cliente_direccion
        FOREIGN KEY (id_direccion) REFERENCES Direccion (id_direccion)
);

CREATE TABLE Telefono_cliente (
    id_telefono  INT  NOT NULL IDENTITY(1,1),
    telefono     INT  NOT NULL,
    id_detalle   INT  NOT NULL,   -- FK -> Sub_dominios
    id_cliente   INT  NOT NULL,   -- FK -> Cliente
    create_at    DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at    DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Telefono_cliente            PRIMARY KEY (id_telefono),
    CONSTRAINT FK_Telefono_cliente_detalle
        FOREIGN KEY (id_detalle) REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Telefono_cliente_cliente
        FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
);

CREATE TABLE Horario (
    id_horario   INT   NOT NULL IDENTITY(1,1),
    hora_entrada TIME  NOT NULL,
    hora_salida  TIME  NOT NULL,
    create_at    DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at    DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Horario PRIMARY KEY (id_horario)
);

CREATE TABLE Servicio (
    id_servicio   INT             NOT NULL IDENTITY(1,1),
    id_cliente    INT             NOT NULL,   -- FK -> Cliente
    id_direccion  INT             NOT NULL,   -- FK -> Direccion
    tipo_servicio INT             NOT NULL,   -- FK -> Sub_dominios
    fecha_inicio  DATE            NOT NULL,
    fecha_final   DATE            NULL,
    costo         DECIMAL(10,2)   NOT NULL,
    descripcion   NVARCHAR(300)   NULL,
    create_at     DATETIME2       NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at     DATETIME2       NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Servicio              PRIMARY KEY (id_servicio),
    CONSTRAINT FK_Servicio_cliente
        FOREIGN KEY (id_cliente)    REFERENCES Cliente (id_cliente),
    CONSTRAINT FK_Servicio_direccion
        FOREIGN KEY (id_direccion)  REFERENCES Direccion (id_direccion),
    CONSTRAINT FK_Servicio_tipo_servicio
        FOREIGN KEY (tipo_servicio) REFERENCES Sub_dominios (id_sub_dominio)
);

CREATE TABLE Asignacion_empleados (
    id_usuario      INT  NOT NULL,   -- FK -> Usuario_trabajador
    id_servicio     INT  NOT NULL,   -- FK -> Servicio
    id_horario      INT  NOT NULL,   -- FK -> Horario
    dias_laborales  INT  NOT NULL,   -- FK -> Sub_dominios
    create_at       DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at       DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Asignacion_empleados PRIMARY KEY (id_usuario, id_servicio),
    CONSTRAINT FK_Asignacion_empleados_usuario
        FOREIGN KEY (id_usuario)     REFERENCES Usuario_trabajador (id_usuario),
    CONSTRAINT FK_Asignacion_empleados_servicio
        FOREIGN KEY (id_servicio)    REFERENCES Servicio (id_servicio),
    CONSTRAINT FK_Asignacion_empleados_horario
        FOREIGN KEY (id_horario)     REFERENCES Horario (id_horario),
    CONSTRAINT FK_Asignacion_empleados_dias
        FOREIGN KEY (dias_laborales) REFERENCES Sub_dominios (id_sub_dominio)
);

CREATE TABLE Incidentes (
    id_incidente  INT            NOT NULL IDENTITY(1,1),
    id_servicio   INT            NOT NULL,   -- FK -> Servicio
    descripcion   NVARCHAR(300)  NOT NULL,
    fecha         DATE           NOT NULL,
    create_at     DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at     DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Incidentes          PRIMARY KEY (id_incidente),
    CONSTRAINT FK_Incidentes_servicio
        FOREIGN KEY (id_servicio) REFERENCES Servicio (id_servicio)
);

CREATE TABLE Marca_maquinaria (
    id_marca_maquinaria  INT            NOT NULL IDENTITY(1,1),
    id_pais              INT            NOT NULL,   -- FK -> Sub_dominios
    nombre_marca         NVARCHAR(100)  NOT NULL,
    create_at            DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at            DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Marca_maquinaria       PRIMARY KEY (id_marca_maquinaria),
    CONSTRAINT FK_Marca_maquinaria_pais
        FOREIGN KEY (id_pais) REFERENCES Sub_dominios (id_sub_dominio)
);

CREATE TABLE Maquinaria (
    id_maquinaria        INT            NOT NULL IDENTITY(1,1),
    id_proveedor         INT            NOT NULL,   -- FK -> Provedores
    id_tipo_maquinaria   INT            NOT NULL,   -- FK -> Sub_dominios
    id_estado_calidad    INT            NOT NULL,   -- FK -> Estado_calidad
    id_marca_maquinaria  INT            NOT NULL,   -- FK -> Marca_maquinaria
    nombre_maquinaria    NVARCHAR(100)  NOT NULL,
    codigo_inv           NVARCHAR(50)   NOT NULL,
    descripcion          NVARCHAR(300)  NULL,
    create_at            DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at            DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Maquinaria                   PRIMARY KEY (id_maquinaria),
    CONSTRAINT FK_Maquinaria_proveedor
        FOREIGN KEY (id_proveedor)        REFERENCES Provedores (id_proveedor),
    CONSTRAINT FK_Maquinaria_tipo
        FOREIGN KEY (id_tipo_maquinaria)  REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Maquinaria_estado_calidad
        FOREIGN KEY (id_estado_calidad)   REFERENCES Estado_calidad (id_estado_calidad),
    CONSTRAINT FK_Maquinaria_marca
        FOREIGN KEY (id_marca_maquinaria) REFERENCES Marca_maquinaria (id_marca_maquinaria)
);

CREATE TABLE Mantenimiento (
    id_mantenimiento     INT            NOT NULL IDENTITY(1,1),
    fecha_mantenimiento  DATE           NOT NULL,
    descripcion          NVARCHAR(300)  NULL,
    costo                DECIMAL(10,2)  NOT NULL,
    create_at            DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at            DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Mantenimiento PRIMARY KEY (id_mantenimiento)
);

CREATE TABLE Mantenimientos_maquinaria (
    id_maquinaria     INT  NOT NULL,   -- FK -> Maquinaria
    id_mantenimiento  INT  NOT NULL,   -- FK -> Mantenimiento
    create_at         DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at         DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Mantenimientos_maquinaria  PRIMARY KEY (id_maquinaria, id_mantenimiento),
    CONSTRAINT FK_Mantenimientos_maquinaria_maquinaria
        FOREIGN KEY (id_maquinaria)    REFERENCES Maquinaria (id_maquinaria),
    CONSTRAINT FK_Mantenimientos_maquinaria_mantenimiento
        FOREIGN KEY (id_mantenimiento) REFERENCES Mantenimiento (id_mantenimiento)
);

CREATE TABLE Telefono_proveedor (
    id_telefono   INT  NOT NULL IDENTITY(1,1),
    telefono      INT  NOT NULL,
    id_detalle    INT  NOT NULL,   -- FK -> Sub_dominios
    id_proveedor  INT  NOT NULL,   -- FK -> Provedores
    create_at     DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at     DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Telefono_proveedor            PRIMARY KEY (id_telefono),
    CONSTRAINT FK_Telefono_proveedor_detalle
        FOREIGN KEY (id_detalle)   REFERENCES Sub_dominios (id_sub_dominio),
    CONSTRAINT FK_Telefono_proveedor_proveedor
        FOREIGN KEY (id_proveedor) REFERENCES Provedores (id_proveedor)
);

CREATE TABLE Servicio_terminado (
    id_servicio_terminado  INT            NOT NULL IDENTITY(1,1),
    id_servicio            INT            NOT NULL,   -- FK -> Servicio
    satisfaccion           INT            NOT NULL,   -- FK -> Sub_dominios
    comentarios            NVARCHAR(300)  NULL,
    create_at              DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at              DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Servicio_terminado               PRIMARY KEY (id_servicio_terminado),
    CONSTRAINT FK_Servicio_terminado_servicio
        FOREIGN KEY (id_servicio)   REFERENCES Servicio (id_servicio),
    CONSTRAINT FK_Servicio_terminado_satisfaccion
        FOREIGN KEY (satisfaccion)  REFERENCES Sub_dominios (id_sub_dominio)
);

CREATE TABLE Asignacion_maquinaria (
    id_servicio    INT            NOT NULL,   -- FK -> Servicio
    id_maquinaria  INT            NOT NULL,   -- FK -> Maquinaria
    cantidad       INT            NOT NULL,
    descripcion    NVARCHAR(300)  NULL,
    CONSTRAINT PK_Asignacion_maquinaria  PRIMARY KEY (id_servicio, id_maquinaria),
    CONSTRAINT FK_Asignacion_maquinaria_servicio
        FOREIGN KEY (id_servicio)   REFERENCES Servicio (id_servicio),
    CONSTRAINT FK_Asignacion_maquinaria_maquinaria
        FOREIGN KEY (id_maquinaria) REFERENCES Maquinaria (id_maquinaria)
);

CREATE TABLE Usuarios_capacitaciones (
    id_usuario       INT           NOT NULL,   -- FK -> Usuario_trabajador
    id_capacitacion  INT           NOT NULL,   -- FK -> Capacitaciones
    estado           NVARCHAR(50)  NOT NULL,
    CONSTRAINT PK_Usuarios_capacitaciones  PRIMARY KEY (id_usuario, id_capacitacion),
    CONSTRAINT FK_Usuarios_capacitaciones_usuario
        FOREIGN KEY (id_usuario)      REFERENCES Usuario_trabajador (id_usuario),
    CONSTRAINT FK_Usuarios_capacitaciones_capacitacion
        FOREIGN KEY (id_capacitacion) REFERENCES Capacitaciones (id_capacitacion)
);

CREATE TABLE Memorial (
    id_memorial  INT           NOT NULL IDENTITY(1,1),
    id_empleado  INT           NOT NULL,   -- FK -> Usuario_trabajador
    descripcion  NVARCHAR(MAX) NOT NULL,
    create_at    DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at    DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Memorial           PRIMARY KEY (id_memorial),
    CONSTRAINT FK_Memorial_empleado
        FOREIGN KEY (id_empleado) REFERENCES Usuario_trabajador (id_usuario)
);

CREATE TABLE Historial_estado_maquina (
    id_historial       INT            NOT NULL IDENTITY(1,1),
    id_maquinaria      INT            NOT NULL,   -- FK -> Maquinaria
    id_estado_calidad  INT            NOT NULL,   -- FK -> Estado_calidad
    fecha_cambio       DATETIME2      NOT NULL,
    descripcion        NVARCHAR(300)  NULL,
    create_at          DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at          DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Historial_estado_maquina           PRIMARY KEY (id_historial),
    CONSTRAINT FK_Historial_estado_maquina_maquinaria
        FOREIGN KEY (id_maquinaria)     REFERENCES Maquinaria (id_maquinaria),
    CONSTRAINT FK_Historial_estado_maquina_estado
        FOREIGN KEY (id_estado_calidad) REFERENCES Estado_calidad (id_estado_calidad)
);

CREATE TABLE Telefono_usuarios (
    id_telefono_usuario  INT  NOT NULL IDENTITY(1,1),
    telefono_usuario     INT  NOT NULL,
    id_usuario           INT  NOT NULL,   -- FK -> Usuario_trabajador
    id_detalle           INT  NOT NULL,   -- FK -> Sub_dominios
    create_at            DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at            DATETIME2  NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Telefono_usuarios            PRIMARY KEY (id_telefono_usuario),
    CONSTRAINT FK_Telefono_usuarios_usuario
        FOREIGN KEY (id_usuario)  REFERENCES Usuario_trabajador (id_usuario),
    CONSTRAINT FK_Telefono_usuarios_detalle
        FOREIGN KEY (id_detalle)  REFERENCES Sub_dominios (id_sub_dominio)
);

CREATE TABLE Documentos_usuarios (
    id_documento       INT            NOT NULL IDENTITY(1,1),
    id_usuario         INT            NOT NULL,   -- FK -> Usuario_trabajador
    tipo_de_documento  NVARCHAR(100)  NOT NULL,
    archivo            NVARCHAR(MAX)  NOT NULL,
    fecha_subida       DATE           NOT NULL,
    create_at          DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    update_at          DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Documentos_usuarios         PRIMARY KEY (id_documento),
    CONSTRAINT FK_Documentos_usuarios_usuario
        FOREIGN KEY (id_usuario) REFERENCES Usuario_trabajador (id_usuario)
);

CREATE TABLE Asignacion_recursos (
    id_servicio  INT  NOT NULL,   -- FK -> Servicio
    id_recurso   INT  NOT NULL,   -- FK -> Recursos
    cantidad     INT  NOT NULL,
    CONSTRAINT PK_Asignacion_recursos  PRIMARY KEY (id_servicio, id_recurso),
    CONSTRAINT FK_Asignacion_recursos_servicio
        FOREIGN KEY (id_servicio) REFERENCES Servicio (id_servicio),
    CONSTRAINT FK_Asignacion_recursos_recurso
        FOREIGN KEY (id_recurso)  REFERENCES Recursos (id_recurso)
);