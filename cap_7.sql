SHOW DATABASES;
DROP DATABASE IF EXISTS prueba;
CREATE DATABASE prueba;
USE prueba;
CREATE TABLE gente (
nombre VARCHAR(40),
fecha DATE
);


CREATE TABLE ciudad1 (
nombre CHAR(20) NOT NULL, 
poblacion INT NULL
);


CREATE TABLE ciudad2 (
nombre CHAR(20) NOT NULL,
poblacion INT NULL DEFAULT 5000
);


CREATE TABLE ciudad3 (
nombre CHAR(20) NOT NULL PRIMARY KEY, 
poblacion INT NULL DEFAULT 5000
);


CREATE TABLE ciudad4 (
nombre CHAR(20) NOT NULL,
poblacion INT NULL DEFAULT 5000,
PRIMARY KEY (nombre)
);


CREATE TABLE ciudad5 (
clave INT AUTO_INCREMENT PRIMARY KEY,
nombre CHAR(20) NOT NULL,
poblacion INT NULL DEFAULT 5000
);


CREATE TABLE ciudad6(
clave INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Clave principal',
nombre CHAR(50) NOT NULL,
poblacion INT NULL DEFAULT 5000
);

CREATE TABLE mitabla1 (
id1 CHAR(2) NOT NULL,
id2 CHAR(2) NOT NULL,
texto CHAR(30),
PRIMARY KEY (id1, id2)
);

CREATE TABLE mitabla2 (
id INT,nombre CHAR(19),
INDEX (nombre)
);
CREATE TABLE mitabla3 (
id INT,nombre CHAR(19),
KEY (nombre)
);

CREATE TABLE mitabla4 (
id INT,nombre CHAR(19),
INDEX (nombre(4))
);

CREATE TABLE mitabla5 (
id INT,nombre CHAR(19),
UNIQUE (nombre)
);

CREATE TABLE mitabla6 (
id INT,nombre CHAR(19) NOT NULL,
UNIQUE (nombre)
);

CREATE TABLE mitabla7 (
id INT,nombre CHAR(19),
PRIMARY KEY (nombre)
);

CREATE TABLE personas (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(40),
fecha DATE
);

CREATE TABLE personas2 (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(40),
fecha DATE
)ENGINE=InnoDB;

CREATE TABLE telefonos (
numero CHAR(12),
id INT NOT NULL REFERENCES 
personas (id)ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE telefonos2 (
numero CHAR(12),id INT NOT NULL,KEY (id), 
FOREIGN KEY (id) REFERENCES 
personas2 (id)ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE telefonos3 (
numero CHAR(12),id INT NOT NULL,KEY (id),
FOREIGN KEY (id) REFERENCES 
personas (id)ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;

SHOW TABLES;
SHOW COLUMNS FROM gente;
SHOW COLUMNS FROM ciudad1;
SHOW COLUMNS FROM ciudad2;


DROP TABLE ciudad6;
DROP TABLE IF EXISTS ciudad6;

CREATE DATABASE borrame;
USE borrame

CREATE TABLE borrame (
id INT,
nombre CHAR(40)
);

SHOW DATABASES;
SHOW TABLES;
DROP DATABASE IF EXISTS borrame;
DROP DATABASE IF EXISTS borrame;
DROP DATABASE IF EXISTS meteo;
CREATE DATABASE meteo;
USE meteo

CREATE TABLE estacion (
identificador MEDIUMINT UNSIGNED NOT NULL,
latitud VARCHAR(14) NOT NULL,
longitud VARCHAR(15) NOT NULL,
altitud MEDIUMINT NOT NULL,
PRIMARY KEY (identificador)
) ENGINE=InnoDB;

CREATE TABLE muestra (
 identificadorestacion MEDIUMINT UNSIGNED NOT NULL,
 fecha DATE NOT NULL,
 temperaturaminima TINYINT,
temperaturamaxima TINYINT,
precipitaciones SMALLINT UNSIGNED,
humedadminima TINYINT UNSIGNED,
humedadmaxima TINYINT UNSIGNED,
velocidadminima SMALLINT UNSIGNED,
velocidadmaxima SMALLINT UNSIGNED,
KEY (identificadorestacion),
FOREIGN KEY (identificadorestacion)
REFERENCES estacion(identificador)
ON DELETE NO ACTION
ON UPDATE CASCADE
) ENGINE=InnoDB;

DROP DATABASE IF EXISTS biblio; 
CREATE DATABASE biblio;
CREATE TABLE editorial (
claveeditorial SMALLINT NOT NULL,
nombre VARCHAR(60),
direccion VARCHAR(60),
telefono VARCHAR(15),
PRIMARY KEY (claveeditorial)
) ENGINE=InnoDB;
 
 CREATE TABLE libro (
clavelibro INT NOT NULL,
titulo VARCHAR(60),
idioma VARCHAR(15),
formato VARCHAR(15),
categoria CHAR,
claveeditorial SMALLINT,
PRIMARY KEY (clavelibro),
KEY(claveeditorial),
FOREIGN KEY (claveeditorial)
REFERENCES editorial(claveeditorial)
ON DELETE SET NULL
ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE tema (
clavetema SMALLINT NOT NULL,
nombre VARCHAR(40),
PRIMARY KEY (clavetema)
) ENGINE=InnoDB;

CREATE TABLE autor (
 claveautor INT NOT NULL,
 nombre VARCHAR(60),
 PRIMARY KEY (claveautor)
) ENGINE=InnoDB;

CREATE TABLE ejemplar (
clavelibro INT NOT NULL,
numeroorden SMALLINT NOT NULL,
edicion SMALLINT,
ubicacion VARCHAR(15),
PRIMARY KEY (clavelibro,numeroorden),
FOREIGN KEY (clavelibro)
REFERENCES libro(clavelibro)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE socio (
clavesocio INT NOT NULL,
nombre VARCHAR(60),
direccion VARCHAR(60),
telefono VARCHAR(15),
categoria CHAR,
PRIMARY KEY (clavesocio)
) ENGINE=InnoDB;

CREATE TABLE prestamo (
clavesocio INT,
clavelibro INT,
numeroorden SMALLINT,
fecha_prestamo DATE NOT NULL,
fecha_devolucion DATE DEFAULT NULL,
notas BLOB,
FOREIGN KEY (clavesocio)
REFERENCES socio(clavesocio)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (clavelibro)
REFERENCES ejemplar(clavelibro)
ON DELETE SET NULL
ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE trata_sobre (
clavelibro INT NOT NULL,
clavetema SMALLINT NOT NULL,
FOREIGN KEY (clavelibro)
REFERENCES libro(clavelibro)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (clavetema)
REFERENCES tema(clavetema)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB;
 
CREATE TABLE escrito_por (
clavelibro INT NOT NULL,
claveautor INT NOT NULL,
FOREIGN KEY (clavelibro)
REFERENCES libro(clavelibro)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (claveautor)
REFERENCES autor(claveautor)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB;

QUIT
