#definimos la funcion mediana
mediana <- function(vector){
  x<- sort(vector)
  if (length(vector) %% 2 != 0 ) {
    return (x[length(x)/2 + 1])
  }  
  else {
    return( (x[length(x)/2 + 1] + x[length(x)/2])/2) 
  }
}

x <- round(rnorm(100,50,12),0)
mediana(x)
median(x)
