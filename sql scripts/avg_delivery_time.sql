SELECT 
    ROUND(AVG(EXTRACT(EPOCH FROM (o.order_delivered_customer_date - o.order_purchase_timestamp)) / 86400), 2) 
        AS avg_delivery_days
FROM ecommerce.fact_orders o
WHERE o.order_delivered_customer_date IS NOT NULL;
