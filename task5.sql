CREATE TABLE users (
id SERIAL PRIMARY KEY,
full_name VARCHAR(100),
email VARCHAR(100) UNIQUE,
role VARCHAR(20)
);

CREATE TABLE categories (
id SERIAL PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE products (
id SERIAL PRIMARY KEY,
name VARCHAR(100),
price NUMERIC(10,2),
quantity INT,
category_id INT REFERENCES categories(id)
);

CREATE TABLE orders_table (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    order_date DATE
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders_table(id),
    product_id INT REFERENCES products(id),
    quantity INT
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders_table(id),
    amount NUMERIC(10,2),
    payment_date DATE
);