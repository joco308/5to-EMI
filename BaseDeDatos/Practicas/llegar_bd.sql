-- ============================================================
-- SEED DATA - SISTEMA SASL
-- Orden: tablas sin FK primero, luego dependientes
-- Las contrasenas hasheadas corresponden a: "Admin123!"
-- Hash BCrypt generado externamente para pruebas
-- ============================================================

-- ============================================================
-- 1. DOMINIOS (tabla raiz del catalogo)
-- ============================================================
INSERT INTO Dominios (dominio) VALUES
('Roles'),           -- id 1
('Paises'),          -- id 2
('Zonas'),           -- id 3
('Generos'),         -- id 4
('Estado Civil'),    -- id 5
('Grado Academico'), -- id 6
('Tipo Telefono'),   -- id 7
('Tipo Maquinaria'), -- id 8
('Tipo Recurso'),    -- id 9
('Tipo Servicio'),   -- id 10
('Dias Laborales'),  -- id 11
('Empresas'),        -- id 12
('Satisfaccion'),    -- id 13
('Tipo Producto'),   -- id 14
('Carreras');        -- id 15

-- ============================================================
-- 2. SUB_DOMINIOS (catalogo central - todo pasa por aqui)
-- ============================================================

-- Paises (dominio 2)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(2, 'Bolivia'),        -- id 1
(2, 'Argentina'),      -- id 2
(2, 'Brasil'),         -- id 3
(2, 'Alemania'),       -- id 4
(2, 'Estados Unidos'); -- id 5

-- Zonas (dominio 3)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(3, 'Zona Sur'),       -- id 6
(3, 'Zona Norte'),     -- id 7
(3, 'Zona Central'),   -- id 8
(3, 'Zona Este'),      -- id 9
(3, 'Zona Oeste');     -- id 10

-- Generos (dominio 4)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(4, 'Masculino'),      -- id 11
(4, 'Femenino'),       -- id 12
(4, 'Otro');           -- id 13

-- Estado Civil (dominio 5)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(5, 'Soltero'),        -- id 14
(5, 'Casado'),         -- id 15
(5, 'Divorciado'),     -- id 16
(5, 'Viudo');          -- id 17

-- Grado Academico (dominio 6)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(6, 'Bachiller'),      -- id 18
(6, 'Tecnico'),        -- id 19
(6, 'Licenciatura'),   -- id 20
(6, 'Maestria');       -- id 21

-- Tipo Telefono (dominio 7)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(7, 'Celular'),        -- id 22
(7, 'Fijo'),           -- id 23
(7, 'Trabajo');        -- id 24

-- Tipo Maquinaria (dominio 8)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(8, 'Limpieza Industrial'),  -- id 25
(8, 'Fumigacion'),           -- id 26
(8, 'Jardineria'),           -- id 27
(8, 'Seguridad');            -- id 28

-- Tipo Recurso (dominio 9)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(9, 'Quimico'),        -- id 29
(9, 'Herramienta'),    -- id 30
(9, 'Equipo EPP');     -- id 31

-- Tipo Servicio (dominio 10)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(10, 'Limpieza de Oficinas'),    -- id 32
(10, 'Fumigacion Residencial'),  -- id 33
(10, 'Mantenimiento de Areas'),  -- id 34
(10, 'Limpieza Industrial');     -- id 35

-- Dias Laborales (dominio 11)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(11, 'Lunes a Viernes'),         -- id 36
(11, 'Lunes a Sabado'),          -- id 37
(11, 'Fines de Semana'),         -- id 38
(11, 'Lunes, Miercoles, Viernes'); -- id 39

-- Empresas (dominio 12)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(12, 'Banco Nacional'),          -- id 40
(12, 'Hospital Central'),        -- id 41
(12, 'Edificio Torre Sur'),      -- id 42
(12, 'Fabrica Textil Norte'),    -- id 43
(12, 'Municipalidad'),           -- id 44
-- Empresas de proveedores
(12, 'Quimicos del Sur S.A.'),   -- id 45
(12, 'MaquiTech Bolivia'),       -- id 46
(12, 'Distribuidora Nacional');  -- id 47

