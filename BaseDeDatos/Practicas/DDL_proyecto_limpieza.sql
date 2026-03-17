-- ============================================================
-- SCHEMA ADAPTADO PARA SQL SERVER - snake_case
-- 53 Tablas | Sintaxis corregida | Constraints agregados
-- ============================================================

-- ============================================================
-- 1. provedor_herramientas
-- ============================================================
CREATE TABLE provedor_herramientas (
    id_provedor_herramientas INT IDENTITY(1,1) NOT NULL,
    nombre                   NVARCHAR(100)     NOT NULL,
    nit                      INT               NOT NULL,
    create_at                DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at                DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_provedor_herramientas PRIMARY KEY (id_provedor_herramientas)
);

-- ============================================================
-- 2. dias_de_la_semana
-- ============================================================
CREATE TABLE dias_de_la_semana (
    id_dias_semana INT IDENTITY(1,1) NOT NULL,
    dia            DATE              NOT NULL,
    create_at      DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at      DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_dias_de_la_semana PRIMARY KEY (id_dias_semana)
);

-- ============================================================
-- 3. uniformes
-- ============================================================
CREATE TABLE uniformes (
    id_uniforme     INT IDENTITY(1,1) NOT NULL,
    nombre_uniforme NVARCHAR(100)     NOT NULL,
    talla           INT               NOT NULL,
    descripcion     NVARCHAR(300)         NULL,
    create_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_uniformes PRIMARY KEY (id_uniforme)
);

-- ============================================================
-- 4. provedor_liquido_de_limpieza
-- ============================================================
CREATE TABLE provedor_liquido_de_limpieza (
    id_provedor_liquido_limpieza INT IDENTITY(1,1) NOT NULL,
    nombre_provedor              NVARCHAR(100)     NOT NULL,
    nit                          INT               NOT NULL,
    create_at                    DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at                    DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_provedor_liquido_de_limpieza PRIMARY KEY (id_provedor_liquido_limpieza)
);

-- ============================================================
-- 5. categoria_liquido
-- ============================================================
CREATE TABLE categoria_liquido (
    id_categoria_liquido INT IDENTITY(1,1) NOT NULL,
    categoria_liquido    NVARCHAR(50)      NOT NULL,
    create_at            DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at            DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_categoria_liquido PRIMARY KEY (id_categoria_liquido)
);

-- ============================================================
-- 6. marca_insumo
-- ============================================================
CREATE TABLE marca_insumo (
    id_marca_insumo INT IDENTITY(1,1) NOT NULL,
    marca           NVARCHAR(50)      NOT NULL,
    create_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_marca_insumo PRIMARY KEY (id_marca_insumo)
);

-- ============================================================
-- 7. liquidos_de_limpieza
-- ============================================================
CREATE TABLE liquidos_de_limpieza (
    id_liquido_limpieza          INT IDENTITY(1,1) NOT NULL,
    id_provedor_liquido_limpieza INT               NOT NULL,
    id_marca_insumo              INT               NOT NULL,
    nombre_liquido_limpieza      NVARCHAR(100)     NOT NULL,
    codigo_inv                   NVARCHAR(50)      NOT NULL,
    descripcion                  NVARCHAR(300)         NULL,
    id_categoria_liquido         INT               NOT NULL,
    cantidad_litros              INT               NOT NULL,
    create_at                    DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at                    DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_liquidos_de_limpieza PRIMARY KEY (id_liquido_limpieza),
    CONSTRAINT FK_liquidos_provedor FOREIGN KEY (id_provedor_liquido_limpieza)
        REFERENCES provedor_liquido_de_limpieza (id_provedor_liquido_limpieza),
    CONSTRAINT FK_liquidos_categoria FOREIGN KEY (id_categoria_liquido)
        REFERENCES categoria_liquido (id_categoria_liquido),
    CONSTRAINT FK_liquidos_marca FOREIGN KEY (id_marca_insumo)
        REFERENCES marca_insumo (id_marca_insumo)
);

