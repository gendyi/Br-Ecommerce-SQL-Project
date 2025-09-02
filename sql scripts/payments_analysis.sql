SELECT 
    p.payment_type,
    COUNT(p.order_id) AS total_payments,
    ROUND(AVG(p.payment_value), 2) AS avg_payment_value,
    SUM(p.payment_value) AS total_payment_value
FROM ecommerce.fact_payments p
GROUP BY p.payment_type
ORDER BY total_payment_value DESC;
