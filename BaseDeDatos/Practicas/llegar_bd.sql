-- ============================================================
-- SCRIPT: Datos de prueba (seed)
-- MOTOR:  SQL Server
-- ORDEN:  Respeta dependencias de FK (tablas padre primero)
-- MAX:    5 registros por tabla
-- ============================================================

-- ------------------------------------------------------------
-- 1. Dominios  (sin dependencias)
-- ------------------------------------------------------------
INSERT INTO Dominios (dominio) VALUES
    ('Genero'),
    ('Estado Civil'),
    ('Pais'),
    ('Grado Academico'),
    ('Zona'),
    ('Tipo Telefono'),
    ('Tipo Empresa'),
    ('Tipo Producto'),
    ('Tipo Servicio'),
    ('Tipo Maquinaria'),
    ('Carrera'),
    ('Dias Laborales'),
    ('Satisfaccion');
-- IDs generados: 1-13

-- ------------------------------------------------------------
-- 2. Sub_dominios  (depende: Dominios)
-- ------------------------------------------------------------
-- Genero (id_dominio=1)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (1, 'Masculino'),
    (1, 'Femenino'),
    (1, 'Otro');
-- IDs: 1,2,3

-- Estado Civil (id_dominio=2)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (2, 'Soltero'),
    (2, 'Casado');
-- IDs: 4,5

-- Pais (id_dominio=3)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (3, 'Bolivia'),
    (3, 'Argentina'),
    (3, 'Peru'),
    (3, 'Chile'),
    (3, 'Brasil');
-- IDs: 6,7,8,9,10

-- Grado Academico (id_dominio=4)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (4, 'Bachiller'),
    (4, 'Tecnico'),
    (4, 'Licenciado'),
    (4, 'Magister'),
    (4, 'Doctor');
-- IDs: 11,12,13,14,15

-- Zona (id_dominio=5)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (5, 'Norte'),
    (5, 'Sur'),
    (5, 'Este'),
    (5, 'Oeste'),
    (5, 'Centro');
-- IDs: 16,17,18,19,20

-- Tipo Telefono (id_dominio=6)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (6, 'Celular'),
    (6, 'Fijo'),
    (6, 'WhatsApp');
-- IDs: 21,22,23

-- Tipo Empresa (id_dominio=7)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (7, 'S.R.L.'),
    (7, 'S.A.'),
    (7, 'Unipersonal'),
    (7, 'Cooperativa'),
    (7, 'Asociacion');
-- IDs: 24,25,26,27,28

-- Tipo Producto (id_dominio=8)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (8, 'Quimico'),
    (8, 'Herramienta'),
    (8, 'Equipo'),
    (8, 'Insumo'),
    (8, 'Consumible');
-- IDs: 29,30,31,32,33

-- Tipo Servicio (id_dominio=9)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (9, 'Limpieza General'),
    (9, 'Limpieza Industrial'),
    (9, 'Limpieza de Vidrios'),
    (9, 'Desinfeccion'),
    (9, 'Fumigacion');
-- IDs: 34,35,36,37,38

-- Tipo Maquinaria (id_dominio=10)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (10, 'Aspiradora'),
    (10, 'Lustradoras'),
    (10, 'Hidrolavadora'),
    (10, 'Pulidora'),
    (10, 'Atomizador');
-- IDs: 39,40,41,42,43

-- Carrera (id_dominio=11)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (11, 'Administracion de Empresas'),
    (11, 'Ingenieria Industrial'),
    (11, 'Contaduria Publica'),
    (11, 'Derecho'),
    (11, 'Sistemas Informaticos');
-- IDs: 44,45,46,47,48

-- Dias Laborales (id_dominio=12)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (12, 'Lunes a Viernes'),
    (12, 'Lunes a Sabado'),
    (12, 'Fines de Semana'),
    (12, 'Turno Rotativo'),
    (12, 'Bajo Demanda');
-- IDs: 49,50,51,52,53

-- Satisfaccion (id_dominio=13)
INSERT INTO Sub_dominios (id_dominio, detalle) VALUES
    (13, 'Muy satisfecho'),
    (13, 'Satisfecho'),
    (13, 'Neutral'),
    (13, 'Insatisfecho'),
    (13, 'Muy insatisfecho');
-- IDs: 54,55,56,57,58

