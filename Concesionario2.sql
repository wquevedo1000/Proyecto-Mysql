CREATE PROCEDURE InsertaAdministrador(PNombre Varchar(20), SNombre Varchar(20), PApellido Varchar(20),
 SApellido Varchar(20), Nacionalidad Varchar(30), Departamento Varchar(30), Ciudad Varchar(30), Usuario Varchar(30),
  Email Varchar(50), Contrasena Varchar(250))
INSERT INTO Tbl_Administrador(Ad_Id, Ad_Primer_Nombre, Ad_Segundo_Nombre, Ad_Primer_Apellido, Ad_Segundo_Apellido,
 Ad_Nacionalidad, Ad_Departamento, Ad_Ciudad, Ad_Usuario, Ad_Email, Ad_Contrasena) VALUES('', PNombre, SNombre,
  PApellido, SApellido, Nacionalidad, Departamento, Ciudad, Usuario, Email, Contrasena);

CALL InsertaAdministrador('PNombre.Valor', 'SNombre.Valor', 'PApellido.Valor', 'SApellido.Valor', 'Nacionalidad.Valor', 'Departamento.Valor', 'Ciudad.Valor',
 'Usuario.Valor', 'Email.Valor', 'Contrasena.Valor');

CREATE PROCEDURE InsertaVehiculos(Marca Varchar(30), Modelo Varchar(200), Clindrada Varchar(50), Precio Double, Imagen Blob, 
 Id_Admin Int)
INSERT INTO Tbl_Vehiculos(Ve_Id, Ve_Marca, Ve_Modelo, Ve_Cilindrada, Ve_Precio, Ve_Imagen, Ve_Ad_Id) VALUES('',
Marca, Modelo, Clindrada, Precio, Imagen, Id_Admin);

CALL InsertaVehiculos('Marca.Valor', 'Modelo.Valor', 'Clindrada.Valor', Precio.Valor, 'Imagen.Valor', Id_Admin.Valor);

CREATE PROCEDURE InsertaCliente(PNombre Varchar(20), SNombre Varchar(20), PApellido Varchar(20), SApellido Varchar(20), TDocumento Char(3), 
 NDocumento Varchar(50), Departamento Varchar(30), Ciudad Varchar(30), Direccion Varchar(150), Telefono Varchar(12), Email Varchar(50), Id_Admin Int)
INSERT INTO Tbl_Clientes(Cli_Id, Cli_Primer_Nombre, Cli_Segundo_Nombre, Cli_Primer_Apellido, Cli_Segundo_Apellido, Cli_Tipo_Documento, Cli_Numero_Documento, Cli_Departamento,
 Cli_Ciudad, Cli_Direccion, Cli_Telefono, Cli_Email, Cli_Ad_Id) VALUES('',
 PNombre, SNombre, PApellido, SApellido, TDocumento, NDocumento, Departamento, Ciudad, Direccion, Telefono, Email, Id_Admin);

CALL InsertaCliente('PNombre.Valor', 'SNombre.Valor', 'PApellido.Valor', 'SApellido.Valor', 'TDocumento.Valor', 'NDocumento.Valor', 'Departamento.Valor', 
 'Ciudad.Valor', 'Direccion.Valor', 'Telefono.Valor', 'Email.Valor', Id_Admin.Valor);

CREATE PROCEDURE InsertaVendedores(PNombre Varchar(20), SNombre Varchar(20), PApellido Varchar(20), SApellido Varchar(20), TDocumento Char(3), 
 NDocumento Varchar(50), Departamento Varchar(30), Ciudad Varchar(30), Direccion Varchar(150), Telefono Varchar(12), Email Varchar(50), Id_Admin Int)
INSERT INTO Tbl_Vendedores(Ven_Id, Ven_Primer_Nombre, Ven_Segundo_Nombre, Ven_Primer_Apellido, Ven_Segundo_Apellido, Ven_Tipo_Documento, Ven_Numero_Documento, Ven_Departamento,
 Ven_Ciudad, Ven_Direccion, Ven_Telefono, Ven_Email, Ven_Ad_Id) VALUES('',
 PNombre, SNombre, PApellido, SApellido, TDocumento, NDocumento, Departamento, Ciudad, Direccion, Telefono, Email, Id_Admin);

