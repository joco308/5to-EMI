-- ============================================================
--  SEED DATA - SISTEMA SASL
--  Nombres de tablas y columnas corregidos para coincidir
--  exactamente con el DDL generado desde los modelos EF Core
--  Contrasena "Admin123!" -> BCrypt hash costo 10
-- ============================================================

-- ============================================================
-- 1. Dominio
-- ============================================================
INSERT INTO Dominio (Dominio1, CreateAt, UpdateAt) VALUES
('Roles',            GETDATE(), GETDATE()),  -- id 1
('Paises',           GETDATE(), GETDATE()),  -- id 2
('Zonas',            GETDATE(), GETDATE()),  -- id 3
('Generos',          GETDATE(), GETDATE()),  -- id 4
('Estado Civil',     GETDATE(), GETDATE()),  -- id 5
('Grado Academico',  GETDATE(), GETDATE()),  -- id 6
('Tipo Telefono',    GETDATE(), GETDATE()),  -- id 7
('Tipo Maquinaria',  GETDATE(), GETDATE()),  -- id 8
('Tipo Recurso',     GETDATE(), GETDATE()),  -- id 9
('Tipo Servicio',    GETDATE(), GETDATE()),  -- id 10
('Dias Laborales',   GETDATE(), GETDATE()),  -- id 11
('Empresas',         GETDATE(), GETDATE()),  -- id 12
('Satisfaccion',     GETDATE(), GETDATE()),  -- id 13
('Tipo Producto',    GETDATE(), GETDATE()),  -- id 14
('Carreras',         GETDATE(), GETDATE());  -- id 15

-- ============================================================
-- 2. SubDominio
-- ============================================================

-- Paises (IdDominio = 2)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(2, 'Bolivia',        GETDATE(), GETDATE()),  -- id 1
(2, 'Argentina',      GETDATE(), GETDATE()),  -- id 2
(2, 'Brasil',         GETDATE(), GETDATE()),  -- id 3
(2, 'Alemania',       GETDATE(), GETDATE()),  -- id 4
(2, 'Estados Unidos', GETDATE(), GETDATE());  -- id 5

-- Zonas (IdDominio = 3)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(3, 'Zona Sur',     GETDATE(), GETDATE()),  -- id 6
(3, 'Zona Norte',   GETDATE(), GETDATE()),  -- id 7
(3, 'Zona Central', GETDATE(), GETDATE()),  -- id 8
(3, 'Zona Este',    GETDATE(), GETDATE()),  -- id 9
(3, 'Zona Oeste',   GETDATE(), GETDATE());  -- id 10

-- Generos (IdDominio = 4)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(4, 'Masculino', GETDATE(), GETDATE()),  -- id 11
(4, 'Femenino',  GETDATE(), GETDATE()),  -- id 12
(4, 'Otro',      GETDATE(), GETDATE());  -- id 13

-- Estado Civil (IdDominio = 5)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(5, 'Soltero',    GETDATE(), GETDATE()),  -- id 14
(5, 'Casado',     GETDATE(), GETDATE()),  -- id 15
(5, 'Divorciado', GETDATE(), GETDATE()),  -- id 16
(5, 'Viudo',      GETDATE(), GETDATE());  -- id 17

-- Grado Academico (IdDominio = 6)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(6, 'Bachiller',   GETDATE(), GETDATE()),  -- id 18
(6, 'Tecnico',     GETDATE(), GETDATE()),  -- id 19
(6, 'Licenciatura',GETDATE(), GETDATE()),  -- id 20
(6, 'Maestria',    GETDATE(), GETDATE());  -- id 21

-- Tipo Telefono (IdDominio = 7)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(7, 'Celular',  GETDATE(), GETDATE()),  -- id 22
(7, 'Fijo',     GETDATE(), GETDATE()),  -- id 23
(7, 'Trabajo',  GETDATE(), GETDATE());  -- id 24

-- Tipo Maquinaria (IdDominio = 8)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(8, 'Limpieza Industrial', GETDATE(), GETDATE()),  -- id 25
(8, 'Fumigacion',          GETDATE(), GETDATE()),  -- id 26
(8, 'Jardineria',          GETDATE(), GETDATE()),  -- id 27
(8, 'Seguridad',           GETDATE(), GETDATE());  -- id 28