-- ============================================================
-- 8. estado_calidad
-- ============================================================
CREATE TABLE estado_calidad (
    id_estado_calidad INT IDENTITY(1,1) NOT NULL,
    estado_calidad    NVARCHAR(100)     NOT NULL,
    create_at         DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at         DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_estado_calidad PRIMARY KEY (id_estado_calidad)
);

-- ============================================================
-- 9. tipo_de_servicio
-- ============================================================
CREATE TABLE tipo_de_servicio (
    id_tipo_servicio INT IDENTITY(1,1) NOT NULL,
    tipo             NVARCHAR(100)     NOT NULL,
    create_at        DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at        DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_tipo_de_servicio PRIMARY KEY (id_tipo_servicio)
);

-- ============================================================
-- 10. contrasenas_administradores
-- ============================================================
CREATE TABLE contrasenas_administradores (
    id_contrasena   INT IDENTITY(1,1) NOT NULL,
    contrasena_hash VARBINARY(64)     NOT NULL,
    correo          NVARCHAR(50)      NOT NULL,
    create_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_contrasenas_administradores PRIMARY KEY (id_contrasena)
);

-- ============================================================
-- 11. pais
-- ============================================================
CREATE TABLE pais (
    id_pais   INT IDENTITY(1,1) NOT NULL,
    pais      NVARCHAR(50)      NOT NULL,
    create_at DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_pais PRIMARY KEY (id_pais)
);

-- ============================================================
-- 12. marca_maquinaria
-- ============================================================
CREATE TABLE marca_maquinaria (
    id_marca_maquinaria INT IDENTITY(1,1) NOT NULL,
    id_pais             INT               NOT NULL,
    nombre_marca        NVARCHAR(100)     NOT NULL,
    create_at           DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at           DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_marca_maquinaria PRIMARY KEY (id_marca_maquinaria),
    CONSTRAINT FK_marca_maquinaria_pais FOREIGN KEY (id_pais)
        REFERENCES pais (id_pais)
);

-- ============================================================
-- 13. satisfaccion
-- ============================================================
CREATE TABLE satisfaccion (
    id_satisfaccion INT IDENTITY(1,1) NOT NULL,
    satisfaccion    NVARCHAR(50)      NOT NULL,
    create_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_satisfaccion PRIMARY KEY (id_satisfaccion)
);

-- ============================================================
-- 14. provedor_maquinaria
-- ============================================================
CREATE TABLE provedor_maquinaria (
    id_provedor_maquinaria INT IDENTITY(1,1) NOT NULL,
    nombre_provedor        NVARCHAR(100)     NOT NULL,
    nit                    INT               NOT NULL,
    create_at              DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at              DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_provedor_maquinaria PRIMARY KEY (id_provedor_maquinaria)
);

-- ============================================================
-- 15. estado_civil
-- ============================================================
CREATE TABLE estado_civil (
    id_estado_civil INT IDENTITY(1,1) NOT NULL,
    estado          NVARCHAR(50)      NOT NULL,
    create_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_estado_civil PRIMARY KEY (id_estado_civil)
);

-- ============================================================
-- 16. zona
-- ============================================================
CREATE TABLE zona (
    id_zona   INT IDENTITY(1,1) NOT NULL,
    zona      NVARCHAR(50)      NOT NULL,
    create_at DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_zona PRIMARY KEY (id_zona)
);

-- ============================================================
-- 17. direccion
-- ============================================================
CREATE TABLE direccion (
    id_direccion INT IDENTITY(1,1) NOT NULL,
    id_zona      INT               NOT NULL,
    calle        NVARCHAR(100)     NOT NULL,
    n_casa       INT                   NULL,
    create_at    DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at    DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_direccion PRIMARY KEY (id_direccion),
    CONSTRAINT FK_direccion_zona FOREIGN KEY (id_zona)
        REFERENCES zona (id_zona)
);

-- ============================================================
-- 18. sexo
-- ============================================================
CREATE TABLE sexo (
    id_sexo   INT IDENTITY(1,1) NOT NULL,
    sexo      NVARCHAR(50)      NOT NULL,
    create_at DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_sexo PRIMARY KEY (id_sexo)
);

