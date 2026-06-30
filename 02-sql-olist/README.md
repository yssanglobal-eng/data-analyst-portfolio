# 02 · Análisis SQL — Olist E-Commerce

> Análisis exploratorio del dataset público de Olist (e-commerce brasileño) usando SQL sobre PostgreSQL. El objetivo es responder preguntas de negocio reales sobre concentración geográfica de ventas, estado de las órdenes, categorías más rentables y tiempos de entrega.

---

## 🇪🇸 Español

### Contexto del proyecto
Olist es un marketplace brasileño. El dataset contiene **~550,000 registros distribuidos en 8 tablas** relacionadas (órdenes, clientes, items, productos, pagos, reseñas, vendedores y geolocalización). Cargué los datos en **PostgreSQL** y trabajé las consultas en **DBeaver**.

Este proyecto demuestra:
- Lectura e interpretación de un esquema relacional real.
- JOINs entre tablas por su llave correcta.
- Agregaciones (`COUNT`, `SUM`, `AVG`) con `GROUP BY`, `HAVING` y `ORDER BY`.
- Funciones de fecha (`DATE_TRUNC`, `EXTRACT`, resta de fechas con `CAST`).
- Traducción de resultados técnicos a hallazgos de negocio.

### Consultas
| # | Archivo | Pregunta de negocio | Conceptos |
|---|---------|--------------------|-----------|
| 01 | `01_ordenes_por_status.sql` | ¿Cómo se distribuyen las órdenes por estado? | GROUP BY, COUNT, HAVING |
| 02 | `02_top_estados_por_ordenes.sql` | ¿Qué estados concentran más órdenes? | JOIN, GROUP BY, LIMIT |
| 03 | `03_top_categorias_por_facturacion.sql` | ¿Qué categorías facturan más? | JOIN, SUM |
| 04 | `04_ordenes_por_mes.sql` | ¿Cómo se distribuyen las órdenes por mes? | DATE_TRUNC |
| 05 | `05_ordenes_por_anio.sql` | ¿Cuántas órdenes por año? | EXTRACT |
| 06 | `06_tiempo_promedio_entrega.sql` | ¿Días promedio de compra a entrega? | AVG, resta de fechas, CAST |

### Hallazgos principales
- **La operación logística es saludable:** la gran mayoría de las órdenes terminan en estado `delivered` (96,478), muy por encima de `shipped` (1,107). El resto de estados queda por debajo del umbral de 1,000.
- **Fuerte concentración geográfica:** São Paulo (SP) acumula 41,746 órdenes — más que los siguientes tres estados (RJ, MG, RS) sumados. Confirma que la demanda se concentra en el sureste económico de Brasil.
- **La facturación se concentra en pocas categorías:** *beleza_saude* (salud y belleza) lidera con ~1.26M, seguida de relojes/regalos y cama-mesa-baño. El top 5 marca dónde está el dinero del marketplace.
- **Tiempos de entrega:** se calcula el promedio de días de compra a entrega como métrica clave para evaluar la experiencia del cliente.

### Estructura del repositorio
```
02-sql-olist/
├── README.md
└── queries/
    ├── 01_ordenes_por_status.sql
    ├── 02_top_estados_por_ordenes.sql
    ├── 03_top_categorias_por_facturacion.sql
    ├── 04_ordenes_por_mes.sql
    ├── 05_ordenes_por_anio.sql
    └── 06_tiempo_promedio_entrega.sql
```

### Stack
SQL · PostgreSQL · DBeaver

### Próximos pasos
- [x] Agregar 3 consultas más (análisis temporal y tiempos de entrega).
- [ ] Construir un dashboard en Power BI con los 6 reportes (tabla de fechas + medidas DAX).

---

## 🇬🇧 English

### Project context
Olist is a Brazilian marketplace. The dataset contains **~550,000 records across 8 related tables** (orders, customers, items, products, payments, reviews, sellers, and geolocation). I loaded the data into **PostgreSQL** and ran the queries in **DBeaver**.

This project demonstrates:
- Reading and interpreting a real relational schema.
- JOINs between tables on their correct key.
- Aggregations (`COUNT`, `SUM`, `AVG`) with `GROUP BY`, `HAVING`, and `ORDER BY`.
- Date functions (`DATE_TRUNC`, `EXTRACT`, date subtraction with `CAST`).
- Translating technical results into business insights.

### Queries
| # | File | Business question | Concepts |
|---|------|------------------|----------|
| 01 | `01_ordenes_por_status.sql` | How are orders distributed by status? | GROUP BY, COUNT, HAVING |
| 02 | `02_top_estados_por_ordenes.sql` | Which states concentrate the most orders? | JOIN, GROUP BY, LIMIT |
| 03 | `03_top_categorias_por_facturacion.sql` | Which categories generate the most revenue? | JOIN, SUM |
| 04 | `04_ordenes_por_mes.sql` | How are orders distributed by month? | DATE_TRUNC |
| 05 | `05_ordenes_por_anio.sql` | How many orders per year? | EXTRACT |
| 06 | `06_tiempo_promedio_entrega.sql` | Average days from purchase to delivery? | AVG, date subtraction, CAST |

### Key findings
- **Logistics are healthy:** the vast majority of orders end up `delivered` (96,478), far above `shipped` (1,107). Every other status falls below the 1,000 threshold.
- **Strong geographic concentration:** São Paulo (SP) holds 41,746 orders — more than the next three states (RJ, MG, RS) combined. This confirms demand is concentrated in Brazil's economic southeast.
- **Revenue concentrates in a few categories:** *beleza_saude* (health & beauty) leads with ~1.26M, followed by watches/gifts and bed-table-bath. The top 5 shows where the marketplace money is.
- **Delivery times:** the average purchase-to-delivery time is computed as a key metric for evaluating customer experience.

### Stack
SQL · PostgreSQL · DBeaver

### Next steps
- [x] Add 3 more queries (time-based analysis and delivery times).
- [ ] Build a Power BI dashboard with the 6 reports (date table + DAX measures).
