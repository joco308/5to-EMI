-- ============================================================
--  SEED DATA - SISTEMA SASL
--  Nombres de tablas y columnas corregidos para coincidir
--  exactamente con el DDL generado desde los modelos EF Core
--  Contrasena "Admin123!" -> BCrypt hash costo 10
--  CreateAt y UpdateAt se omiten (se rellenan automáticamente)
-- ============================================================

-- ============================================================
-- 1. Dominio
-- ============================================================
INSERT INTO Dominio (Dominio1) VALUES
('Roles'),            -- id 1
('Paises'),           -- id 2
('Zonas'),            -- id 3
('Generos'),          -- id 4
('Estado Civil'),     -- id 5
('Grado Academico'),  -- id 6
('Tipo Telefono'),    -- id 7
('Tipo Maquinaria'),  -- id 8
('Tipo Recurso'),     -- id 9
('Tipo Servicio'),    -- id 10
('Dias Laborales'),   -- id 11
('Empresas'),         -- id 12
('Satisfaccion'),     -- id 13
('Tipo Producto'),    -- id 14
('Carreras'),         -- id 15
('Tipo Documento');   -- id 16

-- ============================================================
-- 2. SubDominio
-- ============================================================

-- Paises (IdDominio = 2)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(2, 'Bolivia'),        -- id 1
(2, 'Argentina'),      -- id 2
(2, 'Brasil'),         -- id 3
(2, 'Alemania'),       -- id 4
(2, 'Estados Unidos'); -- id 5

-- Zonas (IdDominio = 3)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(3, 'Zona Sur'),     -- id 6
(3, 'Zona Norte'),   -- id 7
(3, 'Zona Central'), -- id 8
(3, 'Zona Este'),    -- id 9
(3, 'Zona Oeste');   -- id 10

-- Generos (IdDominio = 4)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(4, 'Masculino'), -- id 11
(4, 'Femenino'),  -- id 12
(4, 'Otro');      -- id 13

-- Estado Civil (IdDominio = 5)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(5, 'Soltero'),    -- id 14
(5, 'Casado'),     -- id 15
(5, 'Divorciado'), -- id 16
(5, 'Viudo');      -- id 17

-- Grado Academico (IdDominio = 6)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(6, 'Bachiller'),   -- id 18
(6, 'Tecnico'),     -- id 19
(6, 'Licenciatura'),-- id 20
(6, 'Maestria');    -- id 21

-- Tipo Telefono (IdDominio = 7)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(7, 'Celular'),  -- id 22
(7, 'Fijo'),     -- id 23
(7, 'Trabajo');  -- id 24

-- Tipo Maquinaria (IdDominio = 8)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(8, 'Limpieza Industrial'), -- id 25
(8, 'Fumigacion'),          -- id 26
(8, 'Jardineria'),          -- id 27
(8, 'Seguridad');           -- id 28

-- Tipo Recurso (IdDominio = 9)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(9, 'Quimico'),      -- id 29
(9, 'Herramienta'),  -- id 30
(9, 'Equipo EPP');   -- id 31

-- Tipo Servicio (IdDominio = 10)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(10, 'Limpieza de Oficinas'),   -- id 32
(10, 'Fumigacion Residencial'), -- id 33
(10, 'Mantenimiento de Areas'), -- id 34
(10, 'Limpieza Industrial');    -- id 35

-- Dias Laborales (IdDominio = 11)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(11, 'Lunes a Viernes'),            -- id 36
(11, 'Lunes a Sabado'),             -- id 37
(11, 'Fines de Semana'),            -- id 38
(11, 'Lunes, Miercoles, Viernes');  -- id 39

-- Empresas (IdDominio = 12)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(12, 'Banco Nacional'),          -- id 40
(12, 'Hospital Central'),        -- id 41
(12, 'Edificio Torre Sur'),      -- id 42
(12, 'Fabrica Textil Norte'),    -- id 43
(12, 'Municipalidad'),           -- id 44
(12, 'Quimicos del Sur S.A.'),   -- id 45
(12, 'MaquiTech Bolivia'),       -- id 46
(12, 'Distribuidora Nacional');  -- id 47

-- Satisfaccion (IdDominio = 13)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(13, 'Muy satisfecho'), -- id 48
(13, 'Satisfecho'),     -- id 49
(13, 'Neutral'),        -- id 50
(13, 'Insatisfecho');   -- id 51

-- Tipo Producto (IdDominio = 14)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(14, 'Productos Quimicos'),  -- id 52
(14, 'Maquinaria'),          -- id 53
(14, 'Insumos Generales');   -- id 54

