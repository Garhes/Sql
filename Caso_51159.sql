SELECT
--pg.pege_id ID,
tdg.TIDG_ABREVIATURA Tipo_Documento,
pg.PEGE_DOCUMENTOIDENTIDAD Documento,
png.PENG_PRIMERNOMBRE Primer_Nombre,
png.PENG_SEGUNDONOMBRE Segundo_Nombre,
png.PENG_PRIMERAPELLIDO Primer_Apellido,
png.PENG_SEGUNDOAPELLIDO Segundo_Apellido,
fr.FRAN_DESCRIPCION Franja,
ep.ESTP_PERIODOACADEMICO Periodo_Academico,
--pr.prog_id Id_Programa, 
--tpd.tppa_id Tipo_Periodo_Academico,
pr.PROG_NOMBRE Programa, 
cat.CATE_DESCRIPCION Categoria, 
ste.SITE_DESCRIPCION Situación,
png.PENG_EMAILINSTITUCIONAL Correo_Institucional,
pg.PEGE_TELEFONO Telefono,
mac.MAAC_ESTADO Matricula,
CASE 
WHEN mac.MAAC_ESTADO = 'ACTIVA' THEN 'Matriculado' 
WHEN mac.MAAC_ESTADO = 'PENDIENTE' THEN 'Esta Pendiente'
WHEN mac.MAAC_ESTADO IS NULL THEN 'No Matriculado'
ELSE 'Otro Estado'
END AS Estado
FROM general.personageneral pg
INNER JOIN general.tipodocumentogeneral tdg ON tdg.tidg_id = pg.tidg_id
INNER JOIN general.personanaturalgeneral png ON png.pege_id = pg.pege_id
INNER JOIN academico.estudiantepensum ep ON ep.estp_id = pg.pege_id
INNER JOIN academico.franja fr ON fr.fran_id = ep.fran_id
INNER JOIN academico.categoria cat ON cat.cate_id = ep.cate_id
INNER JOIN academico.situacionestudiante ste ON ste.site_id = ep.site_id
LEFT JOIN academico.matriculaacademica mac ON mac.estp_id = ep.estp_id 
INNER JOIN academico.unidadprograma up ON up.unpr_id = ep.unpr_id
INNER JOIN academico.programa pr ON pr.prog_id = up.prog_id
INNER JOIN academico.tipoperiodoacademico tpd ON tpd.tppa_id = pr.tppa_id 
WHERE
pr.prog_id IN (1185,1245,5597,5277,6667) 
AND mac.MAAC_ESTADO IS NULL
ORDER BY mac.MAAC_ESTADO DESC
;
