CREATE SCHEMA generation;

USE generation;

CREATE TABLE Cliente (
cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR (25),
direccion VARCHAR (50),
correo VARCHAR (50),
medio_pago VARCHAR (20),
valoracion INTEGER,
rut_cliente VARCHAR (15)
);


CREATE TABLE Boleta(
boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nro_boleta BIGINT,
fecha DATE,
total float
);

CREATE TABLE Proveedor(
proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR (50),
rol INTEGER,
contacto VARCHAR(50),
fecha_visita DATE
);

CREATE TABLE Producto(
producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(50),
precio INTEGER
);
CREATE TABLE Proveedor_producto(
proveedor_producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
producto_id INTEGER,
proveedor_id INTEGER
);

ALTER TABLE Proveedor_producto
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id),
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id);


#CON ESTO YO AGREGO LA COLUMNA DE LA TABLA BOLETA
ALTER TABLE Boleta add cliente_id INTEGER NOT NULL;

#CREAR LAS RELACIONES UTILIZANDO LAS FOREIGN KEY
ALTER TABLE Boleta
ADD FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id);

#como insertar datos
INSERT INTO Cliente (nombre, direccion, correo, medio_pago, valoracion, rut_cliente) 
VALUE("fer", "calle123", "fer@gmail.com", "efectivo", 5, "15745697-5");
INSERT INTO Cliente (nombre, direccion, correo, medio_pago, valoracion, rut_cliente) 
VALUE("coni", "calle143", "cony@gmail.com", "tarjeta", 10, "15846797-5");

SELECT * FROM Cliente;
