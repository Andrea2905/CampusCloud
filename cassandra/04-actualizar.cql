-- En Cassandra el UPDATE necesita la clave completa: estudiante, fecha y evento.
-- Se modifica un solo registro: la cancelación del estudiante 2.
SELECT fecha_evento, tipo_evento, detalle
FROM campuscloud_eventos.eventos_por_estudiante
WHERE id_estudiante = 2 AND fecha_evento = '2026-11-13 15:20:00+0000';

UPDATE campuscloud_eventos.eventos_por_estudiante
SET detalle = 'cancelacion confirmada por servicios escolares'
WHERE id_estudiante = 2
  AND fecha_evento = '2026-11-13 15:20:00+0000'
  AND id_evento = aaaaaaaa-0000-0000-0000-000000000010;

SELECT fecha_evento, tipo_evento, detalle
FROM campuscloud_eventos.eventos_por_estudiante
WHERE id_estudiante = 2 AND fecha_evento = '2026-11-13 15:20:00+0000';
