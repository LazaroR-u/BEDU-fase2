#Lázaro Raúl Díaz Lievano. BEDU 
#1 Genera un vector de 44 entradas (aleatorias), llamado ran (Hint: utiliza la función rnorm()).
ran <- rnorm(44)
ran
#definimos un vector vacio donde almacenaremos los valores que nos de el for 
el <- vector()
for (i in 1:15) {
  el[i] <- (ran[i]**3)+12
  print(el)
}
df <- data.frame(num=ran[1:15], val=el)
df
