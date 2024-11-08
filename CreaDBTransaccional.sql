--##--Crea Base de Datos Transaccional--##--

-- #################AVANCE PROYECTO INTEGRADOR USO DDL########################--
--Creación Base de datos
CREATE DATABASE FastFoodTR; -- Se crea Fast Food
GO
USE FastFoodTR;
GO

--Crear tablas 
CREATE TABLE Categoria(
	CategoriaID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Categoria VARCHAR(100)
);
-- DROP TABLE Categoria;

CREATE TABLE Productos(
	ProductoID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Producto VARCHAR(100), 
	CategoriaID INT,
	Precio DECIMAL,
	FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);
-- DROP TABLE Productos;

CREATE TABLE Sucursales(
	SucursalID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Sucursal VARCHAR(100),
	Direccion VARCHAR(200)
);
-- DROP TABLE Sucursales;
CREATE TABLE Empleados(
	EmpleadoID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	Posicion VARCHAR(100),
	Departamento VARCHAR(100),
	SucursalID INT,
	ROL VARCHAR(100)
);
-- DROP TABLE Empleados;

CREATE TABLE Clientes(
	ClienteID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	Direccion VARCHAR (100)
);
-- DROP TABLE Clientes;
CREATE TABLE Origen(
	OrigenID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Descripcion VARCHAR(100)
);
-- DROP TABLE Origen;

CREATE TABLE TiposPago(
	TiposPagoID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Descripcion VARCHAR(100)
);
-- DROP TABLE TiposPago;

CREATE TABLE Mensajeros(
	MensajeroID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	EsExterno BIT
);

CREATE TABLE Ordenes(
	OrdenID INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	ClienteID INT FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID), 
	EmpleadoID INT FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID),
	SucursalID INT FOREIGN KEY (SucursalID) REFERENCES Sucursales (SucursalID),
	MensajeroID INT FOREIGN KEY (MensajeroID) REFERENCES Mensajeros (MensajeroID),
	TiposPagoID INT	FOREIGN KEY (TiposPagoID) REFERENCES TiposPago (TiposPagoID),
	OrigenID INT FOREIGN KEY (OrigenID) REFERENCES Origen (OrigenID),
	HorarioVenta VARCHAR(100) not null,
	TotalCompra DECIMAL not null,
	KilometrosRecorrer DECIMAL not null,
	FechaDespacho DATETIME,
	FechaEntrega DATETIME,
	FechaOrdenTomada DATETIME,
	FechaOrdenLista DATETIME,
);

CREATE TABLE DetalleOrdenes(
	DetalleID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	OrdenID INT	FOREIGN KEY (OrdenID) REFERENCES Ordenes (OrdenID),
	ProductoID INT FOREIGN KEY (ProductoID) REFERENCES Productos (ProductoID),
	Cantidad INT,
	Precio DECIMAL,
);
------
CREATE TABLE Auditoria(
	AuditoriaID INT IDENTITY(1,1) PRIMARY KEY,
	Tipo CHAR(1),
	Tabla VARCHAR(50),
	Registro INT,
	Campo VARCHAR(50),
	ValorAntes VARCHAR(50),
	ValorDespués VARCHAR(50),
	Fecha DATETIME, 
	Usuario VARCHAR(50)
);