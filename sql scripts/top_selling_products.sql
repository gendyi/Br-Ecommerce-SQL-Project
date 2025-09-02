SELECT 
    p.product_category_name,
    COUNT(oi.order_item_id) AS total_items_sold,
    SUM(oi.price) AS total_revenue
FROM ecommerce.fact_order_items oi
JOIN ecommerce.dim_products p 
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_items_sold DESC
LIMIT 10;
