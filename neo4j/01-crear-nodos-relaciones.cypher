// Grafo de CampusCloud: estudiantes, servicios y las solicitudes que los unen.
// Los ids son los de las tablas Estudiantes y Servicios de SQL Server.
// Se puede ejecutar más de una vez sin duplicar nada.

CREATE CONSTRAINT estudiante_id IF NOT EXISTS
FOR (e:Estudiante) REQUIRE e.id_estudiante IS UNIQUE;

CREATE CONSTRAINT servicio_id IF NOT EXISTS
FOR (s:Servicio) REQUIRE s.id_servicio IS UNIQUE;

UNWIND [
  {id: 1, nombre: 'Ana lopez',      carrera: 'Desarrollo de Software'},
  {id: 2, nombre: 'Lana lopez',     carrera: 'Desarrollo de Software'},
  {id: 3, nombre: 'Carla Núñez',    carrera: 'Redes'},
  {id: 4, nombre: 'Diego Paredes',  carrera: 'Redes'},
  {id: 5, nombre: 'Elena Ibarra',   carrera: 'Desarrollo de Software'},
  {id: 6, nombre: 'Fernando Cruz',  carrera: 'Redes'},
  {id: 7, nombre: 'Gabriela Soto',  carrera: 'Desarrollo de Software'},
  {id: 8, nombre: 'Hugo Lara',      carrera: 'Redes'}
] AS fila
MERGE (e:Estudiante {id_estudiante: fila.id})
ON CREATE SET e.nombre = fila.nombre, e.carrera = fila.carrera;

UNWIND [
  {id: 1, nombre: 'constancia de estudios',  tipo: 'tramite'},
  {id: 2, nombre: 'Prestamo de laboratorio', tipo: 'laboratorio'},
  {id: 3, nombre: 'Tutoría de Programación', tipo: 'tutoria'},
  {id: 4, nombre: 'Préstamo de libros',      tipo: 'biblioteca'},
  {id: 5, nombre: 'Cubículos de estudio',    tipo: 'biblioteca'},
  {id: 6, nombre: 'Laboratorio de Redes',    tipo: 'laboratorio'},
  {id: 7, nombre: 'Tutoría de Inglés',       tipo: 'tutoria'}
] AS fila
MERGE (s:Servicio {id_servicio: fila.id})
ON CREATE SET s.nombre = fila.nombre, s.tipo = fila.tipo;

UNWIND [
  {id: 1001, est: 1, srv: 1, fecha: '2026-10-21', estado: 'pendiente'},
  {id: 1002, est: 2, srv: 2, fecha: '2026-10-22', estado: 'pendiente'},
  {id: 1003, est: 1, srv: 3, fecha: '2026-10-23', estado: 'atendida'},
  {id: 1004, est: 1, srv: 6, fecha: '2026-10-25', estado: 'atendida'},
  {id: 1005, est: 2, srv: 3, fecha: '2026-10-26', estado: 'pendiente'},
  {id: 1006, est: 3, srv: 2, fecha: '2026-10-27', estado: 'atendida'},
  {id: 1007, est: 3, srv: 6, fecha: '2026-10-28', estado: 'atendida'},
  {id: 1008, est: 3, srv: 1, fecha: '2026-10-29', estado: 'atendida'},
  {id: 1009, est: 4, srv: 3, fecha: '2026-10-30', estado: 'atendida'},
  {id: 1010, est: 4, srv: 4, fecha: '2026-11-02', estado: 'cancelada'},
  {id: 1011, est: 5, srv: 4, fecha: '2026-11-03', estado: 'atendida'},
  {id: 1012, est: 5, srv: 5, fecha: '2026-11-04', estado: 'pendiente'},
  {id: 1013, est: 6, srv: 2, fecha: '2026-11-05', estado: 'atendida'},
  {id: 1014, est: 6, srv: 6, fecha: '2026-11-06', estado: 'atendida'},
  {id: 1015, est: 7, srv: 3, fecha: '2026-11-09', estado: 'atendida'},
  {id: 1016, est: 8, srv: 1, fecha: '2026-11-10', estado: 'pendiente'},
  {id: 1017, est: 8, srv: 7, fecha: '2026-11-11', estado: 'atendida'}
] AS fila
MATCH (e:Estudiante {id_estudiante: fila.est})
MATCH (s:Servicio {id_servicio: fila.srv})
MERGE (e)-[r:SOLICITO {id_solicitud: fila.id}]->(s)
ON CREATE SET r.fecha = date(fila.fecha), r.estado = fila.estado;

MATCH (e:Estudiante) RETURN count(e) AS estudiantes;
MATCH (s:Servicio) RETURN count(s) AS servicios;
MATCH ()-[r:SOLICITO]->() RETURN count(r) AS relaciones;
