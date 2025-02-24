USE prueba;
SHOW DATABASES;
SHOW TABLES;

INSERT INTO gente VALUES ('Fulano','1974-04-12');
INSERT INTO gente VALUES ('Mengano','1978-06-15');
INSERT INTO gente VALUES 
('Tulano','2000-12-02'),
('Pegano','1993-02-10');
SELECT * FROM gente;
 
INSERT INTO ciudad2 VALUES ('Perillo', DEFAULT);
SELECT * FROM ciudad2;

INSERT INTO ciudad5 (poblacion,nombre) VALUES

(7000000, 'Madrid'),
(9000000, 'París'),
(3500000, 'Berlín');

SELECT * FROM ciudad5;

INSERT INTO ciudad5
SET nombre='Roma', poblacion=8000000;

INSERT INTO mitabla5 (id, nombre) VALUES
(1, 'Carlos'),
(2, 'Felipe'),
(3, 'Antonio'),
(4, 'Carlos'),
(5, 'Juan')
ON DUPLICATE KEY UPDATE nombre=VALUES(nombre);

INSERT INTO ciudad3 (nombre, poblacion) VALUES
('Madrid', 7000000);

INSERT INTO ciudad3 (nombre, poblacion) VALUES
('París', 9000000),
('Madrid', 7200000)
ON DUPLICATE KEY UPDATE poblacion=VALUES(poblacion);

SELECT * FROM ciudad3;

INSERT INTO ciudad3 (nombre, poblacion) VALUES
('París', 9100000)
ON DUPLICATE KEY UPDATE poblacion=poblacion;

SELECT * FROM ciudad3;

INSERT INTO ciudad3 (nombre, poblacion) VALUES
('París', 9100000)
ON DUPLICATE KEY UPDATE poblacion=0;

SELECT * FROM ciudad3;

REPLACE INTO ciudad3 (nombre, poblacion) VALUES
('Madrid', 7200000),
('París', 9200000),
('Berlín', 6000000);

SELECT * FROM ciudad3;

REPLACE INTO ciudad3 VALUES ('Roma', 9500000);

REPLACE INTO ciudad3 SET nombre='Londres', poblacion=10000000;

SELECT * FROM ciudad3;

UPDATE ciudad3 SET poblacion=poblacion*1.10;

SELECT * FROM ciudad3;

UPDATE ciudad5 SET clave=clave+10, poblacion=poblacion*0.97;

SELECT * FROM ciudad5;

UPDATE ciudad5 SET poblacion=poblacion*1.03
WHERE nombre='Roma';

UPDATE ciudad5 SET clave=clave-10 LIMIT 2;

SELECT * FROM ciudad5;

UPDATE gente SET fecha="1985-04-12" ORDER BY fecha LIMIT 1;

SELECT * FROM gente;

UPDATE gente SET fecha="2001-12-02" ORDER BY fecha DESC LIMIT 1;

SELECT * FROM gente;

DELETE FROM ciudad3;

DELETE FROM ciudad5 WHERE clave=2;

SELECT * FROM ciudad5;

DELETE FROM ciudad5 ORDER BY poblacion DESC LIMIT 2;

SELECT * FROM ciudad5;

TRUNCATE ciudad5;