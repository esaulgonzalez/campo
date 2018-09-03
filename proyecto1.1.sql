DROP TABLE Productos
DROP TABLE Ventas
DROP TABLE Usuarios
DROP TABLE Categoria
DROP TABLE Administrador
DROP TABLE Ventas_Pro
DROP TABLE CP

CREATE TABLE Usuarios(
	LoginID nvarchar(100) PRIMARY KEY,
	Password nvarchar(100) NOT NULL,
	Nombre nvarchar(200),
	Email nvarchar(500),
	Administrador BIT NOT NULL DEFAULT 0,
	Telefono nvarchar(500),
	CP nvarchar(500),
	
)
CREATE TABLE Productos(
	IDproductos nvarchar(100) PRIMARY KEY,
	producto nvarchar(100) NOT NULL,
	Nombre nvarchar(200),
	costo nvarchar(500),
	Administrador BIT NOT NULL DEFAULT 0, #esta linea no la entiendo
	idusuario nvarchar(500),
	
)
CREATE TABLE Ventas(
	IDventas nvarchar(100) PRIMARY KEY,
	idproducto nvarchar(100) NOT NULL,
	Nombre nvarchar(200),
	cantidad nvarchar(500),
	Administrador BIT NOT NULL DEFAULT 0,
	Descripcion nvarchar(800),
	estado nvarchar(500),
	
)

CREATE TABLE Categoria(
	IDItem bigint NOT NULL IDENTITY(1,1) PRIMARY KEY,	

	FechaCreacion datetime NOT NULL DEFAULT getdate(),
		
	Recomendado BIT NOT NULL,
	Publicado BIT NOT NULL,	
	LoNuevo BIT NOT NULL,
		
	Codigo nvarchar(100) NOT NULL UNIQUE,
	Titulo nvarchar(200) NOT NULL,
	Descripcion nvarchar(1000) NOT NULL,
	PalabrasClave nvarchar(1000) NOT NULL,	
	Grupo nvarchar(200) NOT NULL,
	SubGrupo nvarchar(200) NOT NULL,
	Marca nvarchar(200) NOT NULL,
	Orden bigint NOT NULL,

	
	Precio money NOT NULL,				
)
CREATE TABLE Administrador(
	IDArchivo bigint NOT NULL IDENTITY(1,1) PRIMARY KEY,	
	Modificado datetime NOT NULL DEFAULT getdate(),
	NombreArchivo nvarchar(500),	
	Contenido image,	
	IDItem bigint NOT NULL REFERENCES Item,
	Orden bigint,
	Titulo nvarchar(200),
)
CREATE TABLE Ventas_Pro(
	LoginID nvarchar(100) PRIMARY KEY,
	IDventas nvarchar(100) NOT NULL,
	idproducto nvarchar(200),
	idventa nvarchar(500),
	Administrador BIT NOT NULL DEFAULT 0,
	
)