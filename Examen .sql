create database examen34_1;
use examen34_1;
-- EJERCICIO 1
Create table empleado(
    IdEmpleado int primary key,
    Nombre varchar(255) not null,
    Apellido1 varchar(255) not null,
    Apellido2 varchar(255) not null,
    Email varchar(255),
    CONSTRAINT email_unico_empleado UNIQUE (Email),
    Salario decimal(10,2),
    Turno varchar(255) not null,
    CONSTRAINT turno_empleado CHECK (Turno in ('Mañana', 'Tarde', 'Noche')),
    DNI varchar(9) unique,
    Telefono varchar(20)
);
Create table gerente(
    IdGerente int primary key,
    Festivo varchar(255) not null,
    CONSTRAINT festivo_gerente CHECK (Festivo in ('Si', 'No')),
    Complementos decimal(10,2)
);
-- Soy un genio y no lei lo de formacion ahi lo añado :')
ALTER table gerente add column Formacion varchar(255);

Create table Administrativo(
    IdAdmin int primary key,
    Campo varchar(255) not null,
    Especializacion varchar(255) not null,
    CONSTRAINT especializacion_administrativo CHECK (Especializacion in ('Atencion al cliente', 'Secretaria', 'Excel'))
);
Create table Departamento(
    IdDepartamento int primary key,
    Nombre varchar(255) not null,
    Ciudad varchar(255),
    Sede varchar(255),
    Planta int
);
-- EJERCICIO 2
Alter table gerente add IdEmpleado int;
Alter table administrativo add IdEmpleado int;
Alter table gerente add constraint fk_gerente_empleado foreign key (IdEmpleado) references empleado(IdEmpleado);
Alter table administrativo add constraint fk_administrativo_empleado foreign key (IdEmpleado) references empleado(IdEmpleado);
Create table Especializacion(
    IdEspecializacion int primary key,
    NombreEspecializacion varchar(255) not null
);
Alter table Administrativo drop column Especializacion;
Alter table Administrativo add IdEspecializacion int;
Alter table Administrativo add constraint fk_especializacion_administrativo foreign key (IdEspecializacion) references Especializacion(IdEspecializacion);
Create table Turno(
    IdTurno int primary key,
    NombreTurno varchar(255) not null
);
Alter table empleado drop constraint turno_empleado;
Alter table empleado modify column Turno int;
Alter table empleado add constraint fk_empleado_turno foreign key (Turno) references Turno(IdTurno);

Create table trabaja(
    IdEmpleado int,
    IdDepartamento int,
    FechaAlta date,
    FechaBaja date,
    constraint pk_trabaja primary key (IdEmpleado, IdDepartamento),
    constraint fk_trabaja_empleado foreign key (IdEmpleado) references empleado(IdEmpleado),
    constraint fk_trabaja_departamento foreign key (IdDepartamento) references departamento(IdDepartamento)
);
-- EJERCICIO 3
insert turno values (1, 'Mañana');
insert turno values (2, 'Tarde');
Insert into empleado values (1, 'Juan', 'Perez', 'Garcia', 'Juan@gmail.com', 1000, 1, '123456789', '123456789');
INSERT INTO empleado VALUES (2, 'Pepe', 'Garcia', 'Perez', 'Pepe@gmail.com', 1299, 2, '987654321', '987654321');
insert especializacion values (1, 'Atencion al cliente');
insert especializacion values (2, 'Secretaria');
Insert into administrativo values (1,'Fontanero',1 ,1);
Insert into administrativo values (2,'Informatico',1 ,1);

Insert into departamento values (1,'Ventas Aux', 'Madrid', 'Madrid', 1);
Insert into departamento values (2,'Ventas Marketing', 'Madrid', 'Madrid', 1);

Insert into gerente values (1,'Si',100,'Licenciatura en Marketing', 1);
Insert into gerente values (2,'Si', 100,null, 2);

Update departamento set Ciudad = 'Madrid' where Nombre like '%Venta%';

Update empleado set Salario = Salario * 1.1 where Salario between 500 and 2000;

Update administrativo set Campo = 'Finanzas' where Campo is null;

Delete from departamento where Ciudad like '%a' or Sede is null;

Delete from empleado where Salario < 1500;

-- 10. Si se intenta borrar un empleado que esta en la tabla trabaja saltaria una excepcion ya que no se puede borrar un empleado que esta en una tabla que tiene una clave foranea que enlaza con la tabla empleado.

Alter table empleado add column Complemento decimal(10,2);
Select * from empleado where turno = 3 and complemento is null;

Select nombre, ciudad, sede from departamento where planta between 2 and 8 and length(sede) = 3;

Select distinct upper(substring(campo,1,3)) from administrativo order by campo desc, IdEspecializacion desc;




