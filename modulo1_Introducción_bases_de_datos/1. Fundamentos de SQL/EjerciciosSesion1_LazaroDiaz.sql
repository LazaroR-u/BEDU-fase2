#EJERCICIOS SESION 1. LÁZARO RAÚL DÍAZ LIEVANO
#1 conectarse a la base de datos classicmodels
USE classicmodels; 

#2 obten el apellido de todos los empleados 
SELECT lastName FROM employees; 
 
#3 obten obten el apellido, nombre y puesto de todos los empleados 
SELECT lastName, firstName, jobTitle FROM employees;
 
#4 obten todos los datos de cada empleado.
SELECT * FROM employees; 

#5 obten el apellido, nombre y puesto de todos los empleados que tengan el  puesto de Sales Rep. 
SELECT lastName, firstName, jobTitle 
FROM employees
WHERE jobTitle='Sales Rep';

#6 obten el apellido, nombre, puesto y codigo de oficina de todos los empleados que tengan el  puesto de Sales Rep y codigo de oficina 1.
SELECT lastName, firstName, jobTitle, officeCode 
FROM employees
WHERE jobTitle='Sales Rep' 
	AND officeCode=1; 

#7  obten el apellido, nombre, puesto y codigo de oficina de todos los empleados que tengan el  puesto de Sales Rep o codigo de oficina 1.
SELECT lastName, firstName, jobTitle, officeCode 
FROM employees
WHERE jobTitle='Sales Rep' 
	OR officeCode=1; 

#8 obten el apellido, nombre, puesto y codigo de oficina de todos los empleados que tengan el codigo de oficina 1,2 o 3.
SELECT lastName, firstName, jobTitle, officeCode 
FROM employees
WHERE officeCode IN (1,2,3);

#9 obten el apellido, nombre y puesto de todos los empleados que tengan un puesto distinto de Sales Rep. 
SELECT lastName, firstName, jobTitle 
FROM employees
WHERE jobTitle!='Sales Rep';

#10 obten el apellido, nombre, puesto y codigo de oficina de todos los empleados cuyo codigo de oficina sea mayor a 5.
SELECT lastName, firstName, jobTitle, officeCode 
FROM employees
WHERE officeCode > 5;

#11 obten el apellido, nombre, puesto y codigo de oficina de todos los empleados cuyo codigo de oficina sea menor o igual a 4..
SELECT lastName, firstName, jobTitle, officeCode 
FROM employees
WHERE officeCode <= 4;
#12 obten el nombre, pais y estado de todos los clientes cuyo pais sea USA y cuyo estado sea CA.  
SELECT customerName, country, state 
FROM customers 
WHERE country='USA' 
	AND state='CA'; 

#13 obten el nombre, pais y estado de todos los clientes cuyo pais sea USA, cuyo estado sea CA y cuyo credito sea mayor a 100 000.
SELECT customerName, country, state, creditLimit 
FROM customers 
WHERE country='USA' 
	AND state='CA'
    AND creditLimit > 100000;

# 14 obten el nombre y pais de todos los clientes cuyo pais sea USA o France
SELECT customerName, country, state, creditLimit 
FROM customers 
WHERE country='USA' 
	OR country='France';

#15 obten el nombre, pais y limite de credito de todos los clientes cuyo pais sea USA o France y cuyo limite de credito sea mayor a 100 000. 
SELECT customerName, country, state, creditLimit 
FROM customers 
WHERE country IN ('USA','France') 
	AND creditLimit >100000 ;  

#16  obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas que se encuentren en USA o France.
SELECT officeCode, city, phone, country
FROM offices
WHERE country IN ('USA','France');

#17 obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas que no se encuentren en USA o France.
SELECT officeCode, city, phone, country
FROM offices
WHERE country NOT IN ('USA','France');    

#18  obtén el número de orden, número de cliente, estado y fecha de envío de todas las órdenes con el número 10165, 10287 o 10310.
SELECT orderNumber, customerNumber, status, orderDate
FROM orders
WHERE orderNumber IN (10165,10287,10310);

#19  obtén el apellido de contacto y nombre de cada cliente y ordena los resultados por apellido de forma ascendente.       
SELECT contactLastName, customerName
FROM customers
ORDER BY contactLastName ASC;

#20 obtén el apellido de contacto y nombre de cada cliente y ordena los resultados por apellido de forma descendente.
SELECT contactLastName, customerName
FROM customers
ORDER BY contactLastName DESC;

#21  obtén el apellido y nombre de cada cliente y ordena los resultados por apellido de forma descendente y luego por nombre de forma ascendente.
SELECT contactLastName,customerName
FROM customers
ORDER BY contactLastName DESC;

SELECT contactLastName, customerName
FROM customers
ORDER BY customerName ASC;

#22  obtén el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más alto (top 5).
SELECT customerNumber, customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC
LIMIT 5;

#23 obtén el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más bajo diferente de 0.
SELECT customerNumber, customerName, creditLimit
FROM customers
WHERE creditLimit != 0
ORDER BY creditLimit ASC
LIMIT 5;