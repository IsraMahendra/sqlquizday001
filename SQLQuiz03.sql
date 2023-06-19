
--SQLQuizDay03

--create database
create database db_Sales

--create table
create table SALESPERSON(
Id bigint primary key identity (1,1),
Name VARCHAR(100) NOT NULL,
BOD DATE,
SALARY DECIMAL(18,2),
)

Insert Into SALESPERSON(Name, BOD, SALARY) Values
('Abe', '9/11/1988', 140000),
('Bob', '9/11/1978', 44000),
('Chris', '9/11/1983', 40000),
('Dan', '9/11/1980', 52000),
('Ken', '9/11/1977', 115000),
('Joe', '9/11/1990', 38000)

Select * from SALESPERSON
Select * from ORDERS

create table ORDERS(
Id int primary key identity (1,1),
ORDER_DATE DATE,
CUST_ID INT,
SALESPERSON_ID INT,
AMOUNT DECIMAL(18,2),
)

Insert Into ORDERS(ORDER_DATE, CUST_ID, SALESPERSON_ID, AMOUNT) Values
('8/2/2020', 4, 2, 540),
('1/22/2021', 4, 5, 1800),
('7/14/2019', 9, 1, 460),
('1/29/2018', 7, 2, 2400),
('2/3/2021', 6, 4, 600),
('3/2/2020', 6, 4, 720),
('5/6/2021', 9, 4, 150)

Select * from ORDERS

--A Informasi nama sales yang memiliki order lebih dari 1.
SELECT S.Name, COUNT(O.SALESPERSON_ID) AS Orders
FROM SALESPERSON AS S
JOIN ORDERS AS O ON O.SALESPERSON_ID = S.Id
GROUP BY S.Name
HAVING COUNT(O.SALESPERSON_ID) > 1

--B Informasi nama sales yang total amount ordernya di atas 1000.
SELECT S.Name, SUM(O.AMOUNT) AS AMOUNT
FROM SALESPERSON AS S
JOIN ORDERS AS O ON O.SALESPERSON_ID = S.Id
GROUP BY S.Name
HAVING SUM(O.AMOUNT) > 1000

--C. Informasi nama sales, umur, gaji dan total amount order yang tahun ordernya >= 2020 dan data ditampilan berurut sesuai dengan umur (ascending).
SELECT Name, DATEDIFF(YEAR, S.BOD, GETDATE()) AS Year, S.SALARY, SUM(O.AMOUNT) AS AMOUNT, O.ORDER_DATE
FROM SALESPERSON AS S
JOIN ORDERS AS O ON O.SALESPERSON_ID = S.Id
GROUP BY S.Name, DATEDIFF(YEAR, S.BOD, GETDATE()), S.SALARY, O.AMOUNT, O.ORDER_DATE
HAVING YEAR(O.ORDER_DATE) >= '2020'
ORDER BY DATEDIFF(YEAR, S.BOD, GETDATE()) ASC

--D. Carilah rata-rata total amount masing-masig sales urutkan dari hasil yg paling besar
SELECT S.Name, AVG(o.AMOUNT) AS Average 
FROM SALESPERSON AS S
JOIN ORDERS AS O ON O.SALESPERSON_ID = S.Id
GROUP BY S.Name
ORDER BY AVG(O.AMOUNT) DESC

SELECT S.Name, AVG(o.AMOUNT) AS [Rata Rata] 
FROM SALESPERSON AS S
JOIN ORDERS AS O ON O.SALESPERSON_ID = S.Id
GROUP BY S.Name
ORDER BY [Rata Rata] DESC

--E. Perusahaan akan memberikan bonus bagi sales yang berhasil memiliki order lebih dari 2 dan total order lebih dari 1000 sebanyak 30% dari salary
SELECT S.Name, COUNT(O.SALESPERSON_ID) AS Person_Order, SUM(O.AMOUNT) AS AMOUNT, (S.SALARY * 30 / 100) AS Bonus
FROM SALESPERSON AS S
RIGHT JOIN ORDERS AS O ON S.Id = O.SALESPERSON_ID
GROUP BY S.Name, (S.SALARY * 30 / 100)
HAVING COUNT(O.SALESPERSON_ID) > 2 AND SUM(O.AMOUNT) > 1000;

--F. Tampilkan data sales yang belum memiliki orderan sama sekali
SELECT S.Id, S.Name, s.BOD, s.SALARY
FROM SALESPERSON AS S
LEFT JOIN ORDERS AS O ON S.Id = O.SALESPERSON_ID
WHERE O.SALESPERSON_ID IS NULL;

SELECT Id, Name, BOD, SALARY
FROM SALESPERSON
LEFT JOIN ORDERS AS O ON Id = O.SALESPERSON_ID
WHERE O.SALESPERSON_ID IS NULL;

--G. Gaji sales akan dipotong jika tidak memiliki orderan,  gaji akan di potong sebanyak 2%
Select S.Id, S.Name, S.Bod, S.Salary, (s.salary * 2 / 100) as Potong_Gaji, (S.Salary - (S.Salary * 2 / 100)) as Gaji_Sekarang
From SALESPERSON as S
Left Join ORDERS as O on S.Id = O.SALESPERSON_ID
where O.SALESPERSON_ID is null;