-- Satisfaccion (dominio 13)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(13, 'Muy satisfecho'),          -- id 48
(13, 'Satisfecho'),              -- id 49
(13, 'Neutral'),                 -- id 50
(13, 'Insatisfecho');            -- id 51

-- Tipo Producto para proveedor (dominio 14)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(14, 'Productos Quimicos'),      -- id 52
(14, 'Maquinaria'),              -- id 53
(14, 'Insumos Generales');       -- id 54

-- Carreras (dominio 15)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
(15, 'Ingenieria Industrial'),   -- id 55
(15, 'Administracion'),          -- id 56
(15, 'Quimica'),                 -- id 57
(15, 'Electronica');             -- id 58

-- ============================================================
-- 3. ROLES
-- ============================================================
INSERT INTO Roles (nombre_rol, salario) VALUES
('Gerente',        8000),  -- id 1
('Administrador',  6000),  -- id 2
('Trabajador',     4500),  -- id 3


-- ============================================================
-- 4. ESTADO_CALIDAD
-- ============================================================
INSERT INTO Estado_calidad (estado_calidad) VALUES
('Optimo'),          -- id 1
('Bueno'),           -- id 2
('Regular'),         -- id 3
('En Mantenimiento'), -- id 4
('Dado de Baja');    -- id 5

-- ============================================================
-- 5. DIRECCIONES (para usuarios y clientes)
-- ============================================================
INSERT INTO Direccion (id_zona, calle, n_casa) VALUES
(6,  'Av. Hernando Siles',     123),   -- id 1 (usuario gerente)
(7,  'Calle Murillo',          456),   -- id 2
(8,  'Av. Arce',               789),   -- id 3
(9,  'Calle Potosi',           321),   -- id 4
(10, 'Av. Montes',             654),   -- id 5
(6,  'Calle Ingavi',           987),   -- id 6
(7,  'Av. Villazón',           111),   -- id 7
(8,  'Calle Comercio',         222),   -- id 8
(9,  'Av. 6 de Agosto',        333),   -- id 9
(10, 'Calle Linares',          444),   -- id 10
-- Direcciones para clientes
(6,  'Av. Mariscal Santa Cruz', 100),  -- id 11
(7,  'Calle Sagarnaga',         200),  -- id 12
(8,  'Av. del Ejercito',        300),  -- id 13
(9,  'Calle Yanacocha',         400),  -- id 14
-- Direcciones para servicios
(6,  'Av. Camacho',             500),  -- id 15
(7,  'Calle Loayza',            600),  -- id 16
(8,  'Av. Busch',               700),  -- id 17
(9,  'Calle Illampu',           800);  -- id 18

-- ============================================================
-- 6. USUARIOS TRABAJADORES
-- Contrasena para todos: "Admin123!"
-- Hash BCrypt (costo 10): $2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy
-- ============================================================
INSERT INTO Usuario_trabajador 
    (id_rol, id_estado_civil, id_grado_academico, id_genero, id_direccion, id_pais,
     contrasena_hash, correo, ci, nombre_usuario, fecha_nacimiento, servicio_asignado, pediente_2fa)
VALUES
-- Gerente
(1, 15, 20, 11, 1, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'gerente@sasl.com', 12345678, 'Carlos Mamani', '1980-03-15', 0, 0),
()
-- Administrador
(2, 14, 20, 12, 2, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'admin@sasl.com', 87654321, 'Maria Quispe', '1985-07-22', 0, 0),
-- Trabajador
(3, 14, 19, 11, 3, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'supervisor1@sasl.com', 11223344, 'Juan Flores', '1990-01-10', 0, 0),
(1,15,20,11,1,1,'$2a$11$YMzEfJ06.NfSMQ0ImRTLEufx3jWQB6TeEWdxLnDIdnh.L92svo3f.','jqnpnlz@gmail.com',13440068,'Joaquin Peñaloza','1980-03-15',0,0)