-- ------------------------------------------------------------
-- 3. Roles  (sin dependencias)
-- ------------------------------------------------------------
INSERT INTO Roles (nombre_rol, salario) VALUES
    ('Supervisor',      5000),
    ('Operario',        3000),
    ('Administrativo',  4000),
    ('Tecnico',         3500),
    ('Gerente',         8000);
-- IDs: 1-5

-- ------------------------------------------------------------
-- 4. Direccion  (depende: Sub_dominios zona 16-20)
-- ------------------------------------------------------------
INSERT INTO Direccion (id_zona, calle, n_casa) VALUES
    (16, 'Av. Montes',        101),
    (17, 'Calle Murillo',     202),
    (18, 'Av. Arce',          303),
    (19, 'Calle Loayza',      404),
    (20, 'Av. 6 de Agosto',   505);
-- IDs: 1-5

-- ------------------------------------------------------------
-- 5. Estado_calidad  (sin dependencias)
-- ------------------------------------------------------------
INSERT INTO Estado_calidad (estado_calidad) VALUES
    ('Excelente'),
    ('Bueno'),
    ('Regular'),
    ('Deteriorado'),
    ('Fuera de servicio');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 6. Usuario_trabajador  (depende: Sub_dominios, Direccion, Roles)
-- ------------------------------------------------------------
INSERT INTO Usuario_trabajador
    (id_estado_civil, id_grado_academico, id_genero, id_direccion, id_rol, id_pais,
     contrasena_hash, correo, ci, nombre_usuario, fecha_nacimiento)
VALUES
    (4, 13, 1, 1, 2, 6,  '$2b$10$KIX1aBcDeF', 'juan.quispe@empresa.bo',    12345678, 'Juan Quispe',    '1990-03-15'),
    (5, 11, 2, 2, 1, 6,  '$2b$10$LMN2oPqRsT', 'maria.lima@empresa.bo',     23456789, 'Maria Lima',     '1988-07-22'),
    (4, 12, 1, 3, 3, 7,  '$2b$10$UVW3xYzAbC', 'carlos.ramos@empresa.bo',   34567890, 'Carlos Ramos',   '1995-11-08'),
    (5, 14, 2, 4, 4, 8,  '$2b$10$DeF4gHiJkL', 'ana.flores@empresa.bo',     45678901, 'Ana Flores',     '1992-01-30'),
    (4, 15, 1, 5, 5, 6,  '$2b$10$MnO5pQrStU', 'pedro.vargas@empresa.bo',   56789012, 'Pedro Vargas',   '1985-09-12');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 7. Provedores  (depende: Sub_dominios empresa 24-28, producto 29-33)
-- ------------------------------------------------------------
INSERT INTO Provedores (id_empresa, id_producto, nit, nombre) VALUES
    (24, 29, 100200300, 'CleanPro S.R.L.'),
    (25, 30, 200300400, 'HerraMax S.A.'),
    (26, 31, 300400500, 'TecnoEquip'),
    (27, 32, 400500600, 'InsumosCoop'),
    (28, 33, 500600700, 'ConsuPlus');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 8. Recursos  (depende: Provedores, Sub_dominios tipo-producto 29-33)
-- ------------------------------------------------------------
INSERT INTO Recursos (id_proveedor, id_tipo, nombre, descripcion) VALUES
    (1, 29, 'Desengrasante industrial',    'Limpiador multiusos para superficies duras'),
    (2, 30, 'Escoba de cerdas suaves',     'Para limpieza de pisos delicados'),
    (3, 31, 'Aspiradora industrial 50L',   'Capacidad 50 litros motor 2200W'),
    (4, 32, 'Guantes de nitrilo talla M',  'Pack x 100 unidades'),
    (5, 33, 'Bolsas de basura 200L',       'Rollo 25 unidades resistencia alta');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 9. Uniformes  (sin dependencias)
-- ------------------------------------------------------------
INSERT INTO Uniformes (nombre_uniforme, talla, descripcion) VALUES
    ('Camisa polo azul',         38, 'Uniforme diario operario'),
    ('Pantalon cargo gris',      32, 'Resistente con bolsillos laterales'),
    ('Chaleco reflectante',      42, 'Uso en areas industriales'),
    ('Botas de seguridad punta', 40, 'Puntera de acero certificada'),
    ('Gorra con logo',           99, 'Talla unica ajustable');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 10. Asignacion_uniformes  (depende: Usuario_trabajador, Uniformes)
