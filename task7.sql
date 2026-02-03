SELECT * FROM users;

SELECT * FROM users 
WHERE role = 'admin';


SELECT * FROM products ORDER BY price DESC;


SELECT user_id, COUNT(*) as order_count 
FROM orders_table 
GROUP BY user_id 
HAVING COUNT(*) > 1;


SELECT o.id as order_id, u.full_name, u.email, o.order_date
FROM orders_table o
JOIN users u ON o.user_id = u.id;


SELECT role, COUNT(*) as user_count 
FROM users 
GROUP BY role;


SELECT DISTINCT role FROM categories;


SELECT
    MAX(price) as max_price,
    MIN(price) as min_price
FROM products;


SELECT
    COUNT(*)::FLOAT / COUNT(DISTINCT user_id) as avg_orders_per_client
FROM orders_table;



SELECT COUNT(*) as cheap_products_count 
FROM products 
WHERE price < 10000;


SELECT SUM(amount) as total_transactions_amount 
FROM payments;