-- Tipo Recurso (IdDominio = 9)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(9, 'Quimico',      GETDATE(), GETDATE()),  -- id 29
(9, 'Herramienta',  GETDATE(), GETDATE()),  -- id 30
(9, 'Equipo EPP',   GETDATE(), GETDATE());  -- id 31

-- Tipo Servicio (IdDominio = 10)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(10, 'Limpieza de Oficinas',   GETDATE(), GETDATE()),  -- id 32
(10, 'Fumigacion Residencial', GETDATE(), GETDATE()),  -- id 33
(10, 'Mantenimiento de Areas', GETDATE(), GETDATE()),  -- id 34
(10, 'Limpieza Industrial',    GETDATE(), GETDATE());  -- id 35

-- Dias Laborales (IdDominio = 11)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(11, 'Lunes a Viernes',            GETDATE(), GETDATE()),  -- id 36
(11, 'Lunes a Sabado',             GETDATE(), GETDATE()),  -- id 37
(11, 'Fines de Semana',            GETDATE(), GETDATE()),  -- id 38
(11, 'Lunes, Miercoles, Viernes',  GETDATE(), GETDATE());  -- id 39

-- Empresas (IdDominio = 12)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(12, 'Banco Nacional',          GETDATE(), GETDATE()),  -- id 40
(12, 'Hospital Central',        GETDATE(), GETDATE()),  -- id 41
(12, 'Edificio Torre Sur',      GETDATE(), GETDATE()),  -- id 42
(12, 'Fabrica Textil Norte',    GETDATE(), GETDATE()),  -- id 43
(12, 'Municipalidad',           GETDATE(), GETDATE()),  -- id 44
(12, 'Quimicos del Sur S.A.',   GETDATE(), GETDATE()),  -- id 45
(12, 'MaquiTech Bolivia',       GETDATE(), GETDATE()),  -- id 46
(12, 'Distribuidora Nacional',  GETDATE(), GETDATE());  -- id 47

-- Satisfaccion (IdDominio = 13)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(13, 'Muy satisfecho', GETDATE(), GETDATE()),  -- id 48
(13, 'Satisfecho',     GETDATE(), GETDATE()),  -- id 49
(13, 'Neutral',        GETDATE(), GETDATE()),  -- id 50
(13, 'Insatisfecho',   GETDATE(), GETDATE());  -- id 51

-- Tipo Producto (IdDominio = 14)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(14, 'Productos Quimicos',  GETDATE(), GETDATE()),  -- id 52
(14, 'Maquinaria',          GETDATE(), GETDATE()),  -- id 53
(14, 'Insumos Generales',   GETDATE(), GETDATE());  -- id 54

-- Carreras (IdDominio = 15)
INSERT INTO SubDominio (IdDominio, Detalle, CreateAt, UpdateAt) VALUES
(15, 'Ingenieria Industrial', GETDATE(), GETDATE()),  -- id 55
(15, 'Administracion',        GETDATE(), GETDATE()),  -- id 56
(15, 'Quimica',               GETDATE(), GETDATE()),  -- id 57
(15, 'Electronica',           GETDATE(), GETDATE());  -- id 58

-- ============================================================
-- 3. Role
-- ============================================================
INSERT INTO Role (NombreRol, Salario, CreateAt, UpdateAt) VALUES
('Gerente',       8000, GETDATE(), GETDATE()),  -- id 1
('Administrador', 6000, GETDATE(), GETDATE()),  -- id 2
('Trabajador',    4500, GETDATE(), GETDATE());  -- id 3

-- ============================================================
-- 4. EstadoCalidad
-- ============================================================
INSERT INTO EstadoCalidad (EstadoCalidad1, CreateAt, UpdateAt) VALUES
('Optimo',            GETDATE(), GETDATE()),  -- id 1
('Bueno',             GETDATE(), GETDATE()),  -- id 2
('Regular',           GETDATE(), GETDATE()),  -- id 3
('En Mantenimiento',  GETDATE(), GETDATE()),  -- id 4
('Dado de Baja',      GETDATE(), GETDATE());  -- id 5

