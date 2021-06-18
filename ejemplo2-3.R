# Ejemplo 3. Funciones `na.omit` y `complete.cases`

# Ahora vamos a considerar el conjunto de datos `airquality`, observamos primero
# algunas de sus filas

head(airquality)
library(dplyr)

# El tipo de objeto que es y el tipo de variables que contiene

str(airquality)

# observamos la dimensión

dim(airquality)

#un resumen rapido de cada columna, como minimo, 1er quantil, mediana, media, 3er quantil, max 
summary(airquality)

# Con la función `complete.cases` podemos averiguar cuales son aquellas filas
# que no contienen ningún valor perdido (NA) y cuales son aquellas filas
# que tienen al menos un valor perdido.

bien <- complete.cases(airquality)
bien
# La variable bien, es un vector lógico con `TRUE` en las posiciones que 
# representan filas de `airquality` en donde no hay NA's y con `FALSE`
# en las posiciones que representan aquellas filas de `airquality` en donde
# se encontraron NA's

# Por tanto, podemos contar el número de filas en donde no hay NA´s de la 
# siguiente manera

sum(bien) #son 111 filas con datos completos 

# Podemos filtrar aquellas filas sin NA's de la siguiente manera

airquality[bien,]

data <- select(airquality, Ozone:Temp) 
data
#calcular la media a cada columna
apply(data, 2, mean)   #[fila,columna], [1,2]

#dado que hay NA's en data, usamos na.rm
apply(data, 2, mean, na.rm = T)

#FORMA RAPIDO DE LIMPIAR UN DF CON NA.OMIT()
# `na.omit` devuelve el objeto con casos incompletos eliminados

na.omit(data)
(m1 <- apply(na.omit(data), 2, mean)) #apply(df,1 o 2 (fila o columna), funcion a aplicar)

b <- complete.cases(data)

(m2 <- apply(data[b,], 2, mean))

identical(m1,m2)
