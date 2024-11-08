USE FastFoodTR;
GO
-- Insertar datos en Categorias
INSERT INTO Categoria (Categoria) VALUES
('Comida Rápida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafetería'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

-- Insertar datos en Productos
INSERT INTO Productos (Producto, CategoriaID, Precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99), ('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada César', 4, 5.99), ('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);

-- Insertar datos en Sucursales
INSERT INTO Sucursales (Sucursal, Direccion) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'), ('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Montaña', '1718 Mountain St'), ('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');

-- Insertar datos en Empleados
INSERT INTO Empleados (Nombre, Posicion, Departamento, SucursalID, Rol) VALUES
('John Doe', 'Gerente', 'Administración', 1, 'Vendedor'), ('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), ('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), ('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), ('Tom Brown', 'Barista', 'Cafetería', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Logística', 1, 'Mensajero'), ('Lucas Miller', 'Atención al Cliente', 'Servicio', 1, 'Vendedor'), ('Olivia García', 'Encargado de Turno', 'Administración', 1, 'Vendedor'), ('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), ('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

-- Insertar datos en Clientes
INSERT INTO Clientes (Nombre, Direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'), ('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'), ('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');

-- Insertar datos en OrigenesOrden
INSERT INTO Origen(Descripcion) VALUES
('En línea'), ('Presencial'), ('Teléfono'), ('Drive Thru'), ('App Móvil'),
('Redes Sociales'), ('Correo Electrónico'), ('Publicidad'), ('Recomendación'), ('Evento');

-- Insertar datos en TiposPago
INSERT INTO TiposPago (Descripcion) VALUES
('Efectivo'), ('Tarjeta de Crédito'), ('Tarjeta de Débito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cupón de Descuento'), ('Pago Móvil');

-- Insertar datos en Mensajeros
INSERT INTO Mensajeros (Nombre, EsExterno) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);

-- Insertar datos en Ordenes
INSERT INTO Ordenes (ClienteID, EmpleadoID, SucursalID, MensajeroID, TiposPagoID, OrigenID, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista) VALUES
(1, 1, 1, 1, 1, 1, 'Mañana', 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Mañana', 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Mañana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Mañana', 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00'),
(4, 3, 2, 4, 1, 1, 'Mañana', 978.50, 8.0, '2023-11-05 08:30:00', '2023-11-05 09:00:00', '2023-11-05 08:00:00', '2023-11-05 08:15:00'),
(5, 6, 4, 8, 2, 3, 'Tarde', 1054.80, 10.5, '2023-11-06 14:30:00', '2023-11-06 15:00:00', '2023-11-06 14:00:00', '2023-11-06 14:15:00'),
(6, 5, 3, 6, 3, 2, 'Noche', 1123.40, 7.2, '2023-11-07 19:30:00', '2023-11-07 20:00:00', '2023-11-07 19:00:00', '2023-11-07 19:15:00')


--Select * from Ordenes

-- Insertar datos en DetalleOrdenes
INSERT INTO DetalleOrdenes (OrdenID, ProductoID, Cantidad, Precio) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),

(2, 1, 2, 20.00),
(2, 2, 1, 15.00),
(2, 3, 3, 25.00),
(2, 4, 1, 30.00),
(2, 5, 2, 10.00),
(2, 6, 4, 12.50),
(2, 7, 2, 17.00),
(2, 8, 1, 13.50),
(2, 9, 3, 18.00),
(2, 10, 1, 22.00),
    
-- Detalles para la orden 3
(3, 1, 1, 30.00),
(3, 2, 2, 15.00),
(3, 3, 3, 20.00),
(3, 4, 1, 25.00),
(3, 5, 1, 18.00),
(3, 6, 2, 12.50),
(3, 7, 3, 14.00),
(3, 8, 1, 20.00),
(3, 9, 2, 16.50),
(3, 10, 1, 25.00),
    
    -- Detalles para la orden 4
(4, 1, 2, 23.00),
(4, 2, 1, 12.00),
(4, 3, 4, 18.00),
(4, 4, 2, 22.00),
(4, 5, 3, 10.00),
(4, 6, 1, 15.00),
(4, 7, 2, 13.00),
(4, 8, 1, 17.50),
(4, 9, 2, 19.00),
(4, 10, 1, 21.00),
    
 -- Detalles para la orden 5
 (5, 1, 3, 15.00),
 (5, 2, 1, 12.50),
 (5, 3, 2, 18.00),
 (5, 4, 3, 22.00),
 (5, 5, 1, 14.00),
 (5, 6, 4, 16.50),
 (5, 7, 2, 19.00),
 (5, 8, 3, 13.00),
 (5, 9, 1, 20.00),
 (5, 10, 2, 25.00),
    
    -- Detalles para la orden 6
 (6, 1, 2, 10.00),
 (6, 2, 3, 15.00),
 (6, 3, 1, 20.00),
 (6, 4, 2, 12.50),
 (6, 5, 1, 22.00),
 (6, 6, 4, 18.00),
 (6, 7, 3, 14.00),
 (6, 8, 1, 16.00),
 (6, 9, 2, 17.00),
 (6, 10, 1, 19.00),
    
    -- Detalles para la orden 7
 (7, 1, 3, 25.00),
 (7, 2, 2, 18.50),
 (7, 3, 1, 20.00),
 (7, 4, 2, 22.50),
 (7, 5, 1, 15.00),
 (7, 6, 3, 13.50),
 (7, 7, 2, 17.00),
 (7, 8, 1, 16.50),
 (7, 9, 2, 19.00),
 (7, 10, 1, 23.00),
 
 --Detalles para la orden 8
 (8, 1, 2, 23.44),
 (8, 2, 1, 45.14),
 (8, 3, 3, 46.37),
 (8, 4, 4, 42.34),
 (8, 5, 2, 18.25),
 (8, 6, 1, 20.08),
 (8, 7, 2, 13.31),
 (8, 8, 3, 20.96),
 (8, 9, 4, 30.13),
 (8, 10, 1, 38.34),

-- Insertar detalles de la Orden 9
 (9, 1, 3, 25.00),
 (9, 2, 2, 17.50),
 (9, 3, 1, 20.00),
 (9, 4, 2, 22.50),
 (9, 5, 3, 15.00),
 (9, 6, 1, 18.50),
 (9, 7, 4, 19.00),
 (9, 8, 2, 16.50),
 (9, 9, 1, 21.00),
 (9, 10, 2, 23.00),

-- Insertar detalles de la Orden 11
 (11, 5, 3, 46.12),
 (11, 9, 1, 12.83),
 (11, 6, 5, 12.56),
 (11, 2, 1, 18.37),
 (11, 1, 3, 19.51),
 (11, 9, 1, 14.43),
 (11, 4, 4, 15.44),
-- Insertar detalles de la Orden 12
 (12, 8, 2, 10.03),
 (12, 2, 1, 43.52),
 (12, 6, 5, 10.73),
 (12, 1, 5, 35.61),
-- Insertar detalles de la Orden 13
 (13, 1, 3, 29.83),
 (13, 5, 3, 22.54),
 (13, 3, 3, 10.71),
 (13, 6, 1, 32.92);

 select * from Ordenes;