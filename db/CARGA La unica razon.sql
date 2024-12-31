--CARGA TITULO Y DATOS DE CANCION
INSERT INTO `canciones` (`id_canciones`, `nombre`, `tonalidad_sugerida`, `tiempo`, `autor`) VALUES
(NULL,'La única razón de mi adoración', 'C', 80, 'Danilo Montero');
SET @id_canciones = LAST_INSERT_ID();

--CARGA ESTRUCTURA DE LA CANCION
INSERT INTO `estructura_canciones` (`id_estructura_canciones`, `id_canciones`, `id_tipo_linea`, `tipo_linea_numero`, `posicion_estructura`) VALUES
(NULL,@id_canciones, 1, 1, 1);
SET @id_esctructura_canciones1 = LAST_INSERT_ID();

INSERT INTO `estructura_canciones` (`id_estructura_canciones`, `id_canciones`, `id_tipo_linea`, `tipo_linea_numero`, `posicion_estructura`) VALUES
(NULL,@id_canciones, 3, 1, 2);
SET @id_esctructura_canciones2 = LAST_INSERT_ID();

INSERT INTO `estructura_canciones` (`id_estructura_canciones`, `id_canciones`, `id_tipo_linea`, `tipo_linea_numero`, `posicion_estructura`) VALUES
(NULL,@id_canciones, 2, 1, 3);
SET @id_esctructura_canciones3 = LAST_INSERT_ID();

--CARGA LINEAS DE LA ESTRUCUTRA DE LA CANCION
    --4 LINEAS DE LA ESTRUCUTRA 1 (ESTOFA1)
INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,1, 'La única razón de mi adoración,', @id_esctructura_canciones1);
SET @id_lineas_canciones1 = LAST_INSERT_ID();

INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,2, 'Eres Tú mi Señor,', @id_esctructura_canciones1);
SET @id_lineas_canciones2 = LAST_INSERT_ID();

INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,3, 'El único motivo para vivir,', @id_esctructura_canciones1);
SET @id_lineas_canciones3 = LAST_INSERT_ID();

INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,4, 'Eres Tú mi Jesús.,', @id_esctructura_canciones1);
SET @id_lineas_canciones4 = LAST_INSERT_ID();

    --4 LINEAS DE LA ESTRUCUTRA 2 (PUENTE1)
INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,1, 'La única verdad esta en Ti,', @id_esctructura_canciones2);
SET @id_lineas_canciones5 = LAST_INSERT_ID();

INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,2, 'Eres mi luz y mi salvación,', @id_esctructura_canciones2);
SET @id_lineas_canciones6 = LAST_INSERT_ID();

INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,3, 'Todo mi amor eres Tu Señor,', @id_esctructura_canciones2);
SET @id_lineas_canciones7 = LAST_INSERT_ID();

INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,4, 'Y por siempre te alabaré.', @id_esctructura_canciones2);
SET @id_lineas_canciones8 = LAST_INSERT_ID();

    --4 LINEAS DE LA ESTRUCUTRA 3 (CORO1)
INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,1, 'Eres todo poderoso,', @id_esctructura_canciones3);
SET @id_lineas_canciones9 = LAST_INSERT_ID();

INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,2, 'Eres grande y majestuoso,', @id_esctructura_canciones3);
SET @id_lineas_canciones10 = LAST_INSERT_ID();

INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,3, 'Eres fuerte, invencible,', @id_esctructura_canciones3);
SET @id_lineas_canciones11 = LAST_INSERT_ID();

INSERT INTO `lineas_canciones` (`id_lineas_canciones`,  `id_canciones`,`linea_numero`, `texto`, `id_estructura_canciones`) VALUES
(NULL,@id_canciones,4, 'Y no hay nadie como Tu.', @id_esctructura_canciones3);
SET @id_lineas_canciones12 = LAST_INSERT_ID();

--CARGA ACORDES DE LINEAS DE LA CANCION
    --CARGA ACORDES DE LINEAS 1
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones1, 4, 10, 1, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones1, 20, 8, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 2
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones2, 1, 1, NULL, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones2, 15, 6, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 3
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones3, 4, 10, 1, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones3, 20, 8, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 4
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones4, 1, 1, NULL, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones4, 15, 6, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 5
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones5, 8, 10, 1, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones5, 20, 8, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 6
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones6, 10, 1, NULL, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones6, 25, 6, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 7
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones7, 4, 10, 1, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones7, 20, 8, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 8
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones8, 1, 1, NULL, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones8, 15, 6, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 9
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones9, 4, 10, 1, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones9, 20, 8, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 10
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones10, 1, 1, NULL, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones10, 15, 6, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 11
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones11, 4, 10, 1, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones11, 20, 8, NULL, NULL, 0);
    --CARGA ACORDES DE LINEAS 12
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones12, 1, 1, NULL, NULL, 0);
INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES
(NULL,@id_lineas_canciones12, 15, 6, NULL, NULL, 0);