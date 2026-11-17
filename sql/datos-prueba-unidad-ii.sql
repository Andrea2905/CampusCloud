-- Datos ficticios adicionales para CampusCloud (Unidad II).
-- Conserva los registros de la Unidad I (ids 1 y 2) y agrega los demás.
-- Se puede ejecutar más de una vez: solo inserta lo que no existe.
USE CampusCloud;
GO

INSERT INTO Estudiantes (id_estudiante, matricula, nombre, correo)
SELECT v.id, v.mat, v.nom, v.cor
FROM (VALUES
  (3, N'2520004', N'Carla Núñez',    N'carla.nunez@ejemplo.edu'),
  (4, N'2520005', N'Diego Paredes',  N'diego.paredes@ejemplo.edu'),
  (5, N'2520006', N'Elena Ibarra',   N'elena.ibarra@ejemplo.edu'),
  (6, N'2520007', N'Fernando Cruz',  N'fernando.cruz@ejemplo.edu'),
  (7, N'2520008', N'Gabriela Soto',  N'gabriela.soto@ejemplo.edu'),
  (8, N'2520009', N'Hugo Lara',      N'hugo.lara@ejemplo.edu')
) AS v(id, mat, nom, cor)
WHERE NOT EXISTS (SELECT 1 FROM Estudiantes e WHERE e.id_estudiante = v.id);

INSERT INTO Servicios (id_servicio, nombre, descripcion)
SELECT v.id, v.nom, v.des
FROM (VALUES
  (3, N'Tutoría de Programación', N'Apoyo en lógica y lenguajes de programación'),
  (4, N'Préstamo de libros',      N'Préstamo de material impreso y digital'),
  (5, N'Cubículos de estudio',    N'Espacios de estudio con reserva'),
  (6, N'Laboratorio de Redes',    N'Práctica con equipo de redes'),
  (7, N'Tutoría de Inglés',       N'Práctica de inglés en línea')
) AS v(id, nom, des)
WHERE NOT EXISTS (SELECT 1 FROM Servicios s WHERE s.id_servicio = v.id);

INSERT INTO Solicitudes (id_solicitud, id_estudiante, id_servicio, fecha, estado)
SELECT v.id, v.est, v.srv, v.fec, v.sol
FROM (VALUES
  (1003, 1, 3, CAST('2026-10-23' AS DATE), N'atendida'),
  (1004, 1, 6, CAST('2026-10-25' AS DATE), N'atendida'),
  (1005, 2, 3, CAST('2026-10-26' AS DATE), N'pendiente'),
  (1006, 3, 2, CAST('2026-10-27' AS DATE), N'atendida'),
  (1007, 3, 6, CAST('2026-10-28' AS DATE), N'atendida'),
  (1008, 3, 1, CAST('2026-10-29' AS DATE), N'atendida'),
  (1009, 4, 3, CAST('2026-10-30' AS DATE), N'atendida'),
  (1010, 4, 4, CAST('2026-11-02' AS DATE), N'cancelada'),
  (1011, 5, 4, CAST('2026-11-03' AS DATE), N'atendida'),
  (1012, 5, 5, CAST('2026-11-04' AS DATE), N'pendiente'),
  (1013, 6, 2, CAST('2026-11-05' AS DATE), N'atendida'),
  (1014, 6, 6, CAST('2026-11-06' AS DATE), N'atendida'),
  (1015, 7, 3, CAST('2026-11-09' AS DATE), N'atendida'),
  (1016, 8, 1, CAST('2026-11-10' AS DATE), N'pendiente'),
  (1017, 8, 7, CAST('2026-11-11' AS DATE), N'atendida')
) AS v(id, est, srv, fec, sol)
WHERE NOT EXISTS (SELECT 1 FROM Solicitudes s WHERE s.id_solicitud = v.id);
GO

SELECT COUNT(*) AS estudiantes FROM Estudiantes;
SELECT COUNT(*) AS servicios FROM Servicios;
SELECT COUNT(*) AS solicitudes FROM Solicitudes;
