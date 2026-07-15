---Handson
use handson

---create a user defined function which return a given number multiplied by 10
create function multiply(
@a int
)
returns int 
as begin 
return @a * 10 
end 

select dbo.multiply (2) 

---use case statement to check if 100 is less than 200 , greater than 200 or equal to 200 and print the value
select case
when 100 < 200 then 'Lesser'
when 100 > 200 then 'Greater'
Else 'Equal'
end as check_num

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50),
product_name VARCHAR(50),
amount DECIMAL(10,2),
order_date DATE
);

INSERT INTO orders
(order_id, customer_name, product_name, amount, order_date)
VALUES
(101, 'Rahul', 'Laptop', 85000, '2025-01-05'),
(102, 'Priya', 'Mobile', 25000, '2025-01-08'),
(103, 'Aman', 'Headphones', 3500, '2025-01-10'),
(104, 'Sneha', 'Monitor', 18000, '2025-01-12'),
(105, 'Karan', 'Keyboard', 2500, '2025-01-15'),
(106, 'Riya', 'Tablet', 32000, '2025-01-18'),
(107, 'Vikas', 'Printer', 12000, '2025-01-20'),
(108, 'Neha', 'Mouse', 900, '2025-01-22');
select * from orders

---Case statement 
select order_id, amount, case 
when amount <5000 then 'low amount'
when amount between 5000 and 10000 then 'mid amount'
else 'high amount'
end as Status
from Orders

---user defined function to fetch amount greater than the given input
create function compare (@a int)
returns table 
as 
return (
select * from orders where amount > @a
)

select * from dbo.compare(13000)

---user defined function to find min,max,avg amount from the orders table 

create function amot()
returns table 
as 
return (
select max(amount) as maximum,
min(amount) as minimum,
avg(amount) as average
from orders)

select * from dbo.amot()

---Inside a TRY ...CATCH block, divide 100 with 0 , print the default error mgs
BEGIN TRY
SELECT 100 / 0 AS Result;
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE(), ERROR_NUMBER(),ERROR_STATE()
END CATCH;

CREATE TABLE Customer
(
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50)
)

INSERT INTO Customer
VALUES
(101,'John','Jordan','john@gmail.com','San Jose','California'),
(102,'Emma','Watson','emma@gmail.com','New York','New York'),
(103,'David','Miller','david@gmail.com','San Jose','California'),
(104,'Sophia','Brown','sophia@gmail.com','Chicago','Illinois'),
(105,'James','Jordan','james@gmail.com','San Jose','California')

select * from customer