-- ============================================================
-- 5. Direccion
-- ============================================================
INSERT INTO Direccion (IdZona, Calle, NCasa, CreateAt, UpdateAt) VALUES
(6,  'Av. Hernando Siles',      123, GETDATE(), GETDATE()),  -- id 1
(7,  'Calle Murillo',           456, GETDATE(), GETDATE()),  -- id 2
(8,  'Av. Arce',                789, GETDATE(), GETDATE()),  -- id 3
(9,  'Calle Potosi',            321, GETDATE(), GETDATE()),  -- id 4
(10, 'Av. Montes',              654, GETDATE(), GETDATE()),  -- id 5
(6,  'Calle Ingavi',            987, GETDATE(), GETDATE()),  -- id 6
(7,  'Av. Villazón',            111, GETDATE(), GETDATE()),  -- id 7
(8,  'Calle Comercio',          222, GETDATE(), GETDATE()),  -- id 8
(9,  'Av. 6 de Agosto',         333, GETDATE(), GETDATE()),  -- id 9
(10, 'Calle Linares',           444, GETDATE(), GETDATE()),  -- id 10
(6,  'Av. Mariscal Santa Cruz', 100, GETDATE(), GETDATE()),  -- id 11
(7,  'Calle Sagarnaga',         200, GETDATE(), GETDATE()),  -- id 12
(8,  'Av. del Ejercito',        300, GETDATE(), GETDATE()),  -- id 13
(9,  'Calle Yanacocha',         400, GETDATE(), GETDATE()),  -- id 14
(6,  'Av. Camacho',             500, GETDATE(), GETDATE()),  -- id 15
(7,  'Calle Loayza',            600, GETDATE(), GETDATE()),  -- id 16
(8,  'Av. Busch',               700, GETDATE(), GETDATE()),  -- id 17
(9,  'Calle Illampu',           800, GETDATE(), GETDATE());  -- id 18

-- ============================================================
-- 6. UsuarioTrabajador
-- Contrasena para todos: "Admin123!"
-- Hash BCrypt (costo 10): $2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy
-- ============================================================
INSERT INTO UsuarioTrabajador
    (IdRol, IdEstadoCivil, IdGradoAcademico, IdGenero, IdDireccion, IdPais,
     ContrasenaHash, Correo, Ci, NombreUsuario, FechaNacimiento,
     ServicioAsignado, Pediente2fa, CreateAt, UpdateAt)
VALUES
-- id 1 - Gerente
(1, 15, 20, 11, 1, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'gerente@sasl.com', 12345678, 'Carlos Mamani', '1980-03-15', 0, 0, GETDATE(), GETDATE()),
-- id 2 - Administrador
(2, 14, 20, 12, 2, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'admin@sasl.com', 87654321, 'Maria Quispe', '1985-07-22', 0, 0, GETDATE(), GETDATE()),
-- id 3 - Trabajador
(3, 14, 19, 11, 3, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'supervisor1@sasl.com', 11223344, 'Juan Flores', '1990-01-10', 0, 0, GETDATE(), GETDATE()),
-- id 4
(1, 15, 20, 11, 1, 1,
 '$2a$11$YMzEfJ06.NfSMQ0ImRTLEufx3jWQB6TeEWdxLnDIdnh.L92svo3f.',
 'jqnpnlz@gmail.com', 13440068, 'Joaquin Peñaloza', '1980-03-15', 0, 0, GETDATE(), GETDATE()),
-- id 5
(3, 14, 18, 12, 5, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'ana.choque@sasl.com', 22334455, 'Ana Choque', '1992-05-18', 0, 0, GETDATE(), GETDATE()),
-- id 6
(3, 15, 19, 11, 6, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'luis.huanca@sasl.com', 33445566, 'Luis Huanca', '1988-11-30', 0, 0, GETDATE(), GETDATE()),
-- id 7
(3, 14, 18, 12, 7, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'rosa.ticona@sasl.com', 44556677, 'Rosa Ticona', '1995-02-14', 0, 0, GETDATE(), GETDATE()),
-- id 8
(3, 14, 19, 11, 8, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'miguel.apaza@sasl.com', 55667788, 'Miguel Apaza', '1987-08-25', 0, 0, GETDATE(), GETDATE()),
-- id 9
(3, 16, 18, 11, 9, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'diego.vargas@sasl.com', 66778899, 'Diego Vargas', '1993-04-07', 0, 0, GETDATE(), GETDATE()),
-- id 10
(3, 14, 20, 12, 10, 1,
 '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lHgy',
 'lucia.mendez@sasl.com', 77889900, 'Lucia Mendez', '1991-09-12', 0, 0, GETDATE(), GETDATE());

