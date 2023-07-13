--1--
--Бардык клиенттердин шаарлары уникалдуу чыксын
SELECT distinct City  FROM Customers ;

--2--
--Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
SELECT * FROM Employees where BirthDate between '1950-00-00' and '1960-00-00';

--3--
--Франциялык поставщиктердин аттары жана мамлекети чыксын
SELECT SupplierName, Country FROM [Suppliers] where Country='France';

--4--
--Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
SELECT CustomerName,Address, Country FROM [Customers] where CustomerName like 'A%' and Country!='Spain';

--5--
--PostalCode бош болгон клиенттер чыксын
SELECT * FROM [Customers]  where PostalCode='';

--6--
--Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
SELECT * FROM [Customers] where City='London' limit 2;

--7--
--Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
SELECT FirstName,LastName, BirthDate FROM [Employees] where LastName like '____';

--8--
--Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
SELECT Country, count(*) FROM [Suppliers] group by Country;

--9--
--Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
SELECT Country, count(*) FROM [Suppliers] group by Country having count(*)=1 order by Country;

--10--
--Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
SELECT CategoryID, SUM(Price) as Sum from Products group by CategoryID;

--11--
--6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
SELECT * FROM [Products] where CategoryID in (6,8) order by Price limit 1;

--12--
--Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
SELECT ProductName, SupplierName from Products p join Suppliers s on p.SupplierID = s.SupplierID order by ProductName, SupplierName;

--13--
--Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
SELECT s.SupplierId,s.SupplierName, count(p.ProductID) as TotalProducts from Suppliers s join Products p on p.SupplierID = s.SupplierID group by s.SupplierName order by TotalProducts desc;

--14--
--Клиенттердин аты CustomerName деп, ага саткан ишкерлердин аты жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
SELECT CustomerName, OrderID, ShipperName from Customers  join Orders  on Customers.CustomerID = Orders.CustomerID join Shippers  on Orders.ShipperID = Shippers.ShipperID;

--15--
--Кайсы ишкер канча клиент обслуживайтеткен чыксын
select e.EmployeeID, e.LastName, e.FirstName, count(distinct c.CustomerID) as CustomerCount from Employees e join Orders o on e.EmployeeID = o.EmployeeID join Customers c on o.CustomerID = c.CustomerID group by e.EmployeeID, e.LastName, e.FirstName;