-- ============================================================
-- 19. sucursal
-- ============================================================
CREATE TABLE sucursal (
    id_sucursal     INT IDENTITY(1,1) NOT NULL,
    nombre_sucursal NVARCHAR(100)     NOT NULL,
    id_direccion    INT               NOT NULL,
    create_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_sucursal PRIMARY KEY (id_sucursal),
    CONSTRAINT FK_sucursal_direccion FOREIGN KEY (id_direccion)
        REFERENCES direccion (id_direccion)
);

-- ============================================================
-- 20. puesto
-- ============================================================
CREATE TABLE puesto (
    id_puesto     INT IDENTITY(1,1) NOT NULL,
    nombre_puesto NVARCHAR(50)      NOT NULL,
    salario       INT               NOT NULL,
    id_sucursal   INT               NOT NULL,
    create_at     DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at     DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_puesto PRIMARY KEY (id_puesto),
    CONSTRAINT FK_puesto_sucursal FOREIGN KEY (id_sucursal)
        REFERENCES sucursal (id_sucursal)
);

-- ============================================================
-- 21. horario
-- ============================================================
CREATE TABLE horario (
    id_horario   INT IDENTITY(1,1) NOT NULL,
    hora_entrada TIME              NOT NULL,
    hora_salida  TIME              NOT NULL,
    create_at    DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at    DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_horario PRIMARY KEY (id_horario)
);

-- ============================================================
-- 22. grado_academico
-- ============================================================
CREATE TABLE grado_academico (
    id_grado_academico INT IDENTITY(1,1) NOT NULL,
    grado              NVARCHAR(100)     NOT NULL,
    create_at          DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at          DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_grado_academico PRIMARY KEY (id_grado_academico)
);

-- ============================================================
-- 23. usuario
-- ============================================================
CREATE TABLE usuario (
    id_usuario         INT IDENTITY(1,1) NOT NULL,
    id_contrasena      INT               NOT NULL,
    id_estado_civil    INT               NOT NULL,
    id_grado_academico INT               NOT NULL,
    id_sexo            INT               NOT NULL,
    id_direccion       INT               NOT NULL,
    id_horario         INT               NOT NULL,
    id_puesto          INT               NOT NULL,
    id_pais            INT               NOT NULL,
    ci                 INT               NOT NULL,
    nombre_usuario     NVARCHAR(100)     NOT NULL,
    fecha_nacimiento   DATE              NOT NULL,
    create_at          DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at          DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT FK_usuario_contrasena FOREIGN KEY (id_contrasena)
        REFERENCES contrasenas_administradores (id_contrasena),
    CONSTRAINT FK_usuario_estado_civil FOREIGN KEY (id_estado_civil)
        REFERENCES estado_civil (id_estado_civil),
    CONSTRAINT FK_usuario_direccion FOREIGN KEY (id_direccion)
        REFERENCES direccion (id_direccion),
    CONSTRAINT FK_usuario_sexo FOREIGN KEY (id_sexo)
        REFERENCES sexo (id_sexo),
    CONSTRAINT FK_usuario_puesto FOREIGN KEY (id_puesto)
        REFERENCES puesto (id_puesto),
    CONSTRAINT FK_usuario_horario FOREIGN KEY (id_horario)
        REFERENCES horario (id_horario),
    CONSTRAINT FK_usuario_grado_academico FOREIGN KEY (id_grado_academico)
        REFERENCES grado_academico (id_grado_academico),
    CONSTRAINT FK_usuario_pais FOREIGN KEY (id_pais)
        REFERENCES pais (id_pais)
);

-- ============================================================
-- 24. empresa
-- ============================================================
CREATE TABLE empresa (
    id_empresa INT IDENTITY(1,1) NOT NULL,
    nombre     NVARCHAR(100)     NOT NULL,
    create_at  DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at  DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_empresa PRIMARY KEY (id_empresa)
);

