USE FastFoodTR;
SELECT * FROM Auditoria;
SELECT * FROM Ordenes;

CREATE INDEX IdxIngresos
ON Ordenes(OrdenID ASC, TotalCompra);

SET STATISTICS IO ON

/*Eficiencia de los mensajeros: 
�Cu�l es el tiempo promedio desde el despacho hasta la entrega 
de los pedidos gestionados por todo el equipo de mensajer�a?*/

SELECT AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) 
FROM Ordenes;

/*An�lisis de Ventas por Origen de Orden: 
�Qu� canal de ventas genera m�s ingresos?*/

SELECT Origen.Descripcion AS Descripcion, SUM(TotalCompra) AS Ingresos
FROM Ordenes
JOIN Origen
	ON Origen.OrigenID = Ordenes.OrigenID
GROUP BY Origen.Descripcion
ORDER BY Ingresos DESC;

/*Productividad de los Empleados: 
�Cu�l es el nivel de ingreso generado por Empleado?*/

-- SELECT * FROM Ordenes;
SELECT Empleados.Nombre AS Vendedor, SUM(TotalCompra) AS Ingresos
FROM Ordenes
RIGHT JOIN Empleados
	ON Empleados.EmpleadoID = Ordenes.EmpleadoID
GROUP BY Empleados.Nombre
ORDER BY Ingresos DESC;


-----------
SELECT 

/*An�lisis de Demanda por Horario y D�a: �C�mo var�a la demanda de productos a lo largo del d�a? 
NOTA: Esta consulta no puede ser implementada sin una definici�n clara del horario (ma�ana, tarde, noche) 
en la base de datos existente. Asumiremos que HorarioVenta refleja esta informaci�n correctamente*/

SELECT * FROM Ordenes;

SELECT HorarioVenta, SUM(DetalleOrdenes.Cantidad) Cantidad
FROM Ordenes
JOIN DetalleOrdenes
	ON Ordenes.OrdenID = DetalleOrdenes.OrdenID
GROUP BY HorarioVenta
ORDER BY Cantidad DESC;
---------------------------
SELECT 

WITH ClientePrimeraOrden AS (




USE FastFoodAnalytics;
SELECT * FROM DetalleOrdenesSimplificados

SELECT * FROM OrdenesSimplificadas

SELECT * FROM ProductosSimplificados
-- Costo Operacional
-- Lecturas
-- Ram Consumida
-- Tiempo
.......