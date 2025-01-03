
--Creación de Tablas
-- Tabla para almacenar la información de los hermanos
CREATE TABLE Hermano (
    id_hermano INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    fecha_nacimiento DATE,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE
);

-- Tabla para los ministerios
CREATE TABLE Ministerio (
    id_ministerio INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE
);

-- Tabla para las responsabilidades
CREATE TABLE Responsabilidad (
    id_responsabilidad INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE
);

-- Tabla intermedia para asociar hermanos con responsabilidades en ministerios
CREATE TABLE Responsabilidad_Hermano_Ministerio (
    id_responsabilidad_hermano_ministerio INT AUTO_INCREMENT PRIMARY KEY,
    id_ministerio INT NOT NULL,
    id_hermano INT NOT NULL,
    id_responsabilidad INT NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE,
    FOREIGN KEY (id_ministerio) REFERENCES Ministerio(id_ministerio),
    FOREIGN KEY (id_hermano) REFERENCES Hermano(id_hermano),
    FOREIGN KEY (id_responsabilidad) REFERENCES Responsabilidad(id_responsabilidad)
);

-- Tabla para los tipos de servicio
CREATE TABLE Tipo_Servicio (
    id_tipo_servicio INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE
);

-- Tabla para los servicios
CREATE TABLE Servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_servicio INT NOT NULL,
    ff_programada DATETIME NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE,
    FOREIGN KEY (id_tipo_servicio) REFERENCES Tipo_Servicio(id_tipo_servicio)
);

-- Tabla intermedia para asociar hermanos con servicios
CREATE TABLE Hermano_Servicio (
    id_hermano_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_hermano INT NOT NULL,
    id_servicio INT NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE,
    FOREIGN KEY (id_hermano) REFERENCES Hermano(id_hermano),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);


-- Tabla intermedia para asociar servicios con canciones
CREATE TABLE Servicio_Cancion (
    id_servicio_cancion INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_canciones INT NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_canciones) REFERENCES Canciones(id_canciones)
);



--Población de Datos Ejemplo
--Insertar Hermanos
INSERT INTO Hermano (nombre, apellido, direccion, fecha_nacimiento, observaciones, ff_alta, ff_baja) 
VALUES 
('Dario', 'Colombo', 'Dupuy 11141', '1976-01-11', '', '2025-01-03', NULL),
('Andrés', 'Cano', 'desconocido', '1992-01-23', '', '2025-01-03', NULL);

--Insertar Ministerios
INSERT INTO Ministerio (descripcion, observaciones, ff_alta, ff_baja) 
VALUES 
('Alabanza & Adoración', 'Ministerio de música', '2020-01-01', NULL);



--Insertar Responsabilidades
INSERT INTO Responsabilidad (descripcion, observaciones, ff_alta, ff_baja) 
VALUES 
('Director Musical', '', '2025-01-03', NULL),
('Músico', '', '2025-01-03', NULL),
('Director vocal', '', '2025-01-03', NULL);



--Asociar Responsabilidades a Hermanos en Ministerios
INSERT INTO Responsabilidad_Hermano_Ministerio (id_ministerio, id_hermano, id_responsabilidad, observaciones, ff_alta, ff_baja) 
VALUES 
(1, 1, 1, '', '2025-01-03', NULL),
(1, 2, 4, '', '2025-01-03', NULL);



--Insertar Tipos de Servicio
INSERT INTO Tipo_Servicio (descripcion, observaciones, ff_alta, ff_baja) 
VALUES 
('Santa Cena', '', '2025-01-03', NULL),
('Reunión de Oración', '', '2025-01-03', NULL);
('Reunión de jóvenes', '', '2025-01-03', NULL);
