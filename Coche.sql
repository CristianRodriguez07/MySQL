CREATE DATABASE COCHE;
USE COCHE;

create table clientes (
	dni int primary key,
    nombre varchar(255),
    apellido varchar(255),
    ciudad varchar(255)
);

create table coches (
	codcoche int primary key,
    nombre varchar(255),
    modelo varchar(255)
);

create table marcas (
	cifm int primary key,
    nombre varchar(255),
    ciudad varchar(255)
);

create table concesionario (
	cifc int primary key,
    nombre varchar(255),
    ciudad varchar(255)
);

create table fabrica (
	cifm int references marcas(cifm),
    codcoche int references coches(codcoche),
    primary key (cifm,codcoche)
);

create table distribuyen (
	cifc int references concesionario(cifc),
    codcoche int references coches(codcoche),
    cantidad int,
    primary key (cifc,codcoche)
);

create table venden (
	cifc int references concesionario(cifc),
    codcoche int references coches(codcoche),
    dni int references clientes(dni),
    color varchar(50),
    primary key (cifc,codcoche)
);
insert clientes
values (1, "Luis", "Garcia", "Madrid");
INSERT INTO `coche`.`clientes` (`dni`, `nombre_cliente`, `apellido`, `residencia`)
VALUES ('2', 'Antonio', 'Lopez', 'Valencia');
INSERT INTO `coche`.`clientes` (`dni`, `nombre_cliente`, `apellido`, `residencia`)
VALUES ('3', 'Juan', 'Martin', 'Madrid');
INSERT INTO `coche`.`clientes` (`dni`, `nombre_cliente`, `apellido`, `residencia`)
VALUES ('4', 'Maria', 'Garcia', 'Madrid');
INSERT INTO `coche`.`clientes` (`dni`, `nombre_cliente`, `apellido`, `residencia`)
VALUES ('5', 'Javier', 'Gonzalez', 'Barcelona');
INSERT INTO `coche`.`clientes` (`dni`, `nombre_cliente`, `apellido`, `residencia`)
VALUES ('6', 'Ana', 'Lopez', 'Barcelona');

select * from coches;
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('1', 'IBIZA', 'GLX');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('2', 'IBIZA', 'GTI');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('3', 'IBIZA', 'GTD');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('4', 'TOLEDO', 'GTD');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('5', 'CORDOBA', 'GTI');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('6', 'MEGANE', '1.6');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('7', 'MEGANE', 'GTI');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('8', 'LAGUNA', 'GTD');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('9', 'LAGUNA', 'TD');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('10', 'ZX', '16V');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('11', 'ZX', 'TD');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('12', 'XANTIA', 'GTD');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('13', 'A4', '1.8');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('14', 'A4', '2.8');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('15', 'ASTRA', 'CARAVAN');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('16', 'ASTRA', 'GTI');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('17', 'CORSA', '1.4');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('18', '300', '316');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('19', '500', '525');
INSERT INTO `coche`.`coches` (`codcoche`, `nombre`, `modelo`) VALUES ('20', '700', '750');

INSERT INTO MARCAS (CIFM, NOMBRE, CIUDAD) VALUES ('0001', 'SEAT', 'MADRID');
INSERT INTO MARCAS (CIFM, NOMBRE, CIUDAD) VALUES ('0002', 'RENAULT', 'BARCELONA');
INSERT INTO MARCAS (CIFM, NOMBRE, CIUDAD) VALUES ('0003', 'CITROEN', 'VALENCIA');
INSERT INTO MARCAS (CIFM, NOMBRE, CIUDAD) VALUES ('0004', 'AUDI', 'MADRID');
INSERT INTO MARCAS (CIFM, NOMBRE, CIUDAD) VALUES ('0005', 'OPEL', 'BILBAO');
INSERT INTO MARCAS (CIFM, NOMBRE, CIUDAD) VALUES ('0006', 'BMW', 'BARCELONA');

