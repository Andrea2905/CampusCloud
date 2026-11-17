// Conteo general, para comprobar la persistencia después de reiniciar.
MATCH (n) RETURN labels(n)[0] AS tipo, count(*) AS total ORDER BY tipo;
MATCH ()-[r:SOLICITO]->() RETURN count(r) AS relaciones;
MATCH ()-[r:SOLICITO {id_solicitud: 1002}]->() RETURN r.estado AS estado_solicitud_1002;
