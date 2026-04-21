# Proyecto-sql
## Explicación del modelo de datos

El sistema está diseñado para gestionar la relación entre clientes, proyectos y freelancers dentro de una plataforma de contratación.

Entidades principales
Clientes
Almacena la información de los clientes que publican proyectos.
Relación: un cliente puede tener múltiples proyectos.
Freelancers
Contiene los profesionales disponibles.
Incluye especialidad y tarifa por hora.
Proyectos
Representa los trabajos publicados por los clientes.
Relación:
Pertenece a un cliente.
Puede tener múltiples postulaciones.
Puede tener múltiples pagos.
Postulaciones
Representa las ofertas de freelancers a proyectos.
Relación:
Un freelancer puede postularse a varios proyectos.
Un proyecto puede recibir múltiples postulaciones.
Asignaciones
Representa la selección de una postulacion ganadora.
Relación:
Cada asignación corresponde a una única postulación (relación 1 a 1).
Pagos
Registra los pagos realizados por proyecto.
Relación:
Un proyecto puede tener múltiples pagos.
Relaciones clave
Cliente → Proyectos (1:N)
Proyecto → Postulaciones (1:N)
Freelancer → Postulaciones (1:N)
Postulación → Asignación (1:1)
Proyecto → Pagos (1:N)
 Decisiones de diseño tomadas
Normalización
El modelo está normalizado para evitar redundancia (hasta 3FN).
Separación clara entre entidades como postulaciones y asignaciones.
Uso de claves foráneas
Se implementaron para mantener integridad referencial entre tablas.
Separación de postulaciones y asignaciones
Permite mantener historial de ofertas incluso si no fueron seleccionadas.
Pagos independientes
Permite registrar múltiples pagos por proyecto (útil para pagos parciales o por hitos).
Flexibilidad del sistema
Se puede escalar fácilmente para incluir estados (pendiente, completado, etc.) sin romper la estructura.
 Instrucciones para ejecutar los scripts
Orden de ejecución

Ejecutar el esquema de la base de datos:

schema.sql

Insertar los datos iniciales:

inserts.sql

Ejecutar las consultas/reportes:

reportes.sql
Requisitos
Motor de base de datos compatible con SQL (MySQL, PostgreSQL, etc.)
Tener permisos para crear tablas e insertar datos
Uso de LEFT JOIN y subconsultas

Se cumplió con el requisito del uso de LEFT JOIN y subconsultas de la siguiente forma:

LEFT JOIN
Se utilizó para:
Mostrar proyectos incluso si no tienen postulaciones.
Mostrar freelancers aunque no hayan sido asignados.
Incluir datos opcionales sin perder registros principales.
Subconsultas
Se aplicaron para:
Obtener valores agregados (ej: total de pagos por proyecto).
Filtrar resultados basados en condiciones complejas.
Comparaciones dentro de consultas (ej: mejores ofertas).
Cumplimiento del porcentaje

El conjunto de consultas fue diseñado asegurando que:

Un porcentaje significativo incluye LEFT JOIN, priorizando integridad de resultados.
Varias consultas hacen uso de subconsultas para lógica avanzada.

Esto garantiza el cumplimiento del requisito académico sobre diversidad en técnicas SQL.
