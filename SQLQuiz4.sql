
create database db_HR

create table Tb_Karyawan(
Id bigint primary key identity (1,1),
nip VARCHAR(50) NOT NULL,
nama_depan VARCHAR (50) NOT NULL,
nama_belakang VARCHAR (50) NOT NULL,
jenis_kelamin VARCHAR(50) NOT NULL,
agama varchar(50) NOT NULL,
tempat_lahir VARCHAR(50) NOT NULL,
tgl_lahir DATE,
alamat VARCHAR (100) NOT NULL,
pendidikan_terakhir VARCHAR (50) NOT NULL,
tgl_masuk DATE,
)

Select * from Tb_Karyawan
Insert Into Tb_Karyawan(nip, nama_depan, nama_belakang, jenis_kelamin, agama, tempat_lahir, tgl_lahir, alamat, pendidikan_terakhir, tgl_masuk) Values
('001', 'Hamidi', 'Samsudin', 'Pria', 'Islam', 'Sukabumi', '1977-04-21', 'Jl.Sudirman No.12', 'S1 Teknik Mesin', '2015-12-07'),
('003', 'Paul', 'Cristian', 'Pria', 'Kristen', 'Amabon', '1980-05-27', 'Jl.Vetran No.4', 'S1 Pendidikan Geografi', '2014-01-12'),
('002', 'Ghandi', 'Wamida', 'Wanita', 'Islam', 'Palu', '1992-01-12', 'Jl.Rambutan No.22', 'SMA Negeri 02 Palu', '2014-12-01')

create table Tb_Divisi(
Id bigint primary key identity (1,1),
kd_divisi VARCHAR(50) NOT NULL,
nama_divisi VARCHAR (50) NOT NULL,
)
Select * from Tb_Divisi
insert into Tb_Divisi(kd_divisi, nama_divisi) Values
('GD', 'Gudang'),
('HRD', 'HRD'),
('KU', 'Keuangan'),
('UM', 'Umum')

create table Tb_Jabatan(
Id bigint primary key identity (1,1),
kd_jabatan VARCHAR(50) NOT NULL,
nama_jabatan VARCHAR (50) NOT NULL,
gaji_pokok numeric,
tunjangan_jabatan Numeric
)
insert into Tb_Jabatan(kd_jabatan, nama_jabatan, gaji_pokok, tunjangan_jabatan) Values
('MGR', 'Manager', 5500000, 1500000),
('OB', 'Office Boy', 1900000, 200000),
('ST', 'Staff', 3000000, 750000),
('WMGR', 'Wakil Manager', 4000000, 1200000)
Select * from Tb_Jabatan

CREATE TABLE Tb_Pekerjaan(
Id BIGINT PRIMARY KEY IDENTITY (1,1),
nip VARCHAR(50) NOT NULL,
Kd_Jabatan VARCHAR(50) NOT NULL,
Kd_Divisi VARCHAR(50) NOT NULL,
Tunjangan_Kinerja numeric,
Kota_Penempatan VARCHAR(50) NOT NULL
)

INSERT INTO Tb_Pekerjaan(nip, Kd_Jabatan, Kd_Divisi, Tunjangan_Kinerja, Kota_Penempatan) VALUES 
('001', 'ST', 'KU', 750000, 'Cianjur'),
('002', 'OB', 'UM', 350000, 'Sukabumi'),
('003', 'MGR', 'HRD', 1500000, 'Sukabumi')

SELECT * FROM Tb_Pekerjaan

-- S O A L  1
SELECT (k.nama_depan + k.nama_belakang) [Nama Lengkap], j.nama_jabatan, (j.gaji_pokok + j.tunjangan_jabatan) [Tunjangan Gaji]
FROM Tb_Karyawan AS k
JOIN Tb_Pekerjaan  AS p ON p.nip = k.nip
JOIN Tb_Jabatan AS j ON j.kd_jabatan = p.kd_jabatan
WHERE (j.Gaji_pokok + j.tunjangan_jabatan) < 5000000

-- S O A L  2
SELECT 
(k.nama_depan + k.nama_belakang) [Nama Lengkap], 
j.nama_jabatan, 
d.nama_divisi, 
(j.gaji_pokok + j.tunjangan_jabatan + p.tunjangan_kinerja) [Total Gaji],
( (j.gaji_pokok + j.tunjangan_jabatan + p.tunjangan_kinerja) * 5/100) [Pajak],
((j.gaji_pokok + j.tunjangan_jabatan + p.tunjangan_kinerja)) - 
((j.gaji_pokok + j.tunjangan_jabatan + p.tunjangan_kinerja) * 5/100) [Gaji Bersih]
FROM Tb_Karyawan as k
JOIN Tb_Pekerjaan  AS p ON p.nip = k.nip
JOIN Tb_Jabatan AS j ON j.kd_jabatan = p.kd_jabatan
JOIN Tb_Divisi AS d ON d.kd_divisi = p.kd_divisi
WHERE --k.jenis_kelamin in ('Pria', 'wanita')
(k.jenis_kelamin = 'pria' or k.jenis_kelamin = 'Wanita') 
AND p.Kota_Penempatan = 'Sukabumi'


