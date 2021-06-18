# Ejemplo 2. Matrices

# Objetivo

# Crear nuevas matrices
# Extraer datos dentro de una matriz
# Calcular sus dimensiones
# Realizar operaciones básicas entre matrices

# Requisitos

# Tener instalados R y RStudio
# Haber estudiado el Prework

# Desarrollo

# Se debe seguir el código propuesto y tratar de compreder que es lo que realiza

# Crear Matrices. 

(m <- matrix(1:9, nrow = 3, ncol = 3))
n <- matrix(c(1, 0, 0, 0, 1, 0, 0, 0, 1), 3,3)
n
# Extrayendo la primera entrada

m[1,1] #DAME EL VALOR DE LA COLUMNA 1 Y FILA 1
m[,1]  #m[COLUMNA,FILA] DAME LA PRIMERA FILA

# Extrayendo la primer columna, con todas sus filas

m[ ,1]

# ¿Qué sucede si se suma un vector y una matriz?

(sum.vecmat <- c(1, 2) + m)

# Creando otra matriz

(n <- matrix(2:7, 4, 6))

_# Podemos conocer la dimensión de la matriz así

dim(n) #devuelve un vector con las dimensiones
dim(n)[1] #numero de filas
dim(n)[2] #numero de columnas

# Extrayendo subconjuntos de la matriz

n[n > 4] 

# Ahora veremos como localizar la posición de las entradas anteriores

which(n > 4) #cuales son los valores mayores a 4 de la matriz n 
#lo cuenta iniciando por la columna 1 hacia abajo.

# Uniendo Vectores para formar una matriz

a <- 2:6
b <- 5:9

length(b)

m1 <- cbind(a,b) #cbind une dos v. haciendolas columnas para forma una matriz
m1
m2 <- rbind(a,b) #rbind une dos v. haciendolas filas
m2

cbind(rnorm(3),rnorm(3))

# Algunas operaciones básicas de matrices
#matrices aleatorias
# Producto matricial: 
A %*% B
# Producto elemento a elemento: 
A*B
# Traspuesta: 
t(A)
# Determinante: 
det(A)
# Extraer la diagonal: 
diag(A)
# Resolver un sistema de ecuaciones lineales (( Ax=b )): 
solve(A,b)
# Inversa: 
solve(A)
# Autovalores y autovectores: 
eigen(A)