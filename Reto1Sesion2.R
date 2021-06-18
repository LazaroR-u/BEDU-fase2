set.seed(134)
x <- round(rnorm(1000, 175, 6), 1)

#media 
mean(x)

#mediana
median(x)

#moda 
library(DescTools)
Mode(x)

#deciles de los numeros en x
quantile(x, seq(0.1,1,by=0.1))

#iqr, la rango intercuartílico
IQR(x)
plot(x)

#varianza 
var(x)
#desviacion estandar 
sd(x)

?rnorm

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
