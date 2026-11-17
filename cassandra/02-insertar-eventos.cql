-- 15 eventos ficticios de los estudiantes 1, 2 y 3 (ids de SQL Server).
-- Los uuid son fijos para poder actualizar y borrar registros concretos.
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (1, '2026-11-02 09:15:00+0000', aaaaaaaa-0000-0000-0000-000000000001, 'login', null, 'inicio de sesion desde navegador');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (1, '2026-11-02 09:20:00+0000', aaaaaaaa-0000-0000-0000-000000000002, 'consulta_servicio', 3, 'consulto horarios de tutoria');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (1, '2026-11-05 16:05:00+0000', aaaaaaaa-0000-0000-0000-000000000003, 'solicitud_creada', 3, 'solicito tutoria de programacion');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (1, '2026-11-09 10:30:00+0000', aaaaaaaa-0000-0000-0000-000000000004, 'reserva_laboratorio', 6, 'reservo el laboratorio de redes');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (1, '2026-11-12 18:45:00+0000', aaaaaaaa-0000-0000-0000-000000000005, 'login', null, 'inicio de sesion desde celular');

INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (2, '2026-11-03 11:00:00+0000', aaaaaaaa-0000-0000-0000-000000000006, 'login', null, 'inicio de sesion desde navegador');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (2, '2026-11-03 11:10:00+0000', aaaaaaaa-0000-0000-0000-000000000007, 'consulta_servicio', 2, 'consulto disponibilidad de equipo');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (2, '2026-11-06 12:30:00+0000', aaaaaaaa-0000-0000-0000-000000000008, 'solicitud_creada', 2, 'solicito prestamo de laboratorio');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (2, '2026-11-10 09:00:00+0000', aaaaaaaa-0000-0000-0000-000000000009, 'consulta_servicio', 3, 'consulto cupo de tutoria');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (2, '2026-11-13 15:20:00+0000', aaaaaaaa-0000-0000-0000-000000000010, 'solicitud_cancelada', 3, 'cancelo la solicitud de tutoria');

INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (3, '2026-11-01 08:50:00+0000', aaaaaaaa-0000-0000-0000-000000000011, 'login', null, 'inicio de sesion desde navegador');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (3, '2026-11-04 13:15:00+0000', aaaaaaaa-0000-0000-0000-000000000012, 'consulta_servicio', 6, 'consulto equipo del laboratorio de redes');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (3, '2026-11-04 13:40:00+0000', aaaaaaaa-0000-0000-0000-000000000013, 'reserva_laboratorio', 6, 'reservo el laboratorio de redes');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (3, '2026-11-11 17:00:00+0000', aaaaaaaa-0000-0000-0000-000000000014, 'descarga_constancia', 1, 'descargo su constancia de estudios');
INSERT INTO campuscloud_eventos.eventos_por_estudiante (id_estudiante, fecha_evento, id_evento, tipo_evento, id_servicio, detalle) VALUES (3, '2026-11-14 09:05:00+0000', aaaaaaaa-0000-0000-0000-000000000015, 'login', null, 'inicio de sesion desde celular');

SELECT id_estudiante, count(*) AS eventos FROM campuscloud_eventos.eventos_por_estudiante WHERE id_estudiante = 1;
SELECT id_estudiante, count(*) AS eventos FROM campuscloud_eventos.eventos_por_estudiante WHERE id_estudiante = 2;
SELECT id_estudiante, count(*) AS eventos FROM campuscloud_eventos.eventos_por_estudiante WHERE id_estudiante = 3;