-- Carreras (IdDominio = 15)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(15, 'Ingenieria Industrial'), -- id 55
(15, 'Administracion'),        -- id 56
(15, 'Quimica'),               -- id 57
(15, 'Electronica');           -- id 58

-- Tipo documento (IdDominio = 16)
INSERT INTO SubDominio (IdDominio, Detalle) VALUES
(16, 'Fotocopia CI'),                               -- id 59
(16, 'Certificado de Nacimiento'),                  -- id 60
(16, 'Certificado de Antecedentes Policiales'),     -- id 61
(16, 'Currículum Vitae');                           -- id 62

-- ============================================================
-- 3. Role
-- ============================================================
INSERT INTO Role (NombreRol, Salario) VALUES
('Gerente',       8000),  -- id 1
('Administrador', 6000),  -- id 2
('Trabajador',    4500),  -- id 3

-- ============================================================
-- 4. EstadoCalidad
-- ============================================================
INSERT INTO EstadoCalidad (EstadoCalidad1) VALUES
('Optimo'),            -- id 1
('Bueno'),             -- id 2
('Regular'),           -- id 3
('En Mantenimiento'),  -- id 4
('Dado de Baja');      -- id 5

-- ============================================================
-- 5. Direccion
-- ============================================================
INSERT INTO Direccion (IdZona, Calle, NCasa) VALUES
(6,  'Av. Hernando Siles',      123),  -- id 1
(7,  'Calle Murillo',           456),  -- id 2
(8,  'Av. Arce',                789),  -- id 3
(9,  'Calle Potosi',            321),  -- id 4
(10, 'Av. Montes',              654),  -- id 5
(6,  'Calle Ingavi',            987),  -- id 6
(7,  'Av. Villazón',            111),  -- id 7
(8,  'Calle Comercio',          222),  -- id 8
(9,  'Av. 6 de Agosto',         333),  -- id 9
(10, 'Calle Linares',           444),  -- id 10
(6,  'Av. Mariscal Santa Cruz', 100),  -- id 11
(7,  'Calle Sagarnaga',         200),  -- id 12
(8,  'Av. del Ejercito',        300),  -- id 13
(9,  'Calle Yanacocha',         400),  -- id 14
(6,  'Av. Camacho',             500),  -- id 15
(7,  'Calle Loayza',            600),  -- id 16
(8,  'Av. Busch',               700),  -- id 17
(9,  'Calle Illampu',           800);  -- id 18

-- ============================================================
-- 6. UsuarioTrabajador
-- Contrasena para todos: "Admin123!"
-- Hash BCrypt (costo 10): $2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy
-- ============================================================
INSERT INTO UsuarioTrabajador
    (IdRol, IdEstadoCivil, IdGradoAcademico, IdGenero, IdDireccion, IdPais,
     ContrasenaHash, Correo, Ci, NombreUsuario, FechaNacimiento,
     ServicioAsignado, Pediente2fa)
VALUES
-- id 1 - Gerente
(1, 15, 20, 11, 1, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'gerente@sasl.com', 12345678, 'Carlos Mamani', '1980-03-15', 0, 0),
-- id 2 - Administrador
(2, 14, 20, 12, 2, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'admin@sasl.com', 87654321, 'Maria Quispe', '1985-07-22', 0, 0),
-- id 3 - Trabajador
(3, 14, 19, 11, 3, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'supervisor1@sasl.com', 11223344, 'Juan Flores', '1990-01-10', 0, 0),
-- id 4
(1, 15, 20, 11, 1, 1,
 '$2a$11$YMzEfJ06.NfSMQ0ImRTLEufx3jWQB6TeEWdxLnDIdnh.L92svo3f.',
 'jqnpnlz@gmail.com', 13440068, 'Joaquin Peñaloza', '1980-03-15', 0, 0),
-- id 5
(3, 14, 18, 12, 5, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'ana.choque@sasl.com', 22334455, 'Ana Choque', '1992-05-18', 0, 0),
-- id 6
(3, 15, 19, 11, 6, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'luis.huanca@sasl.com', 33445566, 'Luis Huanca', '1988-11-30', 0, 0),
-- id 7
(3, 14, 18, 12, 7, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'rosa.ticona@sasl.com', 44556677, 'Rosa Ticona', '1995-02-14', 0, 0),
-- id 8
(3, 14, 19, 11, 8, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'miguel.apaza@sasl.com', 55667788, 'Miguel Apaza', '1987-08-25', 0, 0),
-- id 9
(3, 16, 18, 11, 9, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'diego.vargas@sasl.com', 66778899, 'Diego Vargas', '1993-04-07', 0, 0),
-- id 10
(3, 14, 20, 12, 10, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'lucia.mendez@sasl.com', 77889900, 'Lucia Mendez', '1991-09-12', 0, 0);

