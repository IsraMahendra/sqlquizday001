
--SQLDay01

--create database
create database db_kampus

--create table
create table mahasiswa(
id bigint primary key identity(1,1),
name varchar(50) not null,
address varchar(50) not null,
email varchar(255)null
)

--create view
create view vw_mahasiswa
as select * from mahasiswa

--ALTER
--add column
alter table mahasiswa add nomor_hp varchar(100) not null

--drop column
alter table mahasiswa drop column nomor_hp

--alter column
alter table mahasiswa alter column email varchar (100) not null


--DML (Data Manipulation Language)

--insert
insert into mahasiswa(name,address,email) values('isra','Makassar','isra@gmail.com')

--select
select id,name,address,email from mahasiswa
select * from mahasiswa
select name,address,email from mahasiswa
--update
update mahasiswa set address = 'Bandung'

--delete
delete from mahasiswa where id = 1

--create table
create table biodata(
id bigint primary key identity(1,1),
mahasiswa_id bigint,
tgl_lahir datetime,
gender varchar(10)
)

--insert
insert into Biodata(mahasiswa_id,tgl_lahir,gender) values(1,'1998-10-19','male'), (1,'1998-10-19','male')
update biodata set mahasiswa_id = 1 where id = 1;
select * from biodata
select * from mahasiswa
delete from biodata
delete from biodata where id = 3;


--JOIN (ada AND, OR, NOT)
select mhs.id as id_mahasiswa, mhs.name as nama_mahasiswa, mhs.address as alamat, mhs.email as email, bio.tgl_lahir as tgl_lahir,
bio.gender as gander
from mahasiswa as mhs
join biodata as bio on mhs.id = bio.mahasiswa_id

-Order by
SELECT *
from biodata
order by tgl_lahir desc 

--select top
select top 1 mahasiswa_id
from biodata
order by mahasiswa_id asc

--between
select*
from biodata
where id
between 2 and 3

--like

--Group by

--having