-- ============================================================
-- 25. cliente
-- ============================================================
CREATE TABLE cliente (
    id_cliente          INT IDENTITY(1,1) NOT NULL,
    id_empresa          INT               NOT NULL,
    nombre_cliente      NVARCHAR(100)     NOT NULL,
    id_direccion        INT               NOT NULL,
    contacto_emergencia NVARCHAR(50)          NULL,
    create_at           DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at           DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT FK_cliente_direccion FOREIGN KEY (id_direccion)
        REFERENCES direccion (id_direccion),
    CONSTRAINT FK_cliente_empresa FOREIGN KEY (id_empresa)
        REFERENCES empresa (id_empresa)
);

-- ============================================================
-- 26. servicio
-- ============================================================
CREATE TABLE servicio (
    id_servicio      INT IDENTITY(1,1) NOT NULL,
    id_cliente       INT               NOT NULL,
    id_direccion     INT               NOT NULL,
    id_tipo_servicio INT               NOT NULL,
    fecha_inicio     DATE              NOT NULL,
    fecha_final      DATE                  NULL,
    costo            DECIMAL(10,2)     NOT NULL,
    descripcion      NVARCHAR(300)         NULL,
    create_at        DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at        DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_servicio PRIMARY KEY (id_servicio),
    CONSTRAINT FK_servicio_tipo_servicio FOREIGN KEY (id_tipo_servicio)
        REFERENCES tipo_de_servicio (id_tipo_servicio),
    CONSTRAINT FK_servicio_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente),
    CONSTRAINT FK_servicio_direccion FOREIGN KEY (id_direccion)
        REFERENCES direccion (id_direccion)
);

-- ============================================================
-- 27. asignacion
-- ============================================================
CREATE TABLE asignacion (
    id_asignacion  INT IDENTITY(1,1) NOT NULL,
    id_usuario     INT               NOT NULL,
    id_servicio    INT               NOT NULL,
    fecha_servicio DATE              NOT NULL,
    hora_entrada   TIME              NOT NULL,
    hora_salida    TIME                  NULL,
    create_at      DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at      DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_asignacion PRIMARY KEY (id_asignacion),
    CONSTRAINT FK_asignacion_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario),
    CONSTRAINT FK_asignacion_servicio FOREIGN KEY (id_servicio)
        REFERENCES servicio (id_servicio)
);

-- ============================================================
-- 28. asignacion_liquidos_de_limpieza
-- ============================================================
CREATE TABLE asignacion_liquidos_de_limpieza (
    id_asignacion       INT       NOT NULL,
    id_liquido_limpieza INT       NOT NULL,
    hora_inicio         TIME          NULL,
    hora_final          TIME          NULL,
    cantidad_liquido    INT       NOT NULL,
    create_at           DATETIME2 NOT NULL DEFAULT GETDATE(),
    update_at           DATETIME2 NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_asignacion_liquidos_de_limpieza PRIMARY KEY (id_asignacion, id_liquido_limpieza),
    CONSTRAINT FK_asig_liq_liquido FOREIGN KEY (id_liquido_limpieza)
        REFERENCES liquidos_de_limpieza (id_liquido_limpieza),
    CONSTRAINT FK_asig_liq_asignacion FOREIGN KEY (id_asignacion)
        REFERENCES asignacion (id_asignacion)
);

-- ============================================================
-- 29. liquido_para_el_servicio
-- ============================================================
CREATE TABLE liquido_para_el_servicio (
    id_liquido_limpieza INT NOT NULL,
    id_servicio         INT NOT NULL,
    CONSTRAINT PK_liquido_para_el_servicio PRIMARY KEY (id_liquido_limpieza, id_servicio),
    CONSTRAINT FK_liq_serv_liquido FOREIGN KEY (id_liquido_limpieza)
        REFERENCES liquidos_de_limpieza (id_liquido_limpieza),
    CONSTRAINT FK_liq_serv_servicio FOREIGN KEY (id_servicio)
        REFERENCES servicio (id_servicio)
);

