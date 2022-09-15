-- Creacion de Base de Datos

CREATE DATABASE proyind;
USE proyind;


-- Creacion de tablas

CREATE TABLE circuits (
	idCircuito INT NOT NULL AUTO_INCREMENT,
	circuitoRef VARCHAR (255),
    nombre VARCHAR (255),
    localizacion VARCHAR (255),
	pais VARCHAR (255),
    latitud FLOAT,
	longitud FLOAT,
    alt INT (11),
	url VARCHAR (255),
	PRIMARY KEY (idCircuito)
);

SELECT *
FROM circuits;

CREATE TABLE races (
	idcarrera INT NOT NULL AUTO_INCREMENT,
	año INT (11),
    ronda INT (11),
    idcircuito INT (11),
    nombre VARCHAR (255),
    fecha DATE,
	hora TIME,
    url VARCHAR (255),
    PRIMARY KEY (idcarrera)
);

SELECT *
FROM races;

CREATE TABLE constructors (
	idconstructor INT NOT NULL AUTO_INCREMENT,
	constructorRef VARCHAR (255),
    nombre VARCHAR (255),
    nacionalidad VARCHAR (255),
    url VARCHAR (255),
	PRIMARY KEY (idconstructor)
);

SELECT *
FROM constructors;

CREATE TABLE drivers (
	idpiloto INT NOT NULL AUTO_INCREMENT,
    pilotoRef VARCHAR (255),
	numero INT (11),
    codigo VARCHAR (3),
    nombre VARCHAR (255),
    apellido VARCHAR (255),
    fecha_nacimiento DATE,
	nacionalidad VARCHAR (255),
    url VARCHAR (255),
    PRIMARY KEY (idpiloto)
);

SELECT *
FROM drivers;

CREATE TABLE results (
	idresultado INT NOT NULL AUTO_INCREMENT,
    idcarrera INT (11),
    idpiloto INT (11),
    idconstructor INT (11),
    numero INT (11),
    grilla INT (11),
    posicion INT (11),
    texto_posicion VARCHAR (255),
    posicion_final INT (11),
    puntos FLOAT,
    vueltas INT (11),
    tiempo VARCHAR (255),
    milisegundos INT (11),
    vuelta_mas_rapida INT (11),
    ranking INT (11),
    tiempo_vuelta_rapida VARCHAR (255),
    velocidad_vuelta_rapida VARCHAR (255),
    idstatus INT (11),
    PRIMARY KEY (idresultado)
);

SELECT *
FROM results;

CREATE TABLE pitStops (
	idcarrera INT NOT NULL AUTO_INCREMENT,
    idpiloto INT (11),
    detencion INT (11),
    vuelta INT (11),
    tiempo TIME,
    duracion VARCHAR (255),
    milisegundos INT (11),
    PRIMARY KEY (idcarrera)
);

SELECT *
FROM pitStops;

CREATE TABLE lapTimes (
	idcarrera INT NOT NULL AUTO_INCREMENT,
    idpiloto INT (11),
    vuelta INT (11),
    posicion INT (11),
    tiempo VARCHAR (255),
    milisegundos INT (11),
    PRIMARY KEY (idcarrera)
);

SELECT *
FROM lapTimes;


-- Carga de datos a tablas

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\drivers.csv'
INTO TABLE `gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\constructors.csv'
INTO TABLE `gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\circuits.csv'
INTO TABLE `gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pit_stops.csv'
INTO TABLE `gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\races.csv'
INTO TABLE `gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\results.csv'
INTO TABLE `gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


