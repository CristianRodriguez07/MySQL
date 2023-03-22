-- Crear la base de datos
CREATE DATABASE equipo_futbol;

-- Usar la base de datos
USE equipo_futbol;

-- Crear la tabla de jugadores
CREATE TABLE Jugadores (
  id_jugador INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  edad INTEGER NOT NULL,
  posicion VARCHAR(255) NOT NULL,
  id_equipo INTEGER,
  FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);
-- Crear la tabla de equipos
CREATE TABLE Equipos (
  id_equipo INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  ciudad VARCHAR(255) NOT NULL
);


-- Crear la tabla de partidos
CREATE TABLE Partidos (
  id_partido INTEGER PRIMARY KEY AUTO_INCREMENT,
  fecha DATE NOT NULL,
  resultado VARCHAR(255) NOT NULL,
  id_estadio INTEGER,
  id_arbitro INTEGER,
  FOREIGN KEY (id_estadio) REFERENCES Estadios(id_estadio),
  FOREIGN KEY (id_arbitro) REFERENCES Arbitros(id_arbitro)
);

-- Crear la tabla de entrenadores
CREATE TABLE Entrenadores (
  id_entrenador INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  edad INTEGER NOT NULL,
  id_equipo INTEGER,
  FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

-- Crear la tabla de árbitros
CREATE TABLE Arbitros (
  id_arbitro INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  edad INTEGER NOT NULL
);

-- Crear la tabla de estadios
CREATE TABLE Estadios (
  id_estadio INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  capacidad INTEGER NOT NULL
);

-- Crear la tabla de ligas
CREATE TABLE Ligas (
  id_liga INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL
);

-- Crear la tabla de equipos_ligas
CREATE TABLE Equipos_ligas (
  id_equipo INTEGER,
  id_liga INTEGER,
  PRIMARY KEY (id_equipo, id_liga),
  FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo),
  FOREIGN KEY (id_liga) REFERENCES Ligas(id_liga)
);

-- Crear la tabla de equipo_partidos
CREATE TABLE Equipo_partidos (
  id_equipo INTEGER,
  id_partido INTEGER,
  PRIMARY KEY (id_equipo, id_partido),
  FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo),
  FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido)
);
-- Crear la tabla de partido_arbitros
CREATE TABLE Partido_arbitros (
  id_partido INTEGER,
  id_arbitro INTEGER,
  PRIMARY KEY (id_partido, id_arbitro),
  FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido),
  FOREIGN KEY (id_arbitro) REFERENCES Arbitros(id_arbitro)
);
-- Insertar datos en la tabla de equipos
INSERT INTO Equipos (nombre, ciudad) VALUES
  ('Real Madrid', 'Madrid'),
  ('Barcelona', 'Barcelona'),
  ('Atlético de Madrid', 'Madrid'),
  ('Valencia', 'Valencia'),
  ('Sevilla', 'Sevilla');

-- Insertar datos en la tabla de ligas
INSERT INTO Ligas (nombre) VALUES
  ('La Liga'),
  ('Premier League'),
  ('Serie A'),
  ('Bundesliga');

-- Insertar datos en la tabla de equipos_ligas
INSERT INTO Equipos_ligas (id_equipo, id_liga) VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 4);

-- Insertar datos en la tabla de estadios
INSERT INTO Estadios (nombre, capacidad) VALUES
  ('Santiago Bernabéu', 81044),
  ('Camp Nou', 99354),
  ('Wanda Metropolitano', 68456),
  ('Mestalla', 55000),
  ('Ramón Sánchez Pizjuán', 45000);

-- Insertar datos en la tabla de árbitros
INSERT INTO Arbitros (nombre, edad) VALUES
  ('Pablo González', 35),
  ('Javier Estrada', 30),
  ('Laura Martínez', 40),
  ('Mario Gómez', 38),
  ('Sandra García', 32);

-- Insertar datos en la tabla de jugadores
INSERT INTO Jugadores (nombre, edad, posicion, id_equipo) VALUES
  ('Cristiano Ronaldo', 35, 'delantero', 1),
  ('Lionel Messi', 33, 'delantero', 2),
  ('Antoine Griezmann', 29, 'delantero', 3),
  ('Kalidou Koulibaly', 30, 'defensa', 4),
  ('Sergio Ramos', 36, 'defensa', 1),
  ('David de Gea', 30, 'portero', 2),
  ('Jan Oblak', 28, 'portero', 3),
  ('Eden Hazard', 30, 'medio', 1),
  ('Kevin De Bruyne', 30, 'medio', 2),
  ('Luka Modric', 37, 'medio', 3);

-- Insertar datos en la tabla de entrenadores
INSERT INTO Entrenadores (nombre, edad, id_equipo) VALUES
  ('Zinedine Zidane', 50, 1),
  ('Ronald Koeman', 56, 2),
  ('Diego Simeone', 50, 3),
  ('Jorge Sampaoli', 60, 4),
  ('Julen Lopetegui', 54, 5);

-- CONSULTAS

-- 1.Mostrar el nombre de todos los árbitros que tienen más de 35 años:
SELECT nombre FROM Arbitros WHERE edad > 35;
-- 2.Mostrar nombres de arbitros
SELECT nombre FROM Arbitros;
-- 3.Mostrar nombres de entrenadores
select nombre from Entrenadores;
-- 4.Mostrar nombres de equipos
select nombre from equipos;
-- 5.Mostrar nombres de jugadores
select nombre from jugadores;
-- 6.Mostrar nombres ligas
select nombre from ligas;
-- 7.Mostrar todo de estadios
select * from estadios;
-- 8.Mostrar de forma ascendente todos los equipos
select * from equipos order by nombre asc;
-- 9.Mostrar nombres de jugadores que empiecen por 'c'
select nombre from jugadores where nombre like 'c%';
-- 10.Mostrar estadios de capacidad entre 50000 y 90000
select * from estadios where capacidad between 50000 and 90000;
-- 11.Mostrar nombre y posicion de jugadores
select nombre,posicion from jugadores;
-- 12.Mostrar nombres descendentes de estadios
select * from estadios order by nombre desc;
-- 13.Mostrar nombres que contengan la 'a' de liga
select * from ligas where nombre like '%a%';
-- 14.Mostrar nombres que acaben en z de los arbitros
SELECT nombre from arbitros where nombre like '%z';
-- 15.Mostrar todo de entrenadores
select * from entrenadores;