-- ============================================================
-- 30. servicio_terminado
-- ============================================================
CREATE TABLE servicio_terminado (
    id_servicio_terminado INT IDENTITY(1,1) NOT NULL,
    id_servicio           INT               NOT NULL,
    id_satisfaccion       INT               NOT NULL,
    comentarios           NVARCHAR(300)         NULL,
    create_at             DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at             DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_servicio_terminado PRIMARY KEY (id_servicio_terminado),
    CONSTRAINT FK_serv_term_servicio FOREIGN KEY (id_servicio)
        REFERENCES servicio (id_servicio),
    CONSTRAINT FK_serv_term_satisfaccion FOREIGN KEY (id_satisfaccion)
        REFERENCES satisfaccion (id_satisfaccion)
);

-- ============================================================
-- 31. carrera
-- ============================================================
CREATE TABLE carrera (
    id_carrera INT IDENTITY(1,1) NOT NULL,
    carrera    NVARCHAR(100)     NOT NULL,
    create_at  DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at  DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_carrera PRIMARY KEY (id_carrera)
);

-- ============================================================
-- 32. asignacion_uniformes
-- ============================================================
CREATE TABLE asignacion_uniformes (
    id_asignacion_uniformes INT IDENTITY(1,1) NOT NULL,
    id_usuario              INT               NOT NULL,
    id_uniforme             INT               NOT NULL,
    fecha_entrega           DATE              NOT NULL,
    fecha_devolucion        DATE                  NULL,
    estado                  NVARCHAR(50)      NOT NULL,
    create_at               DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at               DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_asignacion_uniformes PRIMARY KEY (id_asignacion_uniformes),
    CONSTRAINT FK_asig_unif_uniforme FOREIGN KEY (id_uniforme)
        REFERENCES uniformes (id_uniforme),
    CONSTRAINT FK_asig_unif_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
);

-- ============================================================
-- 33. categoria_herramienta
-- ============================================================
CREATE TABLE categoria_herramienta (
    id_categoria_herramienta INT IDENTITY(1,1) NOT NULL,
    categoria                NVARCHAR(50)      NOT NULL,
    create_at                DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at                DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_categoria_herramienta PRIMARY KEY (id_categoria_herramienta)
);

-- ============================================================
-- 34. estado_de_uso
-- ============================================================
CREATE TABLE estado_de_uso (
    id_estado_uso INT IDENTITY(1,1) NOT NULL,
    estado_uso    NVARCHAR(100)     NOT NULL,
    create_at     DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at     DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_estado_de_uso PRIMARY KEY (id_estado_uso)
);

-- ============================================================
-- 35. herramienta_de_limpieza
-- ============================================================
CREATE TABLE herramienta_de_limpieza (
    id_herramienta           INT IDENTITY(1,1) NOT NULL,
    id_estado_calidad        INT               NOT NULL,
    id_provedor_herramientas INT               NOT NULL,
    id_estado_uso            INT               NOT NULL,
    id_categoria_herramienta INT               NOT NULL,
    nombre                   NVARCHAR(100)     NOT NULL,
    codigo_inv               NVARCHAR(10)      NOT NULL,
    descripcion              NVARCHAR(300)         NULL,
    create_at                DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at                DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_herramienta_de_limpieza PRIMARY KEY (id_herramienta),
    CONSTRAINT FK_herram_categoria FOREIGN KEY (id_categoria_herramienta)
        REFERENCES categoria_herramienta (id_categoria_herramienta),
    CONSTRAINT FK_herram_estado_uso FOREIGN KEY (id_estado_uso)
        REFERENCES estado_de_uso (id_estado_uso),
    CONSTRAINT FK_herram_provedor FOREIGN KEY (id_provedor_herramientas)
        REFERENCES provedor_herramientas (id_provedor_herramientas),
    CONSTRAINT FK_herram_estado_calidad FOREIGN KEY (id_estado_calidad)
        REFERENCES estado_calidad (id_estado_calidad)
);

