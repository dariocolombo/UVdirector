from docx import Document
import re
import json
import sys
import os

# Función para determinar si una línea es de acordes
def es_linea_acordes(linea):
    patron_acordes = r"^[A-G][#b]?(m|maj|min|dim|aug|sus|add|[0-9])*(\s+[A-G][#b]?(m|maj|min|dim|aug|sus|add|[0-9])*)*$"
    return bool(re.match(patron_acordes, linea.strip()))

# Función principal para procesar el archivo .docx
def docx_a_json(input_file, output_file):
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

        # Estructura base del JSON
        json_data = {
            "cancion": {
                "id_cancion": None,
                "nombre": titulo,
                "tonalidad_sugerida": tonalidad_sugerida,
                "autor": autor,
                "tiempo": int(tiempo),
                "estructura_cancion": []
            }
        }

        estructuras_contador = {}  # Para contar el número de cada tipo de línea
        estructura_actual = None

        # Procesar líneas restantes del documento
        for i in range(4, len(lineas)):
            linea = lineas[i].rstrip()  # Conservamos los espacios iniciales
            espacios_iniciales = len(lineas[i]) - len(lineas[i].lstrip())

            # Identificar tipo de línea
            id_tipo_linea = obtener_id_tipo_linea(linea)
            if id_tipo_linea:
                tipo_linea = linea.lower()
                if tipo_linea not in estructuras_contador:
                    estructuras_contador[tipo_linea] = 1
                else:
                    estructuras_contador[tipo_linea] += 1

                # Crear una nueva estructura
                estructura_actual = {
                    "id_estructura": None,
                    "id_tipo_linea": id_tipo_linea,
                    "tipo_linea_numero": estructuras_contador[tipo_linea],
                    "posicion_estructura": len(json_data["cancion"]["estructura_cancion"]) + 1,
                    "lineas": []
                }
                json_data["cancion"]["estructura_cancion"].append(estructura_actual)
            elif es_linea_acordes(linea):
                acordes_anterior = linea
            else:
                if estructura_actual is None:
                    print(f"Error: No se ha definido una estructura para la línea: '{linea}'.")
                    return

                # Crear una nueva línea
                nueva_linea = {
                    "id_linea": None,
                    "linea_numero": len(estructura_actual["lineas"]) + 1,
                    "texto": linea,
                    "acordes": []
                }
                estructura_actual["lineas"].append(nueva_linea)

                # Procesar acordes asociados a esta línea
                if i > 4 and es_linea_acordes(lineas[i - 1]):
                    acordes_anterior = lineas[i - 1].rstrip()
                    acordes = re.finditer(r"[A-G][#b]?(m|maj|min|dim|aug|sus|add|[0-9])*", acordes_anterior)
                    for acorde_match in acordes:
                        acorde = acorde_match.group(0)
                        ubicacion = espacios_iniciales + acorde_match.start() + 1  # Incluimos los espacios iniciales
                        nuevo_acorde = {
                            "id_acorde": None,
                            "ubicacion": ubicacion,
                            "acorde": acorde,
                            "grado": calcular_grado(acorde, tonalidad_sugerida),
                            "id_triada": obtener_id_triada(acorde),
                            "id_extension": obtener_id_extensiones(acorde),
                            "duracion": 0
                        }
                        nueva_linea["acordes"].append(nuevo_acorde)

        # Escribir el archivo JSON
        with open(output_file, 'w', encoding='utf-8') as file:
            json.dump(json_data, file, ensure_ascii=False, indent=4)

        print(f"Archivo JSON generado exitosamente: {output_file}")

    except Exception as e:
        print(f"Error al procesar el archivo: {e}")

# Funciones auxiliares
def obtener_id_tipo_linea(linea):
    tipos = {
        "introduccion": 4,
        "estrofa": 1,
        "coro": 2,
        "puente": 3
    }
    return tipos.get(linea.strip().lower(), None)

def calcular_grado(acorde, tonalidad):
    tonos = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
    acorde_base = re.match(r"[A-G][#b]?", acorde).group(0)
    indice_tonalidad = tonos.index(tonalidad)
    indice_acorde = tonos.index(acorde_base)
    return (indice_acorde - indice_tonalidad) % 12 + 1

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

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Uso: python DocxToJSON.py <input_file> <output_file>")
    else:
        input_file = sys.argv[1]
        output_file = sys.argv[2]
        print(f"Procesando archivo DOCX: {input_file}")
        print(f"Archivo de salida JSON: {output_file}")
        docx_a_json(input_file, output_file)
