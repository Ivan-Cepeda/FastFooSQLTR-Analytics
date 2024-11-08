--##--Base de datos de Analítica--##--
CREATE DATABASE FastFoodAnalytics;
GO

USE FastFoodAnalytics;
GO

-- Crear tablas simplificadas con información adicional
CREATE TABLE ProductosSimplificados (
    ProductoID INT PRIMARY KEY,
    Producto VARCHAR(100),
    Categoria VARCHAR(100),
    Precio DECIMAL
);

CREATE TABLE OrdenesSimplificadas (
    OrdenID INT PRIMARY KEY,
    ClienteID INT,
    ClienteNombre VARCHAR(100),
    TotalCompra DECIMAL,
    FechaOrdenTomada DATETIME,
    Sucursal VARCHAR(100),
    Empleado VARCHAR(100),
    MetodoPago VARCHAR(100),
    Origen VARCHAR(100)
);
GO

CREATE TABLE DetalleOrdenesSimplificados (
    DetalleID INT PRIMARY KEY,
    OrdenID INT,
    ProductoID INT,
    Cantidad INT,
    Precio DECIMAL,
    FOREIGN KEY (OrdenID) REFERENCES OrdenesSimplificadas(OrdenID),
    FOREIGN KEY (ProductoID) REFERENCES ProductosSimplificados(ProductoID)
);
GO