-- ============================================================
-- 36. herramienta_para_el_servicio
-- ============================================================
CREATE TABLE herramienta_para_el_servicio (
    id_servicio    INT NOT NULL,
    id_herramienta INT NOT NULL,
    CONSTRAINT PK_herramienta_para_el_servicio PRIMARY KEY (id_servicio, id_herramienta),
    CONSTRAINT FK_herram_serv_herramienta FOREIGN KEY (id_herramienta)
        REFERENCES herramienta_de_limpieza (id_herramienta),
    CONSTRAINT FK_herram_serv_servicio FOREIGN KEY (id_servicio)
        REFERENCES servicio (id_servicio)
);

-- ============================================================
-- 37. asignacion_herramienta
-- ============================================================
CREATE TABLE asignacion_herramienta (
    id_asignacion  INT           NOT NULL,
    id_herramienta INT           NOT NULL,
    hora_inicio    TIME              NULL,
    hora_final     TIME              NULL,
    descripcion    NVARCHAR(300)     NULL,
    create_at      DATETIME2     NOT NULL DEFAULT GETDATE(),
    update_at      DATETIME2     NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_asignacion_herramienta PRIMARY KEY (id_asignacion, id_herramienta),
    CONSTRAINT FK_asig_herram_asignacion FOREIGN KEY (id_asignacion)
        REFERENCES asignacion (id_asignacion),
    CONSTRAINT FK_asig_herram_herramienta FOREIGN KEY (id_herramienta)
        REFERENCES herramienta_de_limpieza (id_herramienta)
);

-- ============================================================
-- 38. capasitaciones
-- ============================================================
CREATE TABLE capasitaciones (
    id_capacitacion INT IDENTITY(1,1) NOT NULL,
    nombre          NVARCHAR(100)     NOT NULL,
    descripcion     NVARCHAR(300)         NULL,
    fecha           DATE              NOT NULL,
    create_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at       DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_capasitaciones PRIMARY KEY (id_capacitacion)
);

-- ============================================================
-- 39. tipo_maquinaria
-- ============================================================
CREATE TABLE tipo_maquinaria (
    id_tipo_maquinaria INT IDENTITY(1,1) NOT NULL,
    tipo_maquinaria    NVARCHAR(100)     NOT NULL,
    descripcion        NVARCHAR(300)         NULL,
    create_at          DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at          DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_tipo_maquinaria PRIMARY KEY (id_tipo_maquinaria)
);

-- ============================================================
-- 40. maquinaria
-- ============================================================
CREATE TABLE maquinaria (
    id_maquinaria          INT IDENTITY(1,1) NOT NULL,
    nombre_maquinaria      NVARCHAR(100)     NOT NULL,
    codigo_inv             NVARCHAR(50)      NOT NULL,
    id_provedor_maquinaria INT               NOT NULL,
    id_tipo_maquinaria     INT               NOT NULL,
    id_estado_calidad      INT               NOT NULL,
    id_marca_maquinaria    INT               NOT NULL,
    id_estado_uso          INT               NOT NULL,
    descripcion            NVARCHAR(300)         NULL,
    create_at              DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at              DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_maquinaria PRIMARY KEY (id_maquinaria),
    CONSTRAINT FK_maq_marca FOREIGN KEY (id_marca_maquinaria)
        REFERENCES marca_maquinaria (id_marca_maquinaria),
    CONSTRAINT FK_maq_provedor FOREIGN KEY (id_provedor_maquinaria)
        REFERENCES provedor_maquinaria (id_provedor_maquinaria),
    CONSTRAINT FK_maq_tipo FOREIGN KEY (id_tipo_maquinaria)
        REFERENCES tipo_maquinaria (id_tipo_maquinaria),
    CONSTRAINT FK_maq_estado_calidad FOREIGN KEY (id_estado_calidad)
        REFERENCES estado_calidad (id_estado_calidad),
    CONSTRAINT FK_maq_estado_uso FOREIGN KEY (id_estado_uso)
        REFERENCES estado_de_uso (id_estado_uso)
);