INSERT INTO CONCESIONARIO (CIFC, NOMBRE, CIUDAD) VALUES ('0001', 'ACAR', 'MADRID');
INSERT INTO CONCESIONARIO (CIFC, NOMBRE, CIUDAD) VALUES ('0002', 'BCAR', 'MADRID');
INSERT INTO CONCESIONARIO (CIFC, NOMBRE, CIUDAD) VALUES ('0003', 'CCAR', 'BARCELONA');
INSERT INTO CONCESIONARIO (CIFC, NOMBRE, CIUDAD) VALUES ('0004', 'DCAR', 'VALENCIA');
INSERT INTO CONCESIONARIO (CIFC, NOMBRE, CIUDAD) VALUES ('0005', 'ECAR', 'BILBAO');

INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0001', '001 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0001', '002 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0001', '003 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0001', '004 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0001', '005 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0002', '006 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0002', '007 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0002', '008 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0002', '009 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0003', '010 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0003', '011 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0003', '012 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0004', '013 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0004', '014 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0005', '015 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0005', '016 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0005', '017 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0006', '018 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0006', '019 ');
INSERT INTO FABRICA (CIFM, CODCOCHE) VALUES ('0006', '020');

INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0001', '001', '3 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0001', '005', '7 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0001', '006', '7 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0002', '006', '5 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0002', '008', '10 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0002', '009', '10 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0003', '010', '5 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0003', '011', '3 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0003', '012', '5 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0004', '013', '10 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0004', '014', '5 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0005', '015', '10 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0005', '016', '20 ');
INSERT INTO DISTRIBUYEN (CIFC, CODCOCHE, CANTIDAD) VALUES ('0005', '017', '8 ');

INSERT INTO VENDEN (CIFC, DNI, CODCOCHE, COLOR) VALUES ('0001', '0001', ' 001', 'BLANCO');
INSERT INTO VENDEN (CIFC, DNI, CODCOCHE, COLOR) VALUES ('0001', '0002', ' 005', 'ROJO');
INSERT INTO VENDEN (CIFC, DNI, CODCOCHE, COLOR) VALUES ('0002', '0003', ' 008', 'BLANCO');
INSERT INTO VENDEN (CIFC, DNI, CODCOCHE, COLOR) VALUES ('0002', '0001', ' 006', 'ROJO');
INSERT INTO VENDEN (CIFC, DNI, CODCOCHE, COLOR) VALUES ('0003', '0004', ' 011', 'ROJO');
INSERT INTO VENDEN (CIFC, DNI, CODCOCHE, COLOR) VALUES ('0004', '0005', ' 014', 'VERDE');
-- Modifica la tabla VENDEN, para que se pueda almacenar la fecha de venta.
ALTER TABLE VENDEN
	ADD COLUMN FECHA_VENTA date;
select * from venden;
/*d.Inserta los siguientes datos:
•El concesionario 1, ha vendido todos los coches en el año 2018
•El concesionario 2, ha vendido todos los coches en el año 2019
•El concesionario 3, ha vendido todos los coches en el año 2020
•El concesionario 4, ha vendido todos los coches en el año 2021  */
update venden set fecha_venta="2018-01-01" where cifc = 1;
update venden set fecha_venta="2019-01-01" where cifc = 2;
update venden set fecha_venta="2020-01-01" where cifc = 3;
update venden set fecha_venta="2021-01-01" where cifc = 4;
-- 1.Obtener todos los campos de todos los concesionarios
select * from concesionario;
-- 2.Obtener una relación en al que aparezcan los valores del atributo apellido de la relación CLIENTES
select apellido from clientes;
-- Obtener una relación en la que aparezcan los valores de los atributos apellidos y ciudad de la relación CLIENTES
select apellido, ciudad from clientes;
-- 4. Cambiar   el   nombre   de   los   atributos   nombre   y  ciudad   de   la
-- relación CLIENTES por Nombre del cliente y Residencia.
ALTER TABLE CLIENTES CHANGE COLUMN nombre nombre_cliente varchar(255);
ALTER TABLE CLIENTES CHANGE COLUMN ciudad residencia varchar(255);
-- 5. Obtener las registros de la relación MARCAS  para las que el atributo ciudad es “Barcelona”
select * from marcas where ciudad="Barcelona";
select * from marcas where ciudad like "%a"; -- que acabe en a
select * from marcas where ciudad like "_________"; -- 9caracteres
select * from marcas where ciudad like "________a"; -- 8 caracteres y una a
select * from marcas where ciudad like "__r%"; -- 2caracteres una r y lo que sea

