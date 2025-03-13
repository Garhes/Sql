/*solicito su colaboración enviando el reporte de las notas de cada cursos con la relación de los estudiantes de la Escuela de Ingenierías 
Ingeneria de sistemas y Ingeneria de logistica de los periodos académicos 2020-I, 2020-II y 2021-I.*/
SELECT 
hc.HICA_VALOR,
pr.PROG_NOMBRE,
pu.PEUN_PERIODO,
pu.PEUN_ANO,
ep.ESTP_ID,
mt.MATE_CODIGOMATERIA, 
mt.MATE_NOMBRE,
gr.GRUP_NOMBRE,
hn.NOTA_DESCRIPCION
FROM academico.his_calificacion hc
INNER JOIN academico.registroacademico ra ON ra.reac_id = hc.reac_id
INNER JOIN academico.periodouniversidad pu ON pu.peun_id = ra.peun_id
INNER JOIN academico.estudiantepensum ep ON ep.estp_id = ra.estp_id
INNER JOIN academico.unidadprograma up ON up.unpr_id = ep.unpr_id
INNER JOIN academico.programa pr ON pr.prog_id = up.prog_id
INNER JOIN academico.materia mt ON mt.mate_codigomateria = ra.mate_codigomateria  
INNER JOIN academico.grupo gr ON gr.grup_id = ra.grup_id 
INNER JOIN academico.his_nota hn ON hn.hino_id = hc.hino_id
WHERE pu.peun_periodo IN (1,2)
AND 
pu.peun_ano IN (2020,2021)
AND
pr.prog_nombre IN ('INGENIERÍA DE SISTEMAS','INGENIERÍA EN LOGÍSTICA')
ORDER BY pu.peun_ano ASC
