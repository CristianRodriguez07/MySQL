-- INDICES
-- 1. Crea un índice sobre el campo nombre cliente de la tabla cliente, llámala nombre_cliente_index. Muestra todos los índices de la tabla cliente. Elimina el indice nombre_cliente_index de la tabla cliente.
create index nombre_cliente_index on cliente (nombre_cliente);
show index from cliente;
drop index nombre_cliente_index on cliente;
-- VISTAS
-- 1.Crea una vista llamada HiperGardenTools que muestre el número de productos, la suma de los productos en stock y la suma de las ganancias (precio_venta-precio _proveedor) del proveedor HiperGarden Tools.
create view HiperGardenTools as select count(codigo_producto), sum(cantidad_en_stock), sum(precio_venta-precio_proveedor) from producto where proveedor=1;
-- 2.Crea una vista llamada Jefes que muestre el id, el nombre y apellidos (concatenado), y el número de empleados que tiene cada jefe.
create view Jefes as select e.codigo_empleado, concat(e.nombre, ' ', e.apellido1) as nombre, count(e.codigo_empleado) as num_empleados from empleado e, empleado j where e.codigo_jefe=j.codigo_empleado group by e.codigo_empleado;
-- 3.Crea una vista llamada resultados2009 que muestre el total de transacciones que se hicieron ese año y la suma de las ganancias (total) del año 2009.
create view resultados2009 as select count(id_transaccion), sum(total) from pago where year(fecha_pago)=2009;
-- 4.Crea una vista llamada representantes ClientesMadrid, que muestre el id de empleado, nombre y apellidos (concatenado) de empleado y dirección de la oficina en la que trabaja el representante de ventas de todos los clientes que son de Madrid (ciudad).
create view representantesClientesMadrid as select e.codigo_empleado, concat(e.nombre, ' ', e.apellido1) as nombre, o.linea_direccion1 from empleado e, oficina o, cliente c where e.codigo_empleado=o.codigo_oficina and c.codigo_cliente=o.codigo_oficina and c.ciudad='Madrid';
/* 5.Escribe la consulta que utilizarías para mostrar el contenido de la vista Jefes y la consulta con la que la borrarías (ten en cuenta de que la vista puede no existir
cuando ejecutes el comando de borrado).*/
select * from Jefes;
drop view Jefes;
-- SUBCONSULTAS EN DML:
-- 1.Crea la tabla empleados ReVentas Madrid que contendrá todos los datos de de la tabla empleados de todos los representantes de ventas que trabajan en una oficina de Madrid. Rellena la tabla con los datos. (Utiliza una sola consulta, no le pongas restricciones).
create table empleadosReVentasMadrid as select * from empleado where codigo_empleado in
(select codigo_empleado from empleado e, oficina o
where e.codigo_empleado=o.codigo_oficina and o.ciudad='Madrid');
-- 2.Inserta en la tabla empleados ReVentasMadrid los empleados que trabajan para clientes de Madrid, que hayan hecho pedidos en el año 2009 y cuyo estado sea entregado.
insert into empleadosReVentasMadrid select * from empleado where codigo_empleado in
(select codigo_empleado from empleado e, cliente c, pedido p where e.codigo_empleado=c.codigo_cliente
and c.codigo_cliente=p.codigo_cliente and c.ciudad='Madrid' and year(p.fecha_pedido)=2009 and p.estado='Entregado');
-- 3.Actualiza la tabla empleados ReVentasMadrid cambiando el código de jefe de los empleados, al código del empleado que se llama Marcos Magaña Perez, de aquellos empleados que tengan como jefe a Carlos Soria Jimenez.
update empleadosReVentasMadrid set codigo_jefe=
(select codigo_empleado from empleado where nombre='Marcos' and apellido1='Magaña' and apellido2='Perez')
where codigo_jefe=(select codigo_empleado from empleado
where nombre='Carlos' and apellido1='Soria' and apellido2='Jimenez');
-- 4.Elimina de la tabla empleados ReVentasMadrid a los empleados que trabajan en una oficina que no sea de España.
delete from empleadosReVentasMadrid where codigo_empleado in
(select codigo_empleado from empleado e, oficina o where e.codigo_empleado=o.codigo_oficina and o.pais!='España');
-- TEORIA
/* ¿Cúal de las siguientes no forma parte de la normativa vigente sobre protección de datos?
Es el Ley Orgánica 15/1999 de 13 de diciembre de Protección de Datos de Carácter
Personal (LOPD).*/


