-- ============================================================
--  DDL reconstruido desde los modelos EF Core de Api_SASL
--  Generado el 2026-05-14
-- ============================================================

-- -----------------------------------------------------------
-- Dominio
-- -----------------------------------------------------------
CREATE TABLE Dominio (
    IdDominio   INT             NOT NULL IDENTITY(1,1),
    Dominio1    NVARCHAR(MAX)   NOT NULL,
    CreateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Dominio PRIMARY KEY (IdDominio)
);

-- -----------------------------------------------------------
-- SubDominio
-- -----------------------------------------------------------
CREATE TABLE SubDominio (
    IdSubDominio    INT             NOT NULL IDENTITY(1,1),
    IdDominio       INT             NOT NULL,
    Detalle         NVARCHAR(MAX)   NOT NULL,
    CreateAt        DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt        DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_SubDominio PRIMARY KEY (IdSubDominio),
    CONSTRAINT FK_SubDominio_Dominio FOREIGN KEY (IdDominio)
        REFERENCES Dominio (IdDominio)
);

-- -----------------------------------------------------------
-- Role
-- -----------------------------------------------------------
CREATE TABLE Role (
    IdRol       INT             NOT NULL IDENTITY(1,1),
    NombreRol   NVARCHAR(MAX)   NOT NULL,
    Salario     INT             NOT NULL,
    CreateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Role PRIMARY KEY (IdRol)
);

