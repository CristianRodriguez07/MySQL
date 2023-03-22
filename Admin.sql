create user cristian; -- Crea un usuario sin contraseña
create user cristian identified by '1234'; -- Crea un usuario con contraseña
create user 'cristian2'@'192.168.1.10' identified by 'mondongo'; -- Crea un usuario con contraseña y solo desde esa IP
create user 'cristian3'@'localhost' identified by 'sarandonga'; -- Crea un usuario con contraseña y solo desde localhost
create user 'cristian4'@'192.168%' identified by 'burundanga'; -- Crea un usuario solo desde todos los ordenadores que empiecen con esa ip

drop user 'cristian4'@'192.168%';-- Elimina un usuario
drop user 'cristian3'@'localhost';

rename user 'cristian2'@'192.168.1.10' to 'cristian3'@'localhost'; -- Renombra un usuario

set password for 'cristian3'@'localhost' = password('0A'); -- Cambia la contraseña de un usuario

create role 'machomen'@'localhost'; -- Crea un rol
show grants for 'machomen'@'localhost'; -- Muestra los permisos de un rol
show grants for 'cristian3'@'localhost'; -- Muestra los permisos de un usuario

grant all on *.* to 'machomen'@'localhost'; -- Da todos los permisos a un rol
grant select on coche.coches to 'cristian3'@'localhost'; -- Da permisos a un usuario

grant 'machomen'@'localhost' to 'cristian3'@'localhost'; -- Da permisos a un usuario

revoke select on coche.coches from 'cristian3'@'localhost'; -- Quita permisos a un rol

-- Actividad A

-- 1.Usuario con nombre alumno1, que se pueda conectar desde cualquier sitio y que notenga asignada contraseña.
create user alumno1;

-- 2.Usuario con nombre alumno2, que se pueda conectar desde cualquier sitio y que sucontraseña sea ‘123456’.
create user alumno2 identified by '123456';
-- 3.Usuario con nombre alumno3, que se pueda conectar sólo desde local y que no tenga asignada contraseña.
create user 'alumno3'@'localhost';
-- 4.Usuario con nombre alumno4, que se pueda conectar sólo desde la IP 192.168.1.10 yque tenga de contraseña ‘123456’.
create user 'alumno4'@'192.168.1.10' identified by '123456';
-- 5.Crea el rol ‘Informática’.
create role 'Informatica';
-- 6.Crea el rol ‘Infantil’.
create role 'Infantil';

-- Actividad B

-- 1.Cambia el nombre al alumno1 y asígnale de nuevo nombre tu segundo apellido.
rename user alumno1 to 'Cervantes';
-- 2.Asigna como contraseña al usuario del apartado 1 la palabra ‘system’.
set password for 'Cervantes' = 'system';
-- 3.Borra al usuario alumno3.
drop user 'alumno3'@'localhost';
-- 4.Borra el rol ‘Infantil’.
drop role 'Infantil';

-- Actividad C

-- 1.Asigna al alumno2 el rol de Informática.
grant 'Informatica' to 'alumno2';
-- 2.Otorga privilegios de ver, insertar, borrar y actualizar registros sobre todas las tablas dela base de datos de pokemondb al alumno2.
grant select, insert, delete, update on pokemondb.* to 'alumno2';
-- 3.Otorga todos los privilegios posibles sobre todas las bases de datos y todas las tablasal alumno4, y haz que pueda pueda otorgar esos permisos.
grant all on *.* to 'alumno4'@'192.168.1.10' with grant option;
-- 4.Muestra todos los privilegios del alumno4.
show grants for 'alumno4'@'192.168.1.10';
-- 5.Elimina el privilegio de borrar registros sobre todas las tablas de la base de datos depokemondb al alumno2.
revoke delete on pokemondb.* from 'alumno2';
-- 6.Muestra todos los privilegios del alumno2.
show grants for 'alumno2';

-- INDICES
use coche;
-- crea indice sobre el campo nombre_cliente de la tabla clientes
create index index_nombre_cliente on clientes(nombre_cliente);
-- borrar el indice
drop index index_nombre_cliente on clientes;
-- mostrar los indices de la tabla clientes
show index from clientes;

-- VISTAS
create view vista_clientes as select nombre_cliente, apellido from clientes;

select * from vista_clientes;

-- vista total_concesionario:muestre el total de coches vendidos por cada concesionario de la tabla venden.
create view total_concesionario as select count(codcoche) as total_coches,c.nombre from venden
        join concesionario c on venden.cifc = c.cifc group by c.nombre;
select * from total_concesionario;

-- CREAR TABLAS CON SUBCONSULTAS
use coche;
create table clientes_madrid as select * from clientes where residencia like 'Madrid';

select * from clientes_madrid;

create table coches_vendidos (codcoche int, nombre varchar(55), modelo varchar(80), nombre_marca varchar(55))
as select v.codcoche, co.nombre as nombre_coche, co.modelo, m.nombre as nombre_marca from venden v
join coches co on v.codcoche = co.codcoche
join fabrica f on co.codcoche = f.codcoche
join marcas m on f.cifm = m.cifm;

select * from coches_vendidos;

-- insertar datos con subconsultas
insert clientes_madrid select * from clientes where residencia like 'Valencia';

select * from clientes_madrid;