-- ============================================================
-- 41. incidentes
-- ============================================================
CREATE TABLE incidentes (
    id_incidente INT IDENTITY(1,1) NOT NULL,
    id_servicio  INT               NOT NULL,
    descripcion  NVARCHAR(300)         NULL,
    fecha        DATE              NOT NULL,
    create_at    DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at    DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_incidentes PRIMARY KEY (id_incidente),
    CONSTRAINT FK_incidentes_servicio FOREIGN KEY (id_servicio)
        REFERENCES servicio (id_servicio)
);

-- ============================================================
-- 42. maquina_para_el_servicio
-- ============================================================
CREATE TABLE maquina_para_el_servicio (
    id_servicio   INT NOT NULL,
    id_maquinaria INT NOT NULL,
    CONSTRAINT PK_maquina_para_el_servicio PRIMARY KEY (id_servicio, id_maquinaria),
    CONSTRAINT FK_maq_serv_maquinaria FOREIGN KEY (id_maquinaria)
        REFERENCES maquinaria (id_maquinaria),
    CONSTRAINT FK_maq_serv_servicio FOREIGN KEY (id_servicio)
        REFERENCES servicio (id_servicio)
);

-- ============================================================
-- 43. asignacion_maquinaria
-- ============================================================
CREATE TABLE asignacion_maquinaria (
    id_asignacion INT           NOT NULL,
    id_maquinaria INT           NOT NULL,
    hora_inicio   TIME              NULL,
    hora_final    TIME              NULL,
    descripcion   NVARCHAR(300)     NULL,
    CONSTRAINT PK_asignacion_maquinaria PRIMARY KEY (id_asignacion, id_maquinaria),
    CONSTRAINT FK_asig_maq_asignacion FOREIGN KEY (id_asignacion)
        REFERENCES asignacion (id_asignacion),
    CONSTRAINT FK_asig_maq_maquinaria FOREIGN KEY (id_maquinaria)
        REFERENCES maquinaria (id_maquinaria)
);

-- ============================================================
-- 44. historial_de_estado_de_maquina
-- ============================================================
CREATE TABLE historial_de_estado_de_maquina (
    id_historial      INT IDENTITY(1,1) NOT NULL,
    id_maquinaria     INT               NOT NULL,
    id_estado_calidad INT               NOT NULL,
    fecha_de_cambio   DATETIME2         NOT NULL,
    descripcion       NVARCHAR(300)         NULL,
    create_at         DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at         DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_historial_de_estado_de_maquina PRIMARY KEY (id_historial),
    CONSTRAINT FK_historial_estado_calidad FOREIGN KEY (id_estado_calidad)
        REFERENCES estado_calidad (id_estado_calidad),
    CONSTRAINT FK_historial_maquinaria FOREIGN KEY (id_maquinaria)
        REFERENCES maquinaria (id_maquinaria)
);

-- ============================================================
-- 45. usuarios_capacitaciones
-- ============================================================
CREATE TABLE usuarios_capacitaciones (
    id_usuario      INT          NOT NULL,
    id_capacitacion INT          NOT NULL,
    estado          NVARCHAR(50)     NULL,
    CONSTRAINT PK_usuarios_capacitaciones PRIMARY KEY (id_usuario, id_capacitacion),
    CONSTRAINT FK_usu_cap_capacitacion FOREIGN KEY (id_capacitacion)
        REFERENCES capasitaciones (id_capacitacion),
    CONSTRAINT FK_usu_cap_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
);

-- ============================================================
-- 46. dias_laborales
-- ============================================================
CREATE TABLE dias_laborales (
    id_dias_semana INT NOT NULL,
    id_horario     INT NOT NULL,
    CONSTRAINT PK_dias_laborales PRIMARY KEY (id_dias_semana, id_horario),
    CONSTRAINT FK_dias_lab_horario FOREIGN KEY (id_horario)
        REFERENCES horario (id_horario),
    CONSTRAINT FK_dias_lab_dias_semana FOREIGN KEY (id_dias_semana)
        REFERENCES dias_de_la_semana (id_dias_semana)
);

