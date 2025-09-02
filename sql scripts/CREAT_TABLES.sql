CREATE SCHEMA IF NOT EXISTS ecommerce;

-- Dim Customers
CREATE TABLE ecommerce.dim_customers (
    customer_id VARCHAR PRIMARY KEY,
    customer_unique_id VARCHAR,
    customer_city VARCHAR,
    customer_state VARCHAR
);

-- Dim Products
CREATE TABLE ecommerce.dim_products (
    product_id VARCHAR PRIMARY KEY,
    product_category_name VARCHAR,
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

-- Dim Sellers
CREATE TABLE ecommerce.dim_sellers (
    seller_id VARCHAR PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR,
    seller_state VARCHAR
);

-- Fact Orders
CREATE TABLE ecommerce.fact_orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR REFERENCES ecommerce.dim_customers(customer_id),
    order_status VARCHAR,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- Fact Order Items
CREATE TABLE ecommerce.fact_order_items (
    order_item_id INT,
    order_id VARCHAR REFERENCES ecommerce.fact_orders(order_id),
    product_id VARCHAR REFERENCES ecommerce.dim_products(product_id),
    seller_id VARCHAR REFERENCES ecommerce.dim_sellers(seller_id),
    shipping_limit_date TIMESTAMP,
    price DECIMAL,
    freight_value DECIMAL
);

-- Fact Payments
CREATE TABLE ecommerce.fact_payments (
    order_id VARCHAR REFERENCES ecommerce.fact_orders(order_id),
    payment_sequential INT,
    payment_type VARCHAR,
    payment_installments INT,
    payment_value DECIMAL
);

-- Fact Reviews
CREATE TABLE ecommerce.fact_reviews (
    review_id VARCHAR PRIMARY KEY,
    order_id VARCHAR REFERENCES ecommerce.fact_orders(order_id),
    review_score INT,
    review_comment_title VARCHAR,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

-- Dim Date
CREATE TABLE ecommerce.dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    quarter INT,
    month INT,
    week INT,
    day INT,
    day_name VARCHAR,
    month_name VARCHAR,
    is_weekend BOOLEAN
);

-- Dim Product Category
CREATE TABLE ecommerce.dim_product_category (
    product_category_name VARCHAR PRIMARY KEY,
    product_category_name_english VARCHAR
);
