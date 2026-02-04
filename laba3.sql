SELECT COUNT(*) FROM users;

SELECT COUNT(*) AS total_products
FROM products;


SELECT SUM(quantity) FROM products;

SELECT SUM(amount) AS total_payments
FROM payments;


SELECT AVG(price) FROM products;

SELECT AVG(amount) AS avg_payment
FROM payments;

SELECT MIN(price) FROM products;

SELECT MIN(order_date) AS first_order
FROM orders_table;


SELECT MAX(price) FROM products;


SELECT MAX(order_date) AS last_order
FROM orders_table;


SELECT o.id, u.full_name
FROM orders_table o
INNER JOIN users u ON o.user_id = u.id;


SELECT p.name AS product_name, c.name AS category_name
FROM products p
INNER JOIN categories c ON p.category_id = c.id;


SELECT o.id AS order_id, SUM(p.amount) AS total_paid
FROM orders_table o
INNER JOIN payments p ON o.id = p.order_id
GROUP BY o.id;


SELECT u.full_name, o.id
FROM users u
LEFT JOIN orders_table o ON u.id = o.user_id;


SELECT c.name AS category_name, p.name AS product_name
FROM categories c
LEFT JOIN products p ON c.id = p.category_id;


SELECT u.full_name, o.id
FROM users u
RIGHT JOIN orders_table o ON u.id = o.user_id;


SELECT c.name AS category_name, p.name AS product_name
FROM categories c
RIGHT JOIN products p ON c.id = p.category_id;


SELECT u.full_name, o.id
FROM users u
FULL JOIN orders_table o ON u.id = o.user_id;



SELECT u.full_name, c.name
FROM users u
CROSS JOIN categories c;


SELECT p.name AS product, o.id AS order_id
FROM products p
CROSS JOIN orders_table o;


SELECT u.full_name, p.amount
FROM users u
CROSS JOIN payments p;


SELECT u1.full_name AS user1, u2.full_name AS user2, u1.role
FROM users u1
JOIN users u2 ON u1.role = u2.role AND u1.id <> u2.id;


SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);


SELECT *
FROM orders_table
WHERE user_id = (SELECT id FROM users WHERE full_name = 'Йовхимищ Діана');


SELECT * FROM users
WHERE id IN (SELECT user_id FROM orders_table);


SELECT *
FROM products
WHERE id IN (SELECT product_id FROM order_items);


SELECT * FROM users u
WHERE NOT EXISTS (
    SELECT 1 FROM orders_table o WHERE o.user_id = u.id
);


SELECT *
FROM products p
WHERE NOT EXISTS (
    SELECT 1 FROM order_items oi WHERE oi.product_id = p.id
);


SELECT * FROM orders_table o
WHERE EXISTS (
    SELECT 1 FROM payments p WHERE p.order_id = o.id
);




SELECT *
FROM orders_table o
WHERE EXISTS (
    SELECT 1
    FROM order_items oi
    WHERE oi.order_id = o.id
);


SELECT full_name FROM users WHERE role = 'client'
UNION
SELECT full_name FROM users WHERE role = 'moderator';



SELECT role FROM users
UNION ALL
SELECT role FROM users;


SELECT user_id FROM orders_table
INTERSECT
SELECT o.user_id
FROM orders_table o
JOIN payments p ON o.id = p.order_id;


SELECT id, full_name FROM users
EXCEPT
SELECT user_id, full_name FROM users u
JOIN orders_table o ON u.id = o.user_id;



WITH user_orders AS (
    SELECT user_id, COUNT(*) AS order_count
    FROM orders_table
    GROUP BY user_id
)
SELECT u.full_name, uo.order_count
FROM users u
JOIN user_orders uo ON u.id = uo.user_id
WHERE uo.order_count > 1;




WITH payment_summary AS (
    SELECT order_id, SUM(amount) AS total_amount
    FROM payments
    GROUP BY order_id
)
SELECT o.id AS order_id, u.full_name, ps.total_amount
FROM orders_table o
JOIN payment_summary ps ON o.id = ps.order_id
JOIN users u ON o.user_id = u.id;



SELECT id AS order_id,
       user_id,
       ROW_NUMBER() OVER (ORDER BY order_date) AS row_num
FROM orders_table;


SELECT name,
       price,
       RANK() OVER (ORDER BY price DESC) AS price_rank
FROM products;


SELECT name,
       category_id,
       price,
       AVG(price) OVER (PARTITION BY category_id) AS avg_category_price
FROM products;


SELECT user_id,
       id AS order_id,
       order_date,
       SUM(id) OVER (PARTITION BY user_id ORDER BY order_date) AS cumulative_sum
FROM orders_table;



