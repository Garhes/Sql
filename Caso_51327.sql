SELECT submaac.*, subreac.materias_matriculadas
FROM (
SELECT peun.tppa_id tipo_periodo, peun.peun_ano año, peun.peun_periodo periodo,
decode(tidg.tidg_abreviatura, 'RC', 'CC', 'PAS', 'PS', 'VA', 'PS', tidg.tidg_abreviatura) id_tipo_documento, 
pege_documentoidentidad documento_identidad, prog_codigoicfes pro_consecutivo,
(CASE WHEN fran_id IN (44) THEN 25473
WHEN fran_id IN (41, 42, 43, 64, 65, 66, 84, 85, 104, 124) THEN 11001
ELSE 00000 END) id_municipio,
to_char(peng_fechanacimiento, 'DD/MM/YYYY') AS fecha_nacimiento,
id_pais id_pais_nacimiento, cige_idlugarnacimiento id_municipio_nacimiento, '1' id_zona_residencia,
nvl2((SELECT a.estp_id FROM academico.estudiantepensum a WHERE a.estp_id = estp.estp_id AND a.cate_id = 4), 'S', 'N') es_reintegro,
prog.prog_nombre, peng.peng_primernombre, peng.peng_segundonombre, peng.peng_primerapellido, peng.peng_segundoapellido,
(SELECT cate_descripcion FROM academico.categoria cate2 WHERE cate2.cate_id = maac.cate_id) AS maac_desc_categoria,
(SELECT site_descripcion FROM academico.situacionestudiante site2 WHERE site2.site_id = maac.site_id) AS maac_desc_situacion,
cate.cate_descripcion AS estp_desc_categoria,
(SELECT site_descripcion FROM academico.situacionestudiante site3 WHERE site3.site_id = estp.site_id) AS estp_desc_situacion,
maac.maac_id, estp.estp_id, pege.pege_id, fran.fran_descripcion
FROM general.personageneral pege
INNER JOIN general.personanaturalgeneral peng ON pege.pege_id = peng.pege_id
INNER JOIN academico.estudiantepensum estp ON estp.pege_id = pege.pege_id
INNER JOIN academico.his_matriculaacademica maac ON maac.estp_id = estp.estp_id
INNER JOIN academico.periodouniversidad peun ON peun.peun_id = maac.peun_id
INNER JOIN academico.tipodocumentogeneral tidg ON tidg.tidg_id = pege.tidg_id  
INNER JOIN academico.pensum pens ON pens.pens_id = estp.pens_id
INNER JOIN academico.programa prog ON prog.prog_id = pens.prog_id 
INNER JOIN general.paisgeneral page ON page.page_id = peng.page_idnacimiento
INNER JOIN academico.categoria cate ON cate.cate_id = estp.cate_id
INNER JOIN academico.tipoperiodoacademico tppa ON tppa.tppa_id = peun.tppa_id
INNER JOIN academico.franja fran ON fran.fran_id = estp.fran_id
WHERE estp.site_id NOT IN (10) AND maac_tipo <> 'CANCELADA'
) submaac
LEFT JOIN (
SELECT maac_id, COUNT(mate_codigomateria) materias_matriculadas
FROM academico.registroacademico reac
GROUP BY maac_id
) subreac ON submaac.maac_id = subreac.maac_id
WHERE subreac.materias_matriculadas > 0 AND submaac.tipo_periodo IN (1, 2);

