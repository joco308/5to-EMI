CREATE TABLE [Dominios] (
  [id_dominio] INT PRIMARY KEY IDENTITY(1,1),
  [Dominio] NVARCHAR(100),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE [Sub_dominios] (
  [id_sub_dominios] INT PRIMARY KEY IDENTITY(1,1),
  [id_dominio] INT,
  [detalle] NVARCHAR(100),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Sub_dominios_id_dominio]
    FOREIGN KEY ([id_dominio])
      REFERENCES [Dominios]([id_dominio])
);

CREATE TABLE [Provedores] (
  [id_provedor] INT PRIMARY KEY IDENTITY(1,1),
  [id_empresa] INT,
  [NIT] INT,
  [nombre] NVARCHAR(50),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Provedores_id_empresa]
    FOREIGN KEY ([id_empresa])
      REFERENCES [Sub_dominios]([id_sub_dominios])
);

CREATE TABLE [Recursos] (
  [id_recurso] INT PRIMARY KEY IDENTITY(1,1),
  [id_provedor] INT,
  [id_tipo] INT,
  [nombre] NVARCHAR(100),
  [descripcion] NVARCHAR(300),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Recursos_id_provedor]
    FOREIGN KEY ([id_provedor])
      REFERENCES [Provedores]([id_provedor]),
  CONSTRAINT [FK_Recursos_id_tipo]
    FOREIGN KEY ([id_tipo])
      REFERENCES [Sub_dominios]([id_sub_dominios])
);

CREATE TABLE [Direccion] (
  [id_direccion] INT PRIMARY KEY IDENTITY(1,1),
  [id_zona] INT,
  [calle] NVARCHAR(100),
  [n_casa] INT,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Direccion_id_zona]
    FOREIGN KEY ([id_zona])
      REFERENCES [Sub_dominios]([id_sub_dominios])
);

CREATE TABLE [Roles] (
  [id_rol] INT PRIMARY KEY IDENTITY(1,1),
  [nombre_rol] NVARCHAR(50),
  [salario] INT,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE [Usuario_trabajador] (
  [id_usuario] INT PRIMARY KEY IDENTITY(1,1),
  [id_estado_civil] INT,
  [id_grado_academico] INT,
  [id_genero] INT,
  [Id_direccion] INT,
  [id_rol] INT,
  [id_pais] INT,
  [contraseña_hash] NVARCHAR(60),
  [correo] NVARCHAR(100),
  [ci] INT,
  [nombre_usuario] NVARCHAR(100),
  [fecha_nacimiento] DATE,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  [codigo2fa] INT,
  [expiracion] DATETIME2,
  [pendiente_2fa] BIT,
  [servicio_asignado] BIT,
  CONSTRAINT [FK_Usuario_trabajador_id_genero]
    FOREIGN KEY ([id_genero])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Usuario_trabajador_id_pais]
    FOREIGN KEY ([id_pais])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Usuario_trabajador_id_grado_academico]
    FOREIGN KEY ([id_grado_academico])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Usuario_trabajador_id_estado_civil]
    FOREIGN KEY ([id_estado_civil])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Usuario_trabajador_Id_direccion]
    FOREIGN KEY ([Id_direccion])
      REFERENCES [Direccion]([id_direccion]),
  CONSTRAINT [FK_Usuario_trabajador_id_rol]
    FOREIGN KEY ([id_rol])
      REFERENCES [Roles]([id_rol])
);

CREATE TABLE [Uniformes] (
  [id_uniforme] INT PRIMARY KEY IDENTITY(1,1),
  [nombre_uniforme] NVARCHAR(100),
  [talla] INT,
  [descripcion] NVARCHAR(300),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE [asignacion_Uniformes] (
  [id_asignacion_uniformes] INT PRIMARY KEY IDENTITY(1,1),
  [id_usuario] INT,
  [id_uniforme] INT,
  [fecha_entrega] DATE,
  [fecha_devolucion] DATE,
  [estado] NVARCHAR(50),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_asignacion_Uniformes_id_usuario]
    FOREIGN KEY ([id_usuario])
      REFERENCES [Usuario_trabajador]([id_usuario]),
  CONSTRAINT [FK_asignacion_Uniformes_id_uniforme]
    FOREIGN KEY ([id_uniforme])
      REFERENCES [Uniformes]([id_uniforme])
);