-- ============================================================
-- 7. TELEFONOS USUARIOS
-- ============================================================
INSERT INTO Telefono_usuarios (telefono_usuario, id_usuario, id_detalle) VALUES
(72345678, 1, 22),
(71234567, 2, 22),
(76543210, 3, 22),
(79876543, 4, 22),
(74567890, 5, 22),
(73456789, 6, 22),
(78901234, 7, 22),
(75678901, 8, 22),
(70123456, 9, 22),
(77890123, 10, 22);

-- ============================================================
-- 8. UNIFORMES
-- ============================================================
INSERT INTO Uniformes (nombre_uniforme, talla, descripcion) VALUES
('Overol Industrial Azul',   42, 'Overol resistente para trabajo pesado'),
('Overol Industrial Azul',   44, 'Overol resistente para trabajo pesado'),
('Overol Industrial Azul',   46, 'Overol resistente para trabajo pesado'),
('Chaleco Reflectivo',       42, 'Chaleco de seguridad con franjas reflectivas'),
('Chaleco Reflectivo',       44, 'Chaleco de seguridad con franjas reflectivas'),
('Camiseta Institucional',   42, 'Camiseta con logo SASL'),
('Camiseta Institucional',   44, 'Camiseta con logo SASL');

-- ============================================================
-- 9. ASIGNACION DE UNIFORMES
-- ============================================================
INSERT INTO Asignacion_uniformes (id_usuario, id_uniforme, fecha_entrega, estado) VALUES
(4, 1, '2025-01-10', 'Activo'),
(5, 2, '2025-01-10', 'Activo'),
(6, 3, '2025-01-10', 'Activo'),
(7, 1, '2025-01-10', 'Activo'),
(8, 4, '2025-01-10', 'Activo'),
(9, 5, '2025-01-10', 'Activo'),
(10, 6, '2025-02-01', 'Activo');

-- ============================================================
-- 10. PROVEEDORES
-- ============================================================
INSERT INTO Provedores (id_empresa, id_producto, nit, nombre) VALUES
(45, 52, 100200300, 'Quimicos del Sur S.A.'),  -- id 1
(46, 53, 200300400, 'MaquiTech Bolivia'),       -- id 2
(47, 54, 300400500, 'Distribuidora Nacional'); -- id 3

-- ============================================================
-- 11. TELEFONOS PROVEEDORES
-- ============================================================
INSERT INTO Telefono_proveedor (telefono, id_proveedor, id_detalle) VALUES
(22345678, 1, 23),
(22456789, 2, 23),
(22567890, 3, 23);

-- ============================================================
-- 12. MARCA MAQUINARIA
-- ============================================================
INSERT INTO Marca_maquinaria (id_pais, nombre_marca) VALUES
(4, 'Karcher'),      -- id 1 (Alemania)
(5, 'Tennant'),      -- id 2 (EEUU)
(1, 'AgroBolivia'),  -- id 3 (Bolivia)
(5, 'Husqvarna');    -- id 4 (EEUU)

-- ============================================================
-- 13. MAQUINARIA
-- ============================================================
INSERT INTO Maquinaria 
    (id_proveedor, id_tipo_maquinaria, id_estado_calidad, id_marca_maquinaria,
     nombre_maquinaria, codigo_inv, descripcion)
