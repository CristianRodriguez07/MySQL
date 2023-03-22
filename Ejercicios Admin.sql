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

