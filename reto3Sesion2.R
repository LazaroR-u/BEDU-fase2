
#definimos donde se guardaran los archivos
setwd("C:/Users/Lazaro Diaz/Documents/reto3")
#definimos los url
u1011 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
u1314 <- "https://www.football-data.co.uk/mmz4281/2021/D1.csv"
#descargamos los archivos con estos nombres
download.file(url = u1011, destfile = "SP1-17-18.csv", mode = "wb")
download.file(url = u1112, destfile = "SP1-18-19.csv", mode = "wb")
download.file(url = u1213, destfile = "SP1-19-20.csv", mode = "wb")
download.file(url = u1314, destfile = "SP1-20-21.csv", mode = "wb")
dir()
#leemos cada csv en dir()
lista <- lapply(dir(), read.csv)



lista <- lapply(lista, select, c("Date","HomeTeam","AwayTeam","FTHG","FTAG","FTR"))
head(lista[[1]]); head(lista[[2]]); head(lista[[3]]); head(lista[[4]])


data <- do.call(rbind, lista)
head(data)
dim(data)
