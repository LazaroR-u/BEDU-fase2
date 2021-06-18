# EJEMPLO 4. Descarga y lectura de data sets.

# Objetivo
# Fijar y conocer ruta de trabajo
# Lectura de ficheros CSV, locales y en repositorio
# Manejo de objetos

# Requisitos
# R, RStudio
# Prework
# Desarrollo

# Ejecutar las líneas de comando y tratar de comprender que realiza cada parte de sus entradas

# Se pueden obtener diversos data sets de Kaggle, visita el sitio para que te familiarices
# La siguiente es una base de datos de los libros más vendidos en Amazon del 2009 - 2019

# Obtenemos la ruta del directorio de trabajo

getwd()

# Fijando el directorio de trabajo

setwd("C:/Users/Lazaro Diaz/Documents/") # Depende del usuario donde ubicar su wd

# La función read.csv será util para leer fichero .csv

read.csv("bestsellers with categories.csv") # El archivo csv debe estar en el directorio de trabajo

# se puede asignar a un objeto el fichero leido anteriormente

#read.csv lo guarda como un data.frame
amazon.books <- read.csv("bestsellers with categories.csv")
str(amazon.books) 
head(amazon.books); tail(amazon.books) 

# Calculamos la dimensión de la base de datos

dim(amazon.books)

# El tipo de objeto se puede saber utilizando class()

class(amazon.books)

# También se puede leer el fichero directamente desde una URL
data2 <- read.csv("https://github.com/beduExpert/Programacion-R-Santander-2021/blob/main/Sesion-01/Ejemplo-04/Ejemplo_04.R")
view(data2)
data.url <- read.csv("https://www.football-data.co.uk/mmz4281/2021/SP1.csv")
str(data.url)
head(data.url); tail(data.url) 