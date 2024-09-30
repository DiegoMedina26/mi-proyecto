const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');

// Crear y conectar a la base de datos
const db = new sqlite3.Database('./database.db', (err) => {
    if (err) {
        console.error(err.message);
    }
    console.log('Conectado a la base de datos SQLite.');
});

// Leer el archivo SQL
fs.readFile('setup.sql', 'utf8', (err, sql) => {
    if (err) {
        console.error(err);
        return;
    }
    // Ejecutar las instrucciones SQL
    db.exec(sql, (err) => {
        if (err) {
            console.error(err);
        } else {
            console.log('Base de datos configurada.');
        }
        db.close(); // Cerrar la conexión
    });
});
