CREATE DATABASE almacen__;

USE almacen__;

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255)
);

INSERT INTO categoria (nombre) VALUES
    ('Electrónicos'),
    ('Ropa'),
    ('Hogar'),
    ('Alimentos');

CREATE TABLE IF NOT EXISTS marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255)
);

INSERT INTO marca (nombre) VALUES
    ('Sony'),
    ('Nike'),
    ('Samsung'),
    ('Adidas');

CREATE TABLE IF NOT EXISTS producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    id_categoria INT,
    id_marca INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    FOREIGN KEY (id_marca) REFERENCES marca (id_marca)
);

INSERT INTO producto (nombre, id_categoria, id_marca) VALUES
    ('Televisor LED 55"', 1, 1),
    ('Zapatillas deportivas', 2, 2),
    ('Heladera', 3, 3),
    ('Smartphone Galaxy', 1, 3);

CREATE TABLE IF NOT EXISTS precio (
    id_precio INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);

INSERT INTO precio (id_producto, precio) VALUES
    (1, 699.99),
    (2, 89.99),
    (3, 999.99),
    (4, 499.99);

CREATE TABLE IF NOT EXISTS stock (
    id_stock INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);

INSERT INTO stock (id_producto, cantidad) VALUES
    (1, 50),
    (2, 100),
    (3, 30),
    (4, 75);
