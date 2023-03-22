create database ej1;
use ej1;
create table empresas (
idempresa INT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
telefono VARCHAR(255) UNIQUE,
direccion VARCHAR(255) NOT NULL,
dni VARCHAR(255) NOT NULL
);
create table alumnos(
idalumno INT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
telefono VARCHAR(255) UNIQUE,
direccion VARCHAR(255) NOT NULL,
dni VARCHAR(255) NOT NULL,
edad varchar(255) not null,
fechanacimiento date,
idempresa int references empresa(idempresa)
);
create table profesores(
idprofesores INT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
telefono VARCHAR(255) UNIQUE,
direccion VARCHAR(255) NOT NULL,
dni VARCHAR(255) NOT NULL,
apellidos varchar(255) not null
);

CREATE TABLE `curso` (
  `idtipo` int NOT NULL,
  `nºcurso` int DEFAULT NULL,
  `idtipo` int NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tipo` (
  `duracion` varchar(255) DEFAULT NULL,
  `programacion` varchar(255) DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
