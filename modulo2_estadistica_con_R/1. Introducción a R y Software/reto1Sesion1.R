#Lázaro Raúl Díaz Lievano. BEDU 

#importamos el csv con el url
netflix.df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-01/Data/netflix_titles.csv")
dim(netflix.df)
class(netflix.df)
#creamos un subconjunto del archivo donde solo se muestren las peliculas que salieron despues del 2015
net.2015 <- netflix.df[netflix.df$release_year>2015,]
#y guardamos este subconjunto
write.csv(net.2015, "res.netflix.csv")