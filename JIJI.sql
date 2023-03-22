create database pokemon;
use pokemon;
CREATE TABLE PERSONAJE (
	idpersonaje int primary key,
    nombre varchar(255) not null,
    edad int unsigned not null,
    sexo varchar(10) not null,
    altura double(4,2) unsigned not null
);

CREATE TABLE ENTRENADOR (
	idpersonaje int references Personaje(idpersonaje),
    num_pokedex int primary key,
    telefono int unsigned not null
);

CREATE TABLE CIUDAD (
	idciudad int primary key,
    nombre varchar(255) not null,
    ubicacion varchar(255) not null
);

CREATE TABLE PERSONAJE_CIUDAD (
	idciudad int references Ciudad(idciudad),
    idpersonaje int references Personaje(idpersonaje),
    primary key (idciudad,idpersonaje)
);

CREATE TABLE POKEMON (
	IDPokemon int primary key,
	Nombre varchar(255) not null,
	Especie varchar(255) not null,
	Altura double(4,2) unsigned not null,
	Peso double(4,2) unsigned not null,
	Naturaleza varchar(255) not null,
	Sexo varchar(10) not null,
	Categoría varchar(255) not null,
	Habilidad varchar(255) not null,
	IDPersonaje int references Personaje(idpersonaje)
);

ALTER TABLE POKEMON 
	ADD column idevolucion int references Pokemon(IDPokemon);
    
ALTER TABLE POKEMON 
	modify column Sexo varchar(10);
    
CREATE TABLE RUTA (
	IDruta int primary key,
	Nombre varchar(255) not null,
	IDciudad int references Ciudad(idciudad)
);

CREATE TABLE TIPO (
	IdTipo int primary key,
	Nombre varchar(255) not null
);

CREATE TABLE EDIFICIO (
	IDEdificio int primary key,
	IDRuta int references RUTA(IDruta),
	Nombre varchar(255) not null
);
CREATE TABLE POKEMON_RUTA (
	IDPokemon int references pokemon(IDPokemon),
    idruta int references ruta(IDruta),
    primary key (IDPokemon,idruta)
);

CREATE TABLE POKEMON_TIPO (
	IDPokemon int references pokemon(IDPokemon),
    idtipo int references tipo(IdTipo),
    primary key (IDPokemon,idtipo)
);

CREATE TABLE GIMNASIO (
	IDGimnasio int primary key,
	IDtipo int references tipo(IdTipo)
);

CREATE TABLE LIDER (
	Derrotas int unsigned not null,
	Victorias int unsigned not null,
	IDLider int primary key,
	IdPersonaje int references Personaje(idpersonaje),
	Fecha date,
	IDGimnasio int references GIMNASIO(IDGimnasio)
);

CREATE TABLE POLICIA (
	num_placa int primary key,
	Especialidad varchar(255) not null,
	IDPersonaje int references Personaje(idpersonaje)
);

CREATE TABLE MEDALLA (
	IDMedalla int primary key,
	Nombre varchar(255) not null,
	Forma varchar(255) not null,
	Nivel int unsigned not null
);

CREATE TABLE ENFERMERA (
	Num_colegiada int primary key,
	IDPersonaje int references Personaje(idpersonaje),
	Especialidad varchar(255) not null
);

CREATE TABLE MEDALLA_LIDER_ENTRENADOR (
	IDmedalla  int references MEDALLA(IDMedalla),
	IDlider int references LIDER(IDLider),
	IDentrenador int references ENTRENADOR(num_pokedex),
    primary key (IDmedalla,IDlider,IDentrenador)
);
