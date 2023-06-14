
--SQLDay02

--min max count

select * from mahasiswa
select min (id) from mahasiswa
select max (id) from mahasiswa
select count(id) from mahasiswa
select top 1 id from mahasiswa order by id asc
select top 1 id from mahasiswa order by id desc

--add column nilai pada table mahasiswa
alter table mahasiswa add nilai int

--updatre column nilai
update mahasiswa set nilai = 80 where id = 1
update mahasiswa set nilai = 100 where id = 2
update mahasiswa set nilai = 90 where id = 3
update mahasiswa set nilai = 20 where id = 4
update mahasiswa set nilai = 40 where id = 5

--avg sum
select avg(nilai) from mahasiswa
select sum(nilai) from mahasiswa