VALUES
(2, 25, 1, 1, 'Aspiradora Industrial K5',    'MAQ-001', 'Aspiradora de alta potencia para superficies grandes'),
(2, 25, 2, 1, 'Aspiradora Industrial K3',    'MAQ-002', 'Aspiradora para superficies medianas'),
(2, 26, 1, 3, 'Fumigadora de Mochila 20L',   'MAQ-003', 'Equipo de fumigacion manual con tanque 20 litros'),
(2, 26, 2, 3, 'Fumigadora Automatica',       'MAQ-004', 'Equipo automatico de fumigacion'),
(2, 27, 1, 4, 'Cortadora de Cesped BX200',   'MAQ-005', 'Cortadora a gasolina para areas grandes'),
(2, 25, 3, 2, 'Fregadora Automatica T300',   'MAQ-006', 'Fregadora automatica para pisos industriales');

-- ============================================================
-- 14. HISTORIAL ESTADO MAQUINA
-- ============================================================
INSERT INTO Historial_estado_maquina (id_maquinaria, id_estado_calidad, fecha_cambio, descripcion) VALUES
(1, 1, '2025-01-05', 'Alta inicial, estado optimo'),
(2, 1, '2025-01-05', 'Alta inicial, estado optimo'),
(2, 2, '2025-03-10', 'Revision de filtros, estado bueno'),
(3, 1, '2025-01-05', 'Alta inicial'),
(6, 2, '2025-02-01', 'Alta con desgaste menor en rodillos'),
(6, 3, '2025-04-15', 'Rodillos requieren cambio proximo');

-- ============================================================
-- 15. MANTENIMIENTO + MANTENIMIENTOS_MAQUINARIA
-- ============================================================
INSERT INTO Mantenimiento (fecha_mantenimiento, descripcion, costo) VALUES
('2025-03-10', 'Cambio de filtros y revision general aspiradora K3',    350.00),
('2025-04-15', 'Lubricacion y ajuste de rodillos fregadora T300',       280.00),
('2025-02-20', 'Revision de valvulas fumigadora automatica',             150.00);

INSERT INTO Mantenimientos_maquinaria (id_maquinaria, id_mantenimiento) VALUES
(2, 1),
(6, 2),
(4, 3);

-- ============================================================
-- 16. RECURSOS
-- ============================================================
INSERT INTO Recursos (id_proveedor, id_tipo, nombre, descripcion) VALUES
(1, 29, 'Desengrasante Industrial 5L',  'Liquido desengrasante para superficies metalicas'),  -- id 1
(1, 29, 'Desinfectante Multiusos 1L',   'Desinfectante para uso en hospitales y oficinas'),  -- id 2
(1, 29, 'Insecticida Residual 1L',      'Insecticida de efecto prolongado para fumigacion'), -- id 3
(3, 30, 'Escoba Industrial',            'Escoba de cerdas duras para interiores'),            -- id 4
(3, 30, 'Trapeador Profesional',        'Trapeador con escurridor de aluminio'),              -- id 5
(3, 31, 'Guantes de Nitrilo (par)',     'Guantes resistentes a quimicos talla M'),            -- id 6
(3, 31, 'Mascarilla N95',               'Mascarilla de proteccion respiratoria');             -- id 7

-- ============================================================
-- 17. CLIENTES
-- ============================================================
INSERT INTO Cliente (id_empresa, id_direccion, nombre_cliente, contacto_emergencia) VALUES
(40, 11, 'Banco Nacional - Sucursal Central', '75123456'),  -- id 1
(41, 12, 'Hospital Central La Paz',           '72987654'),  -- id 2
(42, 13, 'Edificio Torre Sur - Admin',        '71456789'),  -- id 3
(43, 14, 'Fabrica Textil del Norte',          '76789012');  -- id 4

-- ============================================================
-- 18. TELEFONOS CLIENTES
-- ============================================================
INSERT INTO Telefono_cliente (telefono, id_cliente, id_detalle) VALUES
(22112233, 1, 23),
(22334455, 2, 23),
(22445566, 3, 23),
(22556677, 4, 23);

-- ============================================================
-- 19. SERVICIOS
-- ============================================================
INSERT INTO Servicio 
    (id_cliente, id_direccion, tipo_servicio, fecha_inicio, fecha_final, costo, descripcion)
