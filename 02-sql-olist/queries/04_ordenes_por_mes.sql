/* ============================================================
   04 - Órdenes por mes / Orders per month
   ------------------------------------------------------------
   Pregunta de negocio:
   ¿Cómo evolucionó el volumen de órdenes mes a mes?
   (Business question: how did order volume evolve month over month?)

   Conceptos: DATE_TRUNC · GROUP BY · ORDER BY
   Nota: DATE_TRUNC('month', ...) "aplasta" cada fecha al primer
   día de su mes, de modo que todas las órdenes del mismo mes
   se agrupan juntas. Devuelve una fecha (no un número).
   ============================================================ */

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS mes,
    COUNT(*) AS total_ordenes
FROM olist_orders
GROUP BY mes
ORDER BY mes;
