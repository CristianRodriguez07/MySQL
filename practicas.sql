create database practicas;
use practicas;
create table talumno(
Idalumno int primary key,
DNI varchar(10) unique,
nombre varchar(255) not null,
apellido1 varchar(255) not null,
apellido2 varchar(255) not null,
email varchar(255) default null,
telf1 varchar(255) not null,
telf2 varchar(255) not null,
telf3 varchar(255) not null
);
create table tprofesor(
Idprofesor int primary key,
DNI varchar(10) unique,
nombre varchar(255) not null,
apellido1 varchar(255) not null,
apellido2 varchar(255) not null,
email varchar(255) default null,
telf1 varchar(255) not null,
especialidad varchar(255)
);
create table taula(
Idaula int primary key, 
NombreAula varchar(255) not null,
planta int not null,
Numero int not null
);
create table modulo(
IdModulo int primary key,
NombreModulo varchar(255) not null,
especialidad varchar(255),
Tipo varchar(255)
);

alter table talumno drop column telf3;

create table tespecialidad(
idespecialidad int primary key,
NombreEspecialidad varchar(255) 
);
alter table modulo modify column especialidad int;
alter table tprofesor modify column especialidad int;
alter table tprofesor add constraint fk_especialidad foreign key (especialidad) references tespecialidad(idespecialidad);
alter table modulo add constraint foreing_especialidad foreign key (especialidad) references tespecialidad(idespecialidad);

create table TAlumnoModulo(
primary key (idalumno,idModulo),
Idalumno int references alumno(idalumno),
idModulo int references modulo(idmodulo)
);
create table TprofesorEspecialidad(
primary key (IdProfesor,Idespecialidad),
Idprofesor int references profesor(idprofesor),
Idespecialidad int references especialidad(idespecialidad)
);
create table TProfesorModulo(
primary key (IdProfesor,idModulo),
Idprofesor int references profesor(idprofesor),
idModulo int references modulo(idmodulo)
);
create table TProfesorAlumno(
primary key (idalumno,idprofesor),
Idprofesor int references profesor(idprofesor),
Idalumno int references alumno(idalumno)
);
create table TAulaModulo(
Idmodulo int primary key,
idaula int references aula(idaula)
);