CREATE TABLE [Capacitaciones] (
  [id_capacitacion] INT PRIMARY KEY IDENTITY(1,1),
  [nombre] NVARCHAR(100),
  [descripcion] NVARCHAR(300),
  [fecha] DATE,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE [Carreras_usuario] (
  [id_carrera] INT,
  [id_usuario] INT,
  PRIMARY KEY ([id_carrera], [id_usuario]),
  CONSTRAINT [FK_Carreras_usuario_id_usuario]
    FOREIGN KEY ([id_usuario])
      REFERENCES [Usuario_trabajador]([id_usuario]),
  CONSTRAINT [FK_Carreras_usuario_id_carrera]
    FOREIGN KEY ([id_carrera])
      REFERENCES [Sub_dominios]([id_sub_dominios])
);

CREATE TABLE [Cliente] (
  [id_cliente] INT PRIMARY KEY IDENTITY(1,1),
  [id_empresa] INT,
  [nombre_cliente] NVARCHAR(100),
  [id_direccion] INT,
  [contacto_emergencia] NVARCHAR(50),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Cliente_id_empresa]
    FOREIGN KEY ([id_empresa])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Cliente_id_direccion]
    FOREIGN KEY ([id_direccion])
      REFERENCES [Direccion]([id_direccion])
);

CREATE TABLE [Telefono_cliente] (
  [id_telefono] INT PRIMARY KEY IDENTITY(1,1),
  [telefono] INT,
  [id_detalle] INT,
  [id_cliente] INT,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Telefono_cliente_id_detalle]
    FOREIGN KEY ([id_detalle])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Telefono_cliente_id_cliente]
    FOREIGN KEY ([id_cliente])
      REFERENCES [Cliente]([id_cliente])
);

CREATE TABLE [Horario] (
  [id_horario] INT PRIMARY KEY IDENTITY(1,1),
  [hora_entrada] TIME,
  [hora_salida] TIME,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE [Servicio] (
  [id_servicio] INT PRIMARY KEY IDENTITY(1,1),
  [id_cliente] INT,
  [id_direccion] INT,
  [tipo_servicio] INT,
  [fecha_inicio] DATE,
  [fecha_final] DATE,
  [costo] DECIMAL(10,2),
  [descripcion] NVARCHAR(300),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Servicio_tipo_servicio]
    FOREIGN KEY ([tipo_servicio])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Servicio_id_direccion]
    FOREIGN KEY ([id_direccion])
      REFERENCES [Direccion]([id_direccion]),
  CONSTRAINT [FK_Servicio_id_cliente]
    FOREIGN KEY ([id_cliente])
      REFERENCES [Cliente]([id_cliente])
);

CREATE TABLE [Asignacion_empleados] (
  [id_usuario] INT,
  [id_servicio] INT,
  [id_horario] INT,
  [dias_lavorales] INT,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  PRIMARY KEY ([id_usuario], [id_servicio]),
  CONSTRAINT [FK_Asignacion_empleados_id_usuario]
    FOREIGN KEY ([id_usuario])
      REFERENCES [Usuario_trabajador]([id_usuario]),
  CONSTRAINT [FK_Asignacion_empleados_id_horario]
    FOREIGN KEY ([id_horario])
      REFERENCES [Horario]([id_horario]),
  CONSTRAINT [FK_Asignacion_empleados_id_servicio]
    FOREIGN KEY ([id_servicio])
      REFERENCES [Servicio]([id_servicio]),
  CONSTRAINT [FK_Asignacion_empleados_dias_lavorales]
    FOREIGN KEY ([dias_lavorales])
      REFERENCES [Sub_dominios]([id_sub_dominios])
);

