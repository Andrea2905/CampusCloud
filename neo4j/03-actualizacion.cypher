// Actualización controlada: la solicitud 1002 de Lana lopez pasa de pendiente a atendida.
// Solo se modifica esa relación.

MATCH (e:Estudiante)-[r:SOLICITO {id_solicitud: 1002}]->(s:Servicio)
RETURN 'ANTES' AS momento, e.nombre AS estudiante, s.nombre AS servicio, r.estado AS estado;

MATCH (:Estudiante)-[r:SOLICITO {id_solicitud: 1002}]->(:Servicio)
SET r.estado = 'atendida'
RETURN count(r) AS relaciones_modificadas;

MATCH (e:Estudiante)-[r:SOLICITO {id_solicitud: 1002}]->(s:Servicio)
RETURN 'DESPUÉS' AS momento, e.nombre AS estudiante, s.nombre AS servicio, r.estado AS estado;