-- ------------------------------------------------------------
INSERT INTO Asignacion_uniformes (id_usuario, id_uniforme, fecha_entrega, fecha_devolucion, estado) VALUES
    (1, 1, '2025-01-05', NULL,         'Activo'),
    (2, 2, '2025-01-05', NULL,         'Activo'),
    (3, 3, '2025-01-10', NULL,         'Activo'),
    (4, 4, '2025-01-10', '2025-06-30', 'Devuelto'),
    (5, 5, '2025-02-01', NULL,         'Activo');

-- ------------------------------------------------------------
-- 11. Capacitaciones  (sin dependencias)
-- ------------------------------------------------------------
INSERT INTO Capacitaciones (nombre, descripcion, fecha) VALUES
    ('Seguridad e higiene laboral',       'Normas basicas de seguridad en el trabajo',         '2025-02-10'),
    ('Manejo de productos quimicos',      'Uso seguro y almacenamiento de quimicos',           '2025-03-05'),
    ('Atencion al cliente',               'Tecnicas de comunicacion y servicio',               '2025-03-20'),
    ('Uso de maquinaria industrial',      'Operacion correcta de equipos de limpieza',         '2025-04-15'),
    ('Primeros auxilios',                 'Procedimientos de emergencia y primeros auxilios',  '2025-05-08');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 12. Carreras_usuario  (depende: Sub_dominios carrera 44-48, Usuario_trabajador)
-- ------------------------------------------------------------
INSERT INTO Carreras_usuario (id_carrera, id_usuario) VALUES
    (44, 1),
    (45, 2),
    (46, 3),
    (47, 4),
    (48, 5);

-- ------------------------------------------------------------
-- 13. Cliente  (depende: Sub_dominios empresa 24-28, Direccion)
-- ------------------------------------------------------------
INSERT INTO Cliente (id_empresa, id_direccion, nombre_cliente, contacto_emergencia) VALUES
    (24, 1, 'Banco Union S.A.',          '76543210'),
    (25, 2, 'Hospital del Norte',        '78901234'),
    (26, 3, 'Colegio San Ignacio',       '77654321'),
    (27, 4, 'Plaza Shopping Center',     '76789012'),
    (28, 5, 'Planta Metalurgica Oruro',  '75678901');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 14. Telefono_cliente  (depende: Sub_dominios tipo-tel 21-23, Cliente)
-- ------------------------------------------------------------
INSERT INTO Telefono_cliente (telefono, id_detalle, id_cliente) VALUES
    (22001100, 21, 1),
    (22002200, 22, 2),
    (76300300, 21, 3),
    (22004400, 22, 4),
    (76500500, 21, 5);

-- ------------------------------------------------------------
-- 15. Horario  (sin dependencias)
-- ------------------------------------------------------------
INSERT INTO Horario (hora_entrada, hora_salida) VALUES
    ('07:00', '15:00'),
    ('08:00', '16:00'),
    ('15:00', '23:00'),
    ('22:00', '06:00'),
    ('06:00', '14:00');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 16. Servicio  (depende: Cliente, Direccion, Sub_dominios tipo-servicio 34-38)
-- ------------------------------------------------------------
INSERT INTO Servicio (id_cliente, id_direccion, tipo_servicio, fecha_inicio, fecha_final, costo, descripcion) VALUES
    (1, 1, 34, '2025-01-15', '2025-12-31', 15000.00, 'Limpieza general mensual oficinas Banco Union'),
    (2, 2, 37, '2025-02-01', '2025-07-31',  8500.00, 'Desinfeccion semanal areas hospitalarias'),
    (3, 3, 36, '2025-03-01', '2025-05-31',  3200.00, 'Limpieza de vidrios exterior edificio colegio'),
    (4, 4, 34, '2025-03-15', NULL,          12000.00, 'Limpieza diaria areas comunes shopping'),
    (5, 5, 35, '2025-04-01', '2025-09-30',  20000.00, 'Limpieza industrial planta de produccion');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 17. Asignacion_empleados  (depende: Usuario_trabajador, Servicio, Horario, Sub_dominios dias 49-53)
-- ------------------------------------------------------------
INSERT INTO Asignacion_empleados (id_usuario, id_servicio, id_horario, dias_laborales) VALUES
    (1, 1, 1, 49),
    (2, 2, 2, 50),
    (3, 3, 3, 51),
    (4, 4, 4, 52),
    (5, 5, 5, 53);

