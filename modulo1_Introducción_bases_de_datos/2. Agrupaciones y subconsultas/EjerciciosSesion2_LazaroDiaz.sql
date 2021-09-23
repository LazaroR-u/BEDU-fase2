#LÁZARO RAÚL DÍAZ LIEVANO. EJERCICIOS SESION 2 
use classicmodels;
#1 Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos 
#los empleados cuyo nombre empiece con A.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'A%'; 

#2 Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos 
#los empleados cuyo apellido termina con on.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE '%on'; 

#3 Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos 
#los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE '%on%';
 
#4 Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos 
#los empleados cuyos nombres tienen seis letras e inician con G.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'G_____';  

#5 Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos 
#los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, lastName, firstName
FROM employees 
WHERE firstName NOT LIKE 'B%';

#6 Dentro de la tabla products, obtén el código de producto y nombre de los productos 
#cuyo código incluye la cadena _20.
SELECT productCode, productName 
FROM products
where productCode LIKE '%_20%';

#7 Dentro de la tabla orderdetails, obtén el total de cada orden.
SELECT SUM(priceEach) AS 'TOTAL DE VENTAS'
FROM orderdetails;

#8 Dentro de la tabla orders obtén el número de órdenes por año.
SELECT year(orderDate) AS year,  count(*) 
FROM orders 
group by year;

#9 Obtén el apellido y nombre de los empleados cuya oficina está ubicada en USA.
SELECT lastName, firstName 
FROM employees 
WHERE officeCode IN (SELECT officeCode from offices where country='USA');

#10 Obtén el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
SELECT (SELECT customerName FROM customers where customerNumber=payments.customerNumber) AS 'nombre del cliente', checkNumber, amount
FROM payments 
ORDER BY amount DESC
Limit 1;

#11 Obtén el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
SELECT (SELECT customerName FROM customers where customerNumber=payments.customerNumber) AS 'nombre del cliente', checkNumber, amount 
FROM payments 
WHERE amount > (SELECT avg(amount) AS promedio FROM payments)
ORDER BY amount;

#12 Obtén el nombre de aquellos clientes que no han hecho ninguna orden.
SELECT customerName FROM customers 
WHERE customerNumber not in 
(SELECT customerNumber FROM orders);

#13 Obtén el máximo, mínimo y promedio del número de productos en las órdenes de venta.
SELECT MIN(quantityOrdered) AS 'Cantidad Minima', MAX(quantityOrdered) AS 'Cantidad maxima', AVG(quantityOrdered) AS 'Cantidad promedio'
FROM orderdetails; 

#14 Dentro de la tabla orders, Obtén el número de órdenes que hay por cada estado.
SELECT status, count(*) 
FROM orders 
GROUP BY status;