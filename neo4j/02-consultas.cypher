// Consulta 1: servicios que ha usado un estudiante (Carla Núñez, id 3).
MATCH (e:Estudiante {id_estudiante: 3})-[r:SOLICITO]->(s:Servicio)
RETURN e.nombre AS estudiante, s.nombre AS servicio, r.fecha AS fecha, r.estado AS estado
ORDER BY r.fecha;

// Consulta 2: estudiantes que comparten un servicio (Tutoría de Programación, id 3).
MATCH (e:Estudiante)-[:SOLICITO]->(s:Servicio {id_servicio: 3})
RETURN s.nombre AS servicio, collect(DISTINCT e.nombre) AS estudiantes, count(DISTINCT e) AS total;

// Consulta 3: recomendación básica para Lana lopez (id 2).
// Servicios que usaron otros estudiantes con los que comparte algún servicio
// y que ella todavía no ha solicitado, ordenados por cuántos de ellos los usaron.
MATCH (yo:Estudiante {id_estudiante: 2})-[:SOLICITO]->(:Servicio)<-[:SOLICITO]-(otro:Estudiante)-[:SOLICITO]->(rec:Servicio)
WHERE otro <> yo AND NOT (yo)-[:SOLICITO]->(rec)
RETURN rec.nombre AS servicio_recomendado, count(DISTINCT otro) AS estudiantes_similares
ORDER BY estudiantes_similares DESC, servicio_recomendado;