-- ============================================================
-- 47. documentos_usuarios
-- ============================================================
CREATE TABLE documentos_usuarios (
    id_documento      INT IDENTITY(1,1) NOT NULL,
    id_usuario        INT               NOT NULL,
    tipo_de_documento NVARCHAR(100)     NOT NULL,
    archivo           NVARCHAR(MAX)     NOT NULL,
    fecha_subida      DATE              NOT NULL,
    create_at         DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at         DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_documentos_usuarios PRIMARY KEY (id_documento),
    CONSTRAINT FK_doc_usu_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
);

-- ============================================================
-- 48. mantenimiento
-- ============================================================
CREATE TABLE mantenimiento (
    id_mantenimiento    INT IDENTITY(1,1) NOT NULL,
    fecha_mantenimiento DATE              NOT NULL,
    descripcion         NVARCHAR(300)         NULL,
    costo               DECIMAL(10,2)     NOT NULL,
    create_at           DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at           DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_mantenimiento PRIMARY KEY (id_mantenimiento)
);

-- ============================================================
-- 49. detalle
-- ============================================================
CREATE TABLE detalle (
    id_detalle INT IDENTITY(1,1) NOT NULL,
    detalle    NVARCHAR(20)      NOT NULL,
    create_at  DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at  DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_detalle PRIMARY KEY (id_detalle)
);

-- ============================================================
-- 50. telefono_clientes
-- ============================================================
CREATE TABLE telefono_clientes (
    id_telefono INT IDENTITY(1,1) NOT NULL,
    telefono    INT               NOT NULL,
    id_detalle  INT               NOT NULL,
    id_cliente  INT               NOT NULL,
    create_at   DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at   DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_telefono_clientes PRIMARY KEY (id_telefono),
    CONSTRAINT FK_tel_cli_detalle FOREIGN KEY (id_detalle)
        REFERENCES detalle (id_detalle),
    CONSTRAINT FK_tel_cli_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente)
);

-- ============================================================
-- 51. mantenimientos_maquinaria
-- ============================================================
CREATE TABLE mantenimientos_maquinaria (
    id_maquinaria    INT       NOT NULL,
    id_mantenimiento INT       NOT NULL,
    create_at        DATETIME2 NOT NULL DEFAULT GETDATE(),
    update_at        DATETIME2 NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_mantenimientos_maquinaria PRIMARY KEY (id_maquinaria, id_mantenimiento),
    CONSTRAINT FK_mant_maq_mantenimiento FOREIGN KEY (id_mantenimiento)
        REFERENCES mantenimiento (id_mantenimiento),
    CONSTRAINT FK_mant_maq_maquinaria FOREIGN KEY (id_maquinaria)
        REFERENCES maquinaria (id_maquinaria)
);

-- ============================================================
-- 52. telefono_usuarios
-- ============================================================
CREATE TABLE telefono_usuarios (
    id_telefono_usuario INT IDENTITY(1,1) NOT NULL,
    telefono_usuario    INT               NOT NULL,
    id_usuario          INT               NOT NULL,
    id_detalle          INT               NOT NULL,
    create_at           DATETIME2         NOT NULL DEFAULT GETDATE(),
    update_at           DATETIME2         NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_telefono_usuarios PRIMARY KEY (id_telefono_usuario),
    CONSTRAINT FK_tel_usu_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario),
    CONSTRAINT FK_tel_usu_detalle FOREIGN KEY (id_detalle)
        REFERENCES detalle (id_detalle)
);

-- ============================================================
-- 53. carreras_usuario
-- ============================================================
CREATE TABLE carreras_usuario (
    id_carrera INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT PK_carreras_usuario PRIMARY KEY (id_carrera, id_usuario),
    CONSTRAINT FK_carr_usu_carrera FOREIGN KEY (id_carrera)
        REFERENCES carrera (id_carrera),
    CONSTRAINT FK_carr_usu_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
);
