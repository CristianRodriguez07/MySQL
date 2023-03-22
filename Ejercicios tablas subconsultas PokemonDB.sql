-- EJERCICIOS POKEMONDB
use pokemondb;
-- 1.Crea la tabla pokemonFuego, que contendrá los nombres de todos los pokemon de tipo fuego.
create table pokemonFuego as select p.nombre from pokemon p join pokemon_tipo pt on p.numero_pokedex = pt.numero_pokedex
join tipo t on pt.id_tipo = t.id_tipo where t.nombre = 'fuego';
 select * from pokemonFuego;
-- 2.Crea la tabla pokemonEvolucionesTipo, que contendrá los número depokedex, los nombres de los pokemon y su tipo, y los mismos datos desus evoluciones, además aparecerá el tipo de evolución quenecesitan.
create table pokemonEvolucionesTipo as
select distinct origen.pokemon_origen as pokemon , pok.nombre as nombre , tipok.nombre tipo,
origen.pokemon_evolucionado as evolucion , evo.nombre as nombre_evolucion , tipevol.nombre as tipo2,
tipo_evolucion_poke.tipo_evolucion from evoluciona_de origen
join pokemon pok on pok.numero_pokedex = origen.pokemon_origen
join pokemon evo on evo.numero_pokedex = origen.pokemon_evolucionado
join pokemon_tipo a on a.numero_pokedex = pok.numero_pokedex
join pokemon_tipo b on b.numero_pokedex = evo.numero_pokedex
join tipo tipok on a.id_tipo = tipok.id_tipo
join tipo tipevol on b.id_tipo = tipevol.id_tipo
join pokemon_forma_evolucion on pokemon_forma_evolucion.numero_pokedex = pok.numero_pokedex
join forma_evolucion on forma_evolucion.id_forma_evolucion = pokemon_forma_evolucion.id_forma_evolucion
join tipo_evolucion tipo_evolucion_poke on tipo_evolucion_poke.id_tipo_evolucion = forma_evolucion.tipo_evolucion
;
drop table pokemonEvolucionesTipo;
 select * from pokemonEvolucionesTipo;
-- 3.Crea la tabla movimientos Hielo Y Efecto, que contendrá los ids de movimiento, los nombres de los movimientos, y si hacen un efecto secundario aparecerá también el id del efecto secundario, el nombre del efecto y la probabilidad. (Si hay movimientos que no tienen efecto secundario aparecerán nulos en los campos relacionados)
create table movimientosHieloYefecto as select m.id_movimiento, m.nombre, e.id_efecto_secundario,e.efecto_secundario,mes.probabilidad from movimiento m
left join movimiento_efecto_secundario mes on m.id_movimiento = mes.id_movimiento
left join efecto_secundario e on mes.id_efecto_secundario = e.id_efecto_secundario;
 select * from movimientosHieloYefecto;
drop table movimientosHieloYefecto;
-- 4.Inserta en la tabla de pokemonFuego todos los pokemon de tipo fuegoque pesen más de 1.
insert into pokemonFuego select p.nombre from pokemon p join pokemon_tipo pt on p.numero_pokedex = pt.numero_pokedex
join tipo t on pt.id_tipo = t.id_tipo where t.nombre = 'fuego' and p.peso > 1;
 select * from pokemonFuego;
-- 5.Inserta en la tabla pokemonEvolucionesTipo todos los datos que senecesiten de los pokemon cuya evolución es de tipo agua.
insert into pokemonEvolucionesTipo select p.numero_pokedex as pokedex, p.nombre as pokemon, t.nombre as tipo, p2.numero_pokedex as pokedex2 , p2.nombre as nombre2 , t2.nombre as tipo2  from pokemon p
join pokemon_tipo pt on p.numero_pokedex = pt.numero_pokedex
join tipo t on pt.id_tipo = t.id_tipo
join pokemon_forma_evolucion ev on p.numero_pokedex = ev.numero_pokedex
join pokemon p2 on ev.numero_pokedex = p2.numero_pokedex
join pokemon_tipo pt2 on p2.numero_pokedex = pt2.numero_pokedex
join tipo t2 on pt2.id_tipo = t2.id_tipo where t2.nombre = 'agua';
 select * from pokemonEvolucionesTipo;
-- 6.Inserta en la tabla movimientosHieloYEfecto todos los datos que senecesiten de los movimientos cuya probabilidad sea menor de 80.
insert into movimientosHieloYefecto select m.id_movimiento, m.nombre, e.id_efecto_secundario,e.efecto_secundario,mes.probabilidad from movimiento m
left join movimiento_efecto_secundario mes on m.id_movimiento = mes.id_movimiento
left join efecto_secundario e on mes.id_efecto_secundario = e.id_efecto_secundario where m.id_tipo = 15 and mes.probabilidad < 80;
 select * from movimientosHieloYefecto;
-- 7.Actualiza de la tabla pokemonFuego los nombres de los pokemon que empiecen por ‘char’ y cámbialos por el nombre del pokemon con más ataque. con joins
update pokemonFuego set nombre = (select p.nombre from pokemon p join estadisticas_base eb on p.numero_pokedex = eb.numero_pokedex
where eb.ataque = (select max(ataque) from estadisticas_base)) where nombre like 'char%';
 select * from pokemonFuego;
-- 8.Actualiza la tabla pokemonEvolucionesTipo cambiando el tipo de evolución a piedra, para todos los pokemon cuya evolución sea del mismo tipo que los tipos que tiene el pokemon con más vida del juego.
update pokemonEvolucionesTipo set tipo_evolucion = 'piedra' where tipo = (select t.nombre from tipo t
join pokemon_tipo pt on t.id_tipo = pt.id_tipo join pokemon p on pt.numero_pokedex = p.numero_pokedex
join estadisticas_base eb on p.numero_pokedex = eb.numero_pokedex where eb.ps = (select max(ps) from estadisticas_base));
 select * from pokemonEvolucionesTipo;
-- 12.Borra de la tabla movimientosHieloYEfecto todos los movimientos que aprenda el pokemon que más vida o que más defensa especial tenga.(con joins)
delete from movimientosHieloYefecto where id_movimiento in (select m.id_movimiento from movimiento m
join pokemon_movimiento_forma pm on m.id_movimiento = pm.id_movimiento
join pokemon p on pm.numero_pokedex = p.numero_pokedex
join estadisticas_base eb on p.numero_pokedex = eb.numero_pokedex
where eb.ps = (select max(ps) from estadisticas_base) or eb.defensa = (select max(defensa) from estadisticas_base));
 select * from movimientosHieloYefecto;