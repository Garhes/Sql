SELECT 

pu.PEUN_ANO Periodo_Grado,
pu.PEUN_PERIODO Periodo,
cte.CATE_DESCRIPCION Descripcion,
--pg.PEGE_DOCUMENTOIDENTIDAD
--pr.PROG_NOMBRE  
COUNT (*)
FROM academico.categoria cte
INNER JOIN academico.estudiantepensum ep ON ep.CATE_ID = cte.CATE_ID
INNER JOIN academico.periodouniversidad pu ON pu.PEUN_ID = ep.PEUN_ID
INNER JOIN general.personageneral pg ON pg.PEGE_ID = ep.PEGE_ID
INNER JOIN academico.unidadprograma up ON up.unpr_id = ep.unpr_id
INNER JOIN academico.programa pr ON pr.prog_id = up.prog_id
WHERE cte.CATE_DESCRIPCION IN ('EGRESADO', 'NUEVO') AND pu.PEUN_ANO >=2018 AND 
pr.tppa_id IN (1,2)
GROUP BY 
pu.PEUN_ANO,
pu.PEUN_PERIODO,
cte.CATE_DESCRIPCION
;