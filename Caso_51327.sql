SELECT 
TO_CHAR(pu.PEUN_FECHAINICIO, 'YYYY') ||
CASE 
WHEN TO_CHAR(pu.PEUN_FECHAINICIO, 'MM') BETWEEN '01' AND '06' THEN '-I' 
ELSE '-II' 
END AS Periodo_Ingreso,
TO_CHAR(pu.PEUN_FECHAFIN, 'YYYY') ||
CASE 
WHEN TO_CHAR(pu.PEUN_FECHAFIN, 'MM') BETWEEN '01' AND '06' THEN '-I'
ELSE '-II'
END AS Periodo_Final,
--pu.PEUN_ANO AS Periodo_Grado,
--pu.PEUN_PERIODO AS Periodo,
se.SITE_DESCRIPCION AS Situacion,
--cte.CATE_DESCRIPCION AS Categoria,
ROUND(MONTHS_BETWEEN(pu.PEUN_FECHAFIN, pu.PEUN_FECHAINICIO) / 1) AS Duracion_Prevista, 
COUNT(DISTINCT ep.PEGE_ID) AS Total_Estudiantes,
COUNT(DISTINCT CASE WHEN cte.CATE_DESCRIPCION IN ('NUEVO', 'TRANSFERENCIA INTERNA', 'TRANSFERENCIA EXTERNA', 'MOVILIDAD ACADEMICA') THEN ep.PEGE_ID END) 
AS Total_Estudiantes_Ingresados
FROM academico.categoria cte
INNER JOIN academico.estudiantepensum ep ON ep.CATE_ID = cte.CATE_ID
INNER JOIN academico.periodouniversidad pu ON pu.PEUN_ID = ep.PEUN_ID
INNER JOIN general.personageneral pg ON pg.PEGE_ID = ep.PEGE_ID
INNER JOIN academico.unidadprograma up ON up.unpr_id = ep.unpr_id
INNER JOIN academico.programa pr ON pr.prog_id = up.prog_id
INNER JOIN academico.situacionestudiante se ON se.SITE_ID = ep.SITE_ID
WHERE 
se.SITE_DESCRIPCION IN ('INACTIVO', 'EXCLUIDO', 'RETIRO VOLUNTARIO DEL PROGRAMA', 'GRADUADO', 'ACTIVO')
AND pu.PEUN_ANO >= 2019 
AND pr.tppa_id IN (1,2)
GROUP BY 
pu.PEUN_FECHAINICIO,
pu.PEUN_FECHAFIN,
--pu.PEUN_ANO,
--pu.PEUN_PERIODO,
se.SITE_DESCRIPCION
--cte.CATE_DESCRIPCION
ORDER BY Periodo_Ingreso;

