/* ============================================================
   05 - Órdenes por año / Orders per year
   ------------------------------------------------------------
   Pregunta de negocio:
   ¿Cuántas órdenes se generaron cada año?
   (Business question: how many orders were placed each year?)

   Conceptos: EXTRACT · GROUP BY · ORDER BY
   Nota: a diferencia de DATE_TRUNC, EXTRACT usa la palabra FROM
   (no coma) y devuelve un NÚMERO (2016, 2017, 2018), no una fecha.
   ============================================================ */

SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS anio,
    COUNT(*) AS total_ordenes
FROM olist_orders
GROUP BY anio
ORDER BY anio;
