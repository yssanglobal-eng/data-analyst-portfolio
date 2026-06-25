/* ============================================================
   02 · Top 10 estados por volumen de órdenes
   ------------------------------------------------------------
   Pregunta de negocio:
   ¿Qué 10 estados de Brasil concentran más órdenes?

   Conceptos: JOIN · GROUP BY · COUNT · ORDER BY · LIMIT
   Nota: el JOIN se hace por customer_id, la llave que ambas
   tablas comparten (NO por order_id ni por customer_state).
   ============================================================ */

SELECT
    customer_state,
    COUNT(*) AS ordenes_estado
FROM olist_customers
JOIN olist_orders
    ON olist_orders.customer_id = olist_customers.customer_id
GROUP BY customer_state
ORDER BY ordenes_estado DESC
LIMIT 10;
