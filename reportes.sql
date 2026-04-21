-- 3. reportes--------
-- REPORTE 1: Freelancers con especialidad y tarifa (incluyendo no asignados)
-- Técnica: LEFT JOIN para traer a todos los freelancers aunque no tengan registro en asignaciones.
SELECT 
    f.freelancer_nombre, 
    f.especialidad, 
    f.tarifa_hora
FROM freelancers f
LEFT JOIN postulaciones po ON f.id_reg = po.id_reg
LEFT JOIN asignaciones a ON po.id_postulacion = a.id_postulacion
GROUP BY f.id_reg, f.freelancer_nombre, f.especialidad, f.tarifa_hora;

-- consulta 2 
SELECT 
    p.proyecto_titulo,
    -- Agregamos DISTINCT para que si encuentra el mismo nombre varias veces solo traiga uno
    (SELECT DISTINCT f.freelancer_nombre 
     FROM freelancers f 
     JOIN postulaciones po ON f.id_reg = po.id_reg 
     JOIN asignaciones a ON po.id_postulacion = a.id_postulacion 
     WHERE po.id_proyecto = p.id_proyecto 
     LIMIT 1) AS freelancer_asignado,
    -- La suma no da error de "más de una línea" porque SUM() colapsa todo en un solo número
    (SELECT SUM(pa.pago_monto) 
     FROM pagos pa 
     WHERE pa.id_proyecto = p.id_proyecto) AS total_pagado
FROM proyectos p;

-- consulta 3 
SELECT 
f.freelancer_nombre,
 f.especialidad 
FROM freelancers f WHERE f.id_reg IN (SELECT id_reg FROM postulaciones)
 AND f.id_reg NOT IN ( SELECT po.id_reg FROM postulaciones po JOIN asignaciones a ON po.id_postulacion = a.id_postulacion ); 

-- consulta 4
SELECT p.proyecto_titulo, p.proyecto_presupuesto, MAX(po.postulacion_monto) AS postulacion_alta, MIN(po.postulacion_monto) AS postulacion_baja FROM proyectos p LEFT JOIN postulaciones po ON p.id_proyecto = po.id_proyecto GROUP BY p.id_proyecto, p.proyecto_titulo, p.proyecto_presupuesto;

-- consulta 5
SELECT 
    c.nombre AS cliente,
    COUNT(p.id_proyecto) AS total_proyectos
FROM clientes c
LEFT JOIN proyectos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre;

-- consulta 6
SELECT f1.freelancer_nombre, f1.especialidad, f1.tarifa_hora FROM freelancers f1 WHERE f1.tarifa_hora > ( SELECT AVG(f2.tarifa_hora) FROM freelancers f2 WHERE f2.especialidad = f1.especialidad );

-- consulta 7
SELECT p.proyecto_titulo, p.proyecto_presupuesto, SUM(pa.pago_monto) AS total_pagado FROM proyectos p JOIN pagos pa ON p.id_proyecto = pa.id_proyecto GROUP BY p.id_proyecto, p.proyecto_titulo, p.proyecto_presupuesto HAVING SUM(pa.pago_monto) < p.proyecto_presupuesto;

-- consulta 8
SELECT f.freelancer_nombre, COUNT(DISTINCT po.id_postulacion) AS postulaciones, COUNT(DISTINCT a.id_asignacion) AS asignaciones, SUM(pa.pago_monto) AS total_cobrado FROM freelancers f LEFT JOIN postulaciones po ON f.id_reg = po.id_reg LEFT JOIN asignaciones a ON po.id_postulacion = a.id_postulacion LEFT JOIN pagos pa ON po.id_proyecto = pa.id_proyecto GROUP BY f.id_reg, f.freelancer_nombre;
