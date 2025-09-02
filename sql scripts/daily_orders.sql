SELECT 
    d.date_id,
    COUNT(o.order_id) AS total_orders
FROM ecommerce.fact_orders o
JOIN ecommerce.dim_date d 
    ON o.order_purchase_timestamp::date = d.date_id
GROUP BY d.date_id
ORDER BY d.date_id;
