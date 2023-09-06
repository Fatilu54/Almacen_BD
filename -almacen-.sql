USE almacen;

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS stock (
    id_stock INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);

CREATE TABLE IF NOT EXISTS precio (
    id_precio INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);

CREATE TABLE IF NOT EXISTS producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    id_categoria INT,
    id_marca INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    FOREIGN KEY (id_marca) REFERENCES marca (id_marca)
);

INSERT INTO categoria (nombre) VALUES
    ('Electrónicos'),
    ('Ropa'),
    ('Hogar');


INSERT INTO marca (nombre) VALUES
    ('Sony'),
    ('Nike'),
    ('Philip');

INSERT INTO producto (nombre, id_categoria, id_marca) VALUES
    ('Televisor', 1, 1),
    ('Zapatillas', 2, 2),
    ('Heladera', 3, 3),
    ('Parlante', 1, 3);

INSERT INTO precio (id_producto, precio) VALUES
    (1, 1000),
    (2, 200),
    (3, 2000),
    (4, 300);


INSERT INTO stock (id_producto, cantidad) VALUES
    (1, 10),
    (2, 30),
    (3, 5),
    (4, 15);