-- ------------------------------------------------------------
-- 18. Incidentes  (depende: Servicio)
-- ------------------------------------------------------------
INSERT INTO Incidentes (id_servicio, descripcion, fecha) VALUES
    (1, 'Derrame de liquido en piso 3, area de cajas',           '2025-02-10'),
    (2, 'Falta de insumos de desinfeccion en bodega central',    '2025-02-20'),
    (3, 'Rotura accidental de vidrio en fachada sur',            '2025-03-12'),
    (4, 'Operario reporta malestar por vapores quimicos',        '2025-04-05'),
    (5, 'Falla en hidrolavadora durante turno nocturno',         '2025-04-18');

-- ------------------------------------------------------------
-- 19. Marca_maquinaria  (depende: Sub_dominios pais 6-10)
-- ------------------------------------------------------------
INSERT INTO Marca_maquinaria (id_pais, nombre_marca) VALUES
    (6,  'AquaClean Bolivia'),
    (7,  'IndusPro Argentina'),
    (8,  'LimpiMax Peru'),
    (9,  'TecnoClean Chile'),
    (10, 'CleanBrasil');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 20. Maquinaria  (depende: Provedores, Sub_dominios tipo-maq 39-43, Estado_calidad, Marca_maquinaria)
-- ------------------------------------------------------------
INSERT INTO Maquinaria
    (id_proveedor, id_tipo_maquinaria, id_estado_calidad, id_marca_maquinaria,
     nombre_maquinaria, codigo_inv, descripcion)
VALUES
    (3, 39, 1, 3, 'Aspiradora industrial A1',    'MAQ-001', 'Motor 2200W capacidad 50L'),
    (3, 40, 2, 1, 'Lustradora de pisos L2',      'MAQ-002', 'Disco 450mm velocidad variable'),
    (3, 41, 1, 2, 'Hidrolavadora HP3000',        'MAQ-003', 'Presion 3000PSI motor electrico'),
    (3, 42, 3, 4, 'Pulidora multiusos P4',       'MAQ-004', 'Para pisos de marmol y ceramica'),
    (3, 43, 2, 5, 'Atomizador quimico AQ5',      'MAQ-005', 'Capacidad 20L para desinfeccion');
-- IDs: 1-5

-- ------------------------------------------------------------
-- 21. Mantenimiento  (sin dependencias)
-- ------------------------------------------------------------
INSERT INTO Mantenimiento (fecha_mantenimiento, descripcion, costo) VALUES
    ('2025-01-20', 'Cambio de filtros y revision general aspiradora',    350.00),
    ('2025-02-15', 'Lubricacion y ajuste disco lustradora',              200.00),
    ('2025-03-10', 'Reparacion bomba de presion hidrolavadora',          800.00),
    ('2025-03-25', 'Reemplazo de escobillas pulidora',                   150.00),
    ('2025-04-12', 'Limpieza valvulas y mantenimiento atomizador',       180.00);
-- IDs: 1-5

-- ------------------------------------------------------------
-- 22. Mantenimientos_maquinaria  (depende: Maquinaria, Mantenimiento)
-- ------------------------------------------------------------
INSERT INTO Mantenimientos_maquinaria (id_maquinaria, id_mantenimiento) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- ------------------------------------------------------------
-- 23. Telefono_proveedor  (depende: Sub_dominios tipo-tel 21-23, Provedores)
-- ------------------------------------------------------------
INSERT INTO Telefono_proveedor (telefono, id_detalle, id_proveedor) VALUES
    (22100100, 22, 1),
    (76200200, 21, 2),
    (22300300, 22, 3),
    (76400400, 21, 4),
    (22500500, 22, 5);

-- ------------------------------------------------------------
-- 24. Servicio_terminado  (depende: Servicio, Sub_dominios satisfaccion 54-58)
-- ------------------------------------------------------------
INSERT INTO Servicio_terminado (id_servicio, satisfaccion, comentarios) VALUES
    (3, 54, 'Excelente trabajo, vidrios impecables'),
    (2, 55, 'Buen servicio, puntualidad correcta'),
    (1, 55, 'Conforme con el resultado general'),
    (4, 56, 'Servicio aceptable, algunos detalles pendientes'),
    (5, 54, 'Superaron las expectativas en la planta');

