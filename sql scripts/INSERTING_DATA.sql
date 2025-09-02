-- Load Customers
COPY ecommerce.dim_customers
FROM '/path/to/customers.csv'
DELIMITER ','
CSV HEADER;

-- Load Products
COPY ecommerce.dim_products
FROM '/path/to/products.csv'
DELIMITER ','
CSV HEADER;

-- Load Sellers
COPY ecommerce.dim_sellers
FROM '/path/to/sellers.csv'
DELIMITER ','
CSV HEADER;

-- Load Orders
COPY ecommerce.fact_orders
FROM '/path/to/orders.csv'
DELIMITER ','
CSV HEADER;

-- Load Order Items
COPY ecommerce.fact_order_items
FROM '/path/to/order_items.csv'
DELIMITER ','
CSV HEADER;

-- Load Payments
COPY ecommerce.fact_payments
FROM '/path/to/payments.csv'
DELIMITER ','
CSV HEADER;

-- Load Reviews
COPY ecommerce.fact_reviews
FROM '/path/to/reviews.csv'
DELIMITER ','
CSV HEADER;

-- Load Product Category
COPY ecommerce.dim_product_category
FROM '/path/to/product_category.csv'
DELIMITER ','
CSV HEADER;