CREATE TABLE [Incidentes] (
  [id_incidente] INT PRIMARY KEY IDENTITY(1,1),
  [id_servicio] INT,
  [descripcion] NVARCHAR(300),
  [fecha] DATE,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Incidentes_id_servicio]
    FOREIGN KEY ([id_servicio])
      REFERENCES [Servicio]([id_servicio])
);

CREATE TABLE [Marca_maquinaria] (
  [id_marca_maquinaria] INT PRIMARY KEY IDENTITY(1,1),
  [id_pais] INT,
  [nombre_marca] NVARCHAR(100),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Marca_maquinaria_id_pais]
    FOREIGN KEY ([id_pais])
      REFERENCES [Sub_dominios]([id_sub_dominios])
);

CREATE TABLE [Maquinaria] (
  [id_maquinaria] INT PRIMARY KEY IDENTITY(1,1),
  [nombre_maquinaria] NVARCHAR(100),
  [codigo_inv] NVARCHAR(50),
  [id_provedor] INT,
  [tipo_maquinaria] INT,
  [id_estado_calidad] INT,
  [id_marca_maquinaria] INT,
  [descripcion] NVARCHAR(300),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Maquinaria_id_provedor]
    FOREIGN KEY ([id_provedor])
      REFERENCES [Provedores]([id_provedor]),
  CONSTRAINT [FK_Maquinaria_id_marca_maquinaria]
    FOREIGN KEY ([id_marca_maquinaria])
      REFERENCES [Marca_maquinaria]([id_marca_maquinaria]),
  CONSTRAINT [FK_Maquinaria_id_estado_calidad]
    FOREIGN KEY ([id_estado_calidad])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Maquinaria_tipo_maquinaria]
    FOREIGN KEY ([tipo_maquinaria])
      REFERENCES [Sub_dominios]([id_sub_dominios])
);

CREATE TABLE [Mantenimiento] (
  [id_mantenimiento] INT PRIMARY KEY IDENTITY(1,1),
  [fecha_mantenimiento] DATE,
  [descripcion] NVARCHAR(300),
  [costo] DECIMAL(10,2),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE [Mantenimientos_maquinaria] (
  [id_maquinaria] INT,
  [id_mantenimiento] INT,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  PRIMARY KEY ([id_maquinaria], [id_mantenimiento]),
  CONSTRAINT [FK_Mantenimientos_maquinaria_id_maquinaria]
    FOREIGN KEY ([id_maquinaria])
      REFERENCES [Maquinaria]([id_maquinaria]),
  CONSTRAINT [FK_Mantenimientos_maquinaria_id_mantenimiento]
    FOREIGN KEY ([id_mantenimiento])
      REFERENCES [Mantenimiento]([id_mantenimiento])
);

CREATE TABLE [Telefono_provedor] (
  [id_telefono] INT PRIMARY KEY IDENTITY(1,1),
  [telefono] INT,
  [id_detalle] INT,
  [id_provedor] INT,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Telefono_provedor_id_detalle]
    FOREIGN KEY ([id_detalle])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Telefono_provedor_id_provedor]
    FOREIGN KEY ([id_provedor])
      REFERENCES [Provedores]([id_provedor])
);

CREATE TABLE [Servicio_terminado] (
  [Id_servicio_terminado] INT PRIMARY KEY IDENTITY(1,1),
  [id_servicio] INT,
  [satisfaccion] INT,
  [comentarios] NVARCHAR(300),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Servicio_terminado_id_servicio]
    FOREIGN KEY ([id_servicio])
      REFERENCES [Servicio]([id_servicio]),
  CONSTRAINT [FK_Servicio_terminado_satisfaccion]
    FOREIGN KEY ([satisfaccion])
      REFERENCES [Sub_dominios]([id_sub_dominios])
);

