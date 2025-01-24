package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
	"time"
//	"bytes"
	"github.com/jung-kurt/gofpdf"

	_ "github.com/go-sql-driver/mysql"
)


type NuevoServicio struct {
	IdTipoServicio int      `json:"id_tipo_servicio"`
	IdHermanos     []int    `json:"id_hermanos"`
	IdCanciones    []int    `json:"id_canciones"`
	FfProgramada   string   `json:"ff_programada"`
}

type Cancion struct {
	ID     int    `json:"id_canciones"`
	Nombre string `json:"nombre"`
	Tonalidad_sugerida string `json:"Tonalidad_sugerida"`
	Tiempo int `json:"tiempo"`
	Autor string `json:"autor"`
}

type Letra struct {
	Texto string `json:"texto"`
	IDEstructura string `json:"id_estructura_canciones"`
}

type Parrafo struct {
	IDEstructura string `json:"id_estructura_canciones"`
	Descripcion string `json:"descripcion_parrafo"`
}

type LineaConAcordes struct {
	Texto   string   `json:"texto"`
	Acordes []Acorde `json:"acordes"`
}

type Acorde struct {
	Codigo    string `json:"codigo"`
	Ubicacion    int `json:"ubicacion"`
	Duracion    int `json:"duracion"`
}


var db *sql.DB

