-- 1.Cree y rellene la tabla PAISES, con los mismos campos y datos que COUNTRIES (usa una sola sentencia)
create table paises as select * from countries;
-- 2.Cree la tabla LOCALIZACIONES basándose en la estructura de LOCATIONS, los campos tendrán los siguientes nombres: loc_id, Direccion, CodPostal, Ciudad, Provincia, Pais_ID. Rellénala con los datos de LOCATIONS (usa una sola sentencia)
create table localizaciones as select location_id as loc_id, street_address as direccion,
postal_code as codpostal, city as ciudad, state_province as provincia, country_id as pais_id from locations;
-- 3.Cree la tabla DEPARTAMENTOS con los campos ID y NombreDep, y rellene esta tabla con los datos de DEPARTMENTS (usar solo una sentencia).
create table departamentos as select department_id as id, department_name as nomdep from departments;
-- 4.Cree la tabla EMPLEADOS, basándose en la tabla EMPLOYEES, con los campos ID, nombre, apellido y DepID. En la misma sentencia rellene esta nueva tabla con los cargos que tengan un “ad” en su código (job_id). (4 filas)
create table empleados as select employee_id as id, first_name
as nombre, last_name as apellido, department_id as depid from employees where job_id like '%ad%';
-- 5.Insertar en la tabla EMPLEADOS aquellos trabajadores que tengan un sueldo 4000, 6000 o 8000, según aparece en la tabla EMPLOYEES.  (se insertan 6 filas)
insert into empleados (id, nombre, apellido, depid)
select employee_id, first_name, last_name, department_id from employees where salary in (4000, 6000, 8000);
-- 6.Insertar en la tabla EMPLEADOS, que están en la tabla EMPLOYEES que trabajen en Europa (región_name=’Europe’) (se insertan 36 filas)
insert into empleados (id, nombre, apellido, depid)
select employee_id, first_name, last_name, e.department_id from employees e
join departments d on d.department_id = e.department_id
join locations l on l.location_id = d.location_id
join countries c on c.country_id = l.country_id
where c.country_id in (select country_id from countries where region_id in (select region_id from regions where region_name='Europe'));
select * from empleados;
+
-- 7.Borrar de EMPLEADOS aquellos  que tienen un salario entre 3000 y 5000, según los datos de EMPLOYEES (borra 2 filas)
delete from empleados where id in (select employee_id from employees where salary between 3000 and 5000);
-- 8.Según los datos de la tabla EMPLOYEES, actualiza el campo DepID a 600 de la tabla EMPLEADOS, para aquellos empleados que tienen un salario de 6000. (2 filas actualizadas)
update empleados set depid=600 where id in (select employee_id from employees where salary=6000);
-- 9.Según los datos de la tabla EMPLOYEES, actualiza el campo DepID al mismo que tenga  el empleado que comenzó a trabajar el 24-5-99 (hire_date). Esta actualización solo se realizará para los empleados  que tengan un salario igual a 8000.   (5 filas actualizadas)
update empleados set depid=(select department_id from employees where hire_date='1999-05-24')
where id in (select employee_id from employees where salary=8000);