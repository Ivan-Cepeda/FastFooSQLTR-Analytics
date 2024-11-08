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
SELECT 	E.Nombre,	SUM(O.TotalCompra) [Total Ingreso por Empleado],	CASE		WHEN SUM(O.TotalCompra) > 1000 THEN 'Alto'		ELSE 'Bajo'	END AS NivelFROM Ordenes ORIGHT JOIN Empleados E	ON O.EmpleadoID = E.EmpleadoIDGROUP BY E.NombreORDER BY [Total Ingreso por Empleado] DESC;

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
SELECT 	O.HorarioVenta, 	P.Producto,	SUM(D.Cantidad) CantidadProductoFROM DetalleOrdenes DJOIN Ordenes O	ON D.OrdenID = O.OrdenIDJOIN Productos P	ON D.ProductoID = P.ProductoIDGROUP BY O.HorarioVenta, P.ProductoORDER BY CantidadProducto DESC;-----------------------------/*Comparaci�n de Ventas Mensuales: �Cu�l es la tendencia de los ingresos generados en cada periodo mensual?*/SELECT YEAR(FechaOrdenTomada) AS A�O, 		MONTH(FechaOrdenTomada) NroMes,		DATENAME(MONTH,FechaOrdenTomada) AS MES, 		SUM(TotalCompra) AS INGRESOSFROM OrdenesGROUP BY YEAR(FechaOrdenTomada), MONTH(FechaOrdenTomada), DATENAME(MONTH,FechaOrdenTomada)  ORDER BY NroMes;/*An�lisis de Fidelidad del Cliente: �Qu� porcentaje de clientes son recurrentes versus nuevos clientes cada mes? NOTA: La consulta se enfocar�a en la frecuencia de �rdenes por cliente para inferir la fidelidad.*/SELECT ClienteID, COUNT(OrdenID) Cantidad, YEAR(FechaOrdenTomada) A�o, MONTH(FechaOrdenTomada) MesFROM OrdenesGROUP BY ClienteID, YEAR(FechaOrdenTomada), MONTH(FechaOrdenTomada);

WITH ClientePrimeraOrden AS (    SELECT         ClienteID,        MIN(MONTH(FechaOrdenTomada)) AS MesPrimeraOrden,        MIN(YEAR(FechaOrdenTomada)) AS AnioPrimeraOrden    FROM Ordenes    GROUP BY ClienteID),ClientesPorMes AS (    SELECT         MONTH(O.FechaOrdenTomada) AS Mes,        YEAR(O.FechaOrdenTomada) AS Anio,        O.ClienteID,        CASE             WHEN CP.MesPrimeraOrden = MONTH(O.FechaOrdenTomada)                 AND CP.AnioPrimeraOrden = YEAR(O.FechaOrdenTomada)            THEN 'Nuevo'            ELSE 'Recurrente'        END AS TipoCliente    FROM Ordenes AS O    INNER JOIN ClientePrimeraOrden CP        ON O.ClienteID = CP.ClienteID)SELECT     Mes,    Anio,    SUM(CASE WHEN TipoCliente = 'Nuevo' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS [Porcentaje Nuevos],    SUM(CASE WHEN TipoCliente = 'Recurrente' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS [Porcentaje Recurrentes]FROM ClientesPorMesGROUP BY Mes, AnioORDER BY Anio, Mes;




USE FastFoodAnalytics;
SELECT * FROM DetalleOrdenesSimplificados

SELECT * FROM OrdenesSimplificadas

SELECT * FROM ProductosSimplificados
-- Costo Operacional
-- Lecturas
-- Ram Consumida
-- Tiempo
.......