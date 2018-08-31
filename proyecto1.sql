DROP TABLE Archivo
DROP TABLE Item
DROP TABLE Usuarios


CREATE TABLE Usuarios(
	LoginID nvarchar(100) PRIMARY KEY,
	Password nvarchar(100) NOT NULL,
	Nombre nvarchar(200),
	Email nvarchar(500),
	Administrador BIT NOT NULL DEFAULT 0,
	
)

CREATE TABLE Item (
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
CREATE TABLE Archivo (
	IDArchivo bigint NOT NULL IDENTITY(1,1) PRIMARY KEY,	
	Modificado datetime NOT NULL DEFAULT getdate(),
	NombreArchivo nvarchar(500),	
	Contenido image,	
	IDItem bigint NOT NULL REFERENCES Item,
	Orden bigint,
	Titulo nvarchar(200),
)