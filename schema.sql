-- 1. Crear tablas--------
-- Los clientes publican proyectos 
CREATE TABLE clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    fecha_registro DATE 
);

-- registrar freelancer con especialidades y tarifa
CREATE TABLE freelancers (
    id_reg INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    freelancer_nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE),
    tarifa_hora DECIMAL(12,2) NULL 
);

-- Proyectos 
CREATE TABLE proyectos (
   id_proyecto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NULL,
    proyecto_titulo VARCHAR(200) NOT NULL,
    descripcion TEXT NULL,
    proyecto_presupuesto DECIMAL(12,2) NOT NULL CHECK (proyecto_presupuesto > 0),
    fecha_limite DATE NULL,
    CONSTRAINT fk_proyecto_ciente FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- postulaciones un freelancer se postula a uno o varios proyectos
CREATE TABLE postulaciones (
    id_postulacion INT PRIMARY KEY AUTO_INCREMENT,
    id_proyecto INT NOT NULL, -- FK
    id_reg INT NOT NULL, -- FK
    postulacion_monto DECIMAL(12,2) NOT NULL CHECK (postulacion_monto > 0),
    postulacion_mensaje TEXT,
    fecha_postulacion DATE NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_postulacion_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyectos (id_proyecto),
    CONSTRAINT fk_postulacion_freelancer FOREIGN KEY (id_reg) REFERENCES freelancers (id_reg)
);

-- asiganciones , se referencia la postulación no el freelancer directamente 
CREATE TABLE asignaciones (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_postulacion INT NOT NULL UNIQUE ,
    asignacion_fecha DATE NULL,
    CONSTRAINT fk_asignacion_postulacion FOREIGN KEY (id_postulacion) REFERENCES postulaciones (id_postulacion)
);

-- pagos un proyecto puede tener multiples pagos parciales, se vincula directamente al proyecto
CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL , -- FK
    pago_monto DECIMAL(12,2) NULL CHECK (pago_monto > 0),
    pago_fecha DATE NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_pago_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyectos (id_proyecto)
);