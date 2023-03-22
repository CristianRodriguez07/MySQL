-- 8.Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- Utilizando la función YEAR de MySQL.
-- Utilizando la función DATE_FORMAT de MySQL.
-- Sin utilizar ninguna de las funciones anteriores.
select distinct codigo_cliente from pago where year(fecha_pago) = 2008 group by codigo_cliente;
select distinct codigo_cliente from pago where DATE_FORMAT(fecha_pago, '%Y') = 2008 group by codigo_cliente;
select distinct codigo_cliente from pago where fecha_pago between '2008-01-01' and '2008-12-31' group by codigo_cliente;

-- 10.Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- Utilizando la función ADDDATE de MySQL.
-- Utilizando la función DATEDIFF de MySQL.
-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega < ADDDATE(fecha_esperada, INTERVAL -2 DAY);
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where DATEDIFF(fecha_entrega, fecha_esperada) < -2;
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega < fecha_esperada - INTERVAL 2 DAY;
-- 11.Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
select * from pedido where estado = 'Rechazado' and year(fecha_pedido) = 2009;
-- 12.Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
select * from pedido where estado = 'Entregado' and month(fecha_entrega) = 1;
-- 13.Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
select * from pago where forma_pago = 'Paypal' and year(fecha_pago) = 2008 order by fecha_pago desc;

-- COMPOSICION INTERNA

-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.
-- 1.Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
select nombre_cliente, e.nombre from cliente inner join empleado e on cliente.codigo_empleado_rep_ventas = e.codigo_empleado order by nombre_cliente;
-- 2.Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
select distinct nombre_cliente, e.nombre from cliente inner join empleado e on cliente.codigo_empleado_rep_ventas = e.codigo_empleado inner join pago p on cliente.codigo_cliente = p.codigo_cliente order by nombre_cliente;
-- 3.Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
select nombre_cliente, e.nombre from cliente inner join empleado e on cliente.codigo_empleado_rep_ventas = e.codigo_empleado left join pago p on cliente.codigo_cliente = p.codigo_cliente where p.codigo_cliente is null order by nombre_cliente;
-- 4.Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select nombre_cliente, e.nombre,  cliente.ciudad from cliente inner join empleado e on cliente.codigo_empleado_rep_ventas = e.codigo_empleado inner join pago p on cliente.codigo_cliente = p.codigo_cliente inner join oficina o on e.codigo_oficina = o.codigo_oficina order by nombre_cliente;
-- 5.Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select nombre_cliente, e.nombre,  cliente.ciudad from cliente inner join empleado e on cliente.codigo_empleado_rep_ventas = e.codigo_empleado left join pago p on cliente.codigo_cliente = p.codigo_cliente inner join oficina o on e.codigo_oficina = o.codigo_oficina where p.codigo_cliente is null order by nombre_cliente;
-- 6.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
select o.linea_direccion1 from oficina o inner join empleado e on o.codigo_oficina = e.codigo_oficina inner join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas where c.ciudad = 'Fuenlabrada';
-- 7.Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select nombre_cliente, e.nombre,  cliente.ciudad from cliente inner join empleado e on cliente.codigo_empleado_rep_ventas = e.codigo_empleado inner join oficina o on e.codigo_oficina = o.codigo_oficina order by nombre_cliente;
-- 8.Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
select e.nombre, j.nombre from empleado e inner join empleado j on e.codigo_jefe = j.codigo_empleado order by e.nombre;
-- 9.Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
select e.nombre, j.nombre, j.apellido1, jj.nombre from empleado e inner join empleado j on e.codigo_jefe = j.codigo_empleado inner join empleado jj on j.codigo_jefe = jj.codigo_empleado order by e.nombre;
-- 10.Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
select nombre_cliente from cliente inner join pedido p on cliente.codigo_cliente = p.codigo_cliente where p.estado = 'Rechazado' and p.fecha_entrega > p.fecha_pedido;
-- 11.Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
select distinct nombre_cliente, gama from cliente inner join pedido p on cliente.codigo_cliente = p.codigo_cliente inner join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido inner join producto pr on dp.codigo_producto = pr.codigo_producto order by nombre_cliente;

-- CONSULTAS RESUMEN

-- 1.¿Cuantos empleados hay en la empresa?
select count(*) from empleado;
-- 2.¿Cuántos clientes tiene cada país?
select pais, count(*) from cliente group by pais;
-- 3.¿Cuál fue el pago medio en 2009?
select avg(total) from pago where year(fecha_pago) = 2009;
-- 4.¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
select estado, count(*) from pedido group by estado order by count(*) desc;
-- 5.Calcula el precio de venta del producto más caro y más barato en una misma consulta.
select max(precio_venta), min(precio_venta) from producto;
-- 6.Calcula el número de clientes que tiene la empresa.
select count(codigo_cliente) from cliente;
-- 7.¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
select count(codigo_cliente) from cliente where ciudad = 'Madrid';
-- 8.¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
select ciudad, count(codigo_cliente) from cliente where ciudad like 'M%' group by ciudad;
-- 9.Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
select e.nombre, count(codigo_cliente) from empleado e
    join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
    group by e.nombre;