VALUES
-- Servicio activo en banco (limpieza de oficinas)
(1, 15, 32, '2025-04-01', '2025-06-30', 12000.00,
 'Limpieza diaria de oficinas, salas de espera y banos del edificio principal'),
-- Servicio activo en hospital (limpieza industrial)
(2, 16, 35, '2025-03-15', '2025-07-15', 25000.00,
 'Limpieza y desinfeccion de areas criticas, UCI y consultorios'),
-- Servicio activo en edificio (mantenimiento de areas)
(3, 17, 34, '2025-05-01', NULL,         8500.00,
 'Mantenimiento de areas comunes, jardines y estacionamiento'),
-- Servicio terminado en fabrica (fumigacion)
(4, 18, 33, '2025-02-01', '2025-02-05', 4500.00,
 'Fumigacion completa de planta de produccion y almacenes');

-- ============================================================
-- 20. HORARIOS (para asignacion de empleados)
-- ============================================================
INSERT INTO Horario (hora_entrada, hora_salida) VALUES
('07:00', '15:00'),  -- id 1 turno manana
('15:00', '23:00'),  -- id 2 turno tarde
('07:00', '12:00'),  -- id 3 medio dia
('08:00', '16:00'),  -- id 4 jornada completa
('06:00', '14:00');  -- id 5 madrugada

-- ============================================================
-- 21. ASIGNACION DE EMPLEADOS A SERVICIOS
-- ============================================================
INSERT INTO Asignacion_empleados (id_usuario, id_servicio, id_horario, dias_laborales) VALUES
(4, 1, 1, 36),  -- Pedro Condori -> Banco, turno manana, lun-vie
(5, 1, 1, 36),  -- Ana Choque    -> Banco, turno manana, lun-vie
(6, 2, 4, 37),  -- Luis Huanca   -> Hospital, jornada completa, lun-sab
(7, 2, 4, 37),  -- Rosa Ticona   -> Hospital, jornada completa, lun-sab
(8, 3, 3, 39),  -- Miguel Apaza  -> Edificio, medio dia, lun-mie-vie
(10,3, 3, 39);  -- Lucia Mendez  -> Edificio, medio dia, lun-mie-vie

-- Actualizar ServicioAsignado = true para los empleados asignados
UPDATE Usuario_trabajador SET servicio_asignado = 1 WHERE id_usuario IN (4, 5, 6, 7, 8, 10);

-- ============================================================
-- 22. ASIGNACION MAQUINARIA A SERVICIOS
-- ============================================================
INSERT INTO Asignacion_maquinaria (id_servicio, id_maquinaria, cantidad, descripcion) VALUES
(1, 1, 1, 'Aspiradora para oficinas principales'),
(1, 6, 1, 'Fregadora para pasillos y hall de entrada'),
(2, 2, 2, 'Aspiradoras para diferentes pisos del hospital'),
(2, 6, 1, 'Fregadora para pasillos generales'),
(3, 5, 1, 'Cortadora para areas verdes del edificio'),
(4, 3, 2, 'Fumigadoras para la planta y almacenes');

-- ============================================================
-- 23. ASIGNACION RECURSOS A SERVICIOS
-- ============================================================
INSERT INTO Asignacion_recursos (id_servicio, id_recurso, cantidad) VALUES
(1, 1, 10), -- desengrasante al banco
(1, 4, 5),  -- escobas al banco
(1, 5, 5),  -- trapeadores al banco
(2, 2, 20), -- desinfectante al hospital
(2, 6, 30), -- guantes al hospital
(2, 7, 30), -- mascarillas al hospital
(3, 4, 3),  -- escobas al edificio
(3, 5, 3),  -- trapeadores al edificio
(4, 3, 10), -- insecticida a la fabrica
(4, 7, 10); -- mascarillas a la fabrica

