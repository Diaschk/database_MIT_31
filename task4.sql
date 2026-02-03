CREATE USER admin_user WITH PASSWORD 'admin3112';
CREATE USER moderator_user WITH PASSWORD 'moder3112';
CREATE USER client_user WITH PASSWORD 'client3112';

GRANT ALL PRIVILEGES ON DATABASE online_store TO admin_user;
GRANT CONNECT ON DATABASE online_store TO moderator_user, client_user;
