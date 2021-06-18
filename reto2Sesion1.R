#Lázaro Raúl Díaz Lievano. BEDU 
#definimos la ubicacion del archivo que descargamos e importamos.
getwd()
setwd( "C:/Users/Lazaro Diaz/Documents") # Depende del usuario donde ubicar su wd
amazon.best <- read.csv("bestsellers with categories.csv")
#consultamos la funcion traspuesta y definimos tAmazon como el dataframe traspuesto de amazon.best
?t
?as.data.frame
class(amazon.best)

tAmazon <- as.data.frame(t(amazon.best))

class(tAmzn)

#si no ponemos el as.data.frame nos lo define como una matriz o array. 
tAmzn <- t(amazon.best)

class(tAmzn)

# nombrando las columnas como el nombre del libro.
?names
?colnames
tAmazon[1,]
colnames(tAmazon) <- tAmazon[1,]
str(tAmazon) 

# libro con mayor precio
which.max(tAmazon["Price",]) #Diagnostic and Statistical Manual of Mental Disorders, 5th Edition: DSM-5 
# libro con menor precio
which.min(tAmazon["Price",])


?which.min
