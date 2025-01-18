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

func consultaServiciosHandler(w http.ResponseWriter, r *http.Request) {
	servicios, err := consultaServicios()
	if err != nil {
		http.Error(w, "Error al obtener los servicios", http.StatusInternalServerError)
		log.Printf("Error: %v\n", err)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	if err := json.NewEncoder(w).Encode(servicios); err != nil {
		http.Error(w, "Error al codificar la respuesta", http.StatusInternalServerError)
		log.Printf("Error al codificar JSON: %v\n", err)
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

func consultaServicios() ([]map[string]interface{}, error) {
	query := `
		SELECT 
			s.id_servicio,
			ts.descripcion AS servicio_descripcion,
			GROUP_CONCAT(DISTINCT CONCAT(h.nombre, ' ', h.apellido) ORDER BY h.nombre, h.apellido SEPARATOR ', ') AS nombre_hermanos,
			GROUP_CONCAT(DISTINCT cn.nombre ORDER BY cn.nombre SEPARATOR ', ') AS nombre_canciones,
			DATE_FORMAT(s.ff_programada, '%d/%m/%Y') AS ff_programada
		FROM 
			Servicio s
		INNER JOIN Tipo_Servicio ts ON s.id_tipo_servicio = ts.id_tipo_servicio
		LEFT JOIN Hermano_Servicio hs ON s.id_servicio = hs.id_servicio
		LEFT JOIN Hermano h ON hs.id_hermano = h.id_hermano
		LEFT JOIN Servicio_Cancion sc ON s.id_servicio = sc.id_servicio
		LEFT JOIN canciones cn ON sc.id_canciones = cn.id_canciones
		WHERE 
			s.ff_baja IS NULL
		GROUP BY 
			s.id_servicio, ts.descripcion, s.ff_programada
		ORDER BY 
			s.ff_programada
	`

	rows, err := db.Query(query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var servicios []map[string]interface{}
	for rows.Next() {
		var idServicio int
		var servicioDescripcion, nombreHermanos, nombreCanciones, ffProgramada *string

		if err := rows.Scan(&idServicio, &servicioDescripcion, &nombreHermanos, &nombreCanciones, &ffProgramada); err != nil {
			return nil, err
		}

		hermanos := []string{}
		if nombreHermanos != nil && *nombreHermanos != "" {
			hermanos = strings.Split(*nombreHermanos, ", ")
		}

		canciones := []string{}
		if nombreCanciones != nil && *nombreCanciones != "" {
			canciones = strings.Split(*nombreCanciones, ", ")
		}

		servicios = append(servicios, map[string]interface{}{
			"id_servicio":          idServicio,
			"servicio_descripcion": ifNotNil(servicioDescripcion, ""),
			"nombre_hermanos":      hermanos,
			"nombre_canciones":     canciones,
			"ff_programada":        ifNotNil(ffProgramada, ""),
		})
	}

	return servicios, nil
}

// Helper function to handle nil pointers.
func ifNotNil(ptr *string, defaultValue string) string {
	if ptr != nil {
		return *ptr
	}
	return defaultValue
}