CREATE TABLE [Asignacion_maquinaria] (
  [id_servicio] INT,
  [id_maquinaria] INT,
  [Cantidad] INT,
  [Descripcion] NVARCHAR(300),
  PRIMARY KEY ([id_servicio], [id_maquinaria]),
  CONSTRAINT [FK_Asignacion_maquinaria_id_maquinaria]
    FOREIGN KEY ([id_maquinaria])
      REFERENCES [Maquinaria]([id_maquinaria]),
  CONSTRAINT [FK_Asignacion_maquinaria_id_servicio]
    FOREIGN KEY ([id_servicio])
      REFERENCES [Servicio]([id_servicio])
);

CREATE TABLE [Usuarios_capacitaciones] (
  [id_usuario] INT,
  [id_capacitacion] INT,
  [estado] NVARCHAR(50),
  PRIMARY KEY ([id_usuario], [id_capacitacion]),
  CONSTRAINT [FK_Usuarios_capacitaciones_id_capacitacion]
    FOREIGN KEY ([id_capacitacion])
      REFERENCES [Capacitaciones]([id_capacitacion]),
  CONSTRAINT [FK_Usuarios_capacitaciones_id_usuario]
    FOREIGN KEY ([id_usuario])
      REFERENCES [Usuario_trabajador]([id_usuario])
);

CREATE TABLE [Memorial] (
  [id_memorial] INT PRIMARY KEY IDENTITY(1,1),
  [id_empleado] INT,
  [descripcion] NVARCHAR(MAX),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Memorial_id_empleado]
    FOREIGN KEY ([id_empleado])
      REFERENCES [Usuario_trabajador]([id_usuario])
);

CREATE TABLE [Historial_de_estado_de_maquina] (
  [id_historial] INT PRIMARY KEY IDENTITY(1,1),
  [id_maquinaria] INT,
  [id_estado_calidad] INT,
  [fecha_de_cambio] DATETIME2,
  [descripcion] NVARCHAR(300),
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Historial_de_estado_de_maquina_id_estado_calidad]
    FOREIGN KEY ([id_estado_calidad])
      REFERENCES [Sub_dominios]([id_sub_dominios]),
  CONSTRAINT [FK_Historial_de_estado_de_maquina_id_maquinaria]
    FOREIGN KEY ([id_maquinaria])
      REFERENCES [Maquinaria]([id_maquinaria])
);

CREATE TABLE [Telefono_usuarios] (
  [id_telefono_usuario] INT PRIMARY KEY IDENTITY(1,1),
  [telefono_usuario] INT,
  [id_usuario] INT,
  [id_detalle] INT,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Telefono_usuarios_id_usuario]
    FOREIGN KEY ([id_usuario])
      REFERENCES [Usuario_trabajador]([id_usuario]),
  CONSTRAINT [FK_Telefono_usuarios_id_detalle]
    FOREIGN KEY ([id_detalle])
      REFERENCES [Sub_dominios]([id_sub_dominios])
);

CREATE TABLE [Documentos_usuarios] (
  [id_documento] INT PRIMARY KEY IDENTITY(1,1),
  [id_usuario] INT,
  [tipo_de_documento] NVARCHAR(100),
  [archivo] NVARCHAR(MAX),
  [fecha_subida] DATE,
  [create_at] DATETIME2 DEFAULT GETDATE(),
  [update_at] DATETIME2 DEFAULT GETDATE(),
  CONSTRAINT [FK_Documentos_usuarios_id_usuario]
    FOREIGN KEY ([id_usuario])
      REFERENCES [Usuario_trabajador]([id_usuario])
);

CREATE TABLE [Asignacion_recursos] (
  [id_servicio] INT,
  [id_recurso] INT,
  [cantidad] INT,
  PRIMARY KEY ([id_servicio], [id_recurso]),
  CONSTRAINT [FK_Asignacion_recursos_id_recurso]
    FOREIGN KEY ([id_recurso])
      REFERENCES [Recursos]([id_recurso]),
  CONSTRAINT [FK_Asignacion_recursos_id_servicio]
    FOREIGN KEY ([id_servicio])
      REFERENCES [Servicio]([id_servicio])
);