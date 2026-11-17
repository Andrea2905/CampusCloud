// Los servicios 1 y 2 son los de la Unidad I; el resto se agregó en SQL Server
// con datos-prueba-unidad-ii.sql.
db = db.getSiblingDB('CampusCloud');

if (db.detalles_servicios.countDocuments() > 0) {
  print('Ya hay documentos, no se vuelve a insertar');
} else {
  const r = db.detalles_servicios.insertMany([
    {
      servicio_id: 1, nombre: 'constancia de estudios', tipo: 'tramite',
      modalidad: 'presencial', tiempo_entrega_dias: 3, costo: 0,
      requisitos: ['credencial vigente', 'solicitud firmada'],
      etiquetas: ['administrativo', 'presencial'],
      ubicacion: { edificio: 'A', oficina: 'Servicios Escolares', piso: 1 },
      responsable: { nombre: 'Rosa Medina', correo: 'rmedina@ejemplo.edu' }
    },
    {
      servicio_id: 2, nombre: 'Prestamo de laboratorio', tipo: 'laboratorio',
      cupo_maximo: 12, requiere_reserva: true, duracion_max_horas: 4,
      equipo: ['laptop', 'multimetro'],
      etiquetas: ['equipo', 'presencial'],
      ubicacion: { edificio: 'B', aula: 'LAB-1', piso: 2 }
    },
    {
      servicio_id: 3, nombre: 'Tutoría de Programación', tipo: 'tutoria',
      modalidad: 'en-linea', cupo_maximo: 25,
      etiquetas: ['programacion', 'en-linea'],
      horarios: ['mar 18:00', 'jue 18:00', 'vie 17:00'],
      responsable: { nombre: 'Andrés Salgado', correo: 'asalgado@ejemplo.edu' }
    },
    {
      servicio_id: 4, nombre: 'Préstamo de libros', tipo: 'biblioteca',
      dias_prestamo: 7, renovaciones_max: 2,
      formatos: ['impreso', 'digital'],
      etiquetas: ['libros', 'presencial'],
      ubicacion: { edificio: 'A', piso: 1 }
    },
    {
      servicio_id: 5, nombre: 'Cubículos de estudio', tipo: 'biblioteca',
      cupo_maximo: 6, requiere_reserva: true,
      etiquetas: ['estudio', 'presencial'],
      ubicacion: { edificio: 'A', piso: 2 }
    },
    {
      servicio_id: 6, nombre: 'Laboratorio de Redes', tipo: 'laboratorio',
      cupo_maximo: 20, requiere_reserva: true,
      equipo: ['switch', 'router', 'cables de red'],
      etiquetas: ['redes', 'presencial'],
      ubicacion: { edificio: 'C', aula: 'LAB-3', piso: 1 }
    },
    {
      servicio_id: 7, nombre: 'Tutoría de Inglés', tipo: 'tutoria',
      modalidad: 'en-linea', cupo_maximo: 18,
      etiquetas: ['ingles', 'en-linea'],
      horarios: ['lun 19:00', 'mie 19:00'],
      responsable: { nombre: 'Paula Reyes', correo: 'preyes@ejemplo.edu' }
    }
  ]);
  print('Insertados: ' + Object.keys(r.insertedIds).length);
}
print('Total en la colección: ' + db.detalles_servicios.countDocuments());
