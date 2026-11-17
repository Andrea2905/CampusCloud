-- Consulta 1: actividad del estudiante 3 entre el 3 y el 12 de noviembre.
SELECT fecha_evento, tipo_evento, id_servicio, detalle
FROM campuscloud_eventos.eventos_por_estudiante
WHERE id_estudiante = 3
  AND fecha_evento >= '2026-11-03 00:00:00+0000'
  AND fecha_evento <  '2026-11-12 00:00:00+0000';

-- Consulta 2: los 3 eventos más recientes del estudiante 1.
SELECT fecha_evento, tipo_evento, detalle
FROM campuscloud_eventos.eventos_por_estudiante
WHERE id_estudiante = 1
LIMIT 3;

-- Limitación: la tabla está pensada para consultar por estudiante. Buscar por
-- tipo de evento sin indicar el estudiante obliga a recorrer todas las
-- particiones, y Cassandra rechaza la consulta (daría error a propósito).
SELECT * FROM campuscloud_eventos.eventos_por_estudiante WHERE tipo_evento = 'login';
