/* ============================================================
   06 - Tiempo promedio de entrega / Average delivery time
   ------------------------------------------------------------
   Pregunta de negocio:
   En promedio, ¿cuántos días tarda una orden desde la compra
   hasta que llega al cliente?
   (Business question: on average, how many days does an order
   take from purchase to customer delivery?)

   Conceptos: AVG · resta de fechas · CAST (::date)
   Nota: restar dos timestamps devuelve un INTERVAL (12 days 13:24...).
   Con ::date convertimos a fecha pura y la resta da un número
   entero de días, más limpio para graficar en Power BI.
   AVG ignora automáticamente los NULL (órdenes no entregadas).
   ============================================================ */

SELECT
    AVG(order_delivered_customer_date::date - order_purchase_timestamp::date) AS promedio_dias_entrega
FROM olist_orders;