-- ============================================================
-- 7. TelefonoUsuario
-- ============================================================
INSERT INTO TelefonoUsuario (TelefonoUsuario1, IdUsuario, IdDetalle, CreateAt, UpdateAt) VALUES
(72345678, 1,  22, GETDATE(), GETDATE()),
(71234567, 2,  22, GETDATE(), GETDATE()),
(76543210, 3,  22, GETDATE(), GETDATE()),
(79876543, 4,  22, GETDATE(), GETDATE()),
(74567890, 5,  22, GETDATE(), GETDATE()),
(73456789, 6,  22, GETDATE(), GETDATE()),
(78901234, 7,  22, GETDATE(), GETDATE()),
(75678901, 8,  22, GETDATE(), GETDATE()),
(70123456, 9,  22, GETDATE(), GETDATE()),
(77890123, 10, 22, GETDATE(), GETDATE());

-- ============================================================
-- 8. Uniforme
-- ============================================================
INSERT INTO Uniforme (NombreUniforme, Talla, Descripcion, CreateAt, UpdateAt) VALUES
('Overol Industrial Azul', 42, 'Overol resistente para trabajo pesado',          GETDATE(), GETDATE()),  -- id 1
('Overol Industrial Azul', 44, 'Overol resistente para trabajo pesado',          GETDATE(), GETDATE()),  -- id 2
('Overol Industrial Azul', 46, 'Overol resistente para trabajo pesado',          GETDATE(), GETDATE()),  -- id 3
('Chaleco Reflectivo',     42, 'Chaleco de seguridad con franjas reflectivas',   GETDATE(), GETDATE()),  -- id 4
('Chaleco Reflectivo',     44, 'Chaleco de seguridad con franjas reflectivas',   GETDATE(), GETDATE()),  -- id 5
('Camiseta Institucional', 42, 'Camiseta con logo SASL',                         GETDATE(), GETDATE()),  -- id 6
('Camiseta Institucional', 44, 'Camiseta con logo SASL',                         GETDATE(), GETDATE());  -- id 7

-- ============================================================
-- 9. AsignacionUniforme
-- ============================================================
INSERT INTO AsignacionUniforme (IdUsuario, IdUniforme, FechaEntrega, Estado, CreateAt, UpdateAt) VALUES
(4,  1, '2025-01-10', 'Activo', GETDATE(), GETDATE()),
(5,  2, '2025-01-10', 'Activo', GETDATE(), GETDATE()),
(6,  3, '2025-01-10', 'Activo', GETDATE(), GETDATE()),
(7,  1, '2025-01-10', 'Activo', GETDATE(), GETDATE()),
(8,  4, '2025-01-10', 'Activo', GETDATE(), GETDATE()),
(9,  5, '2025-01-10', 'Activo', GETDATE(), GETDATE()),
(10, 6, '2025-02-01', 'Activo', GETDATE(), GETDATE());

-- ============================================================
-- 10. Provedore
-- ============================================================
INSERT INTO Provedore (IdEmpresa, IdProducto, Nit, Nombre, CreateAt, UpdateAt) VALUES
(45, 52, 100200300, 'Quimicos del Sur S.A.',  GETDATE(), GETDATE()),  -- id 1
(46, 53, 200300400, 'MaquiTech Bolivia',       GETDATE(), GETDATE()),  -- id 2
(47, 54, 300400500, 'Distribuidora Nacional',  GETDATE(), GETDATE());  -- id 3

-- ============================================================
-- 11. TelefonoProveedor
-- ============================================================
INSERT INTO TelefonoProveedor (Telefono, IdProveedor, IdDetalle, CreateAt, UpdateAt) VALUES
(22345678, 1, 23, GETDATE(), GETDATE()),
(22456789, 2, 23, GETDATE(), GETDATE()),
(22567890, 3, 23, GETDATE(), GETDATE());

