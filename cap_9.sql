USE PRUEBA;

SELECT * FROM gente;

SELECT nombre FROM gente;

SELECT clave,poblacion FROM ciudad5;

SELECT SIN(3.1416/2), 3+5, 7*4;

SELECT nombre, fecha, DATEDIFF(CURRENT_DATE(),fecha)/365 FROM gente;

SELECT nombre, fecha, DATEDIFF(CURRENT_DATE(),fecha)/365 AS edad FROM gente;

SELECT fecha FROM gente;

SELECT DISTINCT fecha FROM gente;

SELECT * FROM gente WHERE nombre="Mengano";

SELECT * FROM gente WHERE fecha>="1986-01-01";

SELECT * FROM gente
WHERE fecha>="1986-01-01" AND fecha < "2000-01-01";

SELECT fecha FROM gente GROUP BY fecha;

SELECT nombre,fecha FROM gente GROUP BY fecha;

SELECT fecha, COUNT(*) AS cuenta FROM gente GROUP BY fecha;

SELECT MAX(nombre) FROM gente;

SHOW TABLES;

CREATE TABLE muestras (
 ciudad VARCHAR(40),
 fecha DATE,
 temperatura TINYINT
 );
 
 INSERT INTO muestras (ciudad,fecha,temperatura) VALUES
 ('Madrid', '2005-03-17', 23),
 ('París', '2005-03-17', 16),
 ('Berlín', '2005-03-17', 15),
 ('Madrid', '2005-03-18', 25),
 ('Madrid', '2005-03-19', 24),
 ('Berlín', '2005-03-19', 18);
 
 INSERT INTO muestras (ciudad,fecha,temperatura) VALUES
 ('Madrid', '2005-03-17', 23),
 ('París', '2005-03-17', 16),
 ('Berlín', '2005-03-17', 15),
 ('Madrid', '2005-03-18', 25),
 ('Madrid', '2005-03-19', 24),
 ('Berlín', '2005-03-19', 18);
 
 SELECT * FROM gente ORDER BY fecha;
 
 SELECT * FROM gente ORDER BY fecha DESC;
 
 SELECT * FROM gente LIMIT 3;
 
 SELECT * from gente limit 0,2;
 SELECT * from gente limit 2,2;
 
 SELECT * from gente limit 4,2;
 
 SELECT * from gente limit 6,2;
 