-- 6.Obtener todos los campos  de los clientes de Madrid
select * from clientes where residencia="Madrid";
select * from clientes where residencia like "Madrid";

-- 7.Obtener una relación en la que aparezca los valores de los
-- atributos apellidos y ciudad para los clientes de Madrid
select apellido, residencia from clientes where residencia like "Madrid";

-- 8.Obtener  las  registros  de  la  relación  DISTRIBUCION
-- para  las  que  el  atributo cantidad toma un valor mayor que 15
select * from distribuyen where cantidad>15;

-- 9.Obtener  el  cifc  de  todos  los  concesionarios
-- cuyo  atributo  cantidad  en  la  tabla DISTRIBUCION es mayor que 18
select cifc from distribuyen where cantidad > 18;

-- 10.Obtener  las  registros  de  la  relación  CLIENTES
-- para  las  que  el  atributo  ciudad toma un valor distinto de “Madrid”
select * from clientes where residencia != "Madrid";
select * from clientes where residencia <> "Madrid";
select * from clientes where residencia not like "Madrid";

-- 11.Obtener las registros de la relación CLIENTES para las que el atributo apellidos es “García”
-- y el atributo ciudad es “Madrid”
select * from clientes where apellido = "Garcia" and residencia = "Madrid";
select * from clientes where apellido = "Garcia" && residencia = "Madrid";
-- 12.Obtener el cifc de todos los concesionarios cuyo atributo cantidad en la tabla de distribución
-- es mayor que 10 y menor que 5
select cifc from distribuyen where cantidad > 10 and cantidad<5;
select cifc from distribuyen where cantidad > 10 or cantidad<5;
-- 13 Obtener el cifc de todos los concesionarios cuyo atributo cantidad es la tabla de distribución
-- está comprendida entre 10 y 18 ambos inclusive
select cifc from distribuyen where cantidad >= 10 and cantidad <= 18;
select cifc from distribuyen where cantidad between 10 and 18;

-- 14.Obtener todos los codcoche de los coches cuyo nombre empiece por C
select codcoche from coches where nombre like "C%";

-- 15.Obtener todos los codcoche de los coches cuyo nombre no contiene ninguna A
select codcoche from coches where nombre not like '%a%';

