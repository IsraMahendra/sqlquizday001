
--SQLQuizDay01

--create database 
create database db_Penerbit

--create table
create table Pengarang(
id bigint primary key identity (1,1),
kd_Pengarang VARCHAR(7) NOT NULL,
Nama VARCHAR (30) NOT NULL,
Alamat VARCHAR(80) NOT NULL,
Kota VARCHAR(15) NOT NULL,
Kelamin VARCHAR(1) NOT NULL
)

--Nomor 3
insert into Pengarang (kd_Pengarang, Nama, Alamat, Kota, Kelamin) VALUES 
('P0001', 'Ashadi', 'Jl. Beo 25', 'Yogya', 'P'),
('P0002', 'Rian', 'Jl. Solo 123', 'Yogya', 'P'),
('P0003', 'Suwadi', 'Jl. Semangka 13', 'Bandung', 'P'),
('P0004', 'Siti', 'Jl. Durian 15', 'Solo', 'W'),
('P0005', 'Amir', 'Jl. Gajah 33', 'Kudus', 'P'),
('P0006', 'Suparman', 'Jl. Harimau 25', 'Jakarta', 'P'),
('P0007', 'Jaja', 'Jl. Singa 7', 'Bandung', 'P'),
('P0008', 'Saman', 'Jl. Naga 12', 'Yogya', 'P'),
('P0009', 'Anwar', 'Jl. Tidar 6A', 'Magelang', 'P'),
('P0010', 'Fatmawati', 'Jl. Renjana 4', 'Bogor', 'W')

--Nomor 4
CREATE TABLE Gaji(
id INT PRIMARY KEY IDENTITY (1,1),
kd_Pengarang VARCHAR(7) NOT NULL,
Nama VARCHAR(30) NOT NULL,
Gaji DECIMAL (18,4) NOT NULL
)

--Nomor 5
insert into Gaji(kd_Pengarang, Nama, Gaji) VALUES 
('P0002', 'Rian', 600000),
('P0005', 'Amir', 700000),
('P0004', 'Siti', 500000),
('P0003', 'Suwadi', 1000000),
('P0010', 'Fatmwati', 600000),
('P0008', 'Saman', 750000)

--Soal 1
select * from Pengarang

--Soal 2 
select * from Pengarang where Kelamin = 'P'
select * from Pengarang where Kelamin = 'W'

--Soal 3
select Kota, count (id) AS count 
from Pengarang
group by Kota 
order by count

--Soal 4
select Kota, count (id) AS count 
from Pengarang   
group by Kota 
having count(id) > 2
order by count

--Soal 5
select kd_Pengarang from Pengarang order by kd_Pengarang desc

--Soal 6
select Gaji from Gaji order by Gaji desc

--Soal 7
select Gaji from Gaji
where Gaji > 600000

--tambahan soal 7
select g.Gaji as Gaji, p.nama as Nama, P.kota as kota
from Gaji as g
join Pengarang as p on g.kd_Pengarang = p.kd_Pengarang
where gaji > 600000 order by Gaji

--Soal 8
select sum(Gaji) 
from Gaji


--Soal 9
SELECT COUNT(*) AS count, Peng.Kota AS Kota_Pengarang, Gaj.Gaji AS Gaji_Pengarang
FROM Pengarang AS Peng
JOIN Gaji AS Gaj ON Peng.kd_Pengarang = Gaj.kd_Pengarang
GROUP BY Peng.Kota, Gaj.Gaji

--Soal 10
SELECT * FROM Pengarang 
WHERE kd_Pengarang BETWEEN 'P0003' AND 'P0006'

--Soal 11
SELECT * FROM Pengarang 
WHERE Kota = 'Yogya' OR
Kota = 'Solo' OR
Kota = 'Magelang'

--Tambahan 11
select * from Pengarang where Kota not in ('yogya', 'solo', 'magelang', 'jakarta')

--Soal 12
SELECT * FROM Pengarang
WHERE NOT Kota = 'Yogya'

--Soal 13 (A)
SELECT * FROM Pengarang
WHERE 
Nama LIKE 'a%'

--Soal 13 (B)
SELECT * FROM Pengarang
WHERE 
Nama LIKE '%i'

--Soal 13 (C)
SELECT * FROM Pengarang
WHERE 
Nama LIKE '__a%'

--Soal 13 (D)
SELECT * FROM Pengarang
WHERE 
Nama NOT LIKE '%n'

--Soal 14
SELECT *
FROM Pengarang AS Peng
JOIN Gaji AS Gaj ON Peng.kd_Pengarang = Gaj.kd_Pengarang

--Soal 15
SELECT peng.Kota
FROM Pengarang AS Peng
JOIN Gaji AS Gaj ON Peng.kd_Pengarang = Gaj.kd_Pengarang
WHERE Gaj.Gaji < 1000000

--Soal 16
ALTER TABLE Pengarang ALTER COLUMN Kelamin VARCHAR(10) NOT NULL

--Soal 17
ALTER TABLE Pengarang ADD Gelar VARCHAR(12)

--Soal 18
UPDATE Pengarang
SET Alamat = 'Jl. Cendrawasih 65', Kota = 'Pekanbaru'
WHERE Nama = 'Rian'

--Soal 19
GO
CREATE VIEW vw_Pengarang AS
SELECT Peng.kd_Pengarang, Peng.Nama, Peng.Kota, Gaj.Gaji
FROM Pengarang AS Peng
JOIN Gaji AS gaj ON Peng.kd_Pengarang = Gaj.kd_Pengarang
GO

select * from Pengarang