-- S O A L  3
SELECT k.nip,(k.nama_depan +' '+k.nama_belakang) [Nama Lengkap], j.nama_jabatan, d.nama_divisi, ((j.gaji_pokok + j.tunjangan_jabatan + p.tunjangan_kinerja) * 25/100) * 7 [Bonus]
FROM Tb_Karyawan AS k
JOIN Tb_Pekerjaan  AS p ON p.nip = k.nip
JOIN Tb_Jabatan AS j ON j.Kd_Jabatan = p.Kd_Jabatan
JOIN Tb_Divisi AS d ON d.kd_divisi = p.Kd_Divisi

-- S O A L  4
SELECT 
(k.nama_depan +' '+k.nama_belakang) [Nama Lengkap], j.nama_jabatan, d.nama_divisi, (j.gaji_pokok + j.tunjangan_jabatan + p.tunjangan_kinerja), (j.gaji_pokok + j.tunjangan_jabatan + p.tunjangan_kinerja) * 5/100 [infaq]
FROM Tb_Karyawan AS k
JOIN Tb_Pekerjaan  AS p ON p.nip = k.nip
JOIN Tb_Jabatan AS j ON j.kd_jabatan = p.Kd_Jabatan
JOIN Tb_Divisi AS d ON d.kd_divisi = p.Kd_Divisi
WHERE p.Kd_Jabatan = 'MGR'

-- S O A L  5
SELECT (k.nama_depan +' '+k.nama_belakang) [Nama Lengkap],
j.nama_jabatan, k.pendidikan_terakhir,
Tunjangan_Pendidikan = 2000000,
(gaji_pokok + tunjangan_jabatan + 2000000) AS Total_Gaji
FROM Tb_Karyawan AS k
JOIN Tb_Pekerjaan AS p ON p.nip = k.nip
JOIN Tb_Jabatan AS j ON j.kd_jabatan = p.Kd_Jabatan
WHERE k.pendidikan_terakhir LIKE 'S1%'

-- S O A L  6
SELECT k.nip, (k.nama_depan +' '+ k.nama_belakang) [Nama Lengkap], j.nama_jabatan, d.nama_divisi,
CASE
WHEN j.kd_jabatan = 'MGR' THEN ((j.gaji_pokok + j.tunjangan_jabatan + p.Tunjangan_Kinerja) * 25/100) * 7
WHEN j.kd_jabatan = 'ST' THEN ((j.gaji_pokok + j.tunjangan_jabatan + p.Tunjangan_Kinerja) * 25/100) * 5
ELSE ((j.gaji_pokok + j.tunjangan_jabatan + p.Tunjangan_Kinerja) * 25/100) * 2
END AS [Bonus]
FROM Tb_Karyawan AS k
JOIN Tb_Pekerjaan  AS p ON p.nip = k.nip
JOIN Tb_Jabatan AS j ON j.kd_jabatan = p.Kd_Jabatan
JOIN Tb_Divisi AS d ON d.kd_divisi = p.Kd_Divisi

-- S O A L  7
ALTER TABLE Tb_Karyawan ADD CONSTRAINT unique_nip UNIQUE (nip)

-- S O A L  8
CREATE INDEX index_nip ON Tb_Karyawan (nip)

-- S O A L  9
SELECT (nama_depan +' '+ UPPER(nama_belakang)) [Nama Lengkap]
FROM Tb_Karyawan
WHERE nama_belakang LIKE 'W%'

--10
SELECT 
(k.nama_depan +' '+k.nama_belakang) [Nama Lengkap],
k.tgl_masuk, j.nama_jabatan, d.nama_divisi,
(j.gaji_pokok + j.tunjangan_jabatan + p.Tunjangan_Kinerja) [Total_Gaji],
((j.gaji_pokok + j.tunjangan_jabatan + p. Tunjangan_Kinerja) * 0.10) AS [Bonus],
DATEDIFF(YEAR, k.tgl_masuk, GETDATE()) AS [length_working]
--CASE
--WHEN DATEDIFF(YEAR, k.doe, GETDATE()) > 8 THEN ((j.salary + j.position_a + --p.performance_a) * 10/100)
--ELSE 'Not getting bonuses'
--END AS [bonus]
FROM Tb_Karyawan AS k
JOIN Tb_Pekerjaan  AS p ON p.nip = k.nip
JOIN Tb_Jabatan AS j ON j.kd_jabatan = p.Kd_Jabatan
JOIN Tb_Divisi AS d ON d.kd_divisi = p.Kd_Divisi
WHERE DATEDIFF(YEAR, k.tgl_masuk, GETDATE()) >= 8
