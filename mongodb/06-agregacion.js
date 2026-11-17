// Conteo de servicios por tipo, con el cupo promedio de los que tienen cupo.
db = db.getSiblingDB('CampusCloud');

printjson(db.detalles_servicios.aggregate([
  { $group: {
      _id: '$tipo',
      total: { $sum: 1 },
      cupo_promedio: { $avg: '$cupo_maximo' }
  } },
  { $sort: { total: -1, _id: 1 } }
]).toArray());
