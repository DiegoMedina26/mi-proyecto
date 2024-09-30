-- Crear la tabla de proveedores
CREATE TABLE proveedores (
    id_proveedor INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_proveedor VARCHAR(100) NOT NULL,
    contacto_proveedor VARCHAR(100),
    telefono_proveedor VARCHAR(15),
    email_proveedor VARCHAR(100),
    direccion_proveedor VARCHAR(200)
);

-- Crear la tabla de productos
CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion_producto TEXT,
    precio_unitario DECIMAL(10, 2),
    stock INTEGER NOT NULL DEFAULT 0
);

-- Crear la tabla de órdenes de compra
CREATE TABLE ordenes_compra (
    id_orden_compra INTEGER PRIMARY KEY AUTOINCREMENT,
    id_proveedor INTEGER NOT NULL,
    fecha_orden DATE NOT NULL,
    total DECIMAL(10, 2),
    estado_orden VARCHAR(50), -- 'Pendiente', 'Enviada', 'Completada'
    tiempo_estimado_entrega VARCHAR(100),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- Crear la tabla de detalles de órdenes de compra
CREATE TABLE detalles_orden_compra (
    id_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    id_orden_compra INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (id_orden_compra) REFERENCES ordenes_compra(id_orden_compra),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Crear la tabla de clientes
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_cliente VARCHAR(100) NOT NULL,
    contacto_cliente VARCHAR(100),
    telefono_cliente VARCHAR(15),
    email_cliente VARCHAR(100),
    direccion_cliente VARCHAR(200)
);

-- Crear la tabla de ventas
CREATE TABLE ventas (
    id_venta INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    fecha_venta DATE NOT NULL,
    total DECIMAL(10, 2),
    estado_venta VARCHAR(50), -- 'Completada', 'Pendiente'
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Crear la tabla de detalles de ventas
CREATE TABLE detalles_venta (
    id_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venta INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Crear la tabla de máquinas
CREATE TABLE maquinas (
    id_maquina INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_maquina VARCHAR(100) NOT NULL,
    estado_maquina VARCHAR(50), -- 'En Producción', 'Inactiva', 'Mantenimiento'
    producto_actual VARCHAR(100),
    cantidad_produciendo INTEGER
);

-- Crear la tabla de órdenes de producción
CREATE TABLE ordenes_produccion (
    id_orden_produccion INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_producto INTEGER NOT NULL,
    fecha_orden DATE NOT NULL,
    fecha_entrega DATE,
    cantidad INTEGER NOT NULL,
    estado_orden VARCHAR(50), -- 'En Proceso', 'Atrasada', 'Completada'
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
