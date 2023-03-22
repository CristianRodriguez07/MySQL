-- SIMULACRO EXAMEN CONSULTAS BBDD
-- 1.Muestre el modelo del coche, el nombre de la marca y el nombre del concesionario de todos los coches comprados por un cliente de Madrid.
select c.modelo, m.nombre, co.nombre from coches c
    join venden v on c.codcoche = v.codcoche
    join concesionario co on v.cifc = co.cifc
    join fabrica f on c.codcoche = f.codcoche
    join marcas m on f.cifm = m.cifm
    join clientes c2 on v.dni = c2.dni
    where c2.Residencia like 'Madrid';
-- 2.Muestre el maximo numero (cantidad) de coches distribuidos, el cifc del concesionario que los distribuye y el codcoche, de los coches que tiene un 1  en su codcoche(Usa distribuyen)
select max(cantidad), cifc, codcoche from distribuyen where codcoche like '1%' group by cifc;
-- 3.Muestra el nombre y el apellido, y las tres primeras letras de la ciudad en mayusculas de todos los clientes que tengan los dnis 0001,0002,0003, y cuya ciudad no sea Valencia.
select nombre_cliente, apellido, upper(substr(residencia,1,3)) from clientes where dni in (1,2,3) and residencia != 'Valencia';
-- 4. Muestra el numero total de clientes y el cifc del concesionario de la tabla venden. Agrupalo por cifc y muestra solo el que sea el que mas tenga.(Muestre solo uno aunque haya varios iguales)
select distinct count(dni),cifc from venden group by cifc limit 1;
-- 5.Muestre el cifc, el nombre del concesionario, la ciudad del concesionario y el nombre del cliente, de aquellos concesionarios que hayan vendido un coche a alguien cuyo nombre contenga una a en cualquier posicion seguida de al menos una letra.
select v.cifc, co.nombre, co.ciudad, c.nombre_cliente from venden v
    join concesionario co on v.cifc = co.cifc
    join clientes c on v.dni = c.dni
    where c.nombre_cliente like '%a%';
-- 6.Muestre el modelo y el nombre del coche, la cantidad distribuida y el nombre del concesionario que los distribuye, de los coches cuya cantidad distribuida sea mayor a la medida de la cantidad total disrtibuida, agrupalos por codigo de coche.
select concat(c.nombre, ' ', c.modelo) as coche, d.cantidad, co.nombre from coches c
    join distribuyen d on c.codcoche = d.codcoche
    join concesionario co on d.cifc = co.cifc
    where d.cantidad > (select avg(d.cantidad) from distribuyen d) group by d.codcoche;

use jardineria;
-- 7.Usa Jardineria para esta consulta: Muestra el nombre del empleado el puesto del empleado, la ciudad de la oficina del empleado, el nombre del jefe, el puesto del jefe y la ciudad de la oficina del jefe, de todos los empleados cuya oficina no sea la misma que la de su jefe.
select e.nombre, e.puesto, o.ciudad, e2.nombre, e2.puesto, o2.ciudad from empleado e
    join oficina o on e.codigo_oficina = o.codigo_oficina
    join empleado e2 on e.codigo_jefe = e2.codigo_empleado
    join oficina o2 on e2.codigo_oficina = o2.codigo_oficina
    where e.codigo_oficina != e2.codigo_oficina;
use coche;
-- 8.Muestra el nombre y el modelo de los coches que no son distribuidos por ningun concesionario. Ordenalos de manera ascendente por el nombre y muestra los tres primeros.
select concat(c.nombre, ' ', c.modelo) as coche from coches c
    where c.codcoche not in (select codcoche from distribuyen) order by c.nombre limit 3;
-- 9.Muestra el total de coches y el nombre de la marca del coceh, agrupalo por la marca del coceh de todos los coches comprados por un cliente de Madrid.
select count(c.codcoche), m.nombre from coches c
    join venden v on c.codcoche = v.codcoche
    join fabrica f on c.codcoche = f.codcoche
    join marcas m on f.cifm = m.cifm
    join clientes c2 on v.dni = c2.dni
    where c2.Residencia like 'Madrid' group by m.nombre;
-- 10 Muestre la media redondeada a dos decimales de la cantidad, el nombre del concesionario y el modelo del coche, agrupado por el nombre del concesionario y el codigo del coche.
-- Muestre solo aquellos concesionarios que empiecen con una a o una b en el nombre, teniendo en cuenta que la media de la cantidad debe ser mayor que la maxima cantidad de coches distribuidos por cada concesionario que tenga una b en su nombre.
-- Ordena el resultado por el valor de la media de forma que aparezca la mas alta primero.
select round(avg(cantidad),2), co.nombre, c.modelo from distribuyen d
    join concesionario co on d.cifc = co.cifc
    join coches c on d.codcoche = c.codcoche
    where co.nombre like 'a%' or co.nombre like 'b%'
    group by co.nombre, c.modelo
    having(avg(d.cantidad)) >= (select max(d.cantidad) from distribuyen d
        join concesionario co on d.cifc = co.cifc
        where co.nombre like 'b%' group by co.cifc) order by avg(d.cantidad) desc;

