SELECT 
    o.order_status,
    COUNT(o.order_id) AS total_orders
FROM ecommerce.fact_orders o
GROUP BY o.order_status
ORDER BY total_orders DESC;
