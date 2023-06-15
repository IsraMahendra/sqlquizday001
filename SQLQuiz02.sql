
--SQLQuizDay02

--create database
create database db_Bioskop

--create table
create table Artis(
kd_Artis VARCHAR(100) NOT NULL,
Nama_Artis VARCHAR (100) NOT NULL,
JKelamin VARCHAR(100) NOT NULL,
Bayaran bigint,
Award Bigint,
Negara Varchar(100)
)

insert into Artis(kd_Artis, Nama_Artis, JKelamin, Bayaran, Award, Negara) Values
('A001', 'Robert Downy JR', 'Pria', 3000000000, 2, 'AS'),
('A002', 'Angelina Jolie', 'Wanita', 7000000000, 1, 'AS'),
('A003', 'Jackie Chan', 'Pria', 2000000000, 7, 'HK'),
('A004', 'Joe Taslim', 'Pria', 3500000000, 1, 'ID'),
('A005', 'Chelsea Islam', 'Wanita', 300000000, 0, 'ID')

select * from Film
CREATE TABLE Film (
Kd_Film VARCHAR(10) NOT NULL PRIMARY KEY,
Nm_Film VARCHAR(55) NOT NULL,
Genre VARCHAR(55) NOT NULL,
Artis VARCHAR(55) NOT NULL,
Produser VARCHAR(55) NOT NULL,
Pendapatan BIGINT,
nominal INT
)

insert into Film(Kd_Film, Nm_Film, Genre, Artis, Produser, Pendapatan, Nominal) Values
('F001', 'IRON MAN', 'G001', 'A001', 'PD01', 2000000000, 3),
('F002', 'IRON MAN 2', 'G001', 'A001', 'PD01', 1800000000, 2),
('F003', 'IRON MAN 3', 'G001', 'A001', 'PD01', 1200000000, 0),
('F004', 'AVENGER : CIVIL WAR', 'G001', 'A001', 'PD01', 2000000000, 1),
('F005', 'SPIDERMAN', 'G001', 'A001', 'PD01', 1300000000, 0),
('F006', 'THE RIDE', 'G001', 'A004', 'PD03', 800000000, 5),
('F007', 'FAST & FURIOUS', 'G001', 'A004', 'PD05', 8300000000, 2),
('F008', 'HABIBI AINUN', 'G004', 'A005', 'PD03', 6700000000, 4),
('F009', 'POLICE STORY', 'G001', 'A003', 'PD02', 7000000000, 3),
('F010', 'POLICE STORY 2', 'G001', 'A003', 'PD02', 7100000000, 1),
('F011', 'POLICE STORY 3', 'G001', 'A003', 'PD02', 6100000000, 0),
('F012', 'RUSH HOUR', 'G003', 'A003', 'PD05', 6900000000, 2),
('F013', 'KUNGFU PANDA', 'G003', 'A003', 'PD05', 9230000000, 5)

CREATE TABLE Produser(
Kd_Produser VARCHAR(50) NOT NULL PRIMARY KEY,
Nm_Produser VARCHAR(50) NOT NULL,
International VARCHAR(50) NOT NULL
)

INSERT INTO Produser (Kd_Produser, Nm_Produser, International) VALUES 
('PD01', 'MARVEL', 'YA'),
('PD02', 'HONGKONG CINEMA', 'YA'),
('PD03', 'RAPI FILM', 'TIDAK'),
('PD04', 'PARKIT', 'TIDAK'),
('PD05', 'PARAMOUNT PICTURE', 'YA')

SELECT * FROM Produser

CREATE TABLE Negara(
Kd_negara VARCHAR(100) NOT NULL PRIMARY KEY,
Nm_Negara VARCHAR(100) NOT NULL
)

INSERT INTO Negara(Kd_negara, Nm_Negara) VALUES
('AS', 'AMERIKA SERIKAT'),
('HK', 'HONGKONG'),
('ID', 'INDONESIA'),
('IN', 'INDIA')

