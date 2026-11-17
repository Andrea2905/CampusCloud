# CampusCloud

Proyecto académico de la asignatura Bases de Datos en la Nube.

## Objetivo

Construir progresivamente una Nube Académica Local que permita comprender:

- bases de datos relacionales;
- bases de datos NoSQL;
- persistencia;
- usuarios, roles y privilegios;
- conexión local y remota;
- integración mediante API;
- Docker y Docker Compose como herramientas de soporte.

## Unidad I

Primera implementación:

PC → Docker → SQL Server → Volumen → CampusCloud

Tecnología inicial:

- Docker Desktop
- SQL Server 2025
- Cliente SQL
- Git
- Visual Studio Code

## Unidad II: motores NoSQL

SQL Server sigue guardando Estudiantes, Servicios y Solicitudes. En esta unidad se agregan tres motores pequeños que lo complementan sin duplicar sus datos:

- MongoDB guarda los detalles extendidos de cada servicio, que varían de un servicio a otro.
- Neo4j guarda las relaciones entre estudiantes y servicios para consultar vínculos y recomendaciones.
- Cassandra guarda el registro de eventos de uso, consultado por estudiante y fecha.

Todos los datos son ficticios.

### Servicios utilizados

| Servicio | Contenedor | Puerto en el equipo | Para qué se usa |
|---|---|---|---|
| sqlserver | campuscloud-sqlserver | 1433 | Datos transaccionales (Unidad I) |
| postgres-cloud | campuscloud-postgres | 5432 | Práctica de la Unidad I |
| pgadmin | campuscloud-pgadmin | 8082 | Administrar PostgreSQL |
| mongo | campuscloud-mongo | 27018 | Documentos |
| neo4j | campuscloud-neo4j | 7474 y 7687 | Grafos |
| cassandra | por agregar | 9042 | Eventos |

### Requisitos

- Docker Desktop con Compose v2
- MongoDB Compass o mongosh
- Un navegador para Neo4j Browser
- Git y Visual Studio Code
- PowerShell (los comandos de abajo están escritos para PowerShell)

La imagen de SQL Server no corre de forma nativa en Macs con Apple Silicon. Los demás servicios sí, y no hace falta levantar todos a la vez.

### Configuración

Desde la raíz del repositorio:

```powershell
Copy-Item docker/.env.example docker/.env
```

Edita `docker/.env` y cambia las contraseñas. Ese archivo no se sube a Git.

### Levantar, verificar y detener cada servicio

MongoDB:

```powershell
docker compose -f docker/docker-compose.yml up -d mongo
docker compose -f docker/docker-compose.yml ps mongo
docker compose -f docker/docker-compose.yml stop mongo
```

Neo4j:

```powershell
docker compose -f docker/docker-compose.yml up -d neo4j
docker compose -f docker/docker-compose.yml ps neo4j
docker compose -f docker/docker-compose.yml stop neo4j
```

Para apagar todo sin borrar datos: `docker compose -f docker/docker-compose.yml down`. No uses `-v`, porque borra los volúmenes.

### Ejecutar los scripts

Los scripts toman usuario y contraseña de las variables que ya tiene el contenedor, así que no hay credenciales en los comandos.

MongoDB. Primero se copian los scripts al contenedor y después se ejecuta cada uno en orden numérico:

```powershell
docker cp mongodb/. campuscloud-mongo:/tmp/scripts
docker exec campuscloud-mongo sh -c 'mongosh -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase admin --quiet --file /tmp/scripts/01-crear-coleccion.js'
```

Cambia el nombre del archivo para correr los demás (`02` a `06`). El `07-usuario-lectura.js` pide la contraseña por teclado, así que se ejecuta con `-it`:

```powershell
docker exec -it campuscloud-mongo sh -c 'mongosh -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase admin --quiet --file /tmp/scripts/07-usuario-lectura.js'
```

Neo4j. Se copian los scripts y se ejecutan en orden numérico:

```powershell
docker cp neo4j/. campuscloud-neo4j:/tmp/scripts
docker exec campuscloud-neo4j sh -c 'cypher-shell -u neo4j -p "${NEO4J_AUTH#neo4j/}" --format verbose -f /tmp/scripts/01-crear-nodos-relaciones.cypher'
```

Cambia el nombre del archivo para correr `02`, `03` y `04`.

Cassandra: se documenta cuando se agregue el servicio.

Se ejecutan en orden numérico. Cambia el nombre del archivo para correr cada uno.

### Dónde están las evidencias

Las capturas están en `evidencias/unidad-ii/`, separadas en `mongodb`, `neo4j`, `cassandra` y `generales`. Cada una tiene un número que indica el orden de la prueba. La explicación de cada prueba está en `docs/pruebas.md`.

### Resultados esperados

- MongoDB: la colección de detalles extendidos con al menos 6 documentos de 3 tipos de servicio; tres consultas con filtros distintos; una actualización, una eliminación y un conteo por categoría; los documentos siguen ahí después de reiniciar el contenedor.
- Neo4j: al menos 5 nodos Estudiante, 4 nodos Servicio y 8 relaciones; tres consultas Cypher con resultado; los datos siguen ahí después de reiniciar.
- Cassandra: una tabla de eventos con al menos 12 registros de 3 estudiantes; consulta de un estudiante por periodo; un UPDATE y un DELETE verificados.

### Documentación

- `docs/arquitectura.md`: cómo encaja cada motor en CampusCloud
- `docs/bitacora.md`: bitácora de trabajo
- `docs/pruebas.md`: pruebas y resultados
- `docs/comparacion-cloud-local.md`: comparación entre el despliegue local y los servicios de nube