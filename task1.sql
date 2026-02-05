CREATE TYPE user_role_enum AS ENUM (
    'admin',
    'moderator',
    'client'
);


ALTER TABLE users
ALTER COLUMN role TYPE user_role_enum
USING role::user_role_enum;


SELECT DISTINCT role FROM users;


INSERT INTO users (full_name, email, role)
VALUES ('Test', 'test@test.com', 'manager');


SELECT o.id, o.user_id
FROM orders_table o
LEFT JOIN users u ON o.user_id = u.id
WHERE u.id IS NULL;


SELECT column_name, data_type, udt_name
FROM information_schema.columns
WHERE table_name = 'users';
