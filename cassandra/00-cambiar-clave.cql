-- Cambia la clave del superusuario que trae Cassandra por defecto.
-- __CLAVE__ se reemplaza al ejecutar, con la variable CQL_ADMIN_PASSWORD del
-- contenedor. Este archivo no contiene ninguna contraseña.
ALTER ROLE cassandra WITH PASSWORD = '__CLAVE__';
