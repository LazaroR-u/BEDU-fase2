CREATE TABLE h1n1 (
fecha DATE, 	
Country	VARCHAR(50),
Cumulative_cases	INT, 
Cumulative_deaths	INT
);

drop table h1n1;
SHOW VARIABLES LIKE 'secure_file_priv'; 

LOAD DATA INFILE 'C:/Program Files/MySQL/data.csv'
INTO TABLE h1n1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; 

#consulta de los datos utiles
SELECT distinct Country,max(Cumulative_cases) as casos, max(Cumulative_deaths) as muertes, fecha
FROM h1n1
GROUP BY Country;

#crear vista de la ultima actualizacion de casos y muertes por pais
CREATE VIEW max_paises AS 
(SELECT distinct Country,max(Cumulative_cases) as casos, max(Cumulative_deaths) as muertes, fecha
FROM h1n1
GROUP BY Country);

drop view max_paises;

#muertes y casos promedio
SELECT avg(muertes) AS 'muertes promedio', avg(casos) as 'casos promedio'
FROM max_paises;


#top 5 de paises con mas muertes 
SELECT Country, muertes
FROM max_paises 
ORDER BY muertes DESC 
LIMIT 5;

#top 5 de paises con menos muertes 
SELECT Country, muertes
FROM max_paises 
WHERE muertes != '0'
ORDER BY muertes
LIMIT 5;