-- ============================================================
-- 12. MarcaMaquinarium
-- ============================================================
INSERT INTO MarcaMaquinarium (IdPais, NombreMarca, CreateAt, UpdateAt) VALUES
(4, 'Karcher',     GETDATE(), GETDATE()),  -- id 1 (Alemania)
(5, 'Tennant',     GETDATE(), GETDATE()),  -- id 2 (EEUU)
(1, 'AgroBolivia', GETDATE(), GETDATE()),  -- id 3 (Bolivia)
(5, 'Husqvarna',   GETDATE(), GETDATE());  -- id 4 (EEUU)

-- ============================================================
-- 13. Maquinarium
-- ============================================================
INSERT INTO Maquinarium
    (IdProveedor, IdTipoMaquinaria, IdEstadoCalidad, IdMarcaMaquinaria,
     NombreMaquinaria, CodigoInv, Descripcion, CreateAt, UpdateAt)
VALUES
(2, 25, 1, 1, 'Aspiradora Industrial K5',  'MAQ-001', 'Aspiradora de alta potencia para superficies grandes', GETDATE(), GETDATE()),
(2, 25, 2, 1, 'Aspiradora Industrial K3',  'MAQ-002', 'Aspiradora para superficies medianas',                 GETDATE(), GETDATE()),
(2, 26, 1, 3, 'Fumigadora de Mochila 20L', 'MAQ-003', 'Equipo de fumigacion manual con tanque 20 litros',    GETDATE(), GETDATE()),
(2, 26, 2, 3, 'Fumigadora Automatica',     'MAQ-004', 'Equipo automatico de fumigacion',                      GETDATE(), GETDATE()),
(2, 27, 1, 4, 'Cortadora de Cesped BX200', 'MAQ-005', 'Cortadora a gasolina para areas grandes',             GETDATE(), GETDATE()),
(2, 25, 3, 2, 'Fregadora Automatica T300', 'MAQ-006', 'Fregadora automatica para pisos industriales',        GETDATE(), GETDATE());

-- ============================================================
-- 14. HistorialEstadoMaquina
-- ============================================================
INSERT INTO HistorialEstadoMaquina (IdMaquinaria, IdEstadoCalidad, FechaCambio, Descripcion, CreateAt, UpdateAt) VALUES
(1, 1, '2025-01-05', 'Alta inicial, estado optimo',                GETDATE(), GETDATE()),
(2, 1, '2025-01-05', 'Alta inicial, estado optimo',                GETDATE(), GETDATE()),
(2, 2, '2025-03-10', 'Revision de filtros, estado bueno',          GETDATE(), GETDATE()),
(3, 1, '2025-01-05', 'Alta inicial',                               GETDATE(), GETDATE()),
(6, 2, '2025-02-01', 'Alta con desgaste menor en rodillos',        GETDATE(), GETDATE()),
(6, 3, '2025-04-15', 'Rodillos requieren cambio proximo',          GETDATE(), GETDATE());

-- ============================================================
-- 15. Mantenimiento + MantenimientosMaquinarium
-- ============================================================
INSERT INTO Mantenimiento (FechaMantenimiento, Descripcion, Costo, CreateAt, UpdateAt) VALUES
('2025-03-10', 'Cambio de filtros y revision general aspiradora K3', 350.00, GETDATE(), GETDATE()),  -- id 1
('2025-04-15', 'Lubricacion y ajuste de rodillos fregadora T300',    280.00, GETDATE(), GETDATE()),  -- id 2
('2025-02-20', 'Revision de valvulas fumigadora automatica',         150.00, GETDATE(), GETDATE());  -- id 3

INSERT INTO MantenimientosMaquinarium (IdMaquinaria, IdMantenimiento, CreateAt, UpdateAt) VALUES
(2, 1, GETDATE(), GETDATE()),
(6, 2, GETDATE(), GETDATE()),
(4, 3, GETDATE(), GETDATE());