SELECT * FROM Negara

CREATE TABLE Genre(
Kd_Genre VARCHAR(50) NOT NULL PRIMARY KEY,
Nm_Genre VARCHAR(50) NOT NULL
)

INSERT INTO Genre(Kd_Genre, Nm_Genre) VALUES 
('G001', 'ACTION'),
('G002', 'HORROR'),
('G003', 'COMEDY'),
('G004', 'DRAMA'),
('G005', 'THRILLER'),
('G006', 'FICTION')

SELECT * FROM Film
Update Film Set = 'SPIDERMAN HOME COMING' WHERE =

--SOAL 1
SELECT P.Nm_Produser, SUM(F.Pendapatan) AS Pendapatan
FROM Film AS F
JOIN Produser AS P ON F.Produser = P.Kd_Produser
WHERE P.Nm_Produser = 'MARVEL'
GROUP BY P.Nm_Produser
HAVING SUM (F.Pendapatan) <= 7500000000
--HAVING P.Nm_Produser = 'MARVEL'

--SOAL 2
SELECT Nm_Film, nominal
FROM Film
WHERE nominal = 0

alter table Film Add Nominasi Varchar(100)
Update Film
set Nominasi = nominal
select * from Film
Alter table Film drop column nominal
--rename Column
exec sp_rename 'film.Nominasi2', 'Nominasi','Column'

--SOAL 3
SELECT Nm_Film
FROM Film
WHERE Nm_Film LIKE 'P%'

--SOAL 4
SELECT Nm_Film
FROM Film
WHERE Nm_Film LIKE '%Y'

--SOAL 5
SELECT Nm_Film
FROM Film
WHERE  Nm_Film LIKE '%D%'

--SOAL 6
SELECT Nm_Film, Nama_Artis
FROM Film AS F
JOIN Artis AS A ON F.Artis = A.kd_Artis


--SOAL 7
SELECT Nm_Film, Kd_Negara
FROM Film
JOIN Artis AS A ON Artis = A.kd_Artis
JOIN Negara AS N ON Kd_negara = A.Negara
WHERE Nm_Negara = 'HONGKONG'

--SOAL 8
SELECT Nm_Film, Nm_Negara
FROM Film AS F
JOIN Artis AS A ON F.Artis = A.kd_Artis
JOIN Negara AS N ON N.Kd_Negara = A.Negara
WHERE N.Nm_Negara NOT LIKE '%O%'

--SOAL 9
SELECT A.Nama_Artis
FROM Film AS F
RIGHT JOIN Artis AS A ON F.Artis = A.kd_Artis
Where Kd_Film is null

--Soal 10
SELECT A.Nm_Artis, G.Nm_Genre
FROM Film AS F
JOIN artist AS a ON f.artist = a.cd_artist
JOIN genre AS g ON g.cd_genre  = f.genre
WHERE g.nm_genre = 'DRAMA' 

--11
SELECT DISTINCT a.nm_artist, g.nm_genre
FROM film AS f
JOIN artist AS a ON f.artist = a.cd_artist
RIGHT JOIN genre AS g ON g.cd_genre  = f.genre
WHERE g.nm_genre = 'ACTION'

--12
SELECT c.cd_country, c.nm_country, COUNT(f.nm_film)AS total_film
FROM film AS f
JOIN artist AS a ON a.cd_artist = f.artist
RIGHT JOIN country AS c ON c.cd_country = a.country
GROUP BY c.cd_country, c.nm_country

--13
SELECT f.nm_film
FROM film AS f
JOIN producer AS p ON p.cd_producer = f.producer
WHERE p.international = 'YA'

--14
SELECT p.nm_producer, COUNT(f.nm_film)AS total_film
FROM film AS f
RIGHT JOIN producer AS p ON p.cd_producer = f.producer
GROUP BY p.nm_producer