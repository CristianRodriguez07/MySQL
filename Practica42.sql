create database practica42;
use practica42;

create table autor(
codigo_autor int primary key,
nombre varchar(255) not null
);

create table libro(
codigo_libro int primary key,
titulo varchar(255) not null,
paginas int,
ISBN varchar(255) not null,
editorial varchar(255)
);

create table usuario(
codigo_usuario int primary key,
nombre varchar(255) not null,
Telefono varchar(255),
Direccion varchar(255)
);

create table ejemplar(
codigo_ejemplar int primary key,
localizacion varchar(255)
);

create table AutorLibro(
 primary key (codigo_autor, codigo_libro),
codigo_autor int references autor(codigo_autor),
codigo_libro int references libro(codigo_libro)
);

create table UsuarioEjemplar(
primary key (codigo_usuario, codigo_ejemplar),
codigo_usuario int references usuario(codigo_usuario),
codigo_ejemplar int references ejemplar(codigo_ejemplar),
fechaDev date,
fechaPres date
);

create table Localizacion(
codigo_localizacion int primary key,
pasillo varchar(255),
seccion varchar(255),
estante int
);

alter table ejemplar add column codigo_libro int references libro(codigo_libro);

alter table ejemplar modify column localizacion int;
alter table ejemplar add constraint fk_localizacion foreign key (localizacion) references Localizacion(codigo_localizacion);

alter table usuario add column email varchar(255);
alter table usuario add constraint email_unico_usuario unique(email);

alter table libro add column fechaPublicacion date;

-- Actividad C
select * from usuario;
INSERT INTO `practica42`.`usuario` (`codigo_usuario`, `nombre`, `Telefono`, `Direccion`, `email`) VALUES ('1', 'Pepe', 'telefono', 'Direccion', 'pepeunico@hotmail.es');
INSERT INTO `practica42`.`usuario` (`codigo_usuario`, `nombre`, `Telefono`, `Direccion`, `email`) VALUES ('2', 'Pepe', 'telefono', 'Direccion', 'Pepelapara@gmail.es');
INSERT INTO `practica42`.`usuario` (`codigo_usuario`, `nombre`, `Telefono`, `Direccion`, `email`) VALUES ('3', 'Sonia', 'telefono', 'Direccion', 'Sonia213@gmail.es');
INSERT INTO `practica42`.`usuario` (`codigo_usuario`, `nombre`, `Telefono`, `Direccion`, `email`) VALUES ('4', 'LaVane', 'telefono', 'Direccion', 'LaVane3829@hotmail.es');
INSERT INTO `practica42`.`usuario` (`codigo_usuario`, `nombre`, `Telefono`, `Direccion`, `email`) VALUES ('5', 'Rauw', 'telefono', 'Direccion', 'Rauw84@hotmail.es');


select * from libro;
INSERT INTO `practica42`.`libro` (`codigo_libro`, `titulo`, `paginas`, `ISBN`, `editorial`, `fechaPublicacion`) VALUES ('2', 'Libro', '1', 'ISBN', 'Anaya', '1990-12-13');
INSERT INTO `practica42`.`libro` (`codigo_libro`, `titulo`, `paginas`, `ISBN`, `editorial`, `fechaPublicacion`) VALUES ('3', 'Libro', '1', 'ISBN', 'Anaya', '1990-12-13');
INSERT INTO `practica42`.`libro` (`codigo_libro`, `titulo`, `paginas`, `ISBN`, `editorial`, `fechaPublicacion`) VALUES ('4', 'Libro', '1', 'ISBN', 'Salamandra', '1990-12-13');
INSERT INTO `practica42`.`libro` (`codigo_libro`, `titulo`, `paginas`, `ISBN`, `editorial`, `fechaPublicacion`) VALUES ('5', 'Libro', '1', 'ISBN', 'Salamandra', '1990-12-13');
INSERT INTO `practica42`.`libro` (`codigo_libro`, `titulo`, `paginas`, `ISBN`, `editorial`, `fechaPublicacion`) VALUES ('1', 'Libro', '1', 'ISBN', 'Salamandra', '1990-12-13');

select * from localizacion;
INSERT INTO `practica42`.`localizacion` (`codigo_localizacion`, `pasillo`, `seccion`, `estante`) VALUES ('1', 'B', 'Seccion', '1');
INSERT INTO `practica42`.`localizacion` (`codigo_localizacion`, `pasillo`, `seccion`, `estante`) VALUES ('2', 'B', 'Seccion', '1');
INSERT INTO `practica42`.`localizacion` (`codigo_localizacion`, `pasillo`, `seccion`, `estante`) VALUES ('3', 'A', 'Seccion', '1');
INSERT INTO `practica42`.`localizacion` (`codigo_localizacion`, `pasillo`, `seccion`, `estante`) VALUES ('4', 'C', 'Seccion', '1');
INSERT INTO `practica42`.`localizacion` (`codigo_localizacion`, `pasillo`, `seccion`, `estante`) VALUES ('5', 'D', 'Seccion', '1');

select * from ejemplar;
INSERT INTO `practica42`.`ejemplar` (`codigo_ejemplar`, `localizacion`, `codigo_libro`) VALUES ('1', '1', '1');
INSERT INTO `practica42`.`ejemplar` (`codigo_ejemplar`, `localizacion`, `codigo_libro`) VALUES ('2', '2', '2');
INSERT INTO `practica42`.`ejemplar` (`codigo_ejemplar`, `localizacion`, `codigo_libro`) VALUES ('3', '3', '3');
INSERT INTO `practica42`.`ejemplar` (`codigo_ejemplar`, `localizacion`, `codigo_libro`) VALUES ('4', '4', '4');
INSERT INTO `practica42`.`ejemplar` (`codigo_ejemplar`, `localizacion`, `codigo_libro`) VALUES ('5', '5', '5');

select * from autorlibro;
insert into autorlibro(codigo_autor,codigo_libro) values(1,1);
insert into autorlibro(codigo_autor,codigo_libro) values(2,2);
insert into autorlibro(codigo_autor,codigo_libro) values(3,3);

select * from usuarioejemplar;
insert into usuarioejemplar(codigo_usuario,codigo_ejemplar,fechaPres,fechaDev) values(1,1,'2010-03-10','2010-03-11');
insert into usuarioejemplar(codigo_usuario,codigo_ejemplar,fechaPres,fechaDev) values(2,2,'2010-02-10','2010-12-12');
insert into usuarioejemplar(codigo_usuario,codigo_ejemplar,fechaPres,fechaDev) values(3,3,'2010-10-11','2010-12-11');

-- Actividad D
UPDATE `practica42`.`libro` SET `fechaPublicacion` = '2020/02/20' WHERE (`codigo_libro` = '2');
UPDATE `practica42`.`libro` SET `fechaPublicacion` = '2020/02/20' WHERE (`codigo_libro` = '3');

UPDATE `practica42`.`usuario` SET `nombre` = 'Juan' WHERE (`codigo_usuario` = '1');
UPDATE `practica42`.`usuario` SET `nombre` = 'Juan' WHERE (`codigo_usuario` = '2');

-- Actividad E
select * from usuario;
select nombre, codigo_usuario from usuario;
select * from libro where editorial like "Anaya";
select codigo_libro, titulo from libro where editorial not like "Anaya" or "<50";
select nombre from usuario where codigo_usuario between 3 and 5;
select titulo from libro where titulo like "%a%";




