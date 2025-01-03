
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


CREATE TABLE Ministerio (
    id_ministerio INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE
);


CREATE TABLE Responsabilidad (
    id_responsabilidad INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE
);


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


CREATE TABLE Tipo_Servicio (
    id_tipo_servicio INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE
);


CREATE TABLE Servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_servicio INT NOT NULL,
    ff_programada DATETIME NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE,
    FOREIGN KEY (id_tipo_servicio) REFERENCES Tipo_Servicio(id_tipo_servicio)
);


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



CREATE TABLE Servicio_Cancion (
    id_servicio_cancion INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_canciones INT NOT NULL,
    observaciones TEXT,
    ff_alta DATE NOT NULL,
    ff_baja DATE,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_canciones) REFERENCES canciones(id_canciones)
);

INSERT INTO Hermano (nombre, apellido, direccion, fecha_nacimiento, observaciones, ff_alta, ff_baja) 
VALUES 
('Dario', 'Colombo', 'Dupuy 11141', '1976-01-11', '', '2025-01-03', NULL),
('Andrés', 'Cano', 'desconocido', '1992-01-23', '', '2025-01-03', NULL);


INSERT INTO Ministerio (descripcion, observaciones, ff_alta, ff_baja) 
VALUES 
('Alabanza & Adoración', 'Ministerio de música', '2020-01-01', NULL);



INSERT INTO Responsabilidad (descripcion, observaciones, ff_alta, ff_baja) 
VALUES 
('Director Musical', '', '2025-01-03', NULL),
('Músico', '', '2025-01-03', NULL),
('Director vocal', '', '2025-01-03', NULL);


INSERT INTO Responsabilidad_Hermano_Ministerio (id_ministerio, id_hermano, id_responsabilidad, observaciones, ff_alta, ff_baja) 
VALUES 
(1, 1, 1, '', '2025-01-03', NULL),
(1, 2, 1, '', '2025-01-03', NULL);


INSERT INTO Tipo_Servicio (descripcion, observaciones, ff_alta, ff_baja) 
VALUES 
('Santa Cena', '', '2025-01-03', NULL),
('Reunión de Oración', '', '2025-01-03', NULL),
('Reunión de jóvenes', '', '2025-01-03', NULL);