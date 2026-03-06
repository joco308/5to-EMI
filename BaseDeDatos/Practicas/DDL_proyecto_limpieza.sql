-- 1. Tablas Maestras (Sin dependencias)
CREATE TABLE proveedor_herramientas (
    id_proveedor_herramientas INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(255),
    nit BIGINT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE dias_semana (
    id_dia_s INT PRIMARY KEY IDENTITY(1,1),
    dia NVARCHAR(20),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE uniformes (
    id_uniforme INT PRIMARY KEY IDENTITY(1,1),
    nombre_uniforme NVARCHAR(255),
    talla NVARCHAR(50),
    descripcion NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE proveedor_liquido_limpieza (
    id_proveedor_llim INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(255),
    nit BIGINT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE categoria_liquido (
    id_categoria_l INT PRIMARY KEY IDENTITY(1,1),
    categoria NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE marca_insumo (
    id_marca_insumo INT PRIMARY KEY IDENTITY(1,1),
    marca NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE estado_calidad (
    id_estado_calidad INT PRIMARY KEY IDENTITY(1,1),
    estado NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE tipo_servicio (
    id_tipo_servicio INT PRIMARY KEY IDENTITY(1,1),
    tipo NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE herramienta_utilizar (
    id_herramienta_utilizar INT PRIMARY KEY IDENTITY(1,1),
    herramienta_servicio NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE contrasenas_administradores (
    id_contrasena INT PRIMARY KEY IDENTITY(1,1),
    contrasena_hash NVARCHAR(MAX),
    correo NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE pais (
    id_pais INT PRIMARY KEY IDENTITY(1,1),
    pais NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE satisfaccion (
    id_satisfaccion INT PRIMARY KEY IDENTITY(1,1),
    satisfaccion NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE proveedor_maquinaria (
    id_proveedor_maquinaria INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(255),
    nit BIGINT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE estado_civil (
    id_estado_civil INT PRIMARY KEY IDENTITY(1,1),
    estado NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE zona (
    id_zona INT PRIMARY KEY IDENTITY(1,1),
    zona NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE sexo (
    id_sexo INT PRIMARY KEY IDENTITY(1,1),
    sexo NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE horario (
    id_horario INT PRIMARY KEY IDENTITY(1,1),
    hora_entrada TIME,
    hora_salida TIME,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE grado_academico (
    id_grado_acad INT PRIMARY KEY IDENTITY(1,1),
    grado NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE carrera (
    id_carrera INT PRIMARY KEY IDENTITY(1,1),
    carrera NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE empresa (
    id_empresa INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE liquido_utilizar (
    id_liquido_utilizar INT PRIMARY KEY IDENTITY(1,1),
    liquido_servicio NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE categoria_herramienta (
    id_categoria_h INT PRIMARY KEY IDENTITY(1,1),
    categoria NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE estado_uso (
    id_estado_uso INT PRIMARY KEY IDENTITY(1,1),
    estado NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE capacitaciones (
    id_capacitacion INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(255),
    descripcion NVARCHAR(MAX),
    fecha DATE,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE maquina_utilizar (
    id_maquina_utilizar INT PRIMARY KEY IDENTITY(1,1),
    maquina_servicio NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE tipo_maquinaria (
    id_tipo_maquinaria INT PRIMARY KEY IDENTITY(1,1),
    tipo NVARCHAR(255),
    descripcion NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

CREATE TABLE mantenimiento_maquinaria (
    id_mantenimiento INT PRIMARY KEY IDENTITY(1,1),
    fecha_mantenimiento DATETIME,
    descripcion NVARCHAR(MAX),
    costo DECIMAL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME
);

-- 2. Tablas con Dependencias Nivel 1
CREATE TABLE marcas (
    id_marca INT PRIMARY KEY IDENTITY(1,1),
    id_pais INT,
    marca NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE liquidos_limpieza (
    id_liquido_limpieza INT PRIMARY KEY IDENTITY(1,1),
    id_proveedor_llim INT,
    id_marca_insumo INT,
    nombre NVARCHAR(255),
    codigo_inv NVARCHAR(100),
    descripcion NVARCHAR(MAX),
    id_categoria_l INT,
    cantidad INT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_proveedor_llim) REFERENCES proveedor_liquido_limpieza(id_proveedor_llim),
    FOREIGN KEY (id_categoria_l) REFERENCES categoria_liquido(id_categoria_l),
    FOREIGN KEY (id_marca_insumo) REFERENCES marca_insumo(id_marca_insumo)
);

CREATE TABLE direccion (
    id_direccion INT PRIMARY KEY IDENTITY(1,1),
    id_zona INT,
    calle NVARCHAR(255),
    n_casa INT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_zona) REFERENCES zona(id_zona)
);

CREATE TABLE sucursal (
    id_sucursal INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(255),
    id_direccion INT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

CREATE TABLE puesto (
    id_puesto INT PRIMARY KEY IDENTITY(1,1),
    nombre_puesto NVARCHAR(255),
    salario DECIMAL,
    id_sucursal INT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
);

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY IDENTITY(1,1),
    id_contrasena INT,
    id_estado_civil INT,
    id_carrera INT,
    id_grado_acad INT,
    id_sexo INT,
    id_direccion INT,
    id_horario INT,
    id_puesto INT,
    id_pais INT,
    ci BIGINT,
    nombre NVARCHAR(255),
    edad INT,
    celular BIGINT,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_contrasena) REFERENCES contrasenas_administradores(id_contrasena),
    FOREIGN KEY (id_estado_civil) REFERENCES estado_civil(id_estado_civil),
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
    FOREIGN KEY (id_sexo) REFERENCES sexo(id_sexo),
    FOREIGN KEY (id_puesto) REFERENCES puesto(id_puesto),
    FOREIGN KEY (id_horario) REFERENCES horario(id_horario),
    FOREIGN KEY (id_grado_acad) REFERENCES grado_academico(id_grado_acad),
    FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera),
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    id_empresa INT,
    nombre_cliente NVARCHAR(255),
    id_direccion INT,
    contacto_emergencia NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa),
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

-- 3. Tablas con Dependencias Nivel 2 (Servicios y Asignaciones)
CREATE TABLE servicio (
    id_servicio INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT,
    id_direccion INT,
    id_tipo_servicio INT,
    id_maquina_utilizar INT,
    id_liquido_utilizar INT,
    id_herramienta_utilizar INT,
    fecha_inicio DATE,
    fecha_final DATE,
    costo DECIMAL,
    descripcion NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_tipo_servicio) REFERENCES tipo_servicio(id_tipo_servicio),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
    FOREIGN KEY (id_maquina_utilizar) REFERENCES maquina_utilizar(id_maquina_utilizar),
    FOREIGN KEY (id_liquido_utilizar) REFERENCES liquido_utilizar(id_liquido_utilizar),
    FOREIGN KEY (id_herramienta_utilizar) REFERENCES herramienta_utilizar(id_herramienta_utilizar)
);

CREATE TABLE asignacion (
    id_asignacion INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT,
    id_servicio INT,
    fecha_servicio DATE,
    hora_entrada TIME,
    hora_salida TIME,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- 4. Tablas de Relación Intermedia (N:M) e Incidentes
CREATE TABLE asignacion_liquidos_limpieza (
    id_asignacion INT,
    id_liquido_limpieza INT,
    hora_inicio TIME,
    hora_final TIME,
    cantidad INT,
    created_at DATETIME DEFAULT GETDATE(), -- Agregado para coherencia
    updated_at DATETIME,                   -- Agregado para coherencia
    PRIMARY KEY (id_asignacion, id_liquido_limpieza),
    FOREIGN KEY (id_liquido_limpieza) REFERENCES liquidos_limpieza(id_liquido_limpieza),
    FOREIGN KEY (id_asignacion) REFERENCES asignacion(id_asignacion)
);

CREATE TABLE liquido_para_el_servicio (
    id_liquido_limpieza INT,
    id_liquido_utilizar INT,
    PRIMARY KEY (id_liquido_limpieza, id_liquido_utilizar),
    FOREIGN KEY (id_liquido_limpieza) REFERENCES liquidos_limpieza(id_liquido_limpieza),
    FOREIGN KEY (id_liquido_utilizar) REFERENCES liquido_utilizar(id_liquido_utilizar)
);

CREATE TABLE servicio_terminado (
    id_servicio_terminado INT PRIMARY KEY IDENTITY(1,1),
    id_servicio INT,
    id_satisfaccion INT,
    comentarios NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_satisfaccion) REFERENCES satisfaccion(id_satisfaccion),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);

CREATE TABLE asignacion_uniformes (
    id_asignacion_uniformes INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT,
    id_uniforme INT,
    fecha_entrega DATE,
    estado NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_uniforme) REFERENCES uniformes(id_uniforme),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE herramienta_limpieza (
    id_herramienta INT PRIMARY KEY IDENTITY(1,1),
    id_estado_calidad INT,
    id_proveedor_herramientas INT,
    id_estado_uso INT,
    id_categoria_h INT,
    nombre NVARCHAR(255),
    codigo_inv NVARCHAR(100),
    descripcion NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_categoria_h) REFERENCES categoria_herramienta(id_categoria_h),
    FOREIGN KEY (id_estado_uso) REFERENCES estado_uso(id_estado_uso),
    FOREIGN KEY (id_proveedor_herramientas) REFERENCES proveedor_herramientas(id_proveedor_herramientas),
    FOREIGN KEY (id_estado_calidad) REFERENCES estado_calidad(id_estado_calidad)
);

CREATE TABLE herramienta_para_el_servicio (
    id_herramienta_utilizar INT,
    id_herramienta INT,
    PRIMARY KEY (id_herramienta_utilizar, id_herramienta),
    FOREIGN KEY (id_herramienta) REFERENCES herramienta_limpieza(id_herramienta),
    FOREIGN KEY (id_herramienta_utilizar) REFERENCES herramienta_utilizar(id_herramienta_utilizar)
);

CREATE TABLE asignacion_herramienta (
    id_asignacion INT,
    id_herramienta INT,
    hora_inicio TIME,
    hora_final TIME,
    descripcion NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    PRIMARY KEY (id_asignacion, id_herramienta),
    FOREIGN KEY (id_asignacion) REFERENCES asignacion(id_asignacion),
    FOREIGN KEY (id_herramienta) REFERENCES herramienta_limpieza(id_herramienta)
);

CREATE TABLE maquinaria (
    id_maquinaria INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(255),
    codigo_inv NVARCHAR(100),
    id_proveedor_maquinaria INT,
    id_tipo_maquinaria INT,
    id_estado_calidad INT,
    id_marca INT,
    id_estado_uso INT,
    id_mantenimiento INT,
    descripcion NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_mantenimiento) REFERENCES mantenimiento_maquinaria(id_mantenimiento),
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
    FOREIGN KEY (id_estado_uso) REFERENCES estado_uso(id_estado_uso),
    FOREIGN KEY (id_proveedor_maquinaria) REFERENCES proveedor_maquinaria(id_proveedor_maquinaria),
    FOREIGN KEY (id_tipo_maquinaria) REFERENCES tipo_maquinaria(id_tipo_maquinaria),
    FOREIGN KEY (id_estado_calidad) REFERENCES estado_calidad(id_estado_calidad)
);

CREATE TABLE incidentes (
    id_incidente INT PRIMARY KEY IDENTITY(1,1),
    id_servicio INT,
    descripcion NVARCHAR(MAX),
    fecha DATE,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);

CREATE TABLE maquina_para_el_servicio (
    id_maquina_utilizar INT,
    id_maquinaria INT,
    PRIMARY KEY (id_maquina_utilizar, id_maquinaria),
    FOREIGN KEY (id_maquina_utilizar) REFERENCES maquina_utilizar(id_maquina_utilizar),
    FOREIGN KEY (id_maquinaria) REFERENCES maquinaria(id_maquinaria)
);

CREATE TABLE asignacion_maquinaria (
    id_asignacion INT,
    id_maquinaria INT,
    hora_inicio TIME,
    hora_final TIME,
    descripcion NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(), -- Agregado para coherencia
    updated_at DATETIME,                   -- Agregado para coherencia
    PRIMARY KEY (id_asignacion, id_maquinaria),
    FOREIGN KEY (id_asignacion) REFERENCES asignacion(id_asignacion),
    FOREIGN KEY (id_maquinaria) REFERENCES maquinaria(id_maquinaria)
);

CREATE TABLE historial_estado_maquina (
    id_historial INT PRIMARY KEY IDENTITY(1,1),
    id_maquinaria INT,
    id_estado_calidad INT,
    fecha_cambio DATETIME,
    descripcion NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_estado_calidad) REFERENCES estado_calidad(id_estado_calidad),
    FOREIGN KEY (id_maquinaria) REFERENCES maquinaria(id_maquinaria)
);

CREATE TABLE usuarios_capacitaciones (
    id_usuario INT,
    id_capacitacion INT,
    estado NVARCHAR(255),
    PRIMARY KEY (id_usuario, id_capacitacion),
    FOREIGN KEY (id_capacitacion) REFERENCES capacitaciones(id_capacitacion),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE dias_laborales (
    id_dia_s INT,
    id_horario INT,
    PRIMARY KEY (id_dia_s, id_horario),
    FOREIGN KEY (id_horario) REFERENCES horario(id_horario),
    FOREIGN KEY (id_dia_s) REFERENCES dias_semana(id_dia_s)
);

CREATE TABLE documentos_usuarios (
    id_documento INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT,
    tipo_de_documento NVARCHAR(255),
    archivo NVARCHAR(MAX),
    fecha_subida DATE,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);