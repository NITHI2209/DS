---Creating databse google
create database google

---using database google 
use google 

---Table salesman
create table salesman(
SalesmanId int,
SalesmanName varchar(255),
Commission decimal(10,2),
City varchar(255),
Age int )

----Inserting into salesman Table
Insert into salesman values(
101,'Joe',50,'California',17),
(102,'Simon',75,'Texas',25),
(103, 'Jessie',105,'Florida',35),
(104,'Danny',100,'Texas',22),
(105,'Lia',65,'New Jersey',30)

select * from salesman

---Creating table customer
create table Customer(
SalesmanId int,
CustomerId int,
CustomerName varchar(255),
PurchaseAmount int )

----Inserting into customer table 
Insert into Customer values(
101,2345,'Andrew',550),
(103,1575,'Lucky',4500),
(104,2345,'Andrew',4000),
(107,3747,'Remona',2700),
(110,4004,'Julia',4545)

select * from customer

---creating table orders
create table Orders(
OrderId int,
CustomerId int,
SalesmanId int,
OrderDate date,
Amount int)

----Inserting into table orders
Insert into Orders values(
5001,2345,101,'2021-07-04',550),
(5003,1234,105,'2022-02-15',1500)
select * from Orders

---- 1)Insert a new record into orders table
Insert into Orders values(
5002,3747,107,'2021-08-22',2700)

----- 2)Add Primary key constraint for SalesmanId column in Salesman table
Alter table salesman alter column SalesmanId int not null
Alter table salesman add constraint pri_id primary key(SalesmanID)
sp_help "Salesman"

----- 2) Add Foreign key constraint for SalesmanId column in Customer table
Alter table customer add constraint fro_key foreign key (salesmanId) references salesman(salesmanId)
----That parent salaesman table contains ID is, 101,102,103,104,105,106 but customer table contains 101,103,104,107,110 
--so,107 and 110 is not present in salesman table.so, i can't add the foreign key constraint in customer table.it's getting
--error.
update customer set salesmanId=105 where customerName ='Remona'
select * from customer
update customer set salesmanId=102 where customerName='julia'
select * from customer
select * from salesman
alter table customer add constraint Fk_customer_salesman Foreign key(salesmanID) references salesman(salesmanId)
 
----- 2)Add default constraint for City column in Salesman table
Alter table salesman add constraint df_c default 'Texas' for city

----- 2)Add not null constraint in Customer_name column for the Customer table.
Alter table customer alter column CustomerName varchar(255) not null

----- 3)Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500
Select * from customer where CustomerName like '%N' and PurchaseAmount >  500 

-----4)Using SET operators, retrieve the first result with unique SalesmanId values from two tables and the other result containing SalesmanId with duplicates from two tables.
select salesmanId from salesman
union
select salesmanId from customer

select salesmanId from salesman
union all
select salesmanId from customer

------5)Display the below columns which has the matching data.Orderdate, Salesman Name, Customer Name, Commission, and City which has therange of Purchase Amount between 500 to 1500.
SELECT
    o.OrderDate,
    s.SalesmanName,
    c.CustomerName,
    s.Commission,
    s.City
FROM Orders o
INNER JOIN Salesman s
    ON o.SalesmanId = s.SalesmanId
INNER JOIN Customer c
    ON o.CustomerId = c.CustomerId
WHERE c.PurchaseAmount BETWEEN 500 AND 1500;

------6) Right join 
select *
from salesman s
right join orders o
on s.salesmanid = o.salesmanId;