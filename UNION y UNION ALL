--Ejercicio con el UNION y UNION ALL 
SELECT 
png.pege_id Id_estudiante,
png.PENG_PRIMERNOMBRE Primer_Nombre
FROM general.personageneral pg
INNER JOIN general.personanaturalgeneral png ON png.pege_id = pg.pege_id
WHERE png.pege_id >= 92233
UNION ALL
SELECT 
pg.pege_id,
ep.ESTP_ESTADO Estado
FROM academico.estudiantepensum ep
INNER JOIN general.personageneral pg ON pg.pege_id = ep.pege_id  
--UNION el union me trae todos los resultados pero este me elimina los duplicados
--UNION ALL este lo que hace es que me trae todos los resultados pero me trae todos los que son duplicados tambien 
/*
Aparte de todo esto deben de tener el mismo dato que quiere decir que si tenemos en el primer SELECT valores numericos o date la segunda consulta
del union debe de tener los mismos caracteres esto quiere decir que en als dos conusltas en los tipos de tablas deben de ser char, varchar o dates
*/
/*
la segunda consulta (estudiantepensum) me esta uniendo a la primera consulta (personageneral) el union me esta trayendo la consulta eliminando los duplicados
y el union all me trae toda la consulta pero sin eliminar los duplicados esto quiere decir que me esta trayendo con los duplicados igualmente
*/