-- 10.Calcula el número de clientes que no tiene asignado representante de ventas.
select count(codigo_cliente) from cliente where codigo_empleado_rep_ventas is null;
-- 11.Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
select nombre_contacto,apellido_contacto, min(fecha_pago), max(fecha_pago) from cliente
join pago p on cliente.codigo_cliente = p.codigo_cliente group by nombre_cliente;
-- 12.Calcula el número de productos diferentes que hay en cada uno de los pedidos.
select count(distinct codigo_producto) from detalle_pedido group by codigo_pedido;
-- 13.Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
select sum(cantidad) from detalle_pedido group by codigo_pedido;
-- 14.Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
select pr.nombre, sum(dp.cantidad) from producto pr
join detalle_pedido dp on pr.codigo_producto = dp.codigo_producto
group by pr.nombre order by sum(dp.cantidad) desc limit 20;
-- 15.La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla
select sum(dp.cantidad * pr.precio_venta), sum(dp.cantidad * pr.precio_venta) * 0.21, sum(dp.cantidad * pr.precio_venta) * 1.21 from producto pr
join detalle_pedido dp on pr.codigo_producto = dp.codigo_producto;
-- 16.La misma información que en la pregunta anterior, pero agrupada por código de producto.
select pr.codigo_producto, sum(dp.cantidad * pr.precio_venta), sum(dp.cantidad * pr.precio_venta) * 0.21, sum(dp.cantidad * pr.precio_venta) * 1.21 from producto pr
join detalle_pedido dp on pr.codigo_producto = dp.codigo_producto
group by pr.codigo_producto;
-- 17.La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
select pr.codigo_producto, sum(dp.cantidad * pr.precio_venta), sum(dp.cantidad * pr.precio_venta) * 0.21, sum(dp.cantidad * pr.precio_venta) * 1.21 from producto pr
join detalle_pedido dp on pr.codigo_producto = dp.codigo_producto
where pr.codigo_producto like 'OR%' group by pr.codigo_producto;
-- 18.Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
select pr.nombre, sum(dp.cantidad), sum(dp.cantidad * pr.precio_venta), sum(dp.cantidad * pr.precio_venta) * 1.21 from producto pr  join detalle_pedido dp on pr.codigo_producto = dp.codigo_producto group by pr.nombre having sum(dp.cantidad * pr.precio_venta) > 3000;
-- 19.Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
select year(fecha_pago), sum(total) from pago group by year(fecha_pago);

-- COMPOSICION EXTERNA

-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL LEFT JOIN y NATURAL RIGHT JOIN.

-- 1.Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select * from cliente
    left join pago on cliente.codigo_cliente = pago.codigo_cliente
    where pago.codigo_cliente is null;
-- 2.Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
select * from cliente
    left join pedido on cliente.codigo_cliente = pedido.codigo_cliente
    where pedido.codigo_cliente is null;
-- 3.Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
select * from cliente
    left join pago on cliente.codigo_cliente = pago.codigo_cliente
    left join pedido on cliente.codigo_cliente = pedido.codigo_cliente
    where pago.codigo_cliente is null and pedido.codigo_cliente is null;
-- 4.Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
select * from empleado
    left join oficina on empleado.codigo_oficina = oficina.codigo_oficina
         where oficina.codigo_oficina is null;
-- 5.Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
select * from empleado
    left join cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
         where cliente.codigo_empleado_rep_ventas is null;
-- 6.Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
select empleado.*, oficina.* from empleado
    left join cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
     join oficina on empleado.codigo_oficina = oficina.codigo_oficina
         where cliente.codigo_empleado_rep_ventas is null;
-- 7.Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
select empleado.* from empleado
    left join oficina on empleado.codigo_oficina = oficina.codigo_oficina
    left join cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
         where oficina.codigo_oficina is null and cliente.codigo_empleado_rep_ventas is null;
-- 8.Devuelve un listado de los productos que nunca han aparecido en un pedido.
select * from producto
    left join detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto
         where detalle_pedido.codigo_producto is null;
-- 9.Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
select pr.nombre, pr.descripcion,imagen from producto pr join gama_producto gp on pr.gama = gp.gama
    left join detalle_pedido dp on pr.codigo_producto = dp.codigo_producto
         where dp.codigo_producto is null;
-- 10.Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
select * from oficina
         where codigo_oficina not in
            (select codigo_oficina from empleado where codigo_empleado  in
            (select codigo_empleado_rep_ventas from cliente where codigo_cliente in
            (select codigo_cliente from pedido where codigo_pedido in
            (select codigo_pedido from detalle_pedido
            where codigo_producto in (select codigo_producto from producto where codigo_producto like 'FR%'))))) and codigo_oficina is not null;