func main() {
	// Conexión a la base de datos
	var err error
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s",
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASSWORD"),
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_NAME"),
	)
	db, err = sql.Open("mysql", dsn)
	if err != nil {
		log.Fatalf("Error al abrir la conexión: %v", err)
	}
	defer db.Close()

	// Verificar conexión
	if err = db.Ping(); err != nil {
		log.Fatalf("Error al conectar a la base de datos: %v", err)
	}

	// Rutas HTTP
	http.HandleFunc("/lista_canciones", listaCancionesHandler)
	http.HandleFunc("/consulta_letra_cancion", consultaLetraCancionHandler)
	http.HandleFunc("/consulta_parrafo_cancion", consultaParrafoCancionHandler)
	http.HandleFunc("/consulta_letra_cifrado_cancion", consultaLetraCifradoCancionHandler)
	http.HandleFunc("/consulta_lineas_con_acordes", consultaLineasConAcordesHandler)
	http.HandleFunc("/consulta_tipo_servicio", consultaTipoServicioHandler)
	http.HandleFunc("/consulta_ministerios", consultaMinisteriosHandler)
	http.HandleFunc("/consulta_responsabilidades", consultaResponsabilidadesHandler)
	http.HandleFunc("/consulta_hermanos", consultaHermanosHandler)
	http.HandleFunc("/consulta_servicios", consultaServiciosHandler)
	http.HandleFunc("/altaServicio", altaServicioHandler)
	http.HandleFunc("/modificacionServicio", modificarServicioHandler)
	http.HandleFunc("/bajaServicio", bajaServicioHandler)
	http.HandleFunc("/generar-pdf-letra", generarPDFLetrasHandler)
	http.HandleFunc("/generar-pdf-letra-cifrado", generarPDFLetrasConAcordesHandler)





	fmt.Println("Servidor escuchando en el puerto 8080...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func listaCancionesHandler(w http.ResponseWriter, r *http.Request) {
	canciones, err := listaCanciones()
	if err != nil {
		http.Error(w, "Error al obtener la lista de canciones", http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(canciones)
}

func consultaLetraCancionHandler(w http.ResponseWriter, r *http.Request) {
	id := r.URL.Query().Get("id")
	if id == "" {
		http.Error(w, "Falta el parámetro 'id'", http.StatusBadRequest)
		return
	}

	letra, err := consultaLetraCancion(id)
	if err != nil {
		http.Error(w, "Error al obtener la letra de la canción", http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(letra)
}

func consultaParrafoCancionHandler(w http.ResponseWriter, r *http.Request) {
	id := r.URL.Query().Get("id")
	if id == "" {
		http.Error(w, "Falta el parámetro 'id'", http.StatusBadRequest)
		return
	}

	parrafo, err := consultaParrafoCancion(id)
	if err != nil {
		http.Error(w, "Error al obtener la letra de la canción", http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(parrafo)
}


func consultaLetraCifradoCancionHandler(w http.ResponseWriter, r *http.Request) {
	id := r.URL.Query().Get("id")
	tono := r.URL.Query().Get("tono")

	if id == "" || tono == "" {
		http.Error(w, "Faltan los parámetros 'id' y/o 'tono'", http.StatusBadRequest)
		return
	}

	resultados, err := consultaLetraCifradoCancion(id, tono)
	if err != nil {
		http.Error(w, "Error al obtener la letra cifrada de la canción", http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(resultados)
}

func consultaLineasConAcordesHandler(w http.ResponseWriter, r *http.Request) {
	id := r.URL.Query().Get("id")
	tono := r.URL.Query().Get("tono")

	if id == "" || tono == "" {
		http.Error(w, "Faltan los parámetros 'id' y/o 'tono'", http.StatusBadRequest)
		return
	}

	lineas, err := consultaLineasConAcordes(id, tono)
	if err != nil {
		http.Error(w, "Error al obtener las líneas y acordes", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	if err := json.NewEncoder(w).Encode(lineas); err != nil {
		http.Error(w, "Error al codificar la respuesta", http.StatusInternalServerError)
		log.Printf("Error al codificar JSON: %v\n", err)
	}
}

func consultaTipoServicioHandler(w http.ResponseWriter, r *http.Request) {
	tipoServicio, err := consultaTipoServicio()
	if err != nil {
		http.Error(w, "Error al obtener los tipos de servicio", http.StatusInternalServerError)
		log.Printf("Error: %v\n", err)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	if err := json.NewEncoder(w).Encode(tipoServicio); err != nil {
		http.Error(w, "Error al codificar la respuesta", http.StatusInternalServerError)
		log.Printf("Error al codificar JSON: %v\n", err)
	}
}

func consultaMinisteriosHandler(w http.ResponseWriter, r *http.Request) {
	ministerios, err := consultaMinisterios()
	if err != nil {
		http.Error(w, "Error al obtener los ministerios", http.StatusInternalServerError)
		log.Printf("Error: %v\n", err)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	if err := json.NewEncoder(w).Encode(ministerios); err != nil {
		http.Error(w, "Error al codificar la respuesta", http.StatusInternalServerError)
		log.Printf("Error al codificar JSON: %v\n", err)
	}
}

func consultaResponsabilidadesHandler(w http.ResponseWriter, r *http.Request) {
	responsabilidades, err := consultaResponsabilidades()
	if err != nil {
		http.Error(w, "Error al obtener las responsabilidades", http.StatusInternalServerError)
		log.Printf("Error: %v\n", err)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	if err := json.NewEncoder(w).Encode(responsabilidades); err != nil {
		http.Error(w, "Error al codificar la respuesta", http.StatusInternalServerError)
		log.Printf("Error al codificar JSON: %v\n", err)
	}
}

func consultaHermanosHandler(w http.ResponseWriter, r *http.Request) {
	hermanos, err := consultaHermanos()
	if err != nil {
		http.Error(w, "Error al obtener los hermanos", http.StatusInternalServerError)
		log.Printf("Error: %v\n", err)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	if err := json.NewEncoder(w).Encode(hermanos); err != nil {
		http.Error(w, "Error al codificar la respuesta", http.StatusInternalServerError)
		log.Printf("Error al codificar JSON: %v\n", err)
	}
}

// consultaServiciosHandler maneja la solicitud HTTP POST para consultar servicios
func consultaServiciosHandler(w http.ResponseWriter, r *http.Request) {
    var requestBody struct {
        IDServicio *int    `json:"id_servicio"`
        FechaDesde *string `json:"fecha_desde"`
        FechaHasta *string `json:"fecha_hasta"`
    }

    err := json.NewDecoder(r.Body).Decode(&requestBody)
    if err != nil {
        http.Error(w, "Invalid JSON", http.StatusBadRequest)
        return
    }

    servicios, err := consultaServicios(requestBody.IDServicio, requestBody.FechaDesde, requestBody.FechaHasta)
    if err != nil {
        log.Printf("Error fetching services: %v", err)
        http.Error(w, "Error fetching services", http.StatusInternalServerError)
        return
    }

    w.Header().Set("Content-Type", "application/json")
    if err := json.NewEncoder(w).Encode(servicios); err != nil {
        log.Printf("Error encoding response: %v", err)
        http.Error(w, "Error encoding response", http.StatusInternalServerError)
    }
}

func altaServicioHandler(w http.ResponseWriter, r *http.Request) {
	// Estructura para el JSON recibido
	type NuevoServicio struct {
		IdTipoServicio   int      `json:"id_tipo_servicio"`
		FfProgramada     string   `json:"ff_programada"`      // Fecha y hora en formato "30/01/2025 16:30:30"
		FfPrueba         string   `json:"ff_prueba"`          // Fecha y hora en formato "30/01/2025 14:00:00"
		DuracionServicio int      `json:"duracion_servicio"`  // Duración en minutos
		IdLugarServicio  int      `json:"id_lugar_servicio"`  // ID del lugar del servicio
		IdHermanos       []int    `json:"id_hermanos"`        // Lista de IDs de hermanos
		Canciones        []struct {
			IdCancion int `json:"id_cancion"` // ID de la canción
			Tonalidad int `json:"tonalidad"` // Tonalidad (1-12)
		} `json:"canciones"`
	}

	var nuevoServicio NuevoServicio

	// Decodificar el JSON recibido
	if err := json.NewDecoder(r.Body).Decode(&nuevoServicio); err != nil {
		http.Error(w, "Error al procesar el JSON: "+err.Error(), http.StatusBadRequest)
		return
	}

	// Validar fechas y duración
	ffProgramada, err := time.Parse("02/01/2006 15:04:05", nuevoServicio.FfProgramada)
	if err != nil {
		http.Error(w, "Formato incorrecto para ff_programada. Use DD/MM/YYYY HH:MM:SS.", http.StatusBadRequest)
		return
	}
	ffPrueba, err := time.Parse("02/01/2006 15:04:05", nuevoServicio.FfPrueba)
	if err != nil {
		http.Error(w, "Formato incorrecto para ff_prueba. Use DD/MM/YYYY HH:MM:SS.", http.StatusBadRequest)
		return
	}

	if nuevoServicio.DuracionServicio <= 0 {
		http.Error(w, "La duración del servicio debe ser mayor a 0.", http.StatusBadRequest)
		return
	}

	// Iniciar transacción
	tx, err := db.Begin()
	if err != nil {
		http.Error(w, "Error al iniciar la transacción: "+err.Error(), http.StatusInternalServerError)
		return
	}
	defer tx.Rollback()

	// Insertar en tabla Servicio
	var idServicio int
	queryServicio := `
		INSERT INTO Servicio (id_tipo_servicio, ff_programada, ff_prueba, duracion_servicio, id_lugar_servicio, ff_alta)
		VALUES (?, ?, ?, ?, ?, ?)
	`
	result, err := tx.Exec(queryServicio, nuevoServicio.IdTipoServicio, ffProgramada, ffPrueba, nuevoServicio.DuracionServicio, nuevoServicio.IdLugarServicio, time.Now())
	if err != nil {
		http.Error(w, "Error al insertar en Servicio: "+err.Error(), http.StatusInternalServerError)
		return
	}

	idServicio64, err := result.LastInsertId()
	if err != nil {
		http.Error(w, "Error al obtener el ID del nuevo servicio: "+err.Error(), http.StatusInternalServerError)
		return
	}
	idServicio = int(idServicio64)

	// Insertar en tabla Hermano_Servicio
	queryHermanoServicio := `
		INSERT INTO Hermano_Servicio (id_hermano, id_servicio, ff_alta)
		VALUES (?, ?, ?)
	`
	for _, idHermano := range nuevoServicio.IdHermanos {
		if _, err := tx.Exec(queryHermanoServicio, idHermano, idServicio, time.Now()); err != nil {
			http.Error(w, "Error al insertar en Hermano_Servicio: "+err.Error(), http.StatusInternalServerError)
			return
		}
	}

	// Insertar en tabla Servicio_Cancion con tonalidad
	queryServicioCancion := `
		INSERT INTO Servicio_Cancion (id_canciones, id_servicio, tonalidad, ff_alta)
		VALUES (?, ?, ?, ?)
	`
	for _, cancion := range nuevoServicio.Canciones {
		if cancion.Tonalidad < 1 || cancion.Tonalidad > 12 {
			http.Error(w, fmt.Sprintf("Tonalidad inválida para la canción con ID %d. Debe estar entre 1 y 12.", cancion.IdCancion), http.StatusBadRequest)
			return
		}
		if _, err := tx.Exec(queryServicioCancion, cancion.IdCancion, idServicio, cancion.Tonalidad, time.Now()); err != nil {
			http.Error(w, "Error al insertar en Servicio_Cancion: "+err.Error(), http.StatusInternalServerError)
			return
		}
	}

	// Confirmar transacción
	if err := tx.Commit(); err != nil {
		http.Error(w, "Error al confirmar la transacción: "+err.Error(), http.StatusInternalServerError)
		return
	}

	// Responder con éxito
	w.WriteHeader(http.StatusCreated)
	fmt.Fprintf(w, "Servicio creado con ID: %d", idServicio)
}

func modificarServicioHandler(w http.ResponseWriter, r *http.Request) {
	var servicioModificado struct {
		IdServicio      int      `json:"id_servicio"`
		IdTipoServicio  int      `json:"id_tipo_servicio"`
		IdHermanos      []int    `json:"id_hermanos"`
		IdCanciones     []int    `json:"id_canciones"`
		FfProgramada    string   `json:"ff_programada"`
	}

	// Decodificar el JSON recibido
	err := json.NewDecoder(r.Body).Decode(&servicioModificado)
	if err != nil {
		http.Error(w, "Error al procesar el JSON de entrada", http.StatusBadRequest)
		return
	}

	// Validar y parsear la fecha
	ffProgramada, err := time.Parse("02/01/2006", servicioModificado.FfProgramada)
	if err != nil {
		http.Error(w, "Formato de fecha incorrecto. Use DD/MM/YYYY", http.StatusBadRequest)
		return
	}

	// Actualizar la tabla `Servicio`
	queryServicio := `
		UPDATE Servicio 
		SET id_tipo_servicio = ?, ff_programada = ?
		WHERE id_servicio = ? AND ff_baja IS NULL
	`
	_, err = db.Exec(queryServicio, servicioModificado.IdTipoServicio, ffProgramada, servicioModificado.IdServicio)
	if err != nil {
		http.Error(w, "Error al actualizar el servicio", http.StatusInternalServerError)
		return
	}

	// Eliminar las relaciones actuales del servicio
	_, err = db.Exec("DELETE FROM Hermano_Servicio WHERE id_servicio = ?", servicioModificado.IdServicio)
	if err != nil {
		http.Error(w, "Error al eliminar hermanos asociados", http.StatusInternalServerError)
		return
	}
	_, err = db.Exec("DELETE FROM Servicio_Cancion WHERE id_servicio = ?", servicioModificado.IdServicio)
	if err != nil {
		http.Error(w, "Error al eliminar canciones asociadas", http.StatusInternalServerError)
		return
	}

	// Insertar nuevas relaciones en `Hermano_Servicio`
	queryHermanoServicio := `
		INSERT INTO Hermano_Servicio (id_hermano, id_servicio, ff_alta) 
		VALUES (?, ?, ?)
	`
	for _, idHermano := range servicioModificado.IdHermanos {
		_, err = db.Exec(queryHermanoServicio, idHermano, servicioModificado.IdServicio, time.Now())
		if err != nil {
			http.Error(w, "Error al asociar hermanos al servicio", http.StatusInternalServerError)
			return
		}
	}

	// Insertar nuevas relaciones en `Servicio_Cancion`
	queryServicioCancion := `
		INSERT INTO Servicio_Cancion (id_canciones, id_servicio, ff_alta) 
		VALUES (?, ?, ?)
	`
	for _, idCancion := range servicioModificado.IdCanciones {
		_, err = db.Exec(queryServicioCancion, idCancion, servicioModificado.IdServicio, time.Now())
		if err != nil {
			http.Error(w, "Error al asociar canciones al servicio", http.StatusInternalServerError)
			return
		}
	}

	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Servicio modificado exitosamente"))
}

func bajaServicioHandler(w http.ResponseWriter, r *http.Request) {
	// Estructura para recibir el JSON con el ID del servicio
	var requestBody struct {
		IdServicio int `json:"id_servicio"`
	}

	// Decodificar el JSON recibido
	err := json.NewDecoder(r.Body).Decode(&requestBody)
	if err != nil {
		http.Error(w, "Error al procesar el JSON de entrada", http.StatusBadRequest)
		return
	}

	// Validar que se haya recibido un ID de servicio
	if requestBody.IdServicio == 0 {
		http.Error(w, "El campo id_servicio es obligatorio", http.StatusBadRequest)
		return
	}

	// Obtener la fecha actual para registrar la baja lógica
	ffBaja := time.Now()

	// Realizar la baja lógica del servicio
	query := `
		UPDATE Servicio 
		SET ff_baja = ?
		WHERE id_servicio = ? AND ff_baja IS NULL
	`
	result, err := db.Exec(query, ffBaja, requestBody.IdServicio)
	if err != nil {
		http.Error(w, "Error al realizar la baja del servicio", http.StatusInternalServerError)
		return
	}

	// Verificar si se actualizó algún registro
	rowsAffected, err := result.RowsAffected()
	if err != nil {
		http.Error(w, "Error al verificar la operación de baja", http.StatusInternalServerError)
		return
	}
	if rowsAffected == 0 {
		http.Error(w, "No se encontró el servicio o ya estaba dado de baja", http.StatusNotFound)
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Servicio dado de baja exitosamente"))
}



func listaCanciones() ([]Cancion, error) {
	rows, err := db.Query("SELECT id_canciones, nombre,tonalidad_sugerida,tiempo,autor FROM canciones ORDER BY nombre")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var canciones []Cancion
	for rows.Next() {
		var c Cancion
		if err := rows.Scan(&c.ID, &c.Nombre, &c.Tonalidad_sugerida, &c.Tiempo, &c.Autor); err != nil {
			return nil, err
		}
		canciones = append(canciones, c)
	}	
	return canciones, nil
}

func consultaLetraCancion(id string) ([]Letra, error) {
	rows, err := db.Query("SELECT id_estructura_canciones,texto FROM lineas_canciones WHERE id_estructura_canciones in ( select id_estructura_canciones from estructura_canciones where id_canciones = ?)", id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var letra []Letra
	for rows.Next() {
		var l Letra
		if err := rows.Scan(&l.IDEstructura,&l.Texto); err != nil {
			return nil, err
		}

		letra = append(letra, l)
	}
	return letra, nil
}

func consultaParrafoCancion(id string) ([]Parrafo, error) {
	rows, err := db.Query(`SELECT ec.id_estructura_canciones, 
							concat(tl.descripcion,cast(ec.tipo_linea_numero as char(50))) as descripcion_parrafo 
							FROM tipos_linea tl 
							LEFT JOIN estructura_canciones ec ON ec.id_tipo_linea = tl.id 
							WHERE ec.id_canciones = ? order by ec.posicion_estructura`, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var parrafo []Parrafo
	for rows.Next() {
		var p Parrafo
		if err := rows.Scan(&p.IDEstructura,&p.Descripcion,); err != nil {
			return nil, err
		}

		parrafo = append(parrafo, p)
	}
	return parrafo, nil
}

func consultaLetraCifradoCancion(id string, tono string) ([]map[string]string, error) {
	query := `
		SELECT 
			CONCAT(
				(SELECT tonalidades.codigo FROM tonalidades WHERE tonalidades.grado = acordes_linea.grado + ?),
				IFNULL(triadas.triadas, ''),
				IFNULL(extensiones.extensiones, '')
			) AS acorde,
			SUBSTR(
				lineas_canciones.texto,
				acordes_linea.ubicacion,
				IF(
					acordes_linea.id_lineas_canciones = LEAD(acordes_linea.id_lineas_canciones) OVER (ORDER BY acordes_linea.id_acordes_linea),
					LEAD(acordes_linea.ubicacion) OVER (ORDER BY acordes_linea.id_acordes_linea) - 1,
					LENGTH(lineas_canciones.texto)
				)
			) AS letra
		FROM 
			lineas_canciones
		LEFT JOIN 
			acordes_linea ON acordes_linea.id_lineas_canciones = lineas_canciones.id_lineas_canciones
		LEFT JOIN 
			triadas ON acordes_linea.id_triadas = triadas.id_triadas
		LEFT JOIN 
			extensiones ON acordes_linea.id_extensiones = extensiones.id_extensiones
		WHERE 
			lineas_canciones.id_canciones = ?
	`

	rows, err := db.Query(query, tono, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var resultados []map[string]string
	for rows.Next() {
		var acorde, letra string
		if err := rows.Scan(&acorde, &letra); err != nil {
			return nil, err
		}
		resultados = append(resultados, map[string]string{
			"acorde": acorde,
			"letra":  letra,
		})
	}

	if err := rows.Err(); err != nil {
		return nil, err
	}

	return resultados, nil
}

func consultaLineasConAcordes(id string, tono string) ([]LineaConAcordes, error) {
	queryLineas := `
		SELECT
			lc.id_lineas_canciones,
			lc.texto
		FROM
			lineas_canciones lc
		WHERE
			id_estructura_canciones in ( select id_estructura_canciones from estructura_canciones where id_canciones = ?)`

	rows, err := db.Query(queryLineas, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	lineas := make([]*LineaConAcordes, 0)
	lineaMap := make(map[int]*LineaConAcordes)

	for rows.Next() {
		var idLinea int
		var texto string
		if err := rows.Scan(&idLinea, &texto); err != nil {
			return nil, err
		}
		linea := &LineaConAcordes{
			Texto:   texto,
			Acordes: []Acorde{},
		}
		lineas = append(lineas, linea)
		lineaMap[idLinea] = linea
	}

	queryAcordes := `
		SELECT
			al.id_lineas_canciones,
			al.id_acordes_linea,
			concat( (SELECT tonalidades.codigo FROM tonalidades WHERE tonalidades.grado = al.grado + ?),
			        IFNULL(triadas.triadas, ''),
					IFNULL(extensiones.extensiones, '') ) AS codigo,
			al.ubicacion,
			al.duracion
		FROM
			acordes_linea al
		LEFT JOIN
			triadas ON al.id_triadas = triadas.id_triadas
		LEFT JOIN
			extensiones ON al.id_extensiones = extensiones.id_extensiones
		WHERE
			al.id_lineas_canciones IN (SELECT lc.id_lineas_canciones FROM lineas_canciones lc WHERE lc.id_estructura_canciones IN ( select id_estructura_canciones from estructura_canciones where id_canciones = ?))`

	rows, err = db.Query(queryAcordes, tono, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var idLinea, idAcorde int
		var codigo string
		var ubicacion int
		var duracion int
		if err := rows.Scan(&idLinea, &idAcorde, &codigo, &ubicacion, &duracion); err != nil {
			return nil, err
		}
		if linea, exists := lineaMap[idLinea]; exists {
			acorde := Acorde{
				Codigo:    codigo,
				Ubicacion:    ubicacion,
				Duracion:    duracion,
			}
			linea.Acordes = append(linea.Acordes, acorde)
		} else {
			log.Printf("No se encontró línea para idLinea=%d\n", idLinea)
		}
	}

	// Convertir slice de punteros a slice de valores para retornar
	lineasFinal := make([]LineaConAcordes, len(lineas))
	for i, linea := range lineas {
		lineasFinal[i] = *linea
	}
	return lineasFinal, nil
}


func consultaTipoServicio() ([]map[string]interface{}, error) {
	rows, err := db.Query("SELECT id_tipo_servicio, descripcion FROM Tipo_Servicio WHERE ff_baja IS NULL")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var tipoServicio []map[string]interface{}
	for rows.Next() {
		var id int
		var descripcion string
		if err := rows.Scan(&id, &descripcion); err != nil {
			return nil, err
		}
		tipoServicio = append(tipoServicio, map[string]interface{}{
			"id_tipo_servicio": id,
			"descripcion":      descripcion,
		})
	}
	return tipoServicio, nil
}

func consultaMinisterios() ([]map[string]interface{}, error) {
	rows, err := db.Query("SELECT id_ministerio, descripcion FROM Ministerio WHERE ff_baja IS NULL")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var ministerios []map[string]interface{}
	for rows.Next() {
		var id int
		var descripcion string
		if err := rows.Scan(&id, &descripcion); err != nil {
			return nil, err
		}
		ministerios = append(ministerios, map[string]interface{}{
			"id_ministerio": id,
			"descripcion":   descripcion,
		})
	}
	return ministerios, nil
}

func consultaResponsabilidades() ([]map[string]interface{}, error) {
	rows, err := db.Query("SELECT id_responsabilidad, descripcion FROM Responsabilidad WHERE ff_baja IS NULL")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var responsabilidades []map[string]interface{}
	for rows.Next() {
		var id int
		var descripcion string
		if err := rows.Scan(&id, &descripcion); err != nil {
			return nil, err
		}
		responsabilidades = append(responsabilidades, map[string]interface{}{
			"id_responsabilidad": id,
			"descripcion":        descripcion,
		})
	}
	return responsabilidades, nil
}

func consultaHermanos() ([]map[string]interface{}, error) {
	rows, err := db.Query("SELECT id_hermano, nombre, apellido, direccion, DATE_FORMAT(fecha_nacimiento, '%d/%m/%Y') AS fecha_nacimiento FROM Hermano WHERE ff_baja IS NULL")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var hermanos []map[string]interface{}
	for rows.Next() {
		var id int
		var nombre, apellido, direccion, fechaNacimiento string
		if err := rows.Scan(&id, &nombre, &apellido, &direccion, &fechaNacimiento); err != nil {
			return nil, err
		}
		hermanos = append(hermanos, map[string]interface{}{
			"id_hermano":       id,
			"nombre":           nombre,
			"apellido":         apellido,
			"direccion":        direccion,
			"fecha_nacimiento": fechaNacimiento,
		})
	}
	return hermanos, nil
}

// consultaServicios consulta los servicios en la base de datos con los filtros proporcionados
func consultaServicios(idServicio *int, fechaDesde, fechaHasta *string) ([]map[string]interface{}, error) {
    query := `
        SELECT 
            s.id_servicio,
            s.id_tipo_servicio,
            s.ff_programada,
            s.ff_prueba,
            s.duracion_servicio,
            s.id_lugar_servicio,
            s.observaciones,
            s.ff_alta,
            s.ff_baja,
            ts.descripcion AS servicio_descripcion,
            h.id_hermano,
            CONCAT(h.nombre, ' ', h.apellido) AS nombre_hermano,
            sc.id_canciones,
            cn.nombre AS nombre_cancion,
            sc.tonalidad
        FROM 
            Servicio s
        INNER JOIN Tipo_Servicio ts ON s.id_tipo_servicio = ts.id_tipo_servicio
        LEFT JOIN Hermano_Servicio hs ON s.id_servicio = hs.id_servicio
        LEFT JOIN Hermano h ON hs.id_hermano = h.id_hermano
        LEFT JOIN Servicio_Cancion sc ON s.id_servicio = sc.id_servicio
        LEFT JOIN canciones cn ON sc.id_canciones = cn.id_canciones
        WHERE 
            s.ff_baja IS NULL
    `

    // Agregar filtros según los parámetros recibidos
    if idServicio != nil {
        query += " AND s.id_servicio = ?"
    } else {
        if fechaDesde != nil {
            query += " AND s.ff_programada >= STR_TO_DATE(?, '%d-%m-%Y')"
        }
        if fechaHasta != nil {
            query += " AND s.ff_programada <= STR_TO_DATE(?, '%d-%m-%Y')"
        }
    }

    query += `
        ORDER BY 
            s.id_servicio, h.id_hermano, sc.id_canciones
    `

    args := []interface{}{}
    if idServicio != nil {
        args = append(args, *idServicio)
    } else {
        if fechaDesde != nil {
            args = append(args, *fechaDesde)
        }
        if fechaHasta != nil {
            args = append(args, *fechaHasta)
        }
    }

    rows, err := db.Query(query, args...)
    if err != nil {
        return nil, err
    }
    defer rows.Close()

    serviciosMap := make(map[int]map[string]interface{})
    for rows.Next() {
        var idServicio, idTipoServicio, duracionServicio, idLugarServicio, idHermano, idCanciones *int
        var ffProgramada, ffPrueba, ffAlta, ffBaja, observaciones, servicioDescripcion, nombreHermano, nombreCancion, tonalidad *string

        if err := rows.Scan(
            &idServicio, &idTipoServicio, &ffProgramada, &ffPrueba, &duracionServicio,
            &idLugarServicio, &observaciones, &ffAlta, &ffBaja, &servicioDescripcion,
            &idHermano, &nombreHermano, &idCanciones, &nombreCancion, &tonalidad,
        ); err != nil {
            return nil, err
        }

        // Crear o actualizar el servicio en el mapa
        if _, exists := serviciosMap[*idServicio]; !exists {
            serviciosMap[*idServicio] = map[string]interface{}{
                "id_servicio":          ifNotNil(idServicio, 0),
                "id_tipo_servicio":     ifNotNil(idTipoServicio, 0),
                "ff_programada":        ifNotNil(ffProgramada, ""),
                "ff_prueba":            ifNotNil(ffPrueba, ""),
                "duracion_servicio":    ifNotNil(duracionServicio, 0),
                "id_lugar_servicio":    ifNotNil(idLugarServicio, 0),
                "observaciones":        ifNotNil(observaciones, ""),
                "ff_alta":              ifNotNil(ffAlta, ""),
                "ff_baja":              ifNotNil(ffBaja, ""),
                "servicio_descripcion": ifNotNil(servicioDescripcion, ""),
                "hermanos":             []map[string]interface{}{},
                "canciones":            []map[string]interface{}{},
            }
        }

        // Agregar hermano al servicio
        if idHermano != nil {
            hermanos := serviciosMap[*idServicio]["hermanos"].([]map[string]interface{})
            hermanos = append(hermanos, map[string]interface{}{
                "id_hermano":    ifNotNil(idHermano, 0),
                "nombre_hermano": ifNotNil(nombreHermano, ""),
            })
            serviciosMap[*idServicio]["hermanos"] = hermanos
        }

        // Agregar canción al servicio
        if nombreCancion != nil {
            canciones := serviciosMap[*idServicio]["canciones"].([]map[string]interface{})
            canciones = append(canciones, map[string]interface{}{
                "nombre":    ifNotNil(nombreCancion, ""),
                "tonalidad": ifNotNil(tonalidad, ""),
            })
            serviciosMap[*idServicio]["canciones"] = canciones
        }
    }

    var servicios []map[string]interface{}
    for _, servicio := range serviciosMap {
        servicios = append(servicios, servicio)
    }

    return servicios, nil
}



// Helper function to handle nil pointers.
func ifNotNil[T any](ptr *T, defaultValue T) T {
    if ptr != nil {
        return *ptr
    }
    return defaultValue
}


func removeAccents(input string) string {
    replacer := strings.NewReplacer(
        "á", "a", "é", "e", "í", "i", "ó", "o", "ú", "u",
        "Á", "A", "É", "E", "Í", "I", "Ó", "O", "Ú", "U",
        "ñ", "n", "Ñ", "N",
    )
    return replacer.Replace(input)
}

func generarPDFLetrasHandler(w http.ResponseWriter, r *http.Request) {
    var requestBody struct {
        ServiceID int `json:"id_servicio"`
    }

    err := json.NewDecoder(r.Body).Decode(&requestBody)
    if err != nil {
        http.Error(w, "Invalid JSON", http.StatusBadRequest)
        return
    }

    if requestBody.ServiceID == 0 {
        http.Error(w, "Service ID is required", http.StatusBadRequest)
        return
    }

    // Consulta SQL para obtener la fecha del servicio y el tipo de servicio
    var serviceDate, serviceType string
    err = db.QueryRow(`
        SELECT s.ff_programada, ts.descripcion
        FROM Servicio s
        INNER JOIN Tipo_Servicio ts ON s.id_tipo_servicio = ts.id_tipo_servicio
        WHERE s.id_servicio = ?
    `, requestBody.ServiceID).Scan(&serviceDate, &serviceType)
    if err != nil {
        log.Printf("Error fetching service data: %v", err)
        http.Error(w, "Error fetching service data", http.StatusInternalServerError)
        return
    }

    // Consulta SQL para obtener las letras organizadas por estructura
    query := `
        SELECT 
            c.id_canciones AS song_id, 
            c.nombre AS title, 
            tl.descripcion AS structure_name,
            lc.texto AS line_text
        FROM Servicio_Cancion sc
        INNER JOIN canciones c ON sc.id_canciones = c.id_canciones
        INNER JOIN estructura_canciones ec ON c.id_canciones = ec.id_canciones
        INNER JOIN lineas_canciones lc ON ec.id_estructura_canciones = lc.id_estructura_canciones
        INNER JOIN tipos_linea tl ON ec.id_tipo_linea = tl.id
        WHERE sc.id_servicio = ?
        ORDER BY c.id_canciones, ec.posicion_estructura, lc.linea_numero;
    `

    rows, err := db.Query(query, requestBody.ServiceID)
    if err != nil {
        log.Printf("Error fetching data: %v", err)
        http.Error(w, "Error fetching data", http.StatusInternalServerError)
        return
    }
    defer rows.Close()

    type Line struct {
        Text string
    }
    type Part struct {
        Name  string
        Lines []Line
    }
    type Song struct {
        Title string
        Parts []Part
    }

    songs := make(map[int]Song)

    for rows.Next() {
        var songID int
        var title, structureName, lineText string

        if err := rows.Scan(&songID, &title, &structureName, &lineText); err != nil {
            log.Printf("Error processing data: %v", err)
            http.Error(w, "Error processing data", http.StatusInternalServerError)
            return
        }

        title = strings.ToUpper(removeAccents(title))
        structureName = strings.ToUpper(removeAccents(structureName))
        lineText = strings.ToUpper(removeAccents(lineText))

        if _, exists := songs[songID]; !exists {
            songs[songID] = Song{
                Title: title,
                Parts: []Part{},
            }
        }

        song := songs[songID]
        partIndex := -1
        for i, part := range song.Parts {
            if part.Name == structureName {
                partIndex = i
                break
            }
        }

        if partIndex == -1 {
            song.Parts = append(song.Parts, Part{
                Name:  structureName,
                Lines: []Line{},
            })
            partIndex = len(song.Parts) - 1
        }

        song.Parts[partIndex].Lines = append(song.Parts[partIndex].Lines, Line{
            Text: lineText,
        })

        songs[songID] = song
    }

    if err := rows.Err(); err != nil {
        log.Printf("Error iterating rows: %v", err)
        http.Error(w, "Error processing data", http.StatusInternalServerError)
        return
    }

    pdf := gofpdf.New("P", "mm", "A4", "")
    pdf.SetFont("Courier", "", 12)

    for _, song := range songs {
        pdf.AddPage()

        // Agregar la fecha del servicio y el tipo de servicio en la parte superior de cada página
        pdf.SetFont("Courier", "B", 12)
        pdf.Cell(0, 10, fmt.Sprintf("Fecha del Servicio: %s", serviceDate))
        pdf.Ln(5)
        pdf.Cell(0, 10, fmt.Sprintf("Tipo de Servicio: %s", serviceType))
        pdf.Ln(10)

        pdf.SetFont("Courier", "B", 14)
        pdf.Cell(0, 10, song.Title)
        pdf.Ln(10)

        pdf.SetFont("Courier", "", 12)
        for _, part := range song.Parts {
            pdf.SetFont("Courier", "B", 12)
            pdf.Cell(0, 10, part.Name)
            pdf.Ln(8)

            pdf.SetFont("Courier", "", 12)
            for _, line := range part.Lines {
                pdf.Cell(0, 10, line.Text)
                pdf.Ln(6)
            }
            pdf.Ln(5)
        }
    }

    w.Header().Set("Content-Type", "application/pdf")
    w.Header().Set("Content-Disposition", "inline; filename=lyrics.pdf")
    if err := pdf.Output(w); err != nil {
        log.Printf("Error generating PDF: %v", err)
        http.Error(w, "Error generating PDF", http.StatusInternalServerError)
    }
}

func generarPDFLetrasConAcordesHandler(w http.ResponseWriter, r *http.Request) {
    var requestBody struct {
        ServiceID int `json:"id_servicio"`
    }

    err := json.NewDecoder(r.Body).Decode(&requestBody)
    if err != nil {
        http.Error(w, "Invalid JSON", http.StatusBadRequest)
        return
    }

    if requestBody.ServiceID == 0 {
        http.Error(w, "Service ID is required", http.StatusBadRequest)
        return
    }

    // Consulta SQL para obtener la fecha del servicio y el tipo de servicio
    var serviceDate, serviceType string
    err = db.QueryRow(`
        SELECT s.ff_programada, ts.descripcion
        FROM Servicio s
        INNER JOIN Tipo_Servicio ts ON s.id_tipo_servicio = ts.id_tipo_servicio
        WHERE s.id_servicio = ?
    `, requestBody.ServiceID).Scan(&serviceDate, &serviceType)
    if err != nil {
        log.Printf("Error fetching service data: %v", err)
        http.Error(w, "Error fetching service data", http.StatusInternalServerError)
        return
    }

    // Consulta SQL para obtener las letras organizadas por estructura y los acordes
    query := `
        SELECT 
            c.id_canciones AS song_id, 
            c.nombre AS title, 
            t.codigo AS tonality_code,
            c.tiempo AS tempo,
            c.autor AS author,
            tl.descripcion AS structure_name,
            lc.texto AS line_text,
            al.ubicacion-1 AS chord_position,
            concat((select codigo from tonalidades where grado=al.grado+sc.tonalidad-1),ifnull((select triadas from triadas where id_triadas=al.id_triadas),''),ifnull((select extensiones from extensiones where id_extensiones=al.id_extensiones),'')) AS chord,
            sc.tonalidad AS service_tonality
        FROM Servicio_Cancion sc
        INNER JOIN canciones c ON sc.id_canciones = c.id_canciones
        INNER JOIN estructura_canciones ec ON c.id_canciones = ec.id_canciones
        INNER JOIN lineas_canciones lc ON ec.id_estructura_canciones = lc.id_estructura_canciones
        INNER JOIN tipos_linea tl ON ec.id_tipo_linea = tl.id
        LEFT JOIN acordes_linea al ON lc.id_lineas_canciones = al.id_lineas_canciones
        LEFT JOIN tonalidades t ON sc.tonalidad = t.grado
        WHERE sc.id_servicio = ?
        ORDER BY c.id_canciones, ec.posicion_estructura, lc.linea_numero, al.ubicacion;
    `

    rows, err := db.Query(query, requestBody.ServiceID)
    if err != nil {
        log.Printf("Error fetching data: %v", err)
        http.Error(w, "Error fetching data", http.StatusInternalServerError)
        return
    }
    defer rows.Close()

    type Chord struct {
        Position int
        Chord    string
    }
    type Line struct {
        Text   string
        Chords []Chord
    }
    type Part struct {
        Name  string
        Lines []Line
    }
    type Song struct {
        Title      string
        Tonality   string
        Tempo      int
        Author     string
        Parts      []Part
    }

    songs := make(map[int]Song)

    for rows.Next() {
        var songID int
        var title, tonalityCode, author, structureName, lineText, chord string
        var tempo sql.NullInt64
        var chordPosition sql.NullInt64
        var serviceTonality int

        if err := rows.Scan(&songID, &title, &tonalityCode, &tempo, &author, &structureName, &lineText, &chordPosition, &chord, &serviceTonality); err != nil {
            log.Printf("Error processing data: %v", err)
            http.Error(w, "Error processing data", http.StatusInternalServerError)
            return
        }

        title = strings.ToUpper(removeAccents(title))
        tonalityCode = strings.ToUpper(removeAccents(tonalityCode))
        author = strings.ToUpper(removeAccents(author))
        structureName = strings.ToUpper(removeAccents(structureName))
        lineText = strings.ToUpper(removeAccents(lineText))

        if _, exists := songs[songID]; !exists {
            songs[songID] = Song{
                Title:      title,
                Tonality:   tonalityCode,
                Tempo:      int(tempo.Int64),
                Author:     author,
                Parts:      []Part{},
            }
        }

        song := songs[songID]
        partIndex := -1
        for i, part := range song.Parts {
            if part.Name == structureName {
                partIndex = i
                break
            }
        }

        if partIndex == -1 {
            song.Parts = append(song.Parts, Part{
                Name:  structureName,
                Lines: []Line{},
            })
            partIndex = len(song.Parts) - 1
        }

        lineIndex := -1
        for i, line := range song.Parts[partIndex].Lines {
            if line.Text == lineText {
                lineIndex = i
                break
            }
        }

        if lineIndex == -1 {
            song.Parts[partIndex].Lines = append(song.Parts[partIndex].Lines, Line{
                Text:   lineText,
                Chords: []Chord{},
            })
            lineIndex = len(song.Parts[partIndex].Lines) - 1
        }

        if chordPosition.Valid {
            song.Parts[partIndex].Lines[lineIndex].Chords = append(song.Parts[partIndex].Lines[lineIndex].Chords, Chord{
                Position: int(chordPosition.Int64),
                Chord:    chord,
            })
        }

        songs[songID] = song
    }

    if err := rows.Err(); err != nil {
        log.Printf("Error iterating rows: %v", err)
        http.Error(w, "Error processing data", http.StatusInternalServerError)
        return
    }

    // Crear archivo PDF
    pdf := gofpdf.New("P", "mm", "A4", "")
    pdf.SetFont("Courier", "", 12)

    // Crear archivo de texto
    textFile, err := os.Create("lyrics.txt")
    if err != nil {
        log.Printf("Error creating text file: %v", err)
        http.Error(w, "Error creating text file", http.StatusInternalServerError)
        return
    }
    defer textFile.Close()

    for _, song := range songs {
        pdf.AddPage()

        // Agregar la fecha del servicio y el tipo de servicio en la parte superior de cada página
        pdf.SetFont("Courier", "B", 12)
        pdf.Cell(0, 10, fmt.Sprintf("Fecha del Servicio: %s", serviceDate))
        pdf.Ln(5)
        pdf.Cell(0, 10, fmt.Sprintf("Tipo de Servicio: %s", serviceType))
        pdf.Ln(10)

        pdf.SetFont("Courier", "B", 14)
        pdf.Cell(0, 10, song.Title)
        pdf.Ln(10)

        // Agregar la tonalidad, el tiempo y el autor
        pdf.SetFont("Courier", "", 12)
        pdf.Cell(0, 10, fmt.Sprintf("Tonalidad: %s", song.Tonality))
        pdf.Ln(6)
        pdf.Cell(0, 10, fmt.Sprintf("Tiempo: %d", song.Tempo))
        pdf.Ln(6)
        pdf.Cell(0, 10, fmt.Sprintf("Autor: %s", song.Author))
        pdf.Ln(10)

        // Escribir en el archivo de texto
        fmt.Fprintf(textFile, "Fecha del Servicio: %s\n", serviceDate)
        fmt.Fprintf(textFile, "Tipo de Servicio: %s\n", serviceType)
        fmt.Fprintf(textFile, "Título: %s\n", song.Title)
        fmt.Fprintf(textFile, "Tonalidad: %s\n", song.Tonality)
        fmt.Fprintf(textFile, "Tiempo: %d\n", song.Tempo)
        fmt.Fprintf(textFile, "Autor: %s\n\n", song.Author)

        pdf.SetFont("Courier", "", 12)
        for _, part := range song.Parts {
            pdf.SetFont("Courier", "B", 12)
            pdf.Cell(0, 10, part.Name)
            pdf.Ln(8)

            // Escribir en el archivo de texto
            fmt.Fprintf(textFile, "%s\n", part.Name)

            pdf.SetFont("Courier", "", 12)
            for _, line := range part.Lines {
                // Imprimir acordes
                chordLine := make([]rune, len(line.Text))
                for i := range chordLine {
                    chordLine[i] = ' '
                }
                for _, chord := range line.Chords {
                    if chord.Position < len(chordLine) {
                        copy(chordLine[chord.Position:], []rune(chord.Chord))
                    }
                }
                pdf.Cell(0, 10, string(chordLine))
                pdf.Ln(6)

                // Imprimir texto de la línea
                pdf.Cell(0, 10, line.Text)
                pdf.Ln(6)

                // Escribir en el archivo de texto
                fmt.Fprintf(textFile, "%s\n%s\n", string(chordLine), line.Text)
            }
            pdf.Ln(5)

            // Escribir en el archivo de texto
            fmt.Fprintln(textFile)
        }

        // Escribir en el archivo de texto
        fmt.Fprintln(textFile)
    }

    w.Header().Set("Content-Type", "application/pdf")
    w.Header().Set("Content-Disposition", "inline; filename=lyrics.pdf")
    if err := pdf.Output(w); err != nil {
        log.Printf("Error generating PDF: %v", err)
        http.Error(w, "Error generating PDF", http.StatusInternalServerError)
    }
}