-- ============================================================
-- 16. Recurso
-- ============================================================
INSERT INTO Recurso (IdProveedor, IdTipo, Nombre, Descripcion, CreateAt, UpdateAt) VALUES
(1, 29, 'Desengrasante Industrial 5L', 'Liquido desengrasante para superficies metalicas',      GETDATE(), GETDATE()),  -- id 1
(1, 29, 'Desinfectante Multiusos 1L',  'Desinfectante para uso en hospitales y oficinas',       GETDATE(), GETDATE()),  -- id 2
(1, 29, 'Insecticida Residual 1L',     'Insecticida de efecto prolongado para fumigacion',      GETDATE(), GETDATE()),  -- id 3
(3, 30, 'Escoba Industrial',           'Escoba de cerdas duras para interiores',                GETDATE(), GETDATE()),  -- id 4
(3, 30, 'Trapeador Profesional',       'Trapeador con escurridor de aluminio',                  GETDATE(), GETDATE()),  -- id 5
(3, 31, 'Guantes de Nitrilo (par)',    'Guantes resistentes a quimicos talla M',                GETDATE(), GETDATE()),  -- id 6
(3, 31, 'Mascarilla N95',              'Mascarilla de proteccion respiratoria',                 GETDATE(), GETDATE());  -- id 7

-- ============================================================
-- 17. Cliente
-- ============================================================
INSERT INTO Cliente (IdEmpresa, IdDireccion, NombreCliente, ContactoEmergencia, CreateAt, UpdateAt) VALUES
(40, 11, 'Banco Nacional - Sucursal Central', '75123456', GETDATE(), GETDATE()),  -- id 1
(41, 12, 'Hospital Central La Paz',           '72987654', GETDATE(), GETDATE()),  -- id 2
(42, 13, 'Edificio Torre Sur - Admin',        '71456789', GETDATE(), GETDATE()),  -- id 3
(43, 14, 'Fabrica Textil del Norte',          '76789012', GETDATE(), GETDATE());  -- id 4

-- ============================================================
-- 18. TelefonoCliente
-- ============================================================
INSERT INTO TelefonoCliente (Telefono, IdCliente, IdDetalle, CreateAt, UpdateAt) VALUES
(22112233, 1, 23, GETDATE(), GETDATE()),
(22334455, 2, 23, GETDATE(), GETDATE()),
(22445566, 3, 23, GETDATE(), GETDATE()),
(22556677, 4, 23, GETDATE(), GETDATE());

-- ============================================================
-- 19. Servicio
-- ============================================================
INSERT INTO Servicio
    (IdCliente, IdDireccion, TipoServicio, FechaInicio, FechaFinal, Costo, Descripcion, CreateAt, UpdateAt)
VALUES
(1, 15, 32, '2025-04-01', '2025-06-30', 12000.00,
 'Limpieza diaria de oficinas, salas de espera y banos del edificio principal', GETDATE(), GETDATE()),
(2, 16, 35, '2025-03-15', '2025-07-15', 25000.00,
 'Limpieza y desinfeccion de areas criticas, UCI y consultorios',               GETDATE(), GETDATE()),
(3, 17, 34, '2025-05-01', NULL,          8500.00,
 'Mantenimiento de areas comunes, jardines y estacionamiento',                  GETDATE(), GETDATE()),
(4, 18, 33, '2025-02-01', '2025-02-05', 4500.00,
 'Fumigacion completa de planta de produccion y almacenes',                     GETDATE(), GETDATE());

-- ============================================================
-- 20. Horario
-- ============================================================
INSERT INTO Horario (HoraEntrada, HoraSalida, CreateAt, UpdateAt) VALUES
('07:00', '15:00', GETDATE(), GETDATE()),  -- id 1 turno mañana
('15:00', '23:00', GETDATE(), GETDATE()),  -- id 2 turno tarde
('07:00', '12:00', GETDATE(), GETDATE()),  -- id 3 medio dia
('08:00', '16:00', GETDATE(), GETDATE()),  -- id 4 jornada completa
('06:00', '14:00', GETDATE(), GETDATE());  -- id 5 madrugada