-- ============================================================
-- 7. TelefonoUsuario
-- ============================================================
INSERT INTO TelefonoUsuario (TelefonoUsuario1, IdUsuario, IdDetalle) VALUES
(72345678, 1,  22),
(71234567, 2,  22),
(76543210, 3,  22),
(79876543, 4,  22),
(74567890, 5,  22),
(73456789, 6,  22),
(78901234, 7,  22),
(75678901, 8,  22),
(70123456, 9,  22),
(77890123, 10, 22);

-- ============================================================
-- 8. Uniforme
-- ============================================================
INSERT INTO Uniforme (NombreUniforme, Talla, Descripcion) VALUES
('Overol Industrial Azul', 42, 'Overol resistente para trabajo pesado'),          -- id 1
('Overol Industrial Azul', 44, 'Overol resistente para trabajo pesado'),          -- id 2
('Overol Industrial Azul', 46, 'Overol resistente para trabajo pesado'),          -- id 3
('Chaleco Reflectivo',     42, 'Chaleco de seguridad con franjas reflectivas'),   -- id 4
('Chaleco Reflectivo',     44, 'Chaleco de seguridad con franjas reflectivas'),   -- id 5
('Camiseta Institucional', 42, 'Camiseta con logo SASL'),                         -- id 6
('Camiseta Institucional', 44, 'Camiseta con logo SASL');                         -- id 7

-- ============================================================
-- 9. AsignacionUniforme
-- ============================================================
INSERT INTO AsignacionUniforme (IdUsuario, IdUniforme, FechaEntrega, Estado) VALUES
(4,  1, '2025-01-10', 'Activo'),
(5,  2, '2025-01-10', 'Activo'),
(6,  3, '2025-01-10', 'Activo'),
(7,  1, '2025-01-10', 'Activo'),
(8,  4, '2025-01-10', 'Activo'),
(9,  5, '2025-01-10', 'Activo'),
(10, 6, '2025-02-01', 'Activo');

-- ============================================================
-- 10. Provedore
-- ============================================================
INSERT INTO Provedore (IdEmpresa, IdProducto, Nit, Nombre) VALUES
(45, 52, 100200300, 'Quimicos del Sur S.A.'),  -- id 1
(46, 53, 200300400, 'MaquiTech Bolivia'),      -- id 2
(47, 54, 300400500, 'Distribuidora Nacional'); -- id 3

-- ============================================================
-- 11. TelefonoProveedor
-- ============================================================
INSERT INTO TelefonoProveedor (Telefono, IdProveedor, IdDetalle) VALUES
(22345678, 1, 23),
(22456789, 2, 23),
(22567890, 3, 23);

-- ============================================================
-- 12. MarcaMaquinarium
-- ============================================================
INSERT INTO MarcaMaquinarium (IdPais, NombreMarca) VALUES
(4, 'Karcher'),     -- id 1 (Alemania)
(5, 'Tennant'),     -- id 2 (EEUU)
(1, 'AgroBolivia'), -- id 3 (Bolivia)
(5, 'Husqvarna');   -- id 4 (EEUU)

-- ============================================================
-- 13. Maquinarium
-- ============================================================
INSERT INTO Maquinarium
    (IdProveedor, IdTipoMaquinaria, IdEstadoCalidad, IdMarcaMaquinaria,
     NombreMaquinaria, CodigoInv, Descripcion)
VALUES
(2, 25, 1, 1, 'Aspiradora Industrial K5',  'MAQ-001', 'Aspiradora de alta potencia para superficies grandes'),
(2, 25, 2, 1, 'Aspiradora Industrial K3',  'MAQ-002', 'Aspiradora para superficies medianas'),
(2, 26, 1, 3, 'Fumigadora de Mochila 20L', 'MAQ-003', 'Equipo de fumigacion manual con tanque 20 litros'),
(2, 26, 2, 3, 'Fumigadora Automatica',     'MAQ-004', 'Equipo automatico de fumigacion'),
(2, 27, 1, 4, 'Cortadora de Cesped BX200', 'MAQ-005', 'Cortadora a gasolina para areas grandes'),
(2, 25, 3, 2, 'Fregadora Automatica T300', 'MAQ-006', 'Fregadora automatica para pisos industriales');

