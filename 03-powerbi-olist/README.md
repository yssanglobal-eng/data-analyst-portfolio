# 03 · Dashboard Power BI — Olist E-Commerce

> Dashboard interactivo construido sobre el dataset público de Olist (e-commerce brasileño), conectado directamente a PostgreSQL.

## Stack
Power BI Desktop · PostgreSQL (conexión directa, modo Import) · DAX

## Modelo de datos
- 6 tablas cargadas: `olist_customers`, `olist_order_items`, `olist_order_payments`, `olist_orders`, `olist_products`, `product_category_name_translation`
- Tabla `Calendario` generada con DAX (`ADDCOLUMNS` + `CALENDAR`), marcada como tabla de fechas
- Columna calculada `FechaCompra` para resolver desajuste timestamp/date entre `Calendario` y `olist_orders`

## Medidas DAX

| Medida | Lógica | Propósito |
|---|---|---|
| `Total Pedidos` | `COUNTROWS('public olist_orders')` | Conteo total de órdenes |
| `Pedidos Entregados` | `CALCULATE(..., order_status = "delivered")` | Órdenes completadas |
| `Pedidos Año Anterior` | `SAMEPERIODLASTYEAR(Calendario[Date])` | Comparación YoY |
| `% Crecimiento YoY` | `DIVIDE(Total Pedidos - Pedidos Año Anterior, Pedidos Año Anterior)` | Tasa de crecimiento |
| `Ingresos por Producto` | `SUM('public olist_order_items'[price])` | Ingresos a nivel producto (resuelve limitación de `payment_value`, que vive a nivel orden y no se puede desagregar por categoría) |
| `Tiempo Real de Entrega (días)` | `AVERAGEX(FILTER(delivered), DATEDIFF(purchase, delivered_customer_date, DAY))` | Días reales de entrega |
| `Tiempo Estimado de Entrega (días)` | `AVERAGEX(FILTER(delivered), DATEDIFF(purchase, estimated_delivery_date, DAY))` | Promesa de entrega |

## Visuales del dashboard

1. **KPIs generales** — Total de pedidos, pedidos entregados, pedidos año anterior
2. **Recuento de órdenes por año** — gráfica de columnas
3. **Ingresos por Categoría de Producto** — barras horizontales, Top 10
4. **Tabla comparativa YoY** — Año, Total Pedidos, Pedidos Año Anterior, % Crecimiento, Ingresos Totales
5. **Tiempo de Entrega: Real vs. Estimado** — columnas agrupadas por año
6. **Ingresos por Método de Pago** — gráfica de dona

## Hallazgos clave

- **Concentración de ingresos:** las categorías `health_beauty`, `watches_gifts` y `bed_bath_table` lideran los ingresos por producto, muy por encima del resto del Top 10.
- **Crecimiento sostenido:** los pedidos crecieron 118.89% acumulado entre 2016 y 2018, con una aceleración fuerte en 2017 (+13,608% vs. 2016, año con muestra pequeña).
- **Cumplimiento de entrega:** el tiempo real de entrega se mantiene consistentemente por debajo del tiempo estimado en los tres años — Olist entrega, en promedio, más rápido de lo que promete a sus clientes.
- **Dependencia de tarjeta de crédito:** el 78.3% de los ingresos se concentra en pagos con tarjeta de crédito, frente a 17.9% en boleto y menos del 4% en el resto de los métodos combinados — una posible señal de riesgo de concentración en un solo medio de pago.

## Próximos pasos

- [ ] Formato visual: tema de color coherente, alineación a cuadrícula, encabezado del dashboard
- [ ] Commit final con captura pulida
