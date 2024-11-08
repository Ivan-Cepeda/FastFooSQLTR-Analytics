--##--Triggers Auditoria--##--
USE FastFoodTR;
GO

CREATE TRIGGER trgAuditoriaProductos
ON Productos
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'Productos', inserted.ProductoID, 'ProductoID', NULL, inserted.ProductoID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'Productos', deleted.ProductoID, 'ProductoID', deleted.ProductoID, inserted.ProductoID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.ProductoID = deleted.ProductoID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'Productos', deleted.ProductoID, 'ProductoID', deleted.ProductoID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO

CREATE TRIGGER trgAuditoriaSucursales
ON Sucursales
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'Sucursales', inserted.SucursalID, 'SucursalID', NULL, inserted.SucursalID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'Sucursales', deleted.SucursalID, 'SucursalID', deleted.SucursalID, inserted.SucursalID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.SucursalID = deleted.SucursalID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'Sucursales', deleted.SucursalID, 'SucursalID', deleted.SucursalID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO

CREATE TRIGGER trgAuditoriaEmpleados
ON Empleados
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'Empleados', inserted.EmpleadoID, 'EmpleadoID', NULL, inserted.EmpleadoID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'Empleados', deleted.EmpleadoID, 'EmpleadoID', deleted.EmpleadoID, inserted.EmpleadoID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.EmpleadoID = deleted.EmpleadoID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'Empleados', deleted.EmpleadoID, 'EmpleadoID', deleted.EmpleadoID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO

CREATE TRIGGER trgAuditoriaClientes
ON Clientes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'Clientes', inserted.ClienteID, 'ClienteID', NULL, inserted.ClienteID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'Clientes', deleted.ClienteID, 'ClienteID', deleted.ClienteID, inserted.ClienteID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.ClienteID = deleted.ClienteID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'Clientes', deleted.ClienteID, 'ClienteID', deleted.ClienteID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO

CREATE TRIGGER trgAuditoriaOrdenes
ON Ordenes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'Ordenes', inserted.OrdenID, 'OrdenID', NULL, inserted.OrdenID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'Ordenes', deleted.OrdenID, 'OrdenID', deleted.OrdenID, inserted.OrdenID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.OrdenID = deleted.OrdenID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'Ordenes', deleted.OrdenID, 'OrdenID', deleted.OrdenID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO

CREATE TRIGGER trgAuditoriaDetalleOrdenes
ON DetalleOrdenes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'DetalleOrdenes', inserted.DetalleID, 'DetalleID', NULL, inserted.DetalleID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'DetalleOrdenes', deleted.DetalleID, 'DetalleID', deleted.DetalleID, inserted.DetalleID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.DetalleID = deleted.DetalleID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'DetalleOrdenes', deleted.DetalleID, 'DetalleID', deleted.DetalleID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO

CREATE TRIGGER trgAuditoriaCategoria
ON Categoria
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'Categoria', inserted.CategoriaID, 'CategoriaID', NULL, inserted.CategoriaID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'Categoria', deleted.CategoriaID, 'CategoriaID', deleted.CategoriaID, inserted.CategoriaID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.CategoriaID = deleted.CategoriaID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'Categoria', deleted.CategoriaID, 'CategoriaID', deleted.CategoriaID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO

CREATE TRIGGER trgAuditoriaMensajeros
ON Mensajeros
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'Mensajeros', inserted.MensajeroID, 'MensajeroID', NULL, inserted.MensajeroID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'Mensajeros', deleted.MensajeroID, 'MensajeroID', deleted.MensajeroID, inserted.MensajeroID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.MensajeroID = deleted.MensajeroID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'Mensajeros', deleted.MensajeroID, 'MensajeroID', deleted.MensajeroID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO

CREATE TRIGGER trgAuditoriaOrigen
ON Origen
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'Origen', inserted.OrigenID, 'OrigenID', NULL, inserted.OrigenID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'Origen', deleted.OrigenID, 'OrigenID', deleted.OrigenID, inserted.OrigenID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.OrigenID = deleted.OrigenID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'Origen', deleted.OrigenID, 'OrigenID', deleted.OrigenID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO

CREATE TRIGGER trgAuditoriaTiposPago
ON TiposPago
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Auditoría para INSERT
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'I', 'TiposPago', inserted.TiposPagoID, 'TiposPagoID', NULL, inserted.TiposPagoID, GETDATE(), SYSTEM_USER
    FROM inserted;

    -- Auditoría para UPDATE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'U', 'TiposPago', deleted.TiposPagoID, 'TiposPagoID', deleted.TiposPagoID, inserted.TiposPagoID, GETDATE(), SYSTEM_USER
    FROM inserted
    INNER JOIN deleted ON inserted.TiposPagoID = deleted.TiposPagoID;

    -- Auditoría para DELETE
    INSERT INTO Auditoria (Tipo, Tabla, Registro, Campo, ValorAntes, ValorDespués, Fecha, Usuario)
    SELECT 'D', 'TiposPago', deleted.TiposPagoID, 'TiposPagoID', deleted.TiposPagoID, NULL, GETDATE(), SYSTEM_USER
    FROM deleted;
END;
GO