-- ============================================================
-- 24. SERVICIO TERMINADO (el de la fabrica ya concluyo)
-- ============================================================
INSERT INTO Servicio_terminado (id_servicio, satisfaccion, comentarios) VALUES
(4, 48, 'Excelente trabajo, la fumigacion fue muy efectiva. Sin ninguna queja.');

-- ============================================================
-- 25. INCIDENTES
-- ============================================================
INSERT INTO Incidentes (id_servicio, descripcion, fecha) VALUES
(2, 'Derrame menor de producto de limpieza en pasillo 3er piso. Atendido de inmediato.', '2025-04-10'),
(1, 'Maquina aspiradora presento falla electrica. Se sustituyo por equipo de respaldo.',  '2025-04-22');

-- ============================================================
-- 26. CAPACITACIONES
-- ============================================================
INSERT INTO Capacitaciones (nombre, descripcion, fecha) VALUES
('Manejo de Productos Quimicos',   'Uso seguro y almacenamiento de quimicos industriales',        '2025-02-15'),
('Primeros Auxilios Basicos',      'Respuesta ante accidentes laborales',                         '2025-03-01'),
('Uso de EPP',                     'Equipo de proteccion personal: tipos, uso correcto y cuidado', '2025-03-20'),
('Protocolo de Fumigacion',        'Tecnicas y seguridad en procesos de fumigacion',               '2025-04-05');

-- ============================================================
-- 27. USUARIOS_CAPACITACIONES
-- ============================================================
INSERT INTO Usuarios_capacitaciones (id_usuario, id_capacitacion, estado) VALUES
(4, 1, 'Completado'),
(4, 3, 'Completado'),
(5, 1, 'Completado'),
(5, 3, 'Completado'),
(6, 1, 'Completado'),
(6, 2, 'Completado'),
(6, 3, 'Completado'),
(7, 3, 'En progreso'),
(8, 4, 'Completado'),
(9, 4, 'Completado'),
(9, 1, 'Pendiente'),
(10, 2, 'Completado');

-- ============================================================
-- 28. DOCUMENTOS USUARIOS
-- ============================================================
INSERT INTO Documentos_usuarios (id_usuario, tipo_de_documento, archivo, fecha_subida) VALUES
(1, 'Carnet de Identidad',  'ci_carlos_mamani.pdf',    '2024-01-10'),
(2, 'Carnet de Identidad',  'ci_maria_quispe.pdf',     '2024-01-10'),
(4, 'Carnet de Identidad',  'ci_pedro_condori.pdf',    '2024-01-15'),
(4, 'Certificado Medico',   'med_pedro_condori.pdf',   '2024-01-15'),
(5, 'Carnet de Identidad',  'ci_ana_choque.pdf',       '2024-01-15'),
(6, 'Carnet de Identidad',  'ci_luis_huanca.pdf',      '2024-01-20'),
(8, 'Titulo Tecnico',       'titulo_miguel_apaza.pdf', '2024-01-20');

-- ============================================================
-- 29. MEMORIALES
-- ============================================================
INSERT INTO Memorial (id_empleado, descripcion) VALUES
(4, 'Pedro Condori lleva 2 años en la empresa. Trabajador destacado del mes de marzo 2025.'),
(8, 'Miguel Apaza capacito a 3 nuevos tecnicos en el uso de maquinaria industrial.');

-- ============================================================
-- 30. CARRERAS_USUARIO (relacion M:N usuario <-> subdominio carrera)
-- ============================================================
INSERT INTO Carreras_usuario (id_carrera, id_usuario) VALUES
(55, 8),   -- Miguel Apaza - Ingenieria Industrial
(55, 9),   -- Diego Vargas - Ingenieria Industrial
(56, 2),   -- Maria Quispe - Administracion
(56, 10),  -- Lucia Mendez - Administracion
(57, 6),   -- Luis Huanca  - Quimica
(58, 3);   -- Juan Flores  - Electronica