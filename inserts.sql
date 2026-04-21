-- 2. insertar datos--------
-- 1. datos necesarios para vincular los proyectos del CSV
INSERT INTO clientes (nombre, email, fecha_registro) VALUES 
('Tech Solutions', 'contact@techsolutions.com', '2025-01-01'), -- Para Proyectos 1, 2 y 5
('Global Retail', 'admin@globalretail.com', '2025-01-05');    -- Para Proyectos 3 y 4

-- 5 registros Adicionales (Pruebas de reportes)
INSERT INTO clientes (nombre, email, fecha_registro) VALUES 
('Innovate Corp', 'info@innovate.io', '2025-01-10'),
('Creative Agency', 'hello@creative.com', '2025-01-12'),
('Solo Entrepreneur', 'john@doe.com', '2025-01-15'),
('Education First', 'support@edu.org', '2025-01-20'),
('Client Without Projects', 'ghost@noprojects.com', '2025-02-01'); -- Probará el LEFT JOIN de clientes sin proyectos

-- 2. INSERCIONES PARA LA TABLA: freelancers
-- Datos extraídos del CSV
INSERT INTO freelancers (id_reg, freelancer_nombre, especialidad, tarifa_hora, fecha_registro) VALUES
(1, 'Ana Gómez', 'Desarrollo Web', 25000.00, '2025-01-10'),
(2, 'Luis Pérez', 'Diseño Gráfico', 20000.00, '2025-01-15'),
(3, 'María López', 'Desarrollo Web', 30000.00, '2025-01-20'),
(4, 'Carlos Soto', 'Marketing Digital', 18000.00, '2025-02-01');

-- 5 Registros Adicionales (Pruebas de promedio de especialidad)
INSERT INTO freelancers (freelancer_nombre, especialidad, tarifa_hora, fecha_registro) VALUES 
('Roberto Juez', 'Desarrollo Web', 45000.00, '2025-02-05'),   -- Supera promedio
('Lucía Sanz', 'Diseño Gráfico', 15000.00, '2025-02-05'),    -- Bajo promedio
('Miguel Ángel', 'Data Science', 50000.00, '2025-02-10'),
('Sofía Castro', 'Data Science', 35000.00, '2025-02-10'),
('Andrés Vera', 'Desarrollo Web', NULL, '2025-02-15');       -- Tarifa NULL

-- 3. INSERCIONES PARA LA TABLA: proyectos
-- Datos del CSV (Vinculados a Clientes 1 y 2)
INSERT INTO proyectos (id_proyecto, id_cliente, proyecto_titulo, proyecto_presupuesto, fecha_limite) VALUES
(1, 1, 'Landing Page', 300000.00, '2025-02-20'),
(2, 1, 'Branding Empresa', 500000.00, '2025-03-01'),
(3, 2, 'E-commerce', 1200000.00, '2025-04-15'),
(4, 2, 'App Móvil', 800000.00, '2025-05-10'),
(5, 1, 'SEO Posicionamiento', 400000.00, '2025-03-15');

-- 5 Registros Adicionales
INSERT INTO proyectos (id_cliente, proyecto_titulo, proyecto_presupuesto, fecha_limite) VALUES 
(3, 'Dashboard BI', 900000.00, '2025-06-01'),
(4, 'Campaña Social Media', 150000.00, '2025-04-01'),
(5, 'Blog Personal', 50000.00, '2025-03-20'),
(3, 'Mantenimiento Cloud', 200000.00, NULL),                 -- Sin fecha límite
(4, 'Rediseño UI', 250000.00, '2025-05-01');

-- 4. INSERCIONES PARA LA TABLA: postulaciones
-- Datos del CSV
INSERT INTO postulaciones (id_postulacion, id_proyecto, id_reg, postulacion_monto, postulacion_mensaje) VALUES
(1, 1, 1, 280000.00, 'Experiencia en HTML/CSS'),
(2, 2, 2, 450000.00, 'Propuesta integral de marca'),
(3, 3, 3, 1150000.00, 'Experiencia en tiendas online'),
(4, 4, 3, 780000.00, 'Desarrollo con React Native'),
(5, 5, 4, 380000.00, 'Estrategia completa SEO');

-- 5 Registros Adicionales (Postulaciones que no serán asignadas para reportes)
INSERT INTO postulaciones (id_proyecto, id_reg, postulacion_monto, postulacion_mensaje) VALUES 
(1, 3, 310000.00, 'Puedo hacerlo más rápido'),
(6, 6, 850000.00, 'Experto en Python y Tableau'),
(6, 1, 950000.00, 'Apoyo con mi equipo de desarrollo'),
(7, 4, 140000.00, 'Mejor precio del mercado'),
(8, 3, 45000.00, 'Portafolio disponible');

-- 5. INSERCIONES PARA LA TABLA: asignaciones

-- Datos del CSV (Reflejando NULLs explícitos)
INSERT INTO asignaciones (id_postulacion, asignacion_fecha) VALUES
(1, '2025-01-20'), -- Ana Gómez
(2, '2025-01-28'), -- Luis Pérez
(3, NULL),         -- María López (E-commerce sin fecha)
(4, NULL),         -- María López (App Móvil sin fecha)
(5, '2025-02-10'); -- Carlos Soto

-- 5 Registros Adicionales (Probando asignaciones sin pagos o con fechas futuras)
INSERT INTO asignaciones (id_postulacion, asignacion_fecha) VALUES 
(7, '2025-02-15'),
(8, '2025-02-18'),
(9, NULL),         -- Postulación ficticia para probar NULL
(10, '2025-02-20');

-- 6. INSERCIONES PARA LA TABLA: pagos
-- Datos del CSV (Reflejando NULLs explícitos para María López)
INSERT INTO pagos (id_proyecto, pago_monto, pago_fecha) VALUES
(1, 140000.00, '2025-01-25'), -- Primer pago Ana
(1, 140000.00, '2025-02-10'), -- Segundo pago Ana (Total 280k de 300k -> Incompleto)
(2, 450000.00, '2025-02-05'), -- Pago único Luis
(3, NULL, NULL),              -- María López Proyecto 3 (Sin pago)
(4, NULL, NULL),              -- María López Proyecto 4 (Sin pago)
(5, 190000.00, '2025-02-15'), -- Primer pago Carlos
(5, 190000.00, '2025-02-28'); -- Segundo pago Carlos (Total 380k de 400k -> Incompleto)

-- 5 Registros Adicionales (Probando proyectos pagados al 100% y otros en 0)
INSERT INTO pagos (id_proyecto, pago_monto, pago_fecha) VALUES 
(8, 50000.00, '2025-03-01'),  -- Blog Personal pagado al 100%
(7, 75000.00, '2025-03-05'),  -- Campaña pagada al 50%
(6, NULL, NULL),              -- Dashboard BI sin pago aún
(10, 125000.00, '2025-03-10'),
(10, 125000.00, '2025-03-15'); -- Rediseño UI pagado al 100%
-- Un nuevo freelancer
INSERT INTO freelancers (freelancer_nombre, especialidad, tarifa_hora) 
VALUES ('Pedro Infante', 'Diseño Gráfico', 15000);

-- Pedro postula al proyecto 2, pero NO lo insertamos en la tabla asignaciones
INSERT INTO postulaciones (id_proyecto, id_reg, postulacion_monto, postulacion_mensaje) 
VALUES (2, (SELECT id_reg FROM freelancers WHERE freelancer_nombre = 'Pedro Infante'), 400000, 'Soy muy rápido');