-- ============================================================
-- 14. HistorialEstadoMaquina
-- ============================================================
INSERT INTO HistorialEstadoMaquina (IdMaquinaria, IdEstadoCalidad, FechaCambio, Descripcion) VALUES
(1, 1, '2025-01-05', 'Alta inicial, estado optimo'),
(2, 1, '2025-01-05', 'Alta inicial, estado optimo'),
(2, 2, '2025-03-10', 'Revision de filtros, estado bueno'),
(3, 1, '2025-01-05', 'Alta inicial'),
(6, 2, '2025-02-01', 'Alta con desgaste menor en rodillos'),
(6, 3, '2025-04-15', 'Rodillos requieren cambio proximo');

-- ============================================================
-- 15. Mantenimiento + MantenimientosMaquinarium
-- ============================================================
INSERT INTO Mantenimiento (FechaMantenimiento, Descripcion, Costo) VALUES
('2025-03-10', 'Cambio de filtros y revision general aspiradora K3', 350.00),  -- id 1
('2025-04-15', 'Lubricacion y ajuste de rodillos fregadora T300',    280.00),  -- id 2
('2025-02-20', 'Revision de valvulas fumigadora automatica',         150.00);  -- id 3

INSERT INTO MantenimientosMaquinarium (IdMaquinaria, IdMantenimiento) VALUES
(2, 1),
(6, 2),
(4, 3);

-- ============================================================
-- 16. Recurso
-- ============================================================
INSERT INTO Recurso (IdProveedor, IdTipo, Nombre, Descripcion) VALUES
(1, 29, 'Desengrasante Industrial 5L', 'Liquido desengrasante para superficies metalicas'),      -- id 1
(1, 29, 'Desinfectante Multiusos 1L',  'Desinfectante para uso en hospitales y oficinas'),       -- id 2
(1, 29, 'Insecticida Residual 1L',     'Insecticida de efecto prolongado para fumigacion'),      -- id 3
(3, 30, 'Escoba Industrial',           'Escoba de cerdas duras para interiores'),                -- id 4
(3, 30, 'Trapeador Profesional',       'Trapeador con escurridor de aluminio'),                  -- id 5
(3, 31, 'Guantes de Nitrilo (par)',    'Guantes resistentes a quimicos talla M'),                -- id 6
(3, 31, 'Mascarilla N95',              'Mascarilla de proteccion respiratoria');                 -- id 7

-- ============================================================
-- 17. Cliente
-- ============================================================
INSERT INTO Cliente (IdEmpresa, IdDireccion, NombreCliente, ContactoEmergencia) VALUES
(40, 11, 'Banco Nacional - Sucursal Central', '75123456'),  -- id 1
(41, 12, 'Hospital Central La Paz',           '72987654'),  -- id 2
(42, 13, 'Edificio Torre Sur - Admin',        '71456789'),  -- id 3
(43, 14, 'Fabrica Textil del Norte',          '76789012');  -- id 4

-- ============================================================
-- 18. TelefonoCliente
-- ============================================================
INSERT INTO TelefonoCliente (Telefono, IdCliente, IdDetalle) VALUES
(22112233, 1, 23),
(22334455, 2, 23),
(22445566, 3, 23),
(22556677, 4, 23);

-- ============================================================
-- 19. Servicio
-- ============================================================
INSERT INTO Servicio
    (IdCliente, IdDireccion, TipoServicio, FechaInicio, FechaFinal, Costo, Descripcion)
VALUES
(1, 15, 32, '2025-04-01', '2025-06-30', 12000.00,
 'Limpieza diaria de oficinas, salas de espera y banos del edificio principal'),
(2, 16, 35, '2025-03-15', '2025-07-15', 25000.00,
 'Limpieza y desinfeccion de areas criticas, UCI y consultorios'),
(3, 17, 34, '2025-05-01', NULL,          8500.00,
 'Mantenimiento de areas comunes, jardines y estacionamiento'),
(4, 18, 33, '2025-02-01', '2025-02-05', 4500.00,
 'Fumigacion completa de planta de produccion y almacenes');

-- ============================================================
-- 20. Horario
-- ============================================================
INSERT INTO Horario (HoraEntrada, HoraSalida) VALUES
('07:00', '15:00'),  -- id 1 turno mañana
('15:00', '23:00'),  -- id 2 turno tarde
('07:00', '12:00'),  -- id 3 medio dia
('08:00', '16:00'),  -- id 4 jornada completa
('06:00', '14:00');  -- id 5 madrugada