-- 11.Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
select * from cliente left join pedido on cliente.codigo_cliente = pedido.codigo_cliente left join pago on cliente.codigo_cliente = pago.codigo_cliente where pedido.codigo_cliente is not null and pago.codigo_cliente is null;
-- 12.Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
select * from empleado
    left join cliente on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
    left join empleado e2 on empleado.codigo_jefe = e2.codigo_empleado
    where cliente.codigo_empleado_rep_ventas is null;

-- Subconsultas con operadores básicos de comparación

-- 1.Devuelve el nombre del cliente con mayor límite de crédito.
select nombre_cliente from cliente where limite_credito = (select max(limite_credito) from cliente);
-- 2.Devuelve el nombre del producto que tenga el precio de venta más caro.
select nombre from producto where precio_venta = (select max(precio_venta) from producto);
-- 3.Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
select nombre from producto where codigo_producto in (select codigo_producto from detalle_pedido group by codigo_producto order by sum(cantidad) desc limit 1);
-- 4.Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
select nombre_contacto,limite_credito from cliente join pago p on cliente.codigo_cliente = p.codigo_cliente group by cliente.codigo_cliente having sum(total)<limite_credito;
-- 5.Devuelve el producto que más unidades tiene en stock.
select nombre, cantidad_en_stock from producto where cantidad_en_stock = (select max(cantidad_en_stock) from producto);
-- 6.Devuelve el producto que menos unidades tiene en stock.
select nombre,cantidad_en_stock from producto where cantidad_en_stock = (select min(cantidad_en_stock) from producto);
-- 7.Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
select nombre, apellido1, email from empleado where codigo_jefe = (select codigo_empleado from empleado where nombre = 'Alberto' and apellido1 = 'Soria');

-- Subconsultas con ALL y ANY

-- 8.Devuelve el nombre del cliente con mayor límite de crédito.
select nombre_cliente,limite_credito from cliente where limite_credito >= ALL (select limite_credito from cliente);
-- 9.Devuelve el nombre del producto que tenga el precio de venta más caro.
select nombre,precio_venta from producto where precio_venta >= ALL (select precio_venta from producto);
-- 10.Devuelve el producto que menos unidades tiene en stock.
select nombre,cantidad_en_stock from producto where cantidad_en_stock <= ALL (select cantidad_en_stock from producto);

-- Subconsultas con IN y NOT IN

-- 11.Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
select nombre,apellido1,puesto from empleado where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);
-- 12.Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select * from cliente where codigo_cliente not in (select codigo_cliente from pago);
-- 13.Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
select * from cliente where codigo_cliente in (select codigo_cliente from pago);
-- 14.Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
select * from cliente where codigo_cliente not in (select codigo_cliente from pedido);
-- 15.Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
 select nombre,apellido1,apellido2,puesto,oficina.telefono from empleado
join oficina on empleado.codigo_oficina = oficina.codigo_oficina
where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);
-- 16.Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
select * from oficina where codigo_oficina
not in (select codigo_oficina from empleado where codigo_empleado
in (select codigo_empleado_rep_ventas from cliente where codigo_cliente
in (select codigo_cliente from pedido where codigo_pedido
in (select codigo_pedido from detalle_pedido where codigo_producto
in (select codigo_producto from producto where codigo_producto like 'FR%')))));
-- 17.Devuelve un listado con los clientes que han realizado algún pedido, pero no han realizado ningún pago.
select * from cliente where codigo_cliente in (select codigo_cliente from pedido)
and codigo_cliente not in (select codigo_cliente from pago);

-- Consultas variadas

-- 1.Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
select nombre_cliente,count(codigo_pedido) from cliente
left join pedido on cliente.codigo_cliente = pedido.codigo_cliente
group by cliente.codigo_cliente;
-- 2.Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
select nombre_cliente,sum(total) from cliente
left join pago on cliente.codigo_cliente = pago.codigo_cliente
group by cliente.codigo_cliente;
-- 3.Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
select nombre_cliente from cliente
join pedido on cliente.codigo_cliente = pedido.codigo_cliente
where extract(year from fecha_pedido) = 2008 order by nombre_cliente asc;
-- 4.Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
select nombre_cliente,nombre_contacto,apellido_contacto,oficina.telefono from cliente
join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
join oficina on empleado.codigo_oficina = oficina.codigo_oficina
where codigo_cliente not in (select codigo_cliente from pago);
-- 5.Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
select nombre_cliente,empleado.nombre,apellido1,oficina.ciudad from cliente
    join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado join oficina on empleado.codigo_oficina = oficina.codigo_oficina;
-- 6.Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
select nombre,apellido1,apellido2,puesto,oficina.telefono from empleado
join oficina on empleado.codigo_oficina = oficina.codigo_oficina
where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);
-- 7.Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
select ciudad,count(codigo_empleado) from oficina
join empleado on oficina.codigo_oficina = empleado.codigo_oficina group by ciudad;


