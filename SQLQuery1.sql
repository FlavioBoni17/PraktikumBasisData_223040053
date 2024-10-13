/* Nama : Flavio Boniperti Oktaviola Zyoffy
   NPM  : 223040053
   Kelas: D
*/

use kelas_d;

/* 1. Menggunakan Tabel HR.Employees, tulis pernyataan SELECT yang mengembalikan gender untuk setiap karyawan berdasarkan titel kesopanan. Berupa 'Ms.' dan 'Mrs.’ untuk ‘female’, ‘Mr.’ unruk ‘Male’ dan dalam semua kasus lain (misalnya, 'Dr.') mengembalikan 'Unknown’: */
SELECT empid, firstname, lastname, titleofcourtesy,
    CASE 
        WHEN titleofcourtesy = 'Ms.' THEN 'Female'
        WHEN titleofcourtesy = 'Mrs.' THEN 'Female'
        WHEN titleofcourtesy = 'Mr.' THEN 'Male'
        ELSE 'Unknown'
    END AS Gender
FROM HR.Employees;


/* 2. munculkan pelanggan AS, dan untuk setiap pelanggan kembalikan jumlah total pesanan dan jumlah total:
table yang digunakan: Sales.Customers, Sales.Orders, and Sales.OrderDetails */

SELECT 
    c.custid,
    COUNT(o.orderid) AS numorders,
    SUM(od.qty) AS totalqty
FROM 
    Sales.Customers c
    JOIN Sales.Orders o ON c.custid = o.custid
    JOIN Sales.OrderDetails od ON o.orderid = od.orderid
WHERE c.country = 'USA'
GROUP BY c.custid
ORDER BY c.custid;

/* 3. Jelaskan apa yang salah dalam kueri berikut, dan berikan alternatif yang benar:
	Penjelasan : Menggunakan alias agar lebih mudah dibaca seperti pada C untuk Sales.Customers dan O untuk Sales.Orders dan pada bagian ON, pastikan bahwa menggunakan alias yang sesuai
*/
SELECT C.custid, C.companyname, O.orderdate, O.orderdate
FROM Sales.Customers AS C  
INNER JOIN Sales.Orders AS O     
ON C.custid = O.custid;

/* 4. Munculkan pelanggan dan pesanan mereka, termasuk pelanggan yang tidak melakukan pemesanan:
table yang digunakan: Sales.Customers and Sales.Orders
*/

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT JOIN Sales.Orders AS O
ON C.custid = O.custid
ORDER BY C.custid;

/* 5. Tulis kueri yang mengembalikan semua pesanan yang dilakukan pada hari terakhir aktivitas yang dapat ditemukan di tabel Orders:
table yang digunakan: Sales.Orders
 */

 SELECT orderid, orderdate, custid, empid
 FROM Sales.Orders
 WHERE orderdate = (SELECT MAX(orderdate) FROM Sales.Orders)
 ORDER BY orderid;

 /* 6. Tulis kueri yang mengembalikan karyawan yang tidak melakukan pemesanan pada atau setelah 1 Mei 2016:
table yang digunakan: HR.Employees and Sales.Orders
*/

SELECT E.empid, E.firstname, E.lastname
FROM HR.Employees AS E
WHERE E.empid NOT IN (
		SELECT O.empid
		FROM Sales.Orders AS O
		WHERE O.orderdate >= '2016-05-01'
		)
ORDER BY E.empid;


 
	

