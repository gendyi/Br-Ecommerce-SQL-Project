SELECT 
    d.year,
    d.month,
    COUNT(o.order_id) AS total_orders
FROM ecommerce.fact_orders o
JOIN ecommerce.dim_date d 
    ON o.order_purchase_timestamp::date = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
