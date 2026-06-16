/* =============================================================================
   PROYECTO: Análisis Operacional — ClinicAssist
   AUTOR:    yssanglobal-eng
   MOTOR:    PostgreSQL
   FUENTE:   Base de datos real de ClinicAssist (SaaS para clínicas dentales, MX)
   -----------------------------------------------------------------------------
   CONTEXTO DE NEGOCIO
   ClinicAssist es un SaaS que opera 15 clínicas dentales en 8 estados de México.
   Este análisis responde preguntas clave de negocio sobre ingresos, demanda,
   mercados y desempeño operativo, usando datos reales del sistema.

   MODELO DE DATOS (ruta de relaciones entre tablas)
   clinicas ──< pacientes ──< citas ──< tratamientos
     clinic_id     patient_id     cita_id
   ============================================================================= */


/* -----------------------------------------------------------------------------
   QUERY 1 — ¿Qué tratamientos generan más ingresos?
   Objetivo: identificar las líneas de servicio que más facturan.
   Insight:  Endodoncia ($40,500) es el mayor generador de ingresos,
             representando ~43% del ingreso total. Ortodoncia ($28,300)
             y Limpieza ($8,750) completan el top 3.
----------------------------------------------------------------------------- */
SELECT tipo,
       SUM(costo) AS total_ingresos
FROM tratamientos
GROUP BY tipo
ORDER BY total_ingresos DESC;


/* -----------------------------------------------------------------------------
   QUERY 2 — Ticket promedio por tipo de tratamiento
   Objetivo: medir el valor unitario de cada servicio (no solo el volumen).
   Insight:  Una endodoncia ($4,500) vale 6.7x más que una limpieza ($673).
             Ortodoncia promedia $2,572. Útil para estrategia de precios y
             para enfocar esfuerzos comerciales en servicios de alto valor.
   Nota:     ROUND(..., 2) evita decimales infinitos en reportes monetarios.
----------------------------------------------------------------------------- */
SELECT tipo,
       ROUND(AVG(costo), 2) AS ticket_promedio
FROM tratamientos
GROUP BY tipo
ORDER BY ticket_promedio DESC;


/* -----------------------------------------------------------------------------
   QUERY 3 — ¿Qué ciudad tiene el ticket promedio más alto?
   Objetivo: comparar la rentabilidad por mercado geográfico.
   Insight:  Monterrey ($2,320) es el mercado más rentable por ticket,
             seguido de CDMX ($2,071) y Culiacán ($1,708).
   Técnica:  JOIN en cadena de 4 tablas para conectar ciudad (clinicas)
             con costo (tratamientos), pasando por pacientes y citas.
             Se especifica tabla.columna para evitar ambigüedad.
----------------------------------------------------------------------------- */
SELECT clinicas.ciudad,
       clinicas.estado,
       ROUND(AVG(tratamientos.costo), 2) AS ticket_promedio
FROM clinicas
JOIN pacientes    ON clinicas.clinic_id   = pacientes.clinic_id
JOIN citas        ON pacientes.patient_id = citas.patient_id
JOIN tratamientos ON citas.cita_id        = tratamientos.cita_id
GROUP BY clinicas.ciudad, clinicas.estado
ORDER BY ticket_promedio DESC;


/* -----------------------------------------------------------------------------
   QUERY 4 — ¿Qué dentista atiende más citas?
   Objetivo: medir la carga de trabajo y productividad por profesional.
   Insight:  Dr. Carlos Mendoza Ríos lidera con 12 citas, seguido del
             Dr. Alejandro Torres Mora con 11. Útil para balancear agendas.
----------------------------------------------------------------------------- */
SELECT dentistas.nombre,
       COUNT(citas.cita_id) AS total_citas
FROM dentistas
JOIN citas ON dentistas.dentist_id = citas.dentist_id
GROUP BY dentistas.nombre
ORDER BY total_citas DESC;


/* -----------------------------------------------------------------------------
   QUERY 5 — ¿En qué mes hay más actividad?
   Objetivo: detectar estacionalidad de la demanda.
   Insight:  El primer trimestre es temporada alta: Enero y Febrero (14 citas
             c/u) y Marzo (13). Útil para planear personal e inventario.
   Técnica:  EXTRACT(MONTH ...) ordena cronológicamente, mientras que
             TO_CHAR(..., 'Month') muestra el nombre legible del mes.
             Ambos van en GROUP BY para agrupar correctamente.
----------------------------------------------------------------------------- */
SELECT TO_CHAR(fecha_hora, 'Month') AS mes,
       COUNT(*) AS total_citas
FROM citas
GROUP BY EXTRACT(MONTH FROM fecha_hora), TO_CHAR(fecha_hora, 'Month')
ORDER BY total_citas DESC;


/* -----------------------------------------------------------------------------
   QUERY 6 — ¿Qué clínica tiene más pacientes?
   Objetivo: identificar las clínicas con mayor base de pacientes.
   Insight:  Clínica Dental CDMX y Centro Dental MTY empatan en el primer
             lugar con 9 pacientes cada una.
----------------------------------------------------------------------------- */
SELECT clinicas.nombre,
       COUNT(pacientes.patient_id) AS total_pacientes
FROM clinicas
JOIN pacientes ON clinicas.clinic_id = pacientes.clinic_id
GROUP BY clinicas.nombre
ORDER BY total_pacientes DESC;

-- Agregaciones — práctica sobre el esquema de ClinicAssist

-- 1. Conteo de citas por estado, de mayor a menor
SELECT status, COUNT(*) AS total_citas
FROM appointments
GROUP BY status
ORDER BY total_citas DESC;

-- 2. Conteo de citas por estado, filtrado a una clínica
SELECT status, COUNT(*) AS total_citas
FROM appointments
WHERE clinic_id = 1
GROUP BY status
ORDER BY total_citas DESC;

-- 3. Estados con más de 10 citas en la clínica 1
SELECT status, COUNT(*) AS total_citas
FROM appointments
WHERE clinic_id = 1
GROUP BY status
HAVING COUNT(*) > 10
ORDER BY total_citas DESC;

-- 4. Número de citas por paciente en la clínica 1
SELECT patient_id, COUNT(*) AS total_citas
FROM appointments
WHERE clinic_id = 1
GROUP BY patient_id
ORDER BY total_citas DESC;