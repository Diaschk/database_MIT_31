CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    category_id INT REFERENCES categories(category_id),
    stock INT DEFAULT 0
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO categories (name, description) VALUES
('Спортивний одяг', 'Фітнес-одяг та спортивні костюми'),
('Сукні', 'Літні та вечірні сукні')

INSERT INTO products (name, price, category_id, stock) VALUES
('Зручний спортивний одяг', 3999.99, 1, 100),
('Чорна сукня', 699.99, 2, 200);

INSERT INTO orders (product_id, quantity) VALUES
(1, 2),
(2, 1);

SELECT name, price, stock
FROM products
WHERE category_id = 1;

SELECT name, price
FROM products
WHERE price > 1000;

SELECT p.name AS product_name, c.name AS category_name, p.price, p.stock
FROM products p
JOIN categories c ON p.category_id = c.category_id;

UPDATE products
SET price = 899.99
WHERE product_id = 2;

SELECT product_id, name, price, stock
FROM products
WHERE product_id = 2;

UPDATE products
SET stock = stock - 1
WHERE product_id = 1;

SELECT * FROM products;

DELETE FROM orders 
WHERE order_id = 2;

SELECT * FROM orders;
