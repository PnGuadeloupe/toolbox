-----------------------------------
-- THIS FILE IS INSTALLED BY ANSIBLE
-- ALL CHANGES WILL BE LOST
-----------------------------------

DROP DATABASE IF EXISTS png;

CREATE DATABASE png
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'fr_FR.UTF-8'
       LC_CTYPE = 'fr_FR.UTF-8'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE png
  IS 'Base de données du parc par thémes.
Le schéma "metiers" est propre aux applications PHP Runner
';
