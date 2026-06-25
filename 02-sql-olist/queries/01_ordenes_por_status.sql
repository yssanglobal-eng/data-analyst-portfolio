/* ============================================================
   01 · Órdenes por estado de entrega
   ------------------------------------------------------------
   Pregunta de negocio:
   ¿Cuántas órdenes hay por cada estado (status), mostrando
   solo los estados con más de 1,000 órdenes?

   Conceptos: GROUP BY · COUNT · HAVING · ORDER BY
   Nota: el filtro sobre el conteo va en HAVING, no en WHERE,
   porque filtra sobre el resultado de la agregación.
   ============================================================ */

SELECT
    order_status,
    COUNT(*) AS total_ordenes
FROM olist_orders
GROUP BY order_status
HAVING COUNT(*) > 1000
ORDER BY total_ordenes DESC;
