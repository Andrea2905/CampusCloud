-- Rol de solo lectura sobre el keyspace de eventos.
-- __CLAVE_LECTOR__ se reemplaza al ejecutar con la variable CQL_LECTOR_PASSWORD
-- del contenedor; este archivo no contiene contraseñas.
CREATE ROLE IF NOT EXISTS campus_lector WITH PASSWORD = '__CLAVE_LECTOR__' AND LOGIN = true;
GRANT SELECT ON KEYSPACE campuscloud_eventos TO campus_lector;
LIST ALL PERMISSIONS OF campus_lector;
