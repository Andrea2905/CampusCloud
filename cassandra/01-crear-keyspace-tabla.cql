-- Keyspace de eventos de uso de CampusCloud. Un solo nodo, factor de replicación 1.
CREATE KEYSPACE IF NOT EXISTS campuscloud_eventos
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

-- La consulta que guía el diseño: actividad de un estudiante dentro de un periodo.
--   Partition key: id_estudiante. Todos los eventos de un estudiante quedan en
--   la misma partición, así que esa consulta lee un solo lugar.
--   Clustering: fecha_evento, de más reciente a más antiguo, para que filtrar por
--   rango de fechas y pedir "los últimos eventos" sea directo.
--   id_evento va al final de la clave para que dos eventos del mismo instante
--   no se sobrescriban.
CREATE TABLE IF NOT EXISTS campuscloud_eventos.eventos_por_estudiante (
  id_estudiante int,
  fecha_evento  timestamp,
  id_evento     uuid,
  tipo_evento   text,
  id_servicio   int,
  detalle       text,
  PRIMARY KEY ((id_estudiante), fecha_evento, id_evento)
) WITH CLUSTERING ORDER BY (fecha_evento DESC, id_evento ASC);

DESCRIBE TABLE campuscloud_eventos.eventos_por_estudiante;
