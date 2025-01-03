Hermano (tabla genérica para la congregación)
- id_hermano
- nombre
- apellido
- direccion
- fecha_nacimiento
- observaciones
- ff_alta
- ff_baja

Ministerio (Por ahora solo: UV - Alabanza & Adoración)
- id_ministerio
- descripcion
- observaciones
- ff_alta
- ff_baja

Responsabilidad (Encargado/Ayudante/Musico/Cantante)
- id_responsabilidad
- descripcion
- observaciones
- ff_alta
- ff_baja

Responsabilidad_Hermano_Ministerio
- id_responsabilidad_hermano_ministerio
- id_ministerio
- id_hermano
- id_responsabilidad
- observaciones
- ff_alta
- ff_baja

*Un hermano puedetener varias responsabilidades dentro de un ministerio

Tipo_Servicio (Santa Cena, 180, Oración, Femenina, 3er Tiempo, etc)
- id_tipo_servicio
- descripcion
- observaciones
- ff_alta
- ff_baja

Servicio
- id_servicio
- id_tipo_servicio
- ff_programada
- observaciones
- ff_alta
- ff_baja

Hermano_servicio
- id_hermano_servicio
- id_hermano
- id_servicio
- observaciones
- ff_alta
- ff_baja

* Un servicio tiene varios hermanos con diferentes responsabilidades dentro del servicio.