-- 16.Obtener  el  cifm  y  el  nombre  de  las  marcas  de  coches  cuya  segunda
-- letra  del nombre de la ciudad de origen sea una I
select cifm, nombre from marcas where ciudad like "_i%";
-- 17.Obtener el cifc de todos los concesionarios cuyo número de coches en stock no es nulo
select cifc from distribuyen where cantidad is not null;
-- 18.Obtener los nombres de todas las Marcas ordenadas alfabéticamente
select nombre from marcas order by nombre asc;
select nombre from marcas order by nombre desc;
select nombre, ciudad from marcas order by 2 asc, 1 desc;
-- 19.Obtener todas las parejas de atributos cifm de MARCAS y dni de CLIENTES que sean de la misma ciudad
select m.cifm, c.dni from marcas m, clientes c where m.ciudad = c.residencia;
-- 20.Obtener el atributo codcoche de aquellos coches vendidos a clientes de Madrid
select codcoche from venden v, clientes c where v.dni  = c.dni and c.residencia like "Madrid";
-- 21.Obtener  los  codcoche  que  en  este  momento  están  en  algún  concesionario  de “Barcelona”
select codcoche from distribuyen d, concesionario c where d.cifc = c.cifc and c.ciudad like "Barcelona";
-- 22.Obtener el dni de los clientes que han comprado algún coche a un concesionario de Madrid
select dni from venden v, distribuyen d, concesionario c where v.codcoche = d.codcoche and d.cifc = c.cifc and c.ciudad like "Madrid";
-- 23.Obtener el codcoche de los coches vendidos por algún concesionario de Madrid
select codcoche from venden
join concesionario c on venden.cifc = c.cifc
where c.ciudad like "Madrid";
-- 24.Obtener el color de los coches vendidos por el concesionario Acar
select color from venden
join concesionario c on c.cifc = venden.cifc
where c.nombre like "Acar";
-- 25.Obtener todos los nombres de los clientes que hayan adquirido algún coche del concesionario Dcar
select nombre from clientes
join venden v on clientes.dni = v.dni
join concesionario c on c.cifc = v.cifc
where c.nombre like "Dcar";
-- 26.Obtener el nombre y el modelo de los coches vendidos por algún concesionario de Barcelona
select c.nombre, modelo from coches
join venden v on coches.codcoche = v.codcoche
join concesionario c on c.cifc = v.cifc
where c.ciudad like "Barcelona";
-- 27.Obtener los nombres de las marcas que tiene modelos “GTD”.
select c.nombre from marcas
join fabrica f on marcas.cifm = f.cifm
join coches c on f.codcoche = c.codcoche
where c.modelo like "GTD";
-- 28.Obtener los codcoche de los coches comprados en un concesionario de la misma ciudad que el cliente que lo compra
select codcoche from venden
join clientes c on venden.dni = c.dni
join concesionario con on con.cifc = venden.cifc
where con.ciudad = c.residencia;
-- 29.Obtener  los  codcoche  de  los  coches  comprados  en un  concesionario  de  distinta ciudad que el cliente que lo compra
select codcoche from venden
join concesionario c on c.cifc = venden.cifc
join clientes cl on cl.dni = venden.dni
where c.ciudad != cl.residencia;
-- 30.Obtener  el  nombre  y  el  apellido  de  los  clientes que  han  adquirido  un  coche modelo “gti” de color blanco
select nombre, apellido from clientes
join venden v on clientes.dni = v.dni
join coches c on c.codcoche = v.codcoche
where c.modelo like "gti" and v.color like "blanco";
-- 31.Obtener el atributo codcoche de los coches que han sido adquirido por un cliente de Madrid a un concesionario de Madrid
select codcoche from venden
join concesionario c on c.cifc = venden.cifc
join clientes cl on cl.dni = venden.dni
where c.ciudad like "Madrid" and cl.residencia like "Madrid";
-- 32.Obtener el nombre y el apellido de los clientes que han adquirido un automóvil a un concesionario que posea actualmente coches en stock del modelo GTI
select clientes.nombre_cliente, apellido from clientes
join venden v on clientes.dni = v.dni
join distribuyen d on d.codcoche = v.codcoche
where d.cantidad > 0 and d.codcoche in (select codcoche from coches where modelo like "GTD");
-- 33.Obtener el nombre y el apellido de los clientes que han adquirido un automóvil a un concesionario de  Madrid que  posea actualmente coches en stock del modelo GTI
select nombre, apellido from clientes
join venden v on clientes.dni = v.dni
join distribuyen d on d.codcoche = v.codcoche
join concesionario c on c.cifc = d.cifc
where d.cantidad > 0 and d.codcoche in (select codcoche from coches where modelo like "GTD") and c.ciudad like "Madrid";
-- 34.Obtener todas las parejas de atributos cifm de MARCAS y dni de CLIENTES que NO sean de la misma ciudad
select marcas.cifm, clientes.dni from marcas, clientes
where marcas.ciudad != clientes.residencia;
-- 35.Obtener todas las parejas de nombre de marcas que sean de la misma ciudad
select m1.nombre, m2.nombre from marcas m1, marcas m2
where m1.ciudad = m2.ciudad;
-- 36.Obtener  el  nombre  y  el  apellido  de  los  clientes cuyo  dni  es  menor  que  el  del cliente Juan Martín
select c.nombre_cliente, c.apellido from clientes
join clientes c on clientes.dni < c.dni
where c.nombre_cliente like "Juan" and c.apellido like "Martín";
-- 37.Obtener  las  parejas  de  modelos  de  coches  cuyo  nombre  es  el  mismo  y  cuya marca es de Bilbao.
select c1.modelo, c2.modelo from coches c1, coches c2
join coche c2 on c1.nombre = c2.nombre
join fabrica f2 on c2.codcoche = f2.codcoche
join coche c1 on c1.codcoche = f1.codcoche

