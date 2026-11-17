// Actualización controlada de un solo servicio: el laboratorio de redes (6).
db = db.getSiblingDB('CampusCloud');

print('--- ANTES ---');
printjson(db.detalles_servicios.findOne({ servicio_id: 6 }, { _id: 0 }));

const r = db.detalles_servicios.updateOne(
  { servicio_id: 6 },
  { $set: { cupo_maximo: 24 }, $push: { equipo: 'firewall' } }
);
print('Coincidencias: ' + r.matchedCount + ', modificados: ' + r.modifiedCount);

print('--- DESPUÉS ---');
printjson(db.detalles_servicios.findOne({ servicio_id: 6 }, { _id: 0 }));
