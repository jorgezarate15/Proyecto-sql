# Proyecto-sql

## Descripción general
FreelanceHub es una base de datos relacional pensada para gestionar una plataforma de trabajo independiente. El modelo organiza la información de clientes, freelancers, proyectos, postulaciones, asignaciones y pagos, permitiendo representar el ciclo completo de un proyecto: desde su publicación hasta su pago parcial o total.

## Explicación del modelo de datos
El modelo está compuesto por seis tablas principales:

- **clientes**: almacena los datos de quienes publican proyectos.
- **freelancers**: registra a los profesionales disponibles, su especialidad y su tarifa por hora.
- **proyectos**: contiene los proyectos publicados por cada cliente.
- **postulaciones**: representa las ofertas que hacen los freelancers sobre un proyecto.
- **asignaciones**: indica qué postulación fue seleccionada para trabajar en un proyecto.
- **pagos**: guarda los pagos asociados a cada proyecto, permitiendo pagos parciales.

Relaciones principales:

- Un **cliente** puede tener muchos **proyectos**.
- Un **proyecto** puede tener muchas **postulaciones**.
- Un **freelancer** puede realizar muchas **postulaciones**.
- Una **postulación** puede tener una sola **asignación**.
- Un **proyecto** puede tener muchos **pagos**.

## Decisiones de diseño tomadas
Se tomaron las siguientes decisiones para mantener el modelo simple, flexible y útil para reportes:

- La tabla **asignaciones** se relaciona con **postulaciones** y no directamente con freelancers, porque la asignación real surge de una propuesta específica hecha sobre un proyecto.
- La tabla **pagos** se vincula directamente con **proyectos**, ya que un mismo proyecto puede recibir varios pagos parciales.
- Se permitieron campos **NULL** en algunos atributos como fecha límite, monto de pago o fecha de pago para reflejar escenarios reales con información incompleta o procesos aún en curso.
- Se definieron restricciones de integridad como claves primarias, claves foráneas, unicidad en el correo de clientes y validaciones de montos mayores a cero.
- Se utilizó una estructura compatible con consultas de análisis, especialmente para comparar postulaciones, detectar freelancers no asignados y revisar pagos incompletos.

## Instrucciones para ejecutar los scripts
Para cargar la base de datos se recomienda ejecutar los archivos en este orden:

1. **schema.sql**: crea todas las tablas y sus relaciones.
2. **inserts.sql**: inserta los datos de prueba y los registros adicionales.
3. **reportes.sql**: ejecuta las consultas de análisis y reporte.

### Pasos sugeridos en MySQL
1. Abrir MySQL Workbench, phpMyAdmin o una consola MySQL.
2. Crear una base de datos nueva, por ejemplo:

```sql
CREATE DATABASE FreelanceHub;
USE FreelanceHub;
```

3. Ejecutar primero el contenido de **schema.sql**.
4. Ejecutar después **inserts.sql**.
5. Finalmente ejecutar **reportes.sql** para verificar los reportes solicitados.

### Recomendación
Si se vuelve a ejecutar el script de inserción, conviene hacerlo sobre una base de datos vacía para evitar errores por claves duplicadas, especialmente en los registros con identificadores explícitos.

## Comentario sobre el uso de LEFT JOIN y subconsultas
En el archivo **reportes.sql** hay **8 consultas** en total. De ellas, **7** usan **LEFT JOIN** o **subconsultas**:

- Consulta 1: usa LEFT JOIN.
- Consulta 2: usa subconsultas.
- Consulta 3: usa subconsultas.
- Consulta 4: usa LEFT JOIN.
- Consulta 5: usa LEFT JOIN.
- Consulta 6: usa subconsulta.
- Consulta 8: usa LEFT JOIN.

Solo la consulta 7 no utiliza esas técnicas.

Por tanto, el porcentaje de consultas que cumplen con ese criterio es:

**7 / 8 = 87.5%**

Esto demuestra un uso mayoritario de técnicas de consulta avanzadas, útiles para reportes con relaciones opcionales, agregaciones y filtrados sobre datos relacionados.

## Estructura resumida del proyecto
- **schema.sql**: definición del modelo relacional.
- **inserts.sql**: datos de prueba y escenarios adicionales.
- **reportes.sql**: consultas de análisis.
- **mer.txt**: diagrama del modelo entidad-relación en PlantUML.

## Observación final
El diseño prioriza la trazabilidad del trabajo freelance, la posibilidad de manejar pagos parciales y la generación de reportes con relaciones reales entre entidades, lo que hace que el modelo sea adecuado para prácticas de bases de datos relacionales.
