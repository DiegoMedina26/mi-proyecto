const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');

const app = express();
const PORT = 3000;

// Servir archivos estáticos (HTML, CSS)
app.use(express.static('public'));

// Crear y conectar a la base de datos
const db = new sqlite3.Database('./database.db', (err) => {
    if (err) {
        console.error(err.message);
    }
    console.log('Conectado a la base de datos SQLite.');
});

// API para obtener proveedores
app.get('/api/proveedores', (req, res) => {
    db.all('SELECT * FROM proveedores', [], (err, rows) => {
        if (err) {
            throw err;
        }
        res.json(rows);
    });
});

// API para obtener ventas
app.get('/api/ventas', (req, res) => {
    db.all('SELECT * FROM ventas', [], (err, rows) => {
        if (err) {
            throw err;
        }
        res.json(rows);
    });
});

// API para obtener clientes
app.get('/api/clientes', (req, res) => {
    db.all('SELECT * FROM clientes', [], (err, rows) => {
        if (err) {
            throw err;
        }
        res.json(rows);
    });
});

// API para obtener productos
app.get('/api/productos', (req, res) => {
    db.all('SELECT * FROM productos', [], (err, rows) => {
        if (err) {
            throw err;
        }
        res.json(rows);
    });
});

// Cerrar la base de datos al cerrar el servidor
app.on('exit', () => {
    db.close();
});

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
