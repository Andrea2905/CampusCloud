-- Se elimina un solo evento: el último login del estudiante 1.
SELECT id_estudiante, count(*) AS eventos_antes
FROM campuscloud_eventos.eventos_por_estudiante WHERE id_estudiante = 1;

DELETE FROM campuscloud_eventos.eventos_por_estudiante
WHERE id_estudiante = 1
  AND fecha_evento = '2026-11-12 18:45:00+0000'
  AND id_evento = aaaaaaaa-0000-0000-0000-000000000005;

SELECT id_estudiante, count(*) AS eventos_despues
FROM campuscloud_eventos.eventos_por_estudiante WHERE id_estudiante = 1;

SELECT * FROM campuscloud_eventos.eventos_por_estudiante
WHERE id_estudiante = 1 AND fecha_evento = '2026-11-12 18:45:00+0000';