-- -----------------------------------------------------------
-- Direccion
-- -----------------------------------------------------------
CREATE TABLE Direccion (
    IdDireccion INT             NOT NULL IDENTITY(1,1),
    IdZona      INT             NOT NULL,
    Calle       NVARCHAR(MAX)   NOT NULL,
    NCasa       INT             NOT NULL,
    CreateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Direccion PRIMARY KEY (IdDireccion),
    CONSTRAINT FK_Direccion_SubDominio_Zona FOREIGN KEY (IdZona)
        REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- UsuarioTrabajador
-- -----------------------------------------------------------
CREATE TABLE UsuarioTrabajador (
    IdUsuario           INT             NOT NULL IDENTITY(1,1),
    IdEstadoCivil       INT             NOT NULL,
    IdGradoAcademico    INT             NOT NULL,
    IdGenero            INT             NOT NULL,
    IdDireccion         INT             NOT NULL,
    IdRol               INT             NOT NULL,
    IdPais              INT             NOT NULL,
    ContrasenaHash      NVARCHAR(MAX)   NOT NULL,
    Correo              NVARCHAR(MAX)   NOT NULL,
    Ci                  INT             NOT NULL,
    NombreUsuario       NVARCHAR(MAX)   NOT NULL,
    FechaNacimiento     DATE            NOT NULL,
    CreateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    Codigo2fa           NVARCHAR(MAX)   NULL,
    Expiracion          DATETIME2       NULL,
    Pediente2fa         BIT             NULL,
    ServicioAsignado    BIT             NOT NULL,
    CONSTRAINT PK_UsuarioTrabajador PRIMARY KEY (IdUsuario),
    CONSTRAINT FK_UsuarioTrabajador_EstadoCivil     FOREIGN KEY (IdEstadoCivil)    REFERENCES SubDominio (IdSubDominio),
    CONSTRAINT FK_UsuarioTrabajador_GradoAcademico  FOREIGN KEY (IdGradoAcademico) REFERENCES SubDominio (IdSubDominio),
    CONSTRAINT FK_UsuarioTrabajador_Genero          FOREIGN KEY (IdGenero)         REFERENCES SubDominio (IdSubDominio),
    CONSTRAINT FK_UsuarioTrabajador_Pais            FOREIGN KEY (IdPais)           REFERENCES SubDominio (IdSubDominio),
    CONSTRAINT FK_UsuarioTrabajador_Direccion       FOREIGN KEY (IdDireccion)      REFERENCES Direccion (IdDireccion),
    CONSTRAINT FK_UsuarioTrabajador_Role            FOREIGN KEY (IdRol)            REFERENCES Role (IdRol)
);

-- -----------------------------------------------------------
-- Tabla de union muchos-a-muchos: UsuarioTrabajador <-> SubDominio (Carreras)
-- Inferida de la coleccion IdCarreras en UsuarioTrabajador
-- -----------------------------------------------------------
CREATE TABLE UsuarioTrabajador_Carrera (
    IdUsuario       INT NOT NULL,
    IdSubDominio    INT NOT NULL,
    CONSTRAINT PK_UsuarioTrabajador_Carrera PRIMARY KEY (IdUsuario, IdSubDominio),
    CONSTRAINT FK_UTCarrera_Usuario     FOREIGN KEY (IdUsuario)    REFERENCES UsuarioTrabajador (IdUsuario),
    CONSTRAINT FK_UTCarrera_SubDominio  FOREIGN KEY (IdSubDominio) REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- Cliente
-- -----------------------------------------------------------
CREATE TABLE Cliente (
    IdCliente           INT             NOT NULL IDENTITY(1,1),
    IdEmpresa           INT             NOT NULL,
    IdDireccion         INT             NOT NULL,
    NombreCliente       NVARCHAR(MAX)   NOT NULL,
    ContactoEmergencia  NVARCHAR(MAX)   NULL,
    CreateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Cliente PRIMARY KEY (IdCliente),
    CONSTRAINT FK_Cliente_Empresa   FOREIGN KEY (IdEmpresa)   REFERENCES SubDominio (IdSubDominio),
    CONSTRAINT FK_Cliente_Direccion FOREIGN KEY (IdDireccion) REFERENCES Direccion (IdDireccion)
);

-- -----------------------------------------------------------
-- Servicio
-- -----------------------------------------------------------
CREATE TABLE Servicio (
    IdServicio      INT             NOT NULL IDENTITY(1,1),
    IdCliente       INT             NOT NULL,
    IdDireccion     INT             NOT NULL,
    TipoServicio    INT             NOT NULL,
    FechaInicio     DATE            NOT NULL,
    FechaFinal      DATE            NULL,
    Costo           DECIMAL(18,2)   NOT NULL,
    Descripcion     NVARCHAR(MAX)   NULL,
    CreateAt        DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt        DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Servicio PRIMARY KEY (IdServicio),
    CONSTRAINT FK_Servicio_Cliente      FOREIGN KEY (IdCliente)     REFERENCES Cliente (IdCliente),
    CONSTRAINT FK_Servicio_Direccion    FOREIGN KEY (IdDireccion)   REFERENCES Direccion (IdDireccion),
    CONSTRAINT FK_Servicio_TipoServicio FOREIGN KEY (TipoServicio)  REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- Horario
-- -----------------------------------------------------------
CREATE TABLE Horario (
    IdHorario   INT         NOT NULL IDENTITY(1,1),
    HoraEntrada TIME        NOT NULL,
    HoraSalida  TIME        NOT NULL,
    CreateAt    DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Horario PRIMARY KEY (IdHorario)
);

-- -----------------------------------------------------------
-- AsignacionEmpleado
-- -----------------------------------------------------------
CREATE TABLE AsignacionEmpleado (
    IdUsuario       INT         NOT NULL,
    IdServicio      INT         NOT NULL,
    IdHorario       INT         NOT NULL,
    DiasLaborales   INT         NOT NULL,
    CreateAt        DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt        DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_AsignacionEmpleado PRIMARY KEY (IdUsuario, IdServicio, IdHorario),
    CONSTRAINT FK_AsignacionEmpleado_Usuario        FOREIGN KEY (IdUsuario)     REFERENCES UsuarioTrabajador (IdUsuario),
    CONSTRAINT FK_AsignacionEmpleado_Servicio       FOREIGN KEY (IdServicio)    REFERENCES Servicio (IdServicio),
    CONSTRAINT FK_AsignacionEmpleado_Horario        FOREIGN KEY (IdHorario)     REFERENCES Horario (IdHorario),
    CONSTRAINT FK_AsignacionEmpleado_DiasLaborales  FOREIGN KEY (DiasLaborales) REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- EstadoCalidad
-- -----------------------------------------------------------
CREATE TABLE EstadoCalidad (
    IdEstadoCalidad     INT             NOT NULL IDENTITY(1,1),
    EstadoCalidad1      NVARCHAR(MAX)   NOT NULL,
    CreateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_EstadoCalidad PRIMARY KEY (IdEstadoCalidad)
);

-- -----------------------------------------------------------
-- Provedore (Proveedor)
-- -----------------------------------------------------------
CREATE TABLE Provedore (
    IdProveedor INT             NOT NULL IDENTITY(1,1),
    IdEmpresa   INT             NOT NULL,
    IdProducto  INT             NOT NULL,
    Nit         INT             NOT NULL,
    Nombre      NVARCHAR(MAX)   NOT NULL,
    CreateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Provedore PRIMARY KEY (IdProveedor),
    CONSTRAINT FK_Provedore_Empresa  FOREIGN KEY (IdEmpresa)  REFERENCES SubDominio (IdSubDominio),
    CONSTRAINT FK_Provedore_Producto FOREIGN KEY (IdProducto) REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- MarcaMaquinarium
-- -----------------------------------------------------------
CREATE TABLE MarcaMaquinarium (
    IdMarcaMaquinaria   INT             NOT NULL IDENTITY(1,1),
    IdPais              INT             NOT NULL,
    NombreMarca         NVARCHAR(MAX)   NOT NULL,
    CreateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_MarcaMaquinarium PRIMARY KEY (IdMarcaMaquinaria),
    CONSTRAINT FK_MarcaMaquinarium_Pais FOREIGN KEY (IdPais) REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- Maquinarium
-- -----------------------------------------------------------
CREATE TABLE Maquinarium (
    IdMaquinaria        INT             NOT NULL IDENTITY(1,1),
    IdProveedor         INT             NOT NULL,
    IdTipoMaquinaria    INT             NOT NULL,
    IdEstadoCalidad     INT             NOT NULL,
    IdMarcaMaquinaria   INT             NOT NULL,
    NombreMaquinaria    NVARCHAR(MAX)   NOT NULL,
    CodigoInv           NVARCHAR(MAX)   NOT NULL,
    Descripcion         NVARCHAR(MAX)   NULL,
    CreateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Maquinarium PRIMARY KEY (IdMaquinaria),
    CONSTRAINT FK_Maquinarium_Proveedor      FOREIGN KEY (IdProveedor)       REFERENCES Provedore (IdProveedor),
    CONSTRAINT FK_Maquinarium_TipoMaquinaria FOREIGN KEY (IdTipoMaquinaria)  REFERENCES SubDominio (IdSubDominio),
    CONSTRAINT FK_Maquinarium_EstadoCalidad  FOREIGN KEY (IdEstadoCalidad)   REFERENCES EstadoCalidad (IdEstadoCalidad),
    CONSTRAINT FK_Maquinarium_Marca          FOREIGN KEY (IdMarcaMaquinaria) REFERENCES MarcaMaquinarium (IdMarcaMaquinaria)
);

-- -----------------------------------------------------------
-- AsignacionMaquinarium
-- -----------------------------------------------------------
CREATE TABLE AsignacionMaquinarium (
    IdServicio      INT             NOT NULL,
    IdMaquinaria    INT             NOT NULL,
    Cantidad        INT             NOT NULL,
    Descripcion     NVARCHAR(MAX)   NULL,
    CONSTRAINT PK_AsignacionMaquinarium PRIMARY KEY (IdServicio, IdMaquinaria),
    CONSTRAINT FK_AsignacionMaquinarium_Servicio   FOREIGN KEY (IdServicio)   REFERENCES Servicio (IdServicio),
    CONSTRAINT FK_AsignacionMaquinarium_Maquinaria FOREIGN KEY (IdMaquinaria) REFERENCES Maquinarium (IdMaquinaria)
);

-- -----------------------------------------------------------
-- HistorialEstadoMaquina
-- -----------------------------------------------------------
CREATE TABLE HistorialEstadoMaquina (
    IdHistorial         INT             NOT NULL IDENTITY(1,1),
    IdMaquinaria        INT             NOT NULL,
    IdEstadoCalidad     INT             NOT NULL,
    FechaCambio         DATETIME2       NOT NULL,
    Descripcion         NVARCHAR(MAX)   NULL,
    CreateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_HistorialEstadoMaquina PRIMARY KEY (IdHistorial),
    CONSTRAINT FK_HistorialEstadoMaquina_Maquinaria    FOREIGN KEY (IdMaquinaria)    REFERENCES Maquinarium (IdMaquinaria),
    CONSTRAINT FK_HistorialEstadoMaquina_EstadoCalidad FOREIGN KEY (IdEstadoCalidad) REFERENCES EstadoCalidad (IdEstadoCalidad)
);

-- -----------------------------------------------------------
-- Mantenimiento
-- -----------------------------------------------------------
CREATE TABLE Mantenimiento (
    IdMantenimiento     INT             NOT NULL IDENTITY(1,1),
    FechaMantenimiento  DATE            NOT NULL,
    Descripcion         NVARCHAR(MAX)   NULL,
    Costo               DECIMAL(18,2)   NOT NULL,
    CreateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Mantenimiento PRIMARY KEY (IdMantenimiento)
);

-- -----------------------------------------------------------
-- MantenimientosMaquinarium
-- -----------------------------------------------------------
CREATE TABLE MantenimientosMaquinarium (
    IdMaquinaria    INT         NOT NULL,
    IdMantenimiento INT         NOT NULL,
    CreateAt        DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt        DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_MantenimientosMaquinarium PRIMARY KEY (IdMaquinaria, IdMantenimiento),
    CONSTRAINT FK_MantenimientosMaquinarium_Maquinaria    FOREIGN KEY (IdMaquinaria)    REFERENCES Maquinarium (IdMaquinaria),
    CONSTRAINT FK_MantenimientosMaquinarium_Mantenimiento FOREIGN KEY (IdMantenimiento) REFERENCES Mantenimiento (IdMantenimiento)
);

-- -----------------------------------------------------------
-- Recurso
-- -----------------------------------------------------------
CREATE TABLE Recurso (
    IdRecurso   INT             NOT NULL IDENTITY(1,1),
    IdProveedor INT             NOT NULL,
    IdTipo      INT             NOT NULL,
    Nombre      NVARCHAR(MAX)   NOT NULL,
    Descripcion NVARCHAR(MAX)   NULL,
    CreateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Recurso PRIMARY KEY (IdRecurso),
    CONSTRAINT FK_Recurso_Proveedor FOREIGN KEY (IdProveedor) REFERENCES Provedore (IdProveedor),
    CONSTRAINT FK_Recurso_Tipo      FOREIGN KEY (IdTipo)      REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- AsignacionRecurso
-- -----------------------------------------------------------
CREATE TABLE AsignacionRecurso (
    IdServicio  INT NOT NULL,
    IdRecurso   INT NOT NULL,
    Cantidad    INT NOT NULL,
    CONSTRAINT PK_AsignacionRecurso PRIMARY KEY (IdServicio, IdRecurso),
    CONSTRAINT FK_AsignacionRecurso_Servicio FOREIGN KEY (IdServicio) REFERENCES Servicio (IdServicio),
    CONSTRAINT FK_AsignacionRecurso_Recurso  FOREIGN KEY (IdRecurso)  REFERENCES Recurso (IdRecurso)
);

-- -----------------------------------------------------------
-- Incidente
-- -----------------------------------------------------------
CREATE TABLE Incidente (
    IdIncidente INT             NOT NULL IDENTITY(1,1),
    IdServicio  INT             NOT NULL,
    Descripcion NVARCHAR(MAX)   NOT NULL,
    Fecha       DATE            NOT NULL,
    CreateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Incidente PRIMARY KEY (IdIncidente),
    CONSTRAINT FK_Incidente_Servicio FOREIGN KEY (IdServicio) REFERENCES Servicio (IdServicio)
);

-- -----------------------------------------------------------
-- ServicioTerminado
-- -----------------------------------------------------------
CREATE TABLE ServicioTerminado (
    IdServicioTerminado INT             NOT NULL IDENTITY(1,1),
    IdServicio          INT             NOT NULL,
    Satisfaccion        INT             NOT NULL,
    Comentarios         NVARCHAR(MAX)   NULL,
    CreateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt            DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_ServicioTerminado PRIMARY KEY (IdServicioTerminado),
    CONSTRAINT FK_ServicioTerminado_Servicio     FOREIGN KEY (IdServicio)   REFERENCES Servicio (IdServicio),
    CONSTRAINT FK_ServicioTerminado_Satisfaccion FOREIGN KEY (Satisfaccion) REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- TelefonoCliente
-- -----------------------------------------------------------
CREATE TABLE TelefonoCliente (
    IdTelefono  INT         NOT NULL IDENTITY(1,1),
    Telefono    INT         NOT NULL,
    IdDetalle   INT         NOT NULL,
    IdCliente   INT         NOT NULL,
    CreateAt    DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_TelefonoCliente PRIMARY KEY (IdTelefono),
    CONSTRAINT FK_TelefonoCliente_Cliente  FOREIGN KEY (IdCliente)  REFERENCES Cliente (IdCliente),
    CONSTRAINT FK_TelefonoCliente_Detalle  FOREIGN KEY (IdDetalle)  REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- TelefonoProveedor
-- -----------------------------------------------------------
CREATE TABLE TelefonoProveedor (
    IdTelefono  INT         NOT NULL IDENTITY(1,1),
    Telefono    INT         NOT NULL,
    IdDetalle   INT         NOT NULL,
    IdProveedor INT         NOT NULL,
    CreateAt    DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_TelefonoProveedor PRIMARY KEY (IdTelefono),
    CONSTRAINT FK_TelefonoProveedor_Proveedor FOREIGN KEY (IdProveedor) REFERENCES Provedore (IdProveedor),
    CONSTRAINT FK_TelefonoProveedor_Detalle   FOREIGN KEY (IdDetalle)   REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- TelefonoUsuario
-- -----------------------------------------------------------
CREATE TABLE TelefonoUsuario (
    IdTelefonoUsuario   INT         NOT NULL IDENTITY(1,1),
    TelefonoUsuario1    INT         NOT NULL,
    IdUsuario           INT         NOT NULL,
    IdDetalle           INT         NOT NULL,
    CreateAt            DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt            DATETIME2   NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_TelefonoUsuario PRIMARY KEY (IdTelefonoUsuario),
    CONSTRAINT FK_TelefonoUsuario_Usuario  FOREIGN KEY (IdUsuario)  REFERENCES UsuarioTrabajador (IdUsuario),
    CONSTRAINT FK_TelefonoUsuario_Detalle  FOREIGN KEY (IdDetalle)  REFERENCES SubDominio (IdSubDominio)
);

-- -----------------------------------------------------------
-- Uniforme
-- -----------------------------------------------------------
CREATE TABLE Uniforme (
    IdUniforme      INT             NOT NULL IDENTITY(1,1),
    NombreUniforme  NVARCHAR(MAX)   NOT NULL,
    Talla           INT             NOT NULL,
    Descripcion     NVARCHAR(MAX)   NULL,
    CreateAt        DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt        DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Uniforme PRIMARY KEY (IdUniforme)
);

-- -----------------------------------------------------------
-- AsignacionUniforme
-- -----------------------------------------------------------
CREATE TABLE AsignacionUniforme (
    IdAsignacionUniforme    INT             NOT NULL IDENTITY(1,1),
    IdUsuario               INT             NOT NULL,
    IdUniforme              INT             NOT NULL,
    FechaEntrega            DATE            NOT NULL,
    FechaDevolucion         DATE            NULL,
    Estado                  NVARCHAR(MAX)   NOT NULL,
    CreateAt                DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt                DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_AsignacionUniforme PRIMARY KEY (IdAsignacionUniforme),
    CONSTRAINT FK_AsignacionUniforme_Usuario  FOREIGN KEY (IdUsuario)  REFERENCES UsuarioTrabajador (IdUsuario),
    CONSTRAINT FK_AsignacionUniforme_Uniforme FOREIGN KEY (IdUniforme) REFERENCES Uniforme (IdUniforme)
);

-- -----------------------------------------------------------
-- DocumentosUsuario
-- -----------------------------------------------------------
CREATE TABLE DocumentosUsuario (
    IdDocumento      INT             NOT NULL IDENTITY(1,1),
    IdUsuario        INT             NOT NULL,
    TipoDeDocumento  NVARCHAR(100)   NOT NULL,
    NombreArchivo    NVARCHAR(100)   NOT NULL,
    FechaSubida      DATE            NOT NULL,
    UbicacionArchivo NVARCHAR(200)   NOt NULL,
    CreateAt         DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt         DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_DocumentosUsuario PRIMARY KEY (IdDocumento),
    CONSTRAINT FK_DocumentosUsuario_Usuario FOREIGN KEY (IdUsuario) REFERENCES UsuarioTrabajador (IdUsuario)
);

-- -----------------------------------------------------------
-- Memorial
-- -----------------------------------------------------------
CREATE TABLE Memorial (
    IdMemorial  INT             NOT NULL IDENTITY(1,1),
    IdEmpleado  INT             NOT NULL,
    Descripcion NVARCHAR(MAX)   NOT NULL,
    CreateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt    DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Memorial PRIMARY KEY (IdMemorial),
    CONSTRAINT FK_Memorial_Empleado FOREIGN KEY (IdEmpleado) REFERENCES UsuarioTrabajador (IdUsuario)
);

-- -----------------------------------------------------------
-- Capacitacione
-- -----------------------------------------------------------
CREATE TABLE Capacitacione (
    IdCapacitacion  INT             NOT NULL IDENTITY(1,1),
    Nombre          NVARCHAR(MAX)   NOT NULL,
    Descripcion     NVARCHAR(MAX)   NULL,
    Fecha           DATE            NOT NULL,
    CreateAt        DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    UpdateAt        DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT PK_Capacitacione PRIMARY KEY (IdCapacitacion)
);

-- -----------------------------------------------------------
-- UsuariosCapacitacione
-- -----------------------------------------------------------
CREATE TABLE UsuariosCapacitacione (
    IdUsuario       INT             NOT NULL,
    IdCapacitacion  INT             NOT NULL,
    Estado          NVARCHAR(MAX)   NOT NULL,
    CONSTRAINT PK_UsuariosCapacitacione PRIMARY KEY (IdUsuario, IdCapacitacion),
    CONSTRAINT FK_UsuariosCapacitacione_Usuario      FOREIGN KEY (IdUsuario)      REFERENCES UsuarioTrabajador (IdUsuario),
    CONSTRAINT FK_UsuariosCapacitacione_Capacitacion FOREIGN KEY (IdCapacitacion) REFERENCES Capacitacione (IdCapacitacion)
);