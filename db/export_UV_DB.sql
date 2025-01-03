-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jan 03, 2025 at 06:53 PM
-- Server version: 8.4.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `UV_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `acordes_linea`
--

CREATE TABLE `acordes_linea` (
  `id_acordes_linea` int NOT NULL,
  `id_lineas_canciones` int NOT NULL,
  `ubicacion` int NOT NULL,
  `grado` int NOT NULL,
  `id_triadas` int DEFAULT NULL,
  `id_extensiones` int DEFAULT NULL,
  `duracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `acordes_linea`
--

INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(1, 5, 0, 10, 1, NULL, 0),
(2, 5, 18, 6, NULL, NULL, 0),
(3, 6, 0, 10, 1, NULL, 0),
(4, 6, 20, 6, NULL, NULL, 0),
(5, 7, 0, 10, 1, NULL, 0),
(6, 7, 10, 6, NULL, NULL, 0),
(7, 8, 8, 1, NULL, NULL, 0),
(8, 8, 15, 8, NULL, NULL, 0),
(9, 9, 1, 1, NULL, NULL, 0),
(10, 10, 4, 10, 1, NULL, 0),
(11, 11, 6, 6, NULL, NULL, 0),
(12, 11, 17, 1, NULL, NULL, 0),
(13, 1, 1, 1, NULL, NULL, 0),
(14, 2, 1, 1, NULL, NULL, 0),
(15, 1, 9, 6, NULL, NULL, 0),
(16, 1, 17, 8, NULL, NULL, 0),
(17, 74, 4, 10, 1, NULL, 0),
(18, 74, 24, 6, NULL, NULL, 0),
(19, 75, 1, 1, NULL, NULL, 0),
(20, 75, 15, 8, NULL, NULL, 0),
(21, 76, 4, 10, 1, NULL, 0),
(22, 76, 20, 6, NULL, NULL, 0),
(23, 77, 1, 1, NULL, NULL, 0),
(24, 77, 15, 8, NULL, NULL, 0),
(25, 78, 8, 10, 1, NULL, 0),
(26, 78, 20, 6, NULL, NULL, 0),
(27, 79, 10, 1, NULL, NULL, 0),
(28, 79, 25, 8, NULL, NULL, 0),
(29, 80, 7, 10, 1, NULL, 0),
(30, 80, 20, 6, NULL, NULL, 0),
(31, 81, 9, 1, NULL, NULL, 0),
(32, 81, 24, 8, NULL, NULL, 0),
(33, 82, 7, 10, 1, NULL, 0),
(34, 82, 16, 6, NULL, NULL, 0),
(35, 83, 8, 1, NULL, NULL, 0),
(36, 83, 22, 8, NULL, NULL, 0),
(37, 84, 8, 10, 1, NULL, 0),
(38, 84, 20, 6, NULL, NULL, 0),
(39, 85, 11, 1, NULL, NULL, 0),
(40, 85, 22, 8, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `canciones`
--

CREATE TABLE `canciones` (
  `id_canciones` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tonalidad_sugerida` char(1) NOT NULL,
  `tiempo` int DEFAULT NULL,
  `autor` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `canciones`
--

INSERT INTO `canciones` (`id_canciones`, `nombre`, `tonalidad_sugerida`, `tiempo`, `autor`) VALUES
(1, 'Tu nombre levantaré', '', 0, ''),
(3, 'El es el Rey', 'G', 0, ''),
(4, 'La sangre de Jesús', 'C', 0, ''),
(8, 'La única razón de mi adoración', 'C', 80, 'Danilo Montero');

-- --------------------------------------------------------

--
-- Table structure for table `estructura_canciones`
--

CREATE TABLE `estructura_canciones` (
  `id_estructura_canciones` int NOT NULL,
  `id_canciones` int NOT NULL,
  `id_tipo_linea` int NOT NULL,
  `tipo_linea_numero` int NOT NULL,
  `posicion_estructura` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `estructura_canciones`
--

INSERT INTO `estructura_canciones` (`id_estructura_canciones`, `id_canciones`, `id_tipo_linea`, `tipo_linea_numero`, `posicion_estructura`) VALUES
(1, 1, 1, 1, 1),
(3, 1, 2, 1, 3),
(4, 4, 1, 1, 1),
(5, 4, 1, 2, 2),
(6, 4, 1, 3, 3),
(7, 4, 1, 4, 4),
(8, 4, 2, 1, 5),
(9, 4, 1, 5, 6),
(10, 4, 1, 6, 7),
(11, 4, 2, 2, 8),
(12, 4, 3, 1, 12),
(13, 4, 2, 3, 13),
(14, 4, 3, 2, 14),
(23, 8, 1, 1, 1),
(24, 8, 3, 1, 2),
(25, 8, 2, 1, 3),
(26, 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `extensiones`
--

CREATE TABLE `extensiones` (
  `id_extensiones` int NOT NULL,
  `extensiones` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `extensiones`
--

INSERT INTO `extensiones` (`id_extensiones`, `extensiones`, `nombre`) VALUES
(1, 'maj7', 'Septima mayor'),
(2, '7', 'Septima menor'),
(3, '9', 'Novena'),
(4, 'add9', 'Novena añadida'),
(5, '11', 'Onceaba');

-- --------------------------------------------------------

--
-- Table structure for table `Hermano`
--

CREATE TABLE `Hermano` (
  `id_hermano` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Hermano`
--

INSERT INTO `Hermano` (`id_hermano`, `nombre`, `apellido`, `direccion`, `fecha_nacimiento`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 'Dario', 'Colombo', 'Dupuy 11141', '1976-01-11', '', '2025-01-03', NULL),
(2, 'Andrés', 'Cano', 'desconocido', '1992-01-23', '', '2025-01-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Hermano_Servicio`
--

CREATE TABLE `Hermano_Servicio` (
  `id_hermano_servicio` int NOT NULL,
  `id_hermano` int NOT NULL,
  `id_servicio` int NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lineas_canciones`
--

CREATE TABLE `lineas_canciones` (
  `id_lineas_canciones` int NOT NULL,
  `linea_numero` int NOT NULL,
  `texto` varchar(100) NOT NULL,
  `id_estructura_canciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lineas_canciones`
--

INSERT INTO `lineas_canciones` (`id_lineas_canciones`, `linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(1, 1, 'Tu nombre levantare', 1),
(2, 2, 'Me deleito en adorarte', 1),
(3, 3, 'Te agradezco que en mi vida estés', 1),
(5, 1, 'El es el rey infinito en poder', 26),
(6, 2, 'El es el rey de los cielos', 26),
(7, 3, 'Seré para él siervo fiel', 26),
(8, 4, 'Pues mi vida compró con su amor', 26),
(9, 1, 'Un pecador', 4),
(10, 2, 'Ese es quien era yo', 4),
(11, 3, 'Miserable y perdido', 4),
(12, 4, 'Sin ninguna dirección', 4),
(13, 1, 'Un gran abismo', 5),
(14, 2, 'Nos quería separar', 5),
(15, 3, 'Pero cruzaste la distancia', 5),
(16, 4, 'Me viniste a rescatar', 5),
(17, 5, 'Ya no hay división', 6),
(18, 6, 'Un camino se abrió', 6),
(19, 7, 'Tu trono Dejaste', 6),
(20, 8, 'Por vivir en mi interior', 6),
(21, 1, 'Allí en la cruz', 7),
(22, 2, 'Cargaste mi dolor', 7),
(23, 3, 'Mi deuda Tú pagaste', 7),
(24, 4, 'Y me diste salvación', 7),
(25, 1, 'Te doy gracias por morir por mí', 8),
(26, 2, 'Te doy gracias nuevo soy en Ti', 8),
(27, 3, 'Te doy gracias tengo libertad', 8),
(28, 4, 'Tu sangre derramada el perdón me da', 8),
(29, 1, 'En mi lugar', 9),
(30, 2, 'Tu cuerpo herido fue', 9),
(31, 3, 'A la muerte derrotaste', 9),
(32, 4, 'Te levantaste con poder', 9),
(33, 1, 'Ya no hay aguijón', 10),
(34, 2, 'La vida triunfó', 10),
(35, 3, 'Y la sangre del cordero', 10),
(36, 4, 'Transformó mi corazón', 10),
(37, 1, 'Te doy gracias por morir por mí', 11),
(38, 2, 'Te doy gracias nuevo soy en Ti', 11),
(39, 3, 'Te doy gracias tengo libertad', 11),
(40, 4, 'Tu sangre derramada el perdón me da', 11),
(41, 1, 'Nada se compara', 12),
(42, 2, 'Al poder que hay en la sangre de Jesús, Jesús', 12),
(43, 3, 'Ahora somos hijos', 12),
(44, 4, 'Redimidos por la sangre de Jesús, Jesús', 12),
(45, 1, 'Te doy gracias por morir por mí', 13),
(46, 2, 'Te doy gracias nuevo soy en Ti', 13),
(47, 3, 'Te doy gracias tengo libertad', 13),
(48, 4, 'Tu sangre derramada el perdón me da', 13),
(49, 1, 'A Su nombre gloria', 14),
(50, 2, 'A Su nombre gloria', 14),
(51, 3, 'Ya mis maldades Él perdonó', 14),
(52, 4, 'A Su nombre gloria', 14),
(74, 1, 'La única razón de mi adoración', 23),
(75, 2, 'Eres Tú mi Señor', 23),
(76, 3, 'El único motivo para vivir', 23),
(77, 4, 'Eres Tú mi Jesús', 23),
(78, 1, 'La única verdad esta en Ti', 24),
(79, 2, 'Eres mi luz y mi salvación', 24),
(80, 3, 'Todo mi amor eres Tu Señor', 24),
(81, 4, 'Y por siempre te alabaré', 24),
(82, 1, 'Eres todo poderoso', 25),
(83, 2, 'Eres grande y majestuoso', 25),
(84, 3, 'Eres fuerte invencible', 25),
(85, 4, 'Y no hay nadie como Tu', 25);

-- --------------------------------------------------------

--
-- Table structure for table `Ministerio`
--

CREATE TABLE `Ministerio` (
  `id_ministerio` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Ministerio`
--

INSERT INTO `Ministerio` (`id_ministerio`, `descripcion`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 'Alabanza & Adoración', 'Ministerio de música', '2020-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Responsabilidad`
--

CREATE TABLE `Responsabilidad` (
  `id_responsabilidad` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Responsabilidad`
--

INSERT INTO `Responsabilidad` (`id_responsabilidad`, `descripcion`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 'Director Musical', '', '2025-01-03', NULL),
(2, 'Músico', '', '2025-01-03', NULL),
(3, 'Director vocal', '', '2025-01-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Responsabilidad_Hermano_Ministerio`
--

CREATE TABLE `Responsabilidad_Hermano_Ministerio` (
  `id_responsabilidad_hermano_ministerio` int NOT NULL,
  `id_ministerio` int NOT NULL,
  `id_hermano` int NOT NULL,
  `id_responsabilidad` int NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Responsabilidad_Hermano_Ministerio`
--

INSERT INTO `Responsabilidad_Hermano_Ministerio` (`id_responsabilidad_hermano_ministerio`, `id_ministerio`, `id_hermano`, `id_responsabilidad`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(3, 1, 1, 1, '', '2025-01-03', NULL),
(4, 1, 2, 1, '', '2025-01-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Servicio`
--

CREATE TABLE `Servicio` (
  `id_servicio` int NOT NULL,
  `id_tipo_servicio` int NOT NULL,
  `ff_programada` datetime NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Servicio_Cancion`
--

CREATE TABLE `Servicio_Cancion` (
  `id_servicio_cancion` int NOT NULL,
  `id_servicio` int NOT NULL,
  `id_canciones` int NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_linea`
--

CREATE TABLE `tipos_linea` (
  `id` int NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tipos_linea`
--

INSERT INTO `tipos_linea` (`id`, `descripcion`) VALUES
(1, 'ESTROFA'),
(2, 'CORO'),
(3, 'PUENTE');

-- --------------------------------------------------------

--
-- Table structure for table `Tipo_Servicio`
--

CREATE TABLE `Tipo_Servicio` (
  `id_tipo_servicio` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `observaciones` text,
  `ff_alta` date NOT NULL,
  `ff_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Tipo_Servicio`
--

INSERT INTO `Tipo_Servicio` (`id_tipo_servicio`, `descripcion`, `observaciones`, `ff_alta`, `ff_baja`) VALUES
(1, 'Santa Cena', '', '2025-01-03', NULL),
(2, 'Reunión de Oración', '', '2025-01-03', NULL),
(3, 'Reunión de jóvenes', '', '2025-01-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tonalidades`
--

CREATE TABLE `tonalidades` (
  `grado` int NOT NULL,
  `codigo` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tonalidades`
--

INSERT INTO `tonalidades` (`grado`, `codigo`) VALUES
(1, 'A'),
(2, 'A#'),
(3, 'B'),
(4, 'C'),
(5, 'C#'),
(6, 'D'),
(7, 'D#'),
(8, 'E'),
(9, 'F'),
(10, 'F#'),
(11, 'G'),
(12, 'G#'),
(13, 'A'),
(14, 'A#'),
(15, 'B'),
(16, 'C'),
(17, 'C#'),
(18, 'D'),
(19, 'D#'),
(20, 'E'),
(21, 'F'),
(22, 'F#'),
(23, 'G'),
(24, 'G#');

-- --------------------------------------------------------

--
-- Table structure for table `triadas`
--

CREATE TABLE `triadas` (
  `id_triadas` int NOT NULL,
  `triadas` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `triadas`
--

INSERT INTO `triadas` (`id_triadas`, `triadas`, `nombre`) VALUES
(1, 'm', 'Menor'),
(2, 'dis', 'Disminuido'),
(3, 'aum', 'Aumentado'),
(4, 'sus2', 'Sustituida por segunda'),
(5, 'sus4', 'Sustituida por cuarta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acordes_linea`
--
ALTER TABLE `acordes_linea`
  ADD PRIMARY KEY (`id_acordes_linea`),
  ADD KEY `id_lineas_canciones` (`id_lineas_canciones`),
  ADD KEY `id_triadas` (`id_triadas`),
  ADD KEY `id_extensiones` (`id_extensiones`);

--
-- Indexes for table `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`id_canciones`);

--
-- Indexes for table `estructura_canciones`
--
ALTER TABLE `estructura_canciones`
  ADD PRIMARY KEY (`id_estructura_canciones`),
  ADD KEY `id_tipo_linea` (`id_tipo_linea`),
  ADD KEY `id_canciones` (`id_canciones`);

--
-- Indexes for table `extensiones`
--
ALTER TABLE `extensiones`
  ADD PRIMARY KEY (`id_extensiones`);

--
-- Indexes for table `Hermano`
--
ALTER TABLE `Hermano`
  ADD PRIMARY KEY (`id_hermano`);

--
-- Indexes for table `Hermano_Servicio`
--
ALTER TABLE `Hermano_Servicio`
  ADD PRIMARY KEY (`id_hermano_servicio`),
  ADD KEY `id_hermano` (`id_hermano`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indexes for table `lineas_canciones`
--
ALTER TABLE `lineas_canciones`
  ADD PRIMARY KEY (`id_lineas_canciones`),
  ADD KEY `id_estructura_canciones` (`id_estructura_canciones`);

--
-- Indexes for table `Ministerio`
--
ALTER TABLE `Ministerio`
  ADD PRIMARY KEY (`id_ministerio`);

--
-- Indexes for table `Responsabilidad`
--
ALTER TABLE `Responsabilidad`
  ADD PRIMARY KEY (`id_responsabilidad`);

--
-- Indexes for table `Responsabilidad_Hermano_Ministerio`
--
ALTER TABLE `Responsabilidad_Hermano_Ministerio`
  ADD PRIMARY KEY (`id_responsabilidad_hermano_ministerio`),
  ADD KEY `id_ministerio` (`id_ministerio`),
  ADD KEY `id_hermano` (`id_hermano`),
  ADD KEY `id_responsabilidad` (`id_responsabilidad`);

--
-- Indexes for table `Servicio`
--
ALTER TABLE `Servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_tipo_servicio` (`id_tipo_servicio`);

--
-- Indexes for table `Servicio_Cancion`
--
ALTER TABLE `Servicio_Cancion`
  ADD PRIMARY KEY (`id_servicio_cancion`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_canciones` (`id_canciones`);

--
-- Indexes for table `tipos_linea`
--
ALTER TABLE `tipos_linea`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Tipo_Servicio`
--
ALTER TABLE `Tipo_Servicio`
  ADD PRIMARY KEY (`id_tipo_servicio`);

--
-- Indexes for table `tonalidades`
--
ALTER TABLE `tonalidades`
  ADD PRIMARY KEY (`grado`);

--
-- Indexes for table `triadas`
--
ALTER TABLE `triadas`
  ADD PRIMARY KEY (`id_triadas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acordes_linea`
--
ALTER TABLE `acordes_linea`
  MODIFY `id_acordes_linea` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `canciones`
--
ALTER TABLE `canciones`
  MODIFY `id_canciones` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `estructura_canciones`
--
ALTER TABLE `estructura_canciones`
  MODIFY `id_estructura_canciones` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `extensiones`
--
ALTER TABLE `extensiones`
  MODIFY `id_extensiones` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Hermano`
--
ALTER TABLE `Hermano`
  MODIFY `id_hermano` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Hermano_Servicio`
--
ALTER TABLE `Hermano_Servicio`
  MODIFY `id_hermano_servicio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lineas_canciones`
--
ALTER TABLE `lineas_canciones`
  MODIFY `id_lineas_canciones` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `Ministerio`
--
ALTER TABLE `Ministerio`
  MODIFY `id_ministerio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Responsabilidad`
--
ALTER TABLE `Responsabilidad`
  MODIFY `id_responsabilidad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Responsabilidad_Hermano_Ministerio`
--
ALTER TABLE `Responsabilidad_Hermano_Ministerio`
  MODIFY `id_responsabilidad_hermano_ministerio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Servicio`
--
ALTER TABLE `Servicio`
  MODIFY `id_servicio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Servicio_Cancion`
--
ALTER TABLE `Servicio_Cancion`
  MODIFY `id_servicio_cancion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipos_linea`
--
ALTER TABLE `tipos_linea`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Tipo_Servicio`
--
ALTER TABLE `Tipo_Servicio`
  MODIFY `id_tipo_servicio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `triadas`
--
ALTER TABLE `triadas`
  MODIFY `id_triadas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acordes_linea`
--
ALTER TABLE `acordes_linea`
  ADD CONSTRAINT `acordes_linea_ibfk_1` FOREIGN KEY (`id_lineas_canciones`) REFERENCES `lineas_canciones` (`id_lineas_canciones`) ON DELETE CASCADE,
  ADD CONSTRAINT `acordes_linea_ibfk_2` FOREIGN KEY (`id_triadas`) REFERENCES `triadas` (`id_triadas`),
  ADD CONSTRAINT `acordes_linea_ibfk_3` FOREIGN KEY (`id_extensiones`) REFERENCES `extensiones` (`id_extensiones`);

--
-- Constraints for table `estructura_canciones`
--
ALTER TABLE `estructura_canciones`
  ADD CONSTRAINT `estructura_canciones_ibfk_1` FOREIGN KEY (`id_tipo_linea`) REFERENCES `tipos_linea` (`id`),
  ADD CONSTRAINT `estructura_canciones_ibfk_2` FOREIGN KEY (`id_canciones`) REFERENCES `canciones` (`id_canciones`);

--
-- Constraints for table `Hermano_Servicio`
--
ALTER TABLE `Hermano_Servicio`
  ADD CONSTRAINT `Hermano_Servicio_ibfk_1` FOREIGN KEY (`id_hermano`) REFERENCES `Hermano` (`id_hermano`),
  ADD CONSTRAINT `Hermano_Servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `Servicio` (`id_servicio`);

--
-- Constraints for table `lineas_canciones`
--
ALTER TABLE `lineas_canciones`
  ADD CONSTRAINT `lineas_canciones_ibfk_2` FOREIGN KEY (`id_estructura_canciones`) REFERENCES `estructura_canciones` (`id_estructura_canciones`);

--
-- Constraints for table `Responsabilidad_Hermano_Ministerio`
--
ALTER TABLE `Responsabilidad_Hermano_Ministerio`
  ADD CONSTRAINT `Responsabilidad_Hermano_Ministerio_ibfk_1` FOREIGN KEY (`id_ministerio`) REFERENCES `Ministerio` (`id_ministerio`),
  ADD CONSTRAINT `Responsabilidad_Hermano_Ministerio_ibfk_2` FOREIGN KEY (`id_hermano`) REFERENCES `Hermano` (`id_hermano`),
  ADD CONSTRAINT `Responsabilidad_Hermano_Ministerio_ibfk_3` FOREIGN KEY (`id_responsabilidad`) REFERENCES `Responsabilidad` (`id_responsabilidad`);

--
-- Constraints for table `Servicio`
--
ALTER TABLE `Servicio`
  ADD CONSTRAINT `Servicio_ibfk_1` FOREIGN KEY (`id_tipo_servicio`) REFERENCES `Tipo_Servicio` (`id_tipo_servicio`);

--
-- Constraints for table `Servicio_Cancion`
--
ALTER TABLE `Servicio_Cancion`
  ADD CONSTRAINT `Servicio_Cancion_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `Servicio` (`id_servicio`),
  ADD CONSTRAINT `Servicio_Cancion_ibfk_2` FOREIGN KEY (`id_canciones`) REFERENCES `canciones` (`id_canciones`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
