-- Unir tablas con el INNER JOIN y usando el el alias con un AS 

SELECT 
us.id,
us.id, 
glpi_entities.id,
glpi_entities.name, 
glpi_profiles_users.profiles_id, 
glpi_entities.completename, 
glpi_profiles.name
FROM glpiunimonserrate.glpi_profiles_users
INNER JOIN glpiunimonserrate.glpi_users AS us  ON glpi_profiles_users.users_id = us.id
inner join glpiunimonserrate.glpi_entities on glpi_entities.id = us.entities_id
inner join glpiunimonserrate.glpi_profiles on glpi_profiles.id 
where users_id = 4379;
--------------------------------------------------------------------------------------------------------------------------------------------
-- Unir tablas con el LEFT JOIN 

SELECT  
glpi_users.name, 
glpi_useremails.email,
glpi_users.id,
glpi_tickets_users.tickets_id
FROM glpiunimonserrate.glpi_users -- En este FROM pido que me una la tabla glpi_users me la mande al lado izquierdo de la tabla useremails 
LEFT JOIN glpiunimonserrate.glpi_useremails ON glpi_users.id = glpi_useremails.id
LEFT JOIN glpiunimonserrate.glpi_tickets_users ON glpi_users.id = glpi_tickets_users.id
;
--------------------------------------------------------------------------------------------------------------------------------------------
-- Unir tablas con el RIGHT JOIN 

SELECT  
glpi_users.name, 
glpi_useremails.email,
glpi_users.id,
glpi_tickets_users.tickets_id
FROM glpiunimonserrate.glpi_users -- En este FROM pido que me una la tabla glpi_users me la mande al lado derecho de la tabla useremails 
RIGHT JOIN glpiunimonserrate.glpi_useremails ON glpi_users.id = glpi_useremails.id
RIGHT JOIN glpiunimonserrate.glpi_tickets_users ON glpi_users.id = glpi_tickets_users.id
;
--------------------------------------------------------------------------------------------------------------------------------------------
-- FULL OUTER JOIN 

SELECT  
glpi_users.name, 
glpi_useremails.email,
glpi_users.id,
glpi_tickets_users.tickets_id
FROM glpiunimonserrate.glpi_users -- En este FROM pido que me una la tabla glpi_users me le consulte una consulta completa de la tabla useremails 
CROSS JOIN  glpiunimonserrate.glpi_useremails ON glpi_users.id = glpi_useremails.id
CROSS JOIN  glpiunimonserrate.glpi_tickets_users ON glpi_users.id = glpi_tickets_users.id
;
--------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
us.id,
us.name,
glpi_entities.name,
glpi_entities.id,
glpi_profiles_users.profiles_id,  
glpi_profiles.name
FROM glpiunimonserrate.glpi_profiles_users
INNER JOIN glpiunimonserrate.glpi_users AS us  ON glpi_profiles_users.users_id = us.id
INNER JOIN glpiunimonserrate.glpi_entities ON glpi_entities.id = us.entities_id
INNER JOIN glpiunimonserrate.glpi_profiles ON glpi_profiles.id 
WHERE users_id = 4379  
ORDER BY profiles_id ASC;

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- CROSS JOIN 

SELECT 
glpi_users.id,
glpi_tickets.id
FROM glpiunimonserrate.glpi_users
CROSS JOIN glpiunimonserrate.glpi_tickets ON glpi_users.id = glpi_tickets.id;