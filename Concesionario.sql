CREATE DATABASE dbconcesionario;

USE DATABASE dbconcesionario;

CREATE TABLE Tbl_Administrador(
Ad_Id Int PRIMARY KEY AUTO_INCREMENT,
Ad_Primer_Nombre Varchar(20) NOT NULL,
Ad_Segundo_Nombre Varchar(20) NOT NULL,
Ad_Primer_Apellido Varchar(20) NOT NULL,
Ad_Segundo_Apellido Varchar(20) NOT NULL,
Ad_Nacionalidad Varchar(30),
Ad_Departamento Varchar(30),
Ad_Ciudad Varchar(30),
Ad_Usuario Varchar(30),
Ad_Email Varchar(50),
Ad_Contrasena Varchar(250));

CREATE TABLE Tbl_Vehiculos(
Ve_Id Int PRIMARY KEY AUTO_INCREMENT,
Ve_Marca Varchar(30) NOT NULL,
Ve_Modelo Varchar(200),
Ve_Cilindrada Varchar(50),
Ve_Precio Double,
Ve_Imagen Blob,
Ve_Ad_Id Int NOT NULL);

CREATE TABLE Tbl_Opciones(
Op_Id Int PRIMARY KEY AUTO_INCREMENT,
Op_Nombre Varchar(100) NOT NULL,
Op_Descripcion Text,
Op_Ad_Id Int NOT NULL);

CREATE TABLE Tbl_Cliente(
Cli_Id Int PRIMARY KEY AUTO_INCREMENT,
Cli_Primer_Nombre Varchar(20) NOT NULL,
Cli_Segundo_Nombre Varchar(20) NOT NULL,
Cli_Primer_Apellido Varchar(20) NOT NULL,
Cli_Segundo_Apellido Varchar(20) NOT NULL,
Cli_Tipo_Documento ENUM('C.C', 'C.E', 'NIT', 'PAS') NOT NULL,
Cli_Numero_Documento Varchar(50) NOT NULL,
Cli_Departamento Varchar(30),
Cli_Ciudad Varchar(30),
Cli_Direccion Varchar(150),
Cli_Telefono Varchar(12),
Cli_Email Varchar(50),
Cli_Ad_Id Int NOT NULL);

CREATE TABLE Tbl_Vendedores(
Ven_Id Int PRIMARY KEY AUTO_INCREMENT,
Ven_Primer_Nombre Varchar(20) NOT NULL,
Ven_Segundo_Nombre Varchar(20) NOT NULL,
Ven_Primer_Apellido Varchar(20) NOT NULL,
Ven_Segundo_Apellido Varchar(20) NOT NULL,
Ven_Tipo_Documento ENUM('C.C', 'C.E', 'NIT', 'PAS'),
Ven_Numero_Documento Varchar(50),
Ven_Departamento Varchar(30),
Ven_Ciudad Varchar(30),
Ven_Direccion Varchar(150),
Ven_Telefono Varchar(12),
Ven_Email Varchar(50),
Ven_Ad_Id Int NOT NULL);

CREATE TABLE Tbl_VehiculoUsado(
Vu_Id Int PRIMARY KEY AUTO_INCREMENT,
Vu_Marca Varchar(30) NOT NULL,
Vu_Cli_Id Int NOT NULL,
Vu_Modelo Varchar(200),
Vu_Matricula Varchar(100) NOT NULL,
Vu_Precio_Tasacion Double,
Vu_Fecha_Cesion Date,
Vu_Imagen Blob,
Vu_Ad_Id Int NOT NULL);

CREATE TABLE Tbl_MedioPago(
Me_Id Int PRIMARY KEY AUTO_INCREMENT,
Me_Nombre Varchar(30));

CREATE TABLE Tbl_Venta(
Vet_Id Int PRIMARY KEY AUTO_INCREMENT,
Vet_Cli_Id Int NOT NULL,
Vet_Ven_Id Int NOT NULL,
Vet_Ve_Id Int NOT NULL,
Vet_Fecha_Venta Date,
Vet_Matricula_NuevoVehiculo Varchar(100) NOT NULL,
Vet_Opciones_Id Int,
Vet_VehiculoUsado_Id Int,
Vet_Precio_Total Double,
Vet_MedioPago_Id Int,
Vet_Ad_Id Int NOT NULL);

ALTER TABLE Tbl_Vehiculos
ADD FOREIGN KEY (Ve_Ad_Id) REFERENCES Tbl_Administrador(Ad_Id);

ALTER TABLE Tbl_Opciones
ADD FOREIGN KEY (Op_Ad_Id) REFERENCES Tbl_Administrador(Ad_Id);

ALTER TABLE Tbl_Cliente
ADD FOREIGN KEY (Cli_Ad_Id) REFERENCES Tbl_Administrador(Ad_Id);

ALTER TABLE Tbl_Vendedores
ADD FOREIGN KEY (Ven_Ad_Id) REFERENCES Tbl_Administrador(Ad_Id);

ALTER TABLE Tbl_VehiculoUsado
ADD FOREIGN KEY (Vu_Cli_Id) REFERENCES Tbl_Cliente(Cli_Id),
ADD FOREIGN KEY (Vu_Ad_Id) REFERENCES Tbl_Administrador(Ad_Id);

ALTER TABLE Tbl_Venta
ADD FOREIGN KEY (Vet_Cli_Id) REFERENCES Tbl_Cliente(Cli_Id),
ADD FOREIGN KEY (Vet_Ven_Id) REFERENCES Tbl_Vendedores(Ven_Id),
ADD FOREIGN KEY (Vet_Ve_Id) REFERENCES Tbl_Vehiculos(Ve_Id),
ADD FOREIGN KEY (Vet_Opciones_Id) REFERENCES Tbl_Opciones(Op_Id),
ADD FOREIGN KEY (Vet_VehiculoUsado_Id) REFERENCES Tbl_VehiculoUsado(Vu_Id),
ADD FOREIGN KEY (Vet_MedioPago_Id) REFERENCES Tbl_MedioPago(Me_Id),
ADD FOREIGN KEY (Vet_Ad_Id) REFERENCES Tbl_Administrador(Ad_Id);


