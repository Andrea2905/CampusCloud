-- Se ejecuta con el usuario campus_lector: la lectura funciona, la escritura no.
SELECT id_estudiante, count(*) AS eventos
FROM campuscloud_eventos.eventos_por_estudiante WHERE id_estudiante = 1;

INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento)
VALUES (99, '2026-11-15 10:00:00+0000', aaaaaaaa-0000-0000-0000-000000000099, 'prueba');
