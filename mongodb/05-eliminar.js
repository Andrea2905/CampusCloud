// Eliminación por identificador: se borra solo el servicio 7.
db = db.getSiblingDB('CampusCloud');

print('Documentos antes: ' + db.detalles_servicios.countDocuments());
printjson(db.detalles_servicios.findOne({ servicio_id: 7 }, { _id: 0, servicio_id: 1, nombre: 1 }));

const r = db.detalles_servicios.deleteOne({ servicio_id: 7 });
print('Eliminados: ' + r.deletedCount);

print('Documentos después: ' + db.detalles_servicios.countDocuments());
print('¿Sigue existiendo el servicio 7? ' + (db.detalles_servicios.findOne({ servicio_id: 7 }) !== null));
