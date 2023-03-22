-- EJERCICIOS VISTAS E INDICES
use hr;
-- 1.Cree una vista llamada VistaEmpleados basada en los ids y los nombres de empleado(nombre y apellido en un mismo campo) y los ids de departamento de la tablaEMPLOYEES. Cambie la cabecera para el nombre de empleado sea Empleado.
create view VistaEmpleados as select concat(first_name,' ',last_name) as Empleado,department_id from employees;
-- 2.Visualice los contenidos de la vista VistaEmpleados.
select * from VistaEmpleados;
-- 3.Cree una vista llamada DEPT50 que contenga los ids y los apellidos de los empleados, ylos ids de departamento para todos los empleados del departamento 50. Etiquete lascolumnas de la vista como NumEmpleado, Empleado y NumDepartamento.
create view DEPT50 as select employee_id as NumEmpleado, concat(last_name,' ',first_name) as Empleado, department_id as NumDepartamento
from employees where department_id = 50;
-- 4.Cree una vista llamada JEFES. En ella aparecerán todos los datos (tabla employees) detodos los usuarios que son jefes de algún empleado.
create view JEFES as select * from employees where employee_id in (select manager_id from departments);
-- 5.Crea una vista que se llamará EmpleadosEuropa que mostrará todos los empleados quetrabajan en algún departamento que se encuentra en la región de Europa.
create view EmpleadosEuropa as select * from employees where department_id in (select department_id from departments
where location_id in (select location_id from locations where country_id in (select country_id from countries where region_id = 1)));
-- 6.Cree una vista llamada VistaSalarios basándose en los apellidos de los empleados, losnombres de departamento, los salarios y los grados de salario para todos losempleados. Utilice las tablas EMPLOYEES, DEPARTMENTS y JOBS.
-- Etiquete lascolumnas Empleado, Departamento, Salario, Sueldo categoría (Min-Max),respectivamente.
-- El resultado tiene que ser similar a:EMPLEADODEPARTAMENTOSALARIO Sueldo categoría
-- (Min-Max)------------------------- ------------------------------ -------------------------------------------------KingExecutive2400020000 - 40000
create view VistaSalarios as select concat(last_name,' ',first_name) as Empleado, d.department_name as Departamento, e.salary as Salario, j.min_salary as 'Sueldo categoria (Min-Max)' from employees e
        join departments d on e.department_id = d.department_id
        join jobs j on e.job_id = j.job_id;
-- 7.Modifica la vista jefes para que ahora muestre los datos de los jefes de losdepartamentos (tabla departments manager_id y tabla employees).
alter view JEFES as select * from employees where employee_id in (select manager_id from departments);
-- 8.Escribe la sentencia que utilizarías para borrar una vista que se llama todo, la cual no sabes si realmente existe.
drop view if exists Todo;
-- 9.Muestra los índices que contiene la tabla employees.
show index from employees;
-- 10.Crea un índice llamado lastName_idx sobre el valor de last_name de la tablaemployees. Vuelve a mostrar los índices que contiene la tabla employees.
create index lastName_idx on employees(last_name);
-- 11.Elimina el índice lastName_idx
drop index lastName_idx on employees;
