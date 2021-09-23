#SESION 2 INTRODUCCION A BASES DE DATOS. LAZARO RAUL DIAZ LIEVANO
USE tienda; 

#RETO 1a  
SELECT * 
FROM articulo 
WHERE nombre LIKE "%pasta%";

#RETO 1b
SELECT * 
FROM articulo 
WHERE nombre LIKE "%Cannelloni%";

#RETO 1c 
SELECT * 
FROM articulo 
WHERE nombre LIKE "% - %";
------------------------------------------
#RETO 2a 
SELECT CONCAT("$", ROUND(avg(salario)),2)) #ROUND SIRVE PARA REDONDEAR VALORES
#CONCAT SIRVE PARA UNIR DOS DATOS
FROM puesto;

#RETO 2b 
SELECT count(*) 
FROM articulo
WHERE nombre LIKE "%pasta%";

#RETO 2c 
SELECT MIN(salario) AS "Salario mas bajo", MAX(salario) AS "Salario mas alto"
FROM puesto;

#RETO 2d
SELECT round(sum(salario),2) as 'Promedio ultimos 5 salarios'
FROM
(SELECT salario FROM puesto 
ORDER BY id_puesto DESC
LIMIT 5) as LAST_5_id; 

#2d forma alternativa
SELECT  sum(salario)
FROM puesto WHERE id_puesto > (SELECT COUNT(*)-5 FROM puesto);
---------------------------------------
#RETO 3a 
SELECT nombre, count(*) AS "Número de registros"  
FROM puesto 
GROUP BY nombre
ORDER BY count(*) DESC; 

#RETO 3b 
SELECT nombre, sum(salario) 
FROM puesto
GROUP BY nombre
ORDER BY sum(salario);

#RETO 3c
SELECT id_empleado, COUNT(clave) AS 'numero de ventas'
FROM venta 
GROUP BY id_empleado
ORDER BY COUNT(clave) DESC;

#RETO 3d
SELECT id_articulo, COUNT(*)
FROM venta 
GROUP BY id_articulo
ORDER BY COUNT(*) DESC;

#RETO 4a 

USE tienda;
SELECT nombre, (SELECT salario FROM puesto WHERE id_puesto=empleado.id_puesto) AS salarios
FROM empleado 
WHERE id_puesto IN 
(SELECT id_puesto 
FROM puesto 
WHERE salario > 10000);

#4b
SELECT id_empleado, min(total_ventas) AS menor, max(total_ventas) AS mayor
FROM 
(SELECT clave,id_empleado, count(*) AS total_ventas
	FROM venta 
	GROUP BY clave, id_empleado) AS sq 
	GROUP BY id_empleado;

#4c 	
use tienda;
SELECT nombre, (SELECT nombre from puesto where id_puesto= empleado.id_puesto) AS 'puesto del empleado'
FROM empleado;
