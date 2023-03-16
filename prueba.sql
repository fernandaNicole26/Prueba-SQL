USE minimarket_don_jose;

CREATE TABLE Producto (
producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
sku INTEGER,
descripcion VARCHAR(50),
costo INTEGER,
precio INTEGER,
categoria VARCHAR (20),
cantidad_actual INTEGER,
cantidad_minima INTEGER
);

CREATE TABLE Proveedor (
proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(50),
contacto INTEGER,
direccion VARCHAR (75)
);

CREATE TABLE Inventario (
inventario_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
sku INTEGER,
nombre VARCHAR(50),
prod_bajo_inventario INTEGER,
categoria VARCHAR (20),
cantidad_actual INTEGER,
cantidad_minima INTEGER
);

CREATE TABLE Flujo_caja (
flujo_caja_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
venta_diaria INTEGER,
gastos INTEGER,
ganancia_diaria INTEGER,
pago_proveedores INTEGER,
fecha DATE
);

CREATE TABLE Producto_proveedor(
producto_id INTEGER,
proveedor_id INTEGER,
FOREIGN KEY (producto_id) REFERENCES producto (producto_id),
FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id)
);

SELECT * FROM Producto_proveedor;

INSERT INTO Producto_proveedor(producto_id, proveedor_id)
VALUES
(1,3),
(1,2),
(2,4),
(3,3);


INSERT INTO Producto( sku, descripcion, costo, precio, categoria, cantidad_actual, cantidad_minima)
VALUES(12345, "jabon popeye", 890, 1000, "aseo", 10, 3),
(12367, "galleta race", 550, 870, "confiteria", 5, 5),
(12347, "galleta mini", 550, 870, "confiteria", 9, 5),
(19877, "aceite polit", 1689, 1990, "abarrotes", 15, 5),
(13427, "belmont azul", 3950, 4300, "cigarros", 4, 5);

SELECT * FROM Producto;

INSERT INTO Proveedor( nombre, contacto, direccion)
VALUES("juan perez", 999999999, "las camelias 2"),
("juan atimo", 999678999, "las canarias 3"),
("juan salta", 998976999, "las cbalkias 4"),
("pollo loco", 990334449, "las monosias 5");

SELECT * FROM Proveedor;


INSERT INTO Flujo_caja(venta_diaria, gastos, ganancia_diaria, pago_proveedores, fecha)
VALUES(5678900, 60000, 1507890, 1245600,20220905),
(6788900, 87120, 2797890, 2864500,20220906),
(4678900, 63700, 1345890, 1899900,20220907),
(4978900, 89700, 1901760, 1222450,20220908),
(3568900, 45600, 1119090, 1989900,20220909);


SELECT * FROM Flujo_caja;

SELECT venta_diaria FROM Flujo_caja;

SELECT ganancia_diaria FROM Flujo_caja;


SELECT * FROM Flujo_caja
WHERE flujo_caja_id = 3;

SELECT SUM(venta_diaria)
FROM Flujo_caja;

SELECT * from Proveedor
inner join Producto_proveedor
on Proveedor.proveedor_id = Producto.producto_id;

