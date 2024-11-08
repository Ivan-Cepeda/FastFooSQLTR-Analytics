--##--Triggers Carga a Análítica--##--

USE FastFoodTR;
GO

-- Trigger para la Tabla Productos 
CREATE TRIGGER trgInsertarActualizarProductos
ON Productos
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar nuevos registros
    INSERT INTO FastFoodAnalytics.dbo.ProductosSimplificados (ProductoID, Producto, Categoria, Precio)
    SELECT 
        inserted.ProductoID, 
        inserted.Producto, 
        c.Categoria, 
        inserted.Precio
    FROM inserted
    JOIN Categoria c ON inserted.CategoriaID = c.CategoriaID
    WHERE NOT EXISTS (
        SELECT 1 
        FROM FastFoodAnalytics.dbo.ProductosSimplificados ps 
        WHERE ps.ProductoID = inserted.ProductoID
    );

    -- Actualizar registros existentes
    UPDATE ps
    SET 
        ps.Producto = inserted.Producto,
        ps.Categoria = c.Categoria,
        ps.Precio = inserted.Precio
    FROM FastFoodAnalytics.dbo.ProductosSimplificados ps
    JOIN inserted ON ps.ProductoID = inserted.ProductoID
    JOIN Categoria c ON inserted.CategoriaID = c.CategoriaID;
END;
GO

------------
--Trigger para la Tabla Ordenes
CREATE TRIGGER trgInsertarActualizarOrdenes
ON Ordenes
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar nuevos registros
    INSERT INTO FastFoodAnalytics.dbo.OrdenesSimplificadas (OrdenID, ClienteID, ClienteNombre, TotalCompra, FechaOrdenTomada, Sucursal, Empleado, MetodoPago, Origen)
    SELECT 
        inserted.OrdenID, 
        inserted.ClienteID, 
        c.Nombre AS ClienteNombre, 
        inserted.TotalCompra, 
        inserted.FechaOrdenTomada, 
        s.Sucursal, 
        e.Nombre AS Empleado, 
        tp.Descripcion AS MetodoPago, 
        o.Descripcion AS Origen
    FROM inserted
    JOIN Clientes c ON inserted.ClienteID = c.ClienteID
    JOIN Sucursales s ON inserted.SucursalID = s.SucursalID
    JOIN Empleados e ON inserted.EmpleadoID = e.EmpleadoID
    JOIN TiposPago tp ON inserted.TiposPagoID = tp.TiposPagoID
    JOIN Origen o ON inserted.OrigenID = o.OrigenID
    WHERE NOT EXISTS (
        SELECT 1 
        FROM FastFoodAnalytics.dbo.OrdenesSimplificadas os 
        WHERE os.OrdenID = inserted.OrdenID
    );

    -- Actualizar registros existentes
    UPDATE os
    SET 
        os.ClienteID = inserted.ClienteID,
        os.ClienteNombre = c.Nombre,
        os.TotalCompra = inserted.TotalCompra,
        os.FechaOrdenTomada = inserted.FechaOrdenTomada,
        os.Sucursal = s.Sucursal,
        os.Empleado = e.Nombre,
        os.MetodoPago = tp.Descripcion,
        os.Origen = o.Descripcion
    FROM FastFoodAnalytics.dbo.OrdenesSimplificadas os
    JOIN inserted ON os.OrdenID = inserted.OrdenID
    JOIN Clientes c ON inserted.ClienteID = c.ClienteID
    JOIN Sucursales s ON inserted.SucursalID = s.SucursalID
    JOIN Empleados e ON inserted.EmpleadoID = e.EmpleadoID
    JOIN TiposPago tp ON inserted.TiposPagoID = tp.TiposPagoID
    JOIN Origen o ON inserted.OrigenID = o.OrigenID;
END;
GO

--##--Trigger para la Tabla DetalleOrdenes--##--
CREATE TRIGGER trgInsertarActualizarDetalleOrdenes
ON DetalleOrdenes
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar nuevos registros
    INSERT INTO FastFoodAnalytics.dbo.DetalleOrdenesSimplificados (DetalleID, OrdenID, ProductoID, Cantidad, Precio)
    SELECT 
        inserted.DetalleID, 
        inserted.OrdenID, 
        inserted.ProductoID, 
        inserted.Cantidad, 
        inserted.Precio
    FROM inserted
    WHERE NOT EXISTS (
        SELECT 1 
        FROM FastFoodAnalytics.dbo.DetalleOrdenesSimplificados dos 
        WHERE dos.DetalleID = inserted.DetalleID
    );

    -- Actualizar registros existentes
    UPDATE dos
    SET 
        dos.OrdenID = inserted.OrdenID,
        dos.ProductoID = inserted.ProductoID,
        dos.Cantidad = inserted.Cantidad,
        dos.Precio = inserted.Precio
    FROM FastFoodAnalytics.dbo.DetalleOrdenesSimplificados dos
    JOIN inserted ON dos.DetalleID = inserted.DetalleID;
END;
GO