CALL InsertaVendedores('PNombre.Valor', 'SNombre.Valor', 'PApellido.Valor', 'SApellido.Valor', 'TDocumento.Valor', 'NDocumento.Valor', 'Departamento.Valor', 
 'Ciudad.Valor', 'Direccion.Valor', 'Telefono.Valor', 'Email.Valor', Id_Admin.Valor);

CREATE PROCEDURE InsertaVehiculoU(Marca Varchar(30), Cliente Int, Modelo Varchar(200), Matricula Varchar(100), PTasacion Double, Fecha_Cesion Date, Imagen Blob, Id_Admin Int)
INSERT INTO Tbl_VehiculoUsado(Vu_Id, Vu_Marca, Vu_Cli_Id, Vu_Modelo, Vu_Matricula, Vu_Precio_Tasacion, Vu_Fecha_Cesion, Vu_Imagen, Vu_Ad_Id) VALUES('', Marca, Cliente, Modelo, Matricula,
 PTasacion, Fecha_Cesion, Imagen, Id_Admin);

CALL InsertaVehiculoU('Marca.Valor', Cliente.Valor, 'Modelo.Valor', 'Matricula.Valor', PTasacion.Valor, 'Fecha_Cesion.Valor', 'Imagen.Valor', Id_Admin.Valor);

CREATE PROCEDURE InsertaVenta(Cliente Int, Vendedor Int, Vehiculo Int, Fecha_Venta Date, NMatricula Varchar(100), Opciones Int, VehiculoU Int, PrecioT Double, MedioPago Int,
 Id_Admin Int)
INSERT INTO Tbl_Venta(Vet_Id, Vet_Cli_Id, Vet_Ven_Id, Vet_Ve_Id, Vet_Fecha_Venta, Vet_Matricula_NuevoVehiculo, Vet_Opciones_Id, Vet_VehiculoUsado_Id, Vet_Precio_Total,
 Vet_MedioPago_Id, Vet_Ad_Id) VALUES('', Cliente, Vendedor, Vehiculo, Fecha_Venta, NMatricula, Opciones, VehiculoU, PrecioT, MedioPago, Id_Admin);

CALL InsertaVenta(Cliente.Valor, Vendedor.Valor, Vehiculo.Valor, 'Fecha_Venta.Valor', 'NMatricula.Valor',
 Opciones.Valor, VehiculoU.Valor, PrecioT.Valor, MedioPago.Valor, Id_Admin.Valor);

CREATE PROCEDURE ListaVentas()
SELECT v.Vet_Id, c.Cli_Primer_Nombre, c.Cli_Segundo_Nombre, c.Cli_Primer_Apellido, c.Cli_Segundo_Apellido, c.Cli_Tipo_Documento, c.Cli_Numero_Documento,
 vd.Ven_Primer_Nombre, vd.Ven_Segundo_Nombre, vd.Ven_Primer_Apellido, vd.Ven_Segundo_Apellido, vh.Ve_Nombre, vh.Ve_Modelo, v.Vet_Fecha_Venta, v.Vet_Matricula_NuevoVehiculo,
  o.Op_Nombre, vu.Vu_Matricula, v.Vet_Precio_Total, mp.Me_Nombre, a.Ad_Usuario FROM Tbl_Cliente AS c INNER JOIN Tbl_Ventas AS v ON c.Cli_Id = v.Vet_Cli_Id
   INNER JOIN Tbl_Vendedores AS vd ON vd.Ven_Id = v.Vet_Ven_Id INNER JOIN Tbl_Vehiculos AS vh ON vh.Ve_Id = v.Vet_Ve_Id INNER JOIN Tbl_Opciones AS o ON o.Op_Id = v.Vet_Opciones_Id INNER JOIN Tbl_VehiculoUsado AS vu ON vu.Vu_Id = v.Vet_VehiculoUsado_Id
   INNER JOIN Tbl_MedioPago AS mp ON mp.Me_Id = v.Vet_MedioPago_Id INNER JOIN Tbl_Administrador AS a ON a.Ad_Id = v.Vet_Ad_Id;

CALL ListaVentas();

#Acá se hace la búsqueda de solo las ventas que se hallan pagado dando el carro usado por garantía y que también el cliente haya elegido algunas de las opciones para añadir al nuevo vehículo.