-- ============================================================
-- 21. AsignacionEmpleado
-- ============================================================
INSERT INTO AsignacionEmpleado (IdUsuario, IdServicio, IdHorario, DiasLaborales) VALUES
(4,  1, 1, 36),
(5,  1, 1, 36),
(6,  2, 4, 37),
(7,  2, 4, 37),
(8,  3, 3, 39),
(10, 3, 3, 39);

UPDATE UsuarioTrabajador SET ServicioAsignado = 1 WHERE IdUsuario IN (4, 5, 6, 7, 8, 10);

-- ============================================================
-- 22. AsignacionMaquinarium
-- ============================================================
INSERT INTO AsignacionMaquinarium (IdServicio, IdMaquinaria, Cantidad, Descripcion) VALUES
(1, 1, 1, 'Aspiradora para oficinas principales'),
(1, 6, 1, 'Fregadora para pasillos y hall de entrada'),
(2, 2, 2, 'Aspiradoras para diferentes pisos del hospital'),
(2, 6, 1, 'Fregadora para pasillos generales'),
(3, 5, 1, 'Cortadora para areas verdes del edificio'),
(4, 3, 2, 'Fumigadoras para la planta y almacenes');

-- ============================================================
-- 23. AsignacionRecurso
-- ============================================================
INSERT INTO AsignacionRecurso (IdServicio, IdRecurso, Cantidad) VALUES
(1, 1, 10),
(1, 4, 5),
(1, 5, 5),
(2, 2, 20),
(2, 6, 30),
(2, 7, 30),
(3, 4, 3),
(3, 5, 3),
(4, 3, 10),
(4, 7, 10);

-- ============================================================
-- 24. ServicioTerminado
-- ============================================================
INSERT INTO ServicioTerminado (IdServicio, Satisfaccion, Comentarios) VALUES
(4, 48, 'Excelente trabajo, la fumigacion fue muy efectiva. Sin ninguna queja.');

-- ============================================================
-- 25. Incidente
-- ============================================================
INSERT INTO Incidente (IdServicio, Descripcion, Fecha) VALUES
(2, 'Derrame menor de producto de limpieza en pasillo 3er piso. Atendido de inmediato.', '2025-04-10'),
(1, 'Maquina aspiradora presento falla electrica. Se sustituyo por equipo de respaldo.',  '2025-04-22');

-- ============================================================
-- 26. Capacitacione
-- ============================================================
INSERT INTO Capacitacione (Nombre, Descripcion, Fecha) VALUES
('Manejo de Productos Quimicos', 'Uso seguro y almacenamiento de quimicos industriales',        '2025-02-15'),
('Primeros Auxilios Basicos',    'Respuesta ante accidentes laborales',                         '2025-03-01'),
('Uso de EPP',                   'Equipo de proteccion personal: tipos, uso correcto y cuidado', '2025-03-20'),
('Protocolo de Fumigacion',      'Tecnicas y seguridad en procesos de fumigacion',               '2025-04-05');

-- ============================================================
-- 27. UsuariosCapacitacione
-- ============================================================
INSERT INTO UsuariosCapacitacione (IdUsuario, IdCapacitacion, Estado) VALUES
(4,  1, 'Completado'),
(4,  3, 'Completado'),
(5,  1, 'Completado'),
(5,  3, 'Completado'),
(6,  1, 'Completado'),
(6,  2, 'Completado'),
(6,  3, 'Completado'),
(7,  3, 'En progreso'),
(8,  4, 'Completado'),
(9,  4, 'Completado'),
(9,  1, 'Pendiente'),
(10, 2, 'Completado');

-- ============================================================
-- 28. Memorial
-- ============================================================
INSERT INTO Memorial (IdEmpleado, Descripcion) VALUES
(4, 'Pedro Condori lleva 2 años en la empresa. Trabajador destacado del mes de marzo 2025.'),
(8, 'Miguel Apaza capacito a 3 nuevos tecnicos en el uso de maquinaria industrial.');

-- ============================================================
-- 29. UsuarioTrabajador_Carrera (tabla de union M:N)
-- ============================================================
INSERT INTO UsuarioTrabajador_Carrera (IdUsuario, IdSubDominio) VALUES
(8,  55),  -- Miguel Apaza  - Ingenieria Industrial
(9,  55),  -- Diego Vargas  - Ingenieria Industrial
(2,  56),  -- Maria Quispe  - Administracion
(10, 56),  -- Lucia Mendez  - Administracion
(6,  57),  -- Luis Huanca   - Quimica
(3,  58);  -- Juan Flores   - Electronica