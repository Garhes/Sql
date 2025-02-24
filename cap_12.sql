USE prueba; 
INSERT INTO personas2 (nombre, fecha) VALUES
  ("Fulanito", "1956-12-14"),
  ("Menganito", "1975-10-15"),
  ("Tulanita", "1985-03-17"),
  ("Fusganita", "1976-08-25");
INSERT INTO telefonos2 (id, numero) VALUES
  (1, "123456789"),
  (1, "145654854"),
  (1, "152452545"),
  (2, "254254254"),
  (4, "456545654"),
  (4, "441415414");
CREATE TABLE tabla1 (
  id INT NOT NULL,
  nombre CHAR(10),
  PRIMARY KEY (id));
  CREATE TABLE tabla2 (
  id INT NOT NULL,
  numero INT,
  PRIMARY KEY (id));
INSERT INTO tabla1 VALUES
 (5, "Juan"),
 (6, "Pedro"),
 (7, "José"),
 (8, "Fernando");
INSERT INTO tabla2 VALUES
 (3, 30),
 (4, 40),
 (5, 50),
 (6, 60); 
CREATE TABLE stock1 (
 id INT NOT NULL,
 nombre VARCHAR(30),
 cantidad INT,
 PRIMARY KEY (id));
CREATE TABLE stock2 (
 id INT NOT NULL,
 nombre VARCHAR(40),
 cantidad SMALLINT,
 PRIMARY KEY (id));
CREATE TABLE stock3 (
 id INT NOT NULL,
 nombre VARCHAR(35),
 numero MEDIUMINT,
 PRIMARY KEY (id));
INSERT INTO stock1 VALUES
 (1, "tornillo M3x12", 100),
 (2, "tornillo M3x15", 120),
 (3, "tornillo M4x25", 120),
 (4, "tornillo M5x30", 200);
INSERT INTO stock2 VALUES
 (10, "tuerca M4", 120),
 (11, "tuerca M3", 100),
 (12, "tuerca M5", 87);
INSERT INTO stock3 VALUES
 (20, "varilla 10", 23),
 (1, "tornillo M3x12", 22),
 (21, "varilla 12", 32),
 (11, "tuerca M3", 22);