-- ============================================================
-- 21. AsignacionEmpleado
-- ============================================================
INSERT INTO AsignacionEmpleado (IdUsuario, IdServicio, IdHorario, DiasLaborales, CreateAt, UpdateAt) VALUES
(4,  1, 1, 36, GETDATE(), GETDATE()),
(5,  1, 1, 36, GETDATE(), GETDATE()),
(6,  2, 4, 37, GETDATE(), GETDATE()),
(7,  2, 4, 37, GETDATE(), GETDATE()),
(8,  3, 3, 39, GETDATE(), GETDATE()),
(10, 3, 3, 39, GETDATE(), GETDATE());

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
INSERT INTO ServicioTerminado (IdServicio, Satisfaccion, Comentarios, CreateAt, UpdateAt) VALUES
(4, 48, 'Excelente trabajo, la fumigacion fue muy efectiva. Sin ninguna queja.', GETDATE(), GETDATE());

-- ============================================================
-- 25. Incidente
-- ============================================================
INSERT INTO Incidente (IdServicio, Descripcion, Fecha, CreateAt, UpdateAt) VALUES
(2, 'Derrame menor de producto de limpieza en pasillo 3er piso. Atendido de inmediato.', '2025-04-10', GETDATE(), GETDATE()),
(1, 'Maquina aspiradora presento falla electrica. Se sustituyo por equipo de respaldo.',  '2025-04-22', GETDATE(), GETDATE());

-- ============================================================
-- 26. Capacitacione
-- ============================================================
INSERT INTO Capacitacione (Nombre, Descripcion, Fecha, CreateAt, UpdateAt) VALUES
('Manejo de Productos Quimicos', 'Uso seguro y almacenamiento de quimicos industriales',        '2025-02-15', GETDATE(), GETDATE()),
('Primeros Auxilios Basicos',    'Respuesta ante accidentes laborales',                         '2025-03-01', GETDATE(), GETDATE()),
('Uso de EPP',                   'Equipo de proteccion personal: tipos, uso correcto y cuidado', '2025-03-20', GETDATE(), GETDATE()),
('Protocolo de Fumigacion',      'Tecnicas y seguridad en procesos de fumigacion',               '2025-04-05', GETDATE(), GETDATE());

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
-- 28. DocumentosUsuario
-- ============================================================
INSERT INTO DocumentosUsuario (IdUsuario, TipoDeDocumento, Archivo, FechaSubida, CreateAt, UpdateAt) VALUES
(1, 'Carnet de Identidad', 'ci_carlos_mamani.pdf',    '2024-01-10', GETDATE(), GETDATE()),
(2, 'Carnet de Identidad', 'ci_maria_quispe.pdf',     '2024-01-10', GETDATE(), GETDATE()),
(4, 'Carnet de Identidad', 'ci_pedro_condori.pdf',    '2024-01-15', GETDATE(), GETDATE()),
(4, 'Certificado Medico',  'med_pedro_condori.pdf',   '2024-01-15', GETDATE(), GETDATE()),
(5, 'Carnet de Identidad', 'ci_ana_choque.pdf',       '2024-01-15', GETDATE(), GETDATE()),
(6, 'Carnet de Identidad', 'ci_luis_huanca.pdf',      '2024-01-20', GETDATE(), GETDATE()),
(8, 'Titulo Tecnico',      'titulo_miguel_apaza.pdf', '2024-01-20', GETDATE(), GETDATE());

-- ============================================================
-- 29. Memorial
-- ============================================================
INSERT INTO Memorial (IdEmpleado, Descripcion, CreateAt, UpdateAt) VALUES
(4, 'Pedro Condori lleva 2 años en la empresa. Trabajador destacado del mes de marzo 2025.', GETDATE(), GETDATE()),
(8, 'Miguel Apaza capacito a 3 nuevos tecnicos en el uso de maquinaria industrial.',         GETDATE(), GETDATE());

-- ============================================================
-- 30. UsuarioTrabajador_Carrera (tabla de union M:N)
-- ============================================================
INSERT INTO UsuarioTrabajador_Carrera (IdUsuario, IdSubDominio) VALUES
(8,  55),  -- Miguel Apaza  - Ingenieria Industrial
(9,  55),  -- Diego Vargas  - Ingenieria Industrial
(2,  56),  -- Maria Quispe  - Administracion
(10, 56),  -- Lucia Mendez  - Administracion
(6,  57),  -- Luis Huanca   - Quimica
(3,  58);  -- Juan Flores   - Electronica