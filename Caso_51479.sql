/*solicito su colaboración enviando el reporte de las notas de cada cursos con la relación de los estudiantes de la Escuela de Ingenierías 
Ingeneria de sistemas y Ingeneria de logistica de los periodos académicos 2020-I, 2020-II y 2021-I.*/
SELECT 
ep.ESTP_ID Id_Estudiante,
pg.PEGE_DOCUMENTOIDENTIDAD Documento,
png.PENG_PRIMERNOMBRE Primer_Nombre,
png.PENG_SEGUNDONOMBRE Segundo_Nombre,
png.PENG_PRIMERAPELLIDO Pimer_Apellido,
png.PENG_SEGUNDOAPELLIDO Segundo_Apellido,
fr.FRAN_DESCRIPCION Franja,
pr.PROG_NOMBRE Nombre_Programa,
mt.MATE_CODIGOMATERIA Codigo_Materia, 
mt.MATE_NOMBRE Nombre_Materia,
hn.NOTA_DESCRIPCION Examenes,
hc.HICA_VALOR Notas,
pu.PEUN_PERIODO Periodo,
pu.PEUN_ANO Año,
gr.GRUP_NOMBRE Grupo
FROM academico.his_calificacion hc
INNER JOIN academico.registroacademico ra ON ra.reac_id = hc.reac_id
INNER JOIN academico.periodouniversidad pu ON pu.peun_id = ra.peun_id
INNER JOIN academico.estudiantepensum ep ON ep.estp_id = ra.estp_id
INNER JOIN academico.unidadprograma up ON up.unpr_id = ep.unpr_id
INNER JOIN academico.programa pr ON pr.prog_id = up.prog_id
INNER JOIN academico.materia mt ON mt.mate_codigomateria = ra.mate_codigomateria  
INNER JOIN academico.grupo gr ON gr.grup_id = ra.grup_id 
INNER JOIN academico.his_nota hn ON hn.hino_id = hc.hino_id
INNER JOIN general.personageneral pg ON pg.pege_id = ep.pege_id
INNER JOIN general.personanaturalgeneral png ON png.pege_id = pg.pege_id
INNER JOIN academico.franja fr ON fr.fran_id = ep.fran_id
WHERE pu.peun_periodo IN (1,2)
AND 
pu.peun_ano IN (2020,2021)
AND
pr.prog_nombre IN ('INGENIERÍA DE SISTEMAS','INGENIERÍA EN LOGÍSTICA')
ORDER BY 
ep.ESTP_ID ASC,   
mt.MATE_NOMBRE ASC,
gr.GRUP_NOMBRE ASC,
hc.HICA_VALOR DESC
