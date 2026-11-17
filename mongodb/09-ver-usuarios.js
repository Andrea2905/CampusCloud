db = db.getSiblingDB('CampusCloud');
printjson(db.getUsers().users.map(u => ({ usuario: u.user, roles: u.roles })));