-- ------------------------------------------------------------
-- 25. Asignacion_maquinaria  (depende: Servicio, Maquinaria)
-- ------------------------------------------------------------
INSERT INTO Asignacion_maquinaria (id_servicio, id_maquinaria, cantidad, descripcion) VALUES
    (1, 1, 2, 'Dos aspiradoras para pisos 1 y 2'),
    (2, 5, 1, 'Atomizador para desinfeccion de salas'),
    (3, 4, 1, 'Pulidora para acabado de pisos interiores'),
    (4, 2, 3, 'Tres lustradoras para areas de alto trafico'),
    (5, 3, 2, 'Dos hidrolavadoras para naves industriales');

-- ------------------------------------------------------------
-- 26. Usuarios_capacitaciones  (depende: Usuario_trabajador, Capacitaciones)
-- ------------------------------------------------------------
INSERT INTO Usuarios_capacitaciones (id_usuario, id_capacitacion, estado) VALUES
    (1, 1, 'Completado'),
    (2, 2, 'Completado'),
    (3, 3, 'En progreso'),
    (4, 4, 'Completado'),
    (5, 5, 'Pendiente');

-- ------------------------------------------------------------
-- 27. Memorial  (depende: Usuario_trabajador)
-- ------------------------------------------------------------
INSERT INTO Memorial (id_empleado, descripcion) VALUES
    (1, 'Reconocimiento por 5 anos de servicio sin ausencias injustificadas.'),
    (2, 'Lider del mes en marzo 2025 por gestion de equipo destacada.'),
    (3, 'Certificacion en manejo de quimicos peligrosos obtenida.'),
    (4, 'Propuso mejora en protocolo de desinfeccion adoptada por la empresa.'),
    (5, 'Gerente del trimestre Q1 2025 por crecimiento de cartera de clientes.');

-- ------------------------------------------------------------
-- 28. Historial_estado_maquina  (depende: Maquinaria, Estado_calidad)
-- ------------------------------------------------------------
INSERT INTO Historial_estado_maquina
    (id_maquinaria, id_estado_calidad, fecha_cambio, descripcion)
VALUES
    (1, 1, '2025-01-01', 'Alta en inventario estado inicial excelente'),
    (2, 2, '2025-01-15', 'Leve desgaste en disco tras primer mes de uso'),
    (3, 3, '2025-03-11', 'Falla en bomba detectada, pendiente reparacion'),
    (3, 2, '2025-03-15', 'Reparacion completada, vuelve a estado bueno'),
    (4, 3, '2025-04-01', 'Escobillas gastadas, uso intensivo en shopping');

-- ------------------------------------------------------------
-- 29. Telefono_usuarios  (depende: Usuario_trabajador, Sub_dominios tipo-tel 21-23)
-- ------------------------------------------------------------
INSERT INTO Telefono_usuarios (telefono_usuario, id_usuario, id_detalle) VALUES
    (71111111, 1, 21),
    (72222222, 2, 21),
    (73333333, 3, 23),
    (74444444, 4, 21),
    (75555555, 5, 23);

-- ------------------------------------------------------------
-- 30. Documentos_usuarios  (depende: Usuario_trabajador)
-- ------------------------------------------------------------
INSERT INTO Documentos_usuarios (id_usuario, tipo_de_documento, archivo, fecha_subida) VALUES
    (1, 'Carnet de identidad',      '/docs/usuarios/1/ci_scan.pdf',          '2025-01-03'),
    (2, 'Titulo academico',         '/docs/usuarios/2/titulo_licenciado.pdf', '2025-01-04'),
    (3, 'Contrato de trabajo',      '/docs/usuarios/3/contrato_2025.pdf',     '2025-01-05'),
    (4, 'Certificado de salud',     '/docs/usuarios/4/salud_2025.pdf',        '2025-01-06'),
    (5, 'Curriculum vitae',         '/docs/usuarios/5/cv_pedro.pdf',          '2025-01-07');

-- ------------------------------------------------------------
-- 31. Asignacion_recursos  (depende: Servicio, Recursos)
-- ------------------------------------------------------------
INSERT INTO Asignacion_recursos (id_servicio, id_recurso, cantidad) VALUES
    (1, 1, 10),
    (2, 4, 50),
    (3, 2, 5),
    (4, 5, 20),
    (5, 3,  2);