CREATE TABLE Tbl_AuditoriaVentas (
Id_Audi_Ven Int NOT NULL AUTO_INCREMENT,
Audi_Fecha_Venta_Antigua Date NOT NULL,
Audi_NMatricula_Antigua Varchar(100) NOT NULL,
Audi_PrecioT_Antiguo Double NOT NULL,
Audi_Fecha_Venta_Nueva Date,
Audi_NMatricula_Nueva Varchar(100),
Audi_PrecioT_Nuevo Double,
Audi_Fechamodificacion datetime NOT NULL,
Audi_Usuario Varchar(45) NOT NULL,
Audi_Vet_Id Int NOT NULL,
Audi_Vet_Cli_Id Int NOT NULL,
Audi_Vet_Ven_Id Int NOT NULL,
Audi_Vet_Ve_Id Int NOT NULL,
Audi_Vet_VehiculoUsado_Id Int NOT NULL,
Audi_Vet_Opciones_Id Int NOT NULL,
Audi_Vet_MedioPago_Id Int NOT NULL,
Audi_Vet_Ad_Id Int NOT NULL
Audi_Accion Varchar(45) NOT NULL,
PRIMARY KEY(Id_Audi_Ven));

delimiter //
create trigger auditoria_actualizarventas after update on Tbl_Venta
for each row begin
insert into Tbl_AuditoriaVentas
(Audi_Fecha_Venta_Antigua, Audi_NMatricula_Antigua, Audi_PrecioT_Antiguo, Audi_Fecha_Venta_Nueva,
Audi_NMatricula_Nueva, Audi_PrecioT_Nuevo, Audi_Fechamodificacion, Audi_Usuario,
Audi_Vet_Id, Audi_Vet_Cli_Id, Audi_Vet_Ven_Id, Audi_Vet_Ve_Id, Audi_Vet_VehiculoUsado_Id, 
Audi_Vet_Opciones_Id, Audi_Vet_MedioPago_Id, Audi_Vet_Ad_Id, Audi_Accion)
values
(old.Vet_Fecha_Venta, old.Vet_Matricula_NuevoVehiculo, old.Vet_Precio_Total, new.Vet_Fecha_Venta,
new.Vet_Matricula_NuevoVehiculo, new.Vet_Precio_Total,
now(), current_user(), new.Vet_Id, new.Vet_Cli_Id, new.Vet_Ven_Id, new.Vet_Ve_Id, new.Vet_VehiculoUsado_Id,
 new.Vet_Opciones_Id, new.Vet_MedioPago_Id, new.Vet_Ad_Id, 'Actualizacion');
end //

UPDATE Tbl_Venta SET Vet_Cli_Id = Valor, Vet_Ven_Id = Valor, Vet_Ve_Id = Valor, Vet_Fecha_Venta = 'Valor',
 Vet_Matricula_NuevoVehiculo = 'Valor', Vet_Opciones_Id = Valor, Vet_VehiculoUsado_Id = Valor,
  Vet_Precio_Total = Valor, Vet_MedioPago_Id = Valor, Vet_Ad_Id = Valor WHERE Vet_Id = Valor;

delimiter //
create trigger auditoria_actualizarventas before delete on Tbl_Venta
for each row begin
insert into Tbl_AuditoriaVentas
(Audi_Fecha_Venta_Antigua, Audi_NMatricula_Antigua, Audi_PrecioT_Antiguo, Audi_Fecha_Venta_Nueva,
Audi_NMatricula_Nueva, Audi_PrecioT_Nuevo, Audi_Fechamodificacion, Audi_Usuario,
Audi_Vet_Id, Audi_Vet_Cli_Id, Audi_Vet_Ven_Id, Audi_Vet_Ve_Id, Audi_Vet_VehiculoUsado_Id, 
Audi_Vet_Opciones_Id, Audi_Vet_MedioPago_Id, Audi_Vet_Ad_Id, Audi_Accion)
values
(old.Vet_Fecha_Venta, old.Vet_Matricula_NuevoVehiculo, old.Vet_Precio_Total, null,
null, null,
now(), current_user(), old.Vet_Id, old.Vet_Cli_Id, old.Vet_Ven_Id, old.Vet_Ve_Id, old.Vet_VehiculoUsado_Id,
 old.Vet_Opciones_Id, old.Vet_MedioPago_Id, old.Vet_Ad_Id, 'Registro Eliminado');
end //

DELETE FROM Tbl_Venta WHERE Vet_Id = Valor;