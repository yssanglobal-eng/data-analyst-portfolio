# 🦷 Análisis Operacional — ClinicAssist

Análisis de datos reales de **ClinicAssist**, un SaaS activo que gestiona clínicas dentales en México.  
El objetivo es responder preguntas clave de negocio sobre ingresos, demanda y desempeño operativo.

---

## 🗂 Contexto

ClinicAssist opera **15 clínicas dentales** en 8 estados de México.  
La base de datos incluye clínicas, pacientes, dentistas, citas y tratamientos.

| Tabla | Registros |
|---|---|
| Clínicas | 15 |
| Pacientes | 30 |
| Citas | 77 |
| Tratamientos | 47 |

---

## ❓ Preguntas de negocio

1. ¿Qué tratamientos generan más ingresos?
2. ¿Cuál es el ticket promedio por tipo de servicio?
3. ¿Qué ciudad tiene el mercado más rentable?
4. ¿Qué dentista tiene mayor carga de trabajo?
5. ¿En qué mes hay más actividad?
6. ¿Qué clínica tiene más pacientes?

---

## 📊 Hallazgos clave

- **Endodoncia** genera el 43% del ingreso total ($40,500) con solo algunos procedimientos
- Una endodoncia vale **6.7x más** que una limpieza en ticket promedio
- **Monterrey** es el mercado más rentable por ticket promedio ($2,320)
- El **primer trimestre** (Ene–Mar) concentra la mayor demanda del año
- CDMX y Monterrey empatan como las clínicas con más pacientes (9 c/u)

---

## 🛠 Tecnologías

- **PostgreSQL** — motor de base de datos
- **DBeaver** — cliente SQL
- **Git + GitHub** — control de versiones

---

## ▶️ Cómo ejecutar

1. Clona el repositorio
2. Conéctate a una instancia de PostgreSQL con el esquema de ClinicAssist
3. Abre `queries.sql` en DBeaver o cualquier cliente SQL
4. Ejecuta cada query de forma individual