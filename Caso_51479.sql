/*solicito su colaboración enviando el reporte de las notas de cada cursos con la relación de los estudiantes de la Escuela de Ingenierías 
Ingeneria de sistemas y Ingeneria de logistica de los periodos académicos 2020-I, 2020-II y 2021-I.*/
SELECT 
pg.pege_id,
pr.prog_nombre,
pu.peun_ano,
pu.peun_periodo
FROM general.personageneral pg
INNER JOIN academico.estudiantepensum ep ON ep.pege_id = pg.pege_id
INNER JOIN academico.periodouniversidad pu ON pu.peun_id = ep.peun_id
INNER JOIN academico.unidadprograma up ON up.unid_id = ep.unid_id
INNER JOIN academico.programa pr ON pr.prog_id = up.prog_id
WHERE 
pu.peun_periodo IN (1,2)
AND
pu.peun_ano IN (2020,2021)
;
