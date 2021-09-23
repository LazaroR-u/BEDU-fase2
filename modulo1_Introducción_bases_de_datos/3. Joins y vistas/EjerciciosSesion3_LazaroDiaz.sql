#LÁZARO RAÚL DÍAZ LIEVANO. EJERCICIOS SESION 3. 
#Para estas consultas usa INNER JOIN

#1 Obtén la cantidad de productos de cada orden.
SELECT o.orderNumber, sum(ors.quantityOrdered) AS cantidad
FROM orderdetails ors
JOIN orders o 
ON ors.orderNumber=o.orderNumber
group by o.orderNumber;

#2 Obtén el número de orden, estado y costo total de cada orden.
SELECT ors.orderNumber, o.status, (ors.quantityOrdered*ors.priceEach) as Total
FROM orderdetails ors
JOIN orders o 
ON ors.orderNumber=o.orderNumber;

#Aqui solo vi la cantidad existente por estado del pedido
SELECT status, count(orderNumber) AS cantidad
FROM orders
group by status; 

#3 Obtén el número de orden, fecha de orden, línea de orden, nombre del producto, 
#cantidad ordenada y precio de cada pieza.
SELECT ors.orderNumber, o.orderDate, ors.quantityOrdered as cantidad, ors.priceEach
FROM orderdetails ors
JOIN orders o 
ON ors.orderNumber=o.orderNumber;

#4 Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y 
#precio de cada pieza.
SELECT ors.orderNumber, p.productName, p.MSRP, ors.priceEach 
FROM orderdetails ors
JOIN products p 
ON ors.productCode=p.productCode; 

#Para estas consultas usa LEFT JOIN

#5 Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden 
#hecha por cada cliente. ¿De qué nos sirve hacer LEFT JOIN en lugar de JOIN?

SELECT c.customerNumber, c.customerName, ors.orderNumber, ors.status
from customers c 
Left join orders ors 
on c.customerNumber=ors.customerNumber; 

#Esta consulta nos devuelve el numero y nombre del cliente haya ordenado algo o no, es decir, 
#nos devuelve los clientes que se intersectan con el conjunto de orders y los clientes que no han pedido nada.
#Difiere con el JOIN en que este solo nos devolvería la intersección con la tabla orders, es decir, todos los clientes que hayan hecho un pedido.


#6 Obtén los clientes que no tienen una orden asociada.
SELECT c.customerNumber, c.customerName
from customers c 
Left join orders ors 
on c.customerNumber=ors.customerNumber
WHERE orderNumber is NULL; 

#7 Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
SELECT e.lastName, e.firstName, c.customerName, c.customerNumber, p.checkNumber, p.amount 
FROM employees e
LEFT JOIN customers c 
ON e.employeeNumber=c.salesRepEmployeeNumber 
LEFT JOIN payments p 
ON c.customerNumber=p.customerNumber;

#cantidad de clientes y total de ventas por empleado
SELECT concat(e.lastName,' ', e.firstName) AS empleado, count(c.customerName) AS no_clientes, sum(p.amount) AS total 
FROM employees e
LEFT JOIN customers c 
ON e.employeeNumber=c.salesRepEmployeeNumber 
LEFT JOIN payments p 
ON c.customerNumber=p.customerNumber
GROUP BY empleado
ORDER BY total DESC;


#Para estas consultas usa RIGHT JOIN

#8. Repite los ejercicios 5 a 7 usando RIGHT JOIN. ¿Representan lo mismo? Explica las diferencias en un comentario.

# Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden 
#hecha por cada cliente. ¿De qué nos sirve hacer LEFT JOIN en lugar de JOIN?

SELECT c.customerNumber, c.customerName, ors.orderNumber, ors.status
from customers c 
Right join orders ors 
on c.customerNumber=ors.customerNumber; 

#Esta consulta nos devuelve el numero y nombre del cliente , es decir, 
#nos devuelve la información de los pedidos de orders y su correspondiente informacion de cliente, ahora ya no nos devuelve a los clientes que no han pedido algo.
#Difiere con el LEFT JOIN en que este nos devolvía los clientes y su informacion correspondiente a su pedido hayan hecho un pedido o no.


# Obtén los clientes que no tienen una orden asociada.
SELECT c.customerNumber, c.customerName
from customers c 
right join orders ors 
on c.customerNumber=ors.customerNumber
WHERE orderNumber is NULL; 
# Esta consulta ahora nos devuelve una tabla vacia, dado que no hay ningun orderNumber en orders que sea null, mientras que 
#con el LEFT JOIN nos daba la informacion de los clientes que no han realizado pedidos. 

# Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
SELECT e.lastName, e.firstName, c.customerName, c.customerNumber, p.checkNumber, p.amount 
FROM employees e
right JOIN customers c 
ON e.employeeNumber=c.salesRepEmployeeNumber 
LEFT JOIN payments p 
ON c.customerNumber=p.customerNumber;

#Esta consulta ahora devuelve a todos los clientes y su informacion de orden y empleado asociado, difiere en que ahora nos trae a todos los clientes
#hayan hecho un pedido o no.


#9. Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.
CREATE VIEW ejercicio5_983 AS 
SELECT c.customerNumber, c.customerName, ors.orderNumber, ors.status
from customers c 
Left join orders ors 
on c.customerNumber=ors.customerNumber;

SELECT customerName, status FROM ejercicio5_983; 

CREATE VIEW ejercicio4_154 AS 
(SELECT ors.orderNumber, ors.orderDate, p.MSRP ,o.priceEach,  p.productName
FROM orderdetails o
JOIN orders ors
On o.orderNumber=ors.orderNumber 
Join products p
On p.productCode=o.productCode);

SELECT productName, MSRP, priceEach
FROM ejercicio4_154;

CREATE VIEW ejercicio3_983 AS 
(SELECT ors.orderNumber, ors.orderDate, o.orderLineNumber, o.quantityOrdered, o.priceEach,  p.productName
FROM orderdetails o
JOIN orders ors
On o.orderNumber=ors.orderNumber 
Join products p
On p.productCode=o.productCode);

SELECT productName, quantityOrdered
FROM ejercicio3_983;