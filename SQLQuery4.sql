/*
This query text was retrieved from showplan XML, and may be truncated.
*/

SELECT 
	E.Nombre,
	SUM(O.TotalCompra) [Total Ingreso por Empleado],
	CASE
		WHEN SUM(O.TotalCompra) > 1000 THEN 'Alto'
		ELSE 'Bajo'
	END AS Nivel
FROM Ordenes O
RIGHT JOIN Empleados E
	ON O.EmpleadoID = E.EmpleadoID
GROUP BY E.Nombre
ORDER BY [Total Ingreso por Empleado] DESC

