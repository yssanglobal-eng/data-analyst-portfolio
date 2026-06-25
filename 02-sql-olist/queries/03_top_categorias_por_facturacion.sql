/* ============================================================
   03 · Top 5 categorías por facturación
   ------------------------------------------------------------
   Pregunta de negocio:
   ¿Qué 5 categorías de producto generan mayor facturación
   (suma de price)?

   Conceptos: JOIN · SUM · GROUP BY · ORDER BY · LIMIT
   Nota: se usa SUM(price) porque sumamos dinero, no contamos
   filas. El JOIN se hace por product_id.
   ============================================================ */

SELECT
    product_category_name,
    SUM(price) AS total_facturacion
FROM olist_products
JOIN olist_order_items
    ON olist_order_items.product_id = olist_products.product_id
GROUP BY product_category_name
ORDER BY total_facturacion DESC
LIMIT 5;
