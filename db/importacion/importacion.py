from docx import Document
import re

# Función para determinar si una línea es de acordes
def es_linea_acordes(linea):
    patron_acordes = r"^[A-G][#b]?(m|maj|min|dim|aug|sus|add|[0-9])*(\s+[A-G][#b]?(m|maj|min|dim|aug|sus|add|[0-9])*)*$"
    return bool(re.match(patron_acordes, linea.strip()))

# Función para calcular el grado de un acorde en una tonalidad dada
def calcular_grado(acorde, tonalidad):
    tonos = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
    acorde_base = re.match(r"[A-G][#b]?", acorde).group(0)
    indice_tonalidad = tonos.index(tonalidad)
    indice_acorde = tonos.index(acorde_base)
    grado = (indice_acorde - indice_tonalidad) % 12 + 1
    return grado

# Función para determinar el id_triada de un acorde
def obtener_id_triada(acorde):
    if "m" in acorde and "maj" not in acorde:
        return 1
    if "dim" in acorde:
        return 2
    if "aug" in acorde:
        return 3
    if "sus2" in acorde:
        return 4
    if "sus4" in acorde:
        return 5
    return None

# Función para determinar el id_extensiones de un acorde
def obtener_id_extensiones(acorde):
    if "maj7" in acorde:
        return 1
    if re.search(r"[^m]7", acorde):
        return 2
    if "9" in acorde and "add9" not in acorde:
        return 3
    if "add9" in acorde:
        return 4
    if "11" in acorde:
        return 5
    return None

# Función para obtener el ID del tipo de línea
def obtener_id_tipo_linea(linea):
    tipos = {
        "introduccion": 4,
        "estrofa": 1,
        "coro": 2,
        "puente": 3
    }
    linea_lower = linea.strip().lower()
    return tipos.get(linea_lower, None)

# Función principal para procesar el archivo .docx
def docx_a_texto_con_acordes(input_file, output_file):
    try:
        # Leer el archivo .docx
        doc = Document(input_file)
        lineas = [paragraph.text for paragraph in doc.paragraphs if paragraph.text.strip()]

        if len(lineas) < 4:
            print("El documento no tiene suficientes líneas para extraer título, tonalidad, autor y tiempo.")
            return

        # Extraer datos iniciales
        titulo = lineas[0].strip()
        tonalidad_sugerida = lineas[1].strip()
        autor = lineas[2].strip()
        tiempo = lineas[3].strip()

        if not tiempo.isdigit():
            print("El tiempo debe ser un valor numérico.")
            return

        salida = []
        salida.append(f"INSERT INTO `canciones` (`id_canciones`, `nombre`, `tonalidad_sugerida`, `tiempo`, `autor`) VALUES")
        salida.append(f"(NULL,'{titulo}', '{tonalidad_sugerida}', {tiempo}, '{autor}');")
        salida.append("SET @id_canciones = LAST_INSERT_ID();\n")

        instrucciones_estructura = []
        instrucciones_lineas = []
        instrucciones_acordes = []
        acordes_anterior = ""
        posicion_estructura = 1
        linea_numero = 1

        for i, linea in enumerate(lineas[4:], start=5):
            id_tipo_linea = obtener_id_tipo_linea(linea.strip())
            if id_tipo_linea:
                instrucciones_estructura.append(
                    f"INSERT INTO `estructura_canciones` (`id_estructura_canciones`, `id_canciones`, `id_tipo_linea`, `tipo_linea_numero`, `posicion_estructura`) VALUES"
                )
                instrucciones_estructura.append(
                    f"(NULL,@id_canciones, {id_tipo_linea}, 1, {posicion_estructura});"
                )
                instrucciones_estructura.append(
                    f"SET @id_esctructura_canciones{posicion_estructura} = LAST_INSERT_ID();"
                )
                id_estructura_actual = f"@id_esctructura_canciones{posicion_estructura}"
                posicion_estructura += 1
            elif es_linea_acordes(linea):
                acordes_anterior = linea
            else:
                # Insertar línea de la canción
                instrucciones_lineas.append(
                    f"INSERT INTO `lineas_canciones` (`id_lineas_canciones`, `linea_numero`, `texto`, `id_estructura_canciones`) VALUES"
                )
                instrucciones_lineas.append(
                    f"(NULL,{linea_numero}, '{linea.strip()}', {id_estructura_actual});"
                )
                instrucciones_lineas.append(f"SET @id_lineas_canciones{linea_numero} = LAST_INSERT_ID();")

                # Procesar acordes y generar inserciones en acordes_linea
                if acordes_anterior:
                    acordes = re.finditer(r"[A-G][#b]?(m|maj|min|dim|aug|sus|add|[0-9])*", acordes_anterior)
                    for acorde_match in acordes:
                        acorde = acorde_match.group(0)
                        ubicacion = acorde_match.start() + 1  # Contar la posición del acorde en la línea
                        grado = calcular_grado(acorde, tonalidad_sugerida)
                        id_triada = obtener_id_triada(acorde)
                        id_extensiones = obtener_id_extensiones(acorde)
                        instrucciones_acordes.append(
                            f"INSERT INTO `acordes_linea` (`id_acordes_linea`, `id_lineas_canciones`, `ubicacion`, `grado`, `id_triadas`, `id_extensiones`, `duracion`) VALUES"
                        )
                        instrucciones_acordes.append(
                            f"(NULL,@id_lineas_canciones{linea_numero}, {ubicacion}, {grado}, {id_triada or 'NULL'}, {id_extensiones or 'NULL'}, 0);"
                        )

                acordes_anterior = ""
                linea_numero += 1

        # Agregar todas las instrucciones al archivo de salida
        salida.extend(instrucciones_estructura)
        salida.append("\n")
        salida.extend(instrucciones_lineas)
        salida.append("\n")
        salida.extend(instrucciones_acordes)

        # Escribir el archivo de salida
        with open(output_file, 'w', encoding='utf-8') as file:
            file.write("\n".join(salida))
        
        print(f"Archivo generado exitosamente: {output_file}")

    except Exception as e:
        print(f"Error al procesar el archivo: {e}")

# Ejecutar la función
input_file = "cancion.docx"
output_file = "cancion_procesada.txt"
docx_a_texto_con_acordes(input_file, output_file)