
CREATE SCHEMA :local_schema;

CREATE EXTENSION postgres_fdw;

CREATE SERVER mantis_db 
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (dbname ':remote_db', host ':remote_server');

CREATE USER MAPPING FOR :local_user
SERVER mantis_db
OPTIONS (user ':remote_user', password ':remote_passwd');


