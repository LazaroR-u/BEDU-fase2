#RETOS SESION 3. LAZARO RAUL DIAZ LIEVANO.
#Reto 1. 
#¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT v.clave, e.nombre 
FROM venta v
JOIN empleado e
ON v.id_empleado=e.id_empleado;


# ¿Cuál es el nombre de los artículos que se han vendido?
 SELECT v.clave, a.nombre 
 FROM venta v
 JOIN articulo a
ON v.id_articulo=a.id_articulo;


#¿Cuál es el total de cada venta?
 SELECT v.clave, a.precio  
 FROM venta v
 JOIN articulo a
ON v.id_articulo=a.id_articulo;


#reto 2. CREAR VISTAS
#Obtener el puesto de un empleado.
CREATE VIEW puesto_empleados_155 AS 
(Select concat(e.nombre, ' ',e.apellido_paterno) AS "nombre del empleado", p.nombre  AS "nombre del puesto"
from empleado e
Join puesto  p
on e.id_puesto=p.id_puesto);

SELECT * FROM puesto_empleados_155; 

#Saber qué artículos ha vendido cada empleado.
CREATE VIEW ventas_empleados_155 AS 
(select venta.clave, articulo.nombre AS "nombre del articulo", concat(empleado.nombre, ' ', empleado.apellido_paterno) AS "nombre del empleado" 
from venta 
join empleado 
on venta.id_empleado=empleado.id_empleado
join articulo 
on venta.id_articulo=articulo.id_articulo
Order by venta.clave); 

SELECT * FROM ventas_empleados_155;

#Saber qué puesto ha tenido más ventas.
CREATE VIEW puesto_ventas_158 AS 
(SELECT p.nombre, count(v.clave) AS  TOTAL
FROM venta v 
Join empleado e 
On v.id_empleado=e.id_empleado
JOIN puesto p 
ON e.id_puesto=p.id_puesto
GROUP BY p.nombre);


SELECT *
FROM puesto_ventas_158
order by TOTAL DESC; 