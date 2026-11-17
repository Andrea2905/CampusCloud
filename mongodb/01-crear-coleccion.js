// Base CampusCloud, colección de detalles extendidos de servicios.
// servicio_id corresponde a id_servicio de la tabla Servicios en SQL Server.
db = db.getSiblingDB('CampusCloud');

if (!db.getCollectionNames().includes('detalles_servicios')) {
  db.createCollection('detalles_servicios', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        required: ['servicio_id', 'nombre', 'tipo'],
        properties: {
          servicio_id: { bsonType: 'number' },
          nombre: { bsonType: 'string' },
          tipo: { enum: ['tramite', 'laboratorio', 'tutoria', 'biblioteca'] }
        }
      }
    }
  });
  print('Colección creada');
} else {
  print('La colección ya existía');
}

db.detalles_servicios.createIndex({ servicio_id: 1 }, { unique: true });
printjson(db.getCollectionNames());
