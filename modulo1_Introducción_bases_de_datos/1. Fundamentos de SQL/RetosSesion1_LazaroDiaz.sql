#RETOS SESION 1. LÁZARO RAÚL DÍAZ LIEVANO.
#RETO 1 
DESCRIBE venta;
DESCRIBE empleado;
DESCRIBE puesto; 
---------------
#RETO 2a 
SELECT nombre, id_puesto FROM empleado where id_puesto=4; 
#RETO 2b
SELECT nombre FROM puesto WHERE salario > 10000;
#RETO 2c 
SELECT nombre FROM articulo 
WHERE  precio > 1000 AND iva > 100; 
#RETO 2d 
SELECT id_venta, clave FROM venta 
WHERE id_articulo IN (135,963) AND id_empleado IN (835,369);

#RETO 3 
SELECT nombre, salario FROM puesto 
ORDER BY salario DESC
LIMIT 5;