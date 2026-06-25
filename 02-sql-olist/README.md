# 02 · Análisis SQL — Olist E-Commerce

> Análisis exploratorio del dataset público de Olist (e-commerce brasileño) usando SQL sobre PostgreSQL. El objetivo es responder preguntas de negocio reales sobre concentración geográfica de ventas, estado de las órdenes y categorías más rentables.

---

## 🇪🇸 Español

### Contexto del proyecto
Olist es un marketplace brasileño. El dataset contiene **~550,000 registros distribuidos en 8 tablas** relacionadas (órdenes, clientes, items, productos, pagos, reseñas, vendedores y geolocalización). Cargué los datos en **PostgreSQL** y trabajé las consultas en **DBeaver**.

Este proyecto demuestra:
- Lectura e interpretación de un esquema relacional real.
- JOINs entre tablas por su llave correcta.
- Agregaciones (`COUNT`, `SUM`) con `GROUP BY`, `HAVING` y `ORDER BY`.
- Traducción de resultados técnicos a hallazgos de negocio.

### Preguntas de negocio
1. ¿Cómo se distribuyen las órdenes según su estado de entrega?
2. ¿Qué estados de Brasil concentran más volumen de órdenes?
3. ¿Qué categorías de producto generan mayor facturación?

### Hallazgos principales
- **La operación logística es saludable:** la gran mayoría de las órdenes terminan en estado `delivered` (96,478), muy por encima de `shipped` (1,107). El resto de estados queda por debajo del umbral de 1,000.
- **Fuerte concentración geográfica:** São Paulo (SP) acumula 41,746 órdenes — más que los siguientes tres estados (RJ, MG, RS) sumados. Confirma que la demanda se concentra en el sureste económico de Brasil.
- **La facturación se concentra en pocas categorías:** *beleza_saude* (salud y belleza) lidera con ~1.26M, seguida de relojes/regalos y cama-mesa-baño. El top 5 marca dónde está el dinero del marketplace.

### Estructura del repositorio
```
02-sql-olist/
├── README.md
└── queries/
    ├── 01_ordenes_por_status.sql
    ├── 02_top_estados_por_ordenes.sql
    └── 03_top_categorias_por_facturacion.sql
```

### Stack
SQL · PostgreSQL · DBeaver

### Próximos pasos
- [ ] Agregar 3 consultas más (análisis temporal, ticket promedio, tiempos de entrega).
- [ ] Construir un dashboard en Power BI con los 6 reportes.

---

## 🇬🇧 English

### Project context
Olist is a Brazilian marketplace. The dataset contains **~550,000 records across 8 related tables** (orders, customers, items, products, payments, reviews, sellers, and geolocation). I loaded the data into **PostgreSQL** and ran the queries in **DBeaver**.

This project demonstrates:
- Reading and interpreting a real relational schema.
- JOINs between tables on their correct key.
- Aggregations (`COUNT`, `SUM`) with `GROUP BY`, `HAVING`, and `ORDER BY`.
- Translating technical results into business insights.

### Business questions
1. How are orders distributed by delivery status?
2. Which Brazilian states concentrate the most order volume?
3. Which product categories generate the most revenue?

### Key findings
- **Logistics are healthy:** the vast majority of orders end up `delivered` (96,478), far above `shipped` (1,107). Every other status falls below the 1,000 threshold.
- **Strong geographic concentration:** São Paulo (SP) holds 41,746 orders — more than the next three states (RJ, MG, RS) combined. This confirms demand is concentrated in Brazil's economic southeast.
- **Revenue concentrates in a few categories:** *beleza_saude* (health & beauty) leads with ~1.26M, followed by watches/gifts and bed-table-bath. The top 5 shows where the marketplace money is.

### Stack
SQL · PostgreSQL · DBeaver

### Next steps
- [ ] Add 3 more queries (time-based analysis, average ticket, delivery times).
- [ ] Build a Power BI dashboard with the 6 reports.
