#RETO 2 SESION 4. LAZARO RAUL DIAZ LIEVANO.
CREATE DATABASE IF NOT EXISTS introdb;
use introdb;
CREATE TABLE IF NOT EXISTS users (
   id INT PRIMARY KEY, 
   genero VARCHAR(1), 
   edad INT,
   ocup INT,
   cp VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS movies (
   MovieID INT PRIMARY KEY, 
   Title VARCHAR(80), 
   Genres VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS ratings (
   UserID INT, 
   MovieID INT, 
   rating  SMALLINT, 
   time_stamp BIGINT, 
   Foreign key (MovieID) REFERENCES movies(MovieID),
   Foreign key (UserID) REFERENCES users(id)
);
insert into users (id,genero,edad,ocup,cp) values (7000,'M',21,40,87560);
INSERT INTO movies (MovieID,Title,Genres) values (4001, 'Nacho libre', 'Comedy');
INSERT INTO ratings (UserID,MovieID,rating,time_stamp) values (7000, 4001, 5, 978300760);
