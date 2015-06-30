DROP SCHEMA :local_schema;

DROP USER MAPPING FOR :local_user SERVER mantis_db;
DROP SERVER mantis_db;

DROP EXTENSION postgres_fdw;
