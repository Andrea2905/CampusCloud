db = db.getSiblingDB('CampusCloud');

print('--- 1. Servicios de tipo laboratorio ---');
printjson(db.detalles_servicios.find(
  { tipo: 'laboratorio' },
  { _id: 0, servicio_id: 1, nombre: 1, cupo_maximo: 1 }
).toArray());

print('--- 2. Servicios con la etiqueta en-linea (filtro sobre un arreglo) ---');
printjson(db.detalles_servicios.find(
  { etiquetas: 'en-linea' },
  { _id: 0, servicio_id: 1, nombre: 1, tipo: 1, etiquetas: 1 }
).toArray());

print('--- 3. Servicios con cupo de 20 o más, de mayor a menor ---');
printjson(db.detalles_servicios.find(
  { cupo_maximo: { $gte: 20 } },
  { _id: 0, servicio_id: 1, nombre: 1, cupo_maximo: 1 }
).sort({ cupo_maximo: -1 }).toArray());

print('--- 4. Servicios ubicados en el edificio A (filtro sobre el subdocumento) ---');
printjson(db.detalles_servicios.find(
  { 'ubicacion.edificio': 'A' },
  { _id: 0, servicio_id: 1, nombre: 1, ubicacion: 1 }
).toArray());
