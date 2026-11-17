// Usuario que solo puede leer la base CampusCloud.
// La contraseña se escribe en el momento, no queda en el archivo.
// Si el usuario ya existía, se borra y se vuelve a crear.
db = db.getSiblingDB('CampusCloud');

try {
  db.dropUser('campus_lector');
  print('Se eliminó el usuario anterior');
} catch (e) {
  print('No había un usuario anterior');
}

db.createUser({
  user: 'campus_lector',
  pwd: passwordPrompt(),
  roles: [{ role: 'read', db: 'CampusCloud' }]
});
print('Usuario campus_lector creado');