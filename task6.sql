INSERT INTO users (id, full_name, email, role) VALUES
(1, 'Йовхимищ Діана', 'diana@gmail.com', 'client'),
(2, 'Власюк Лариса', 'larysa@gmail.com', 'client'),
(3, 'Ткаченко Олена', 'olena@gmail.com', 'moderator'),
(4, 'Павленко Анна', 'anna@gmail.com', 'admin');

INSERT INTO categories (id, name) VALUES
(1, 'Електроніка'), (2, 'Одяг'), (3, 'Книги'), 
(4, 'Косметика'), (5, 'Спорт та фітнес'), 
(6, 'Іграшки'), (7, 'Музика та інструменти'),
(8, 'Автотовари'), (9, 'Продукти харчування');

INSERT INTO products (id, name, price, quantity, category_id) VALUES
(1, 'Смартфон Samsung', 15000, 10, 1),
(2, 'Ноутбук Asus', 30000, 5, 1),
(3, 'Навушники Sony', 2500, 15, 1),
(4, 'Футболка Adidas', 800, 50, 2),
(5, 'Книга "Програмування на Java"', 500, 100, 3),
(6, 'Книга "Python для початківців"', 450, 80, 3),
(7, 'Смарт-годинник Apple Watch', 20000, 8, 1);


INSERT INTO orders_table (id, user_id, order_date) VALUES
(1, 1, '2026-02-01'),
(2, 2, '2026-02-02'),
(3, 1, '2026-02-03'),
(4, 3, '2026-02-04'),
(5, 4, '2026-02-05');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),  
(1, 4, 2),
(2, 2, 1),
(3, 5, 1),
(3, 7, 3),
(4, 3, 2),
(4, 6, 1),
(5, 7, 1);

INSERT INTO payments (order_id, amount, payment_date) VALUES
(1, 15000 + 2*800, '2026-02-01'),  
(2, 30000, '2026-02-02'),          
(3, 500 + 3*20000, '2026-02-03'),  
(4, 2*2500 + 450, '2026-02-04'),   
(5, 20000, '2026-02-05');