create database handson
use handson

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Gender VARCHAR(10),
    Department VARCHAR(30),
    JobTitle VARCHAR(40),
    Salary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    HireDate DATE,
    City VARCHAR(30),
    Email VARCHAR(60),
    Age INT,
    Experience INT,
    PerformanceRating INT)

INSERT INTO Employees VALUES
(101,'John','Smith','Male','IT','Software Engineer',65000,5000,'2020-05-12','New York','john.smith@gmail.com',28,4,5),
(102,'Emma','Johnson','Female','HR','HR Manager',72000,6000,'2018-03-25','Chicago','emma.j@gmail.com',34,8,4),
(103,'Michael','Brown','Male','Finance','Financial Analyst',58000,3000,'2021-07-18','Dallas','michael.b@gmail.com',27,3,3),
(104,'Sophia','Davis','Female','IT','Data Analyst',62000,4500,'2019-01-14','Seattle','sophia.d@gmail.com',30,6,5),
(105,'David','Wilson','Male','Sales','Sales Executive',54000,8000,'2022-09-20','Boston','david.w@gmail.com',25,2,4),
(106,'Olivia','Taylor','Female','Marketing','Marketing Manager',70000,6500,'2017-11-10','Miami','olivia.t@gmail.com',36,10,5),
(107,'James','Anderson','Male','IT','Database Administrator',78000,7000,'2016-08-15','New York','james.a@gmail.com',38,12,5),
(108,'Ava','Thomas','Female','Finance','Accountant',56000,3500,'2023-02-11','Chicago','ava.t@gmail.com',24,1,3),
(109,'William','Moore','Male','Sales','Sales Manager',85000,12000,'2015-06-22','Dallas','william.m@gmail.com',40,15,5),
(110,'Mia','Martin','Female','IT','Data Scientist',95000,10000,'2019-10-05','Seattle','mia.m@gmail.com',31,7,5),
(111,'Benjamin','Lee','Male','Marketing','SEO Specialist',50000,2500,'2021-04-30','Boston','ben.lee@gmail.com',26,3,4),
(112,'Charlotte','Clark','Female','HR','Recruiter',52000,2000,'2022-01-08','Miami','charlotte.c@gmail.com',29,2,4),
(113,'Daniel','Lewis','Male','Finance','Auditor',61000,4000,'2018-09-17','Chicago','daniel.l@gmail.com',33,8,4),
(114,'Amelia','Walker','Female','Sales','Business Development Executive',67000,9000,'2020-12-19','New York','amelia.w@gmail.com',28,5,5),
(115,'Ethan','Hall','Male','IT','DevOps Engineer',82000,7500,'2017-05-01','Seattle','ethan.h@gmail.com',35,9,5)

SELECT * FROM EMPLOYEES
---display all employees whose salary is greater than 70000
SELECT * FROM EMPLOYEES WHERE SALARY > 70000

---show the full name of every employee in uppercase
SELECT UPPER(CONCAT(FirstName,' ',LastName)) as FullName from employees
SELECT UPPER(FirstName+ ' ' +LastName)as FullName from employees

---avg salary of each dept
select department, avg(salary) as avg_sal from employees 
group by department

---Find the department whose avg salary is greater than 65000
SELECT DEPARTMENT , AVG(SALARY) AS AVG_SAL FROM EMPLOYEES
GROUP BY DEPARTMENT 
HAVING AVG(SALARY) > 65000

----Display employees hired after 1 jan 2020
SELECT * FROM EMPLOYEES
WHERE Hiredate > '2020-01-01'

----show employees name along with total earnings(bonus+ salary)
SELECT FIRSTNAME+ ' ' + Lastname as EmployeeName,
salary + bonus as total_earning 
From employees

-----classify employees based on salary 
SELECT FIRSTNAME, LASTNAME , SALARY,
CASE
WHEN SALARY >= 80000 THEN ' HIGH SAL'
WHEN SALARY > 60000 THEN 'MEDIUM SAL'
ELSE 'LOW'
END AS SAL_CLASSIFICATION
FROM EMPLOYEES

----Display department-wise employee count and total salary
SELECT DEPARTMENT,
COUNT(*) AS EMPLOYEE_COUNT,
SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT

----Find the top 3 highest_paid salary 
SELECT TOP 3 * FROM EMPLOYEES
ORDER BY SALARY DESC

SELECT TOP (3) FIRSTNAME , SALARY , EMPLOYEEID FROM EMPLOYEES
ORDER BY SALARY DESC

---Find the employees whose last name contains the letter 'o'
select * from employees
where lastname like '%o%'

---Find out employees hired in 2020
Select * from employees
where Hiredate like '%2020%'

select * from employees
where year(Hiredate) = '2020'

----Find the department that has the highest number of employees
SELECT TOP 1 DEPARTMENT, COUNT(*) as total_employee
from employees
group by department 
order by count(*) desc

----Display employees along with remark
SELECT FIRSTNAME , PERFORMANCERATING,
CASE 
WHEN PERFORMANCERATING = 5 THEN 'EXCELLENT'
WHEN PERFORMANCERATING = 4 THEN 'GOOD'
WHEN  PerformanceRating = 3 THEN 'AVERAGE'
ELSE 'NEEDS IMPROVEMENT'
END AS PERFORMANCE
FROM EMPLOYEES

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

/*Assume an employee joined the company on '2022-03-15'.
Write a query to find:
Total number of days worked till today. 
Total number of months worked. 
Total number of years worked */

select 
DATEDIFF(DAY,'2022-03-15' , GETDATE()) as Total_days_worked,
DATEDIFF(MONTH,'2022-03-15' , GETDATE()) as Total_months_worked,
DATEDIFF(YEAR,'2022-03-15' , GETDATE()) as Total_year_worked


----------------------------------------------
CREATE TABLE FoodOrders
(
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    RestaurantName VARCHAR(100),
    Cuisine VARCHAR(50),
    OrderDate DATE,
    OrderAmount DECIMAL(10,2),
    DeliveryTime INT,               -- in minutes
    PaymentMode VARCHAR(20),
    OrderStatus VARCHAR(20)
)

INSERT INTO FoodOrders VALUES
(1001,'Aarav','Delhi','Spice Villa','North Indian','2025-01-02',850,32,'UPI','Delivered'),
(1002,'Priya','Mumbai','Pizza Corner','Italian','2025-01-03',620,28,'Card','Delivered'),
(1003,'Rahul','Bangalore','Dragon Bowl','Chinese','2025-01-04',1450,45,'UPI','Delivered'),
(1004,'Sneha','Chennai','Burger Hub','Fast Food','2025-01-05',480,25,'Cash','Cancelled'),
(1005,'Aarav','Delhi','Pizza Corner','Italian','2025-01-06',760,30,'Card','Delivered'),
(1006,'Karan','Delhi','Spice Villa','North Indian','2025-01-07',980,38,'UPI','Delivered'),
(1007,'Priya','Mumbai','Dragon Bowl','Chinese','2025-01-08',1320,42,'UPI','Delivered'),
(1008,'Rahul','Bangalore','Burger Hub','Fast Food','2025-01-09',540,22,'Cash','Delivered'),
(1009,'Meera','Hyderabad','Biryani House','Hyderabadi','2025-01-10',1190,35,'Card','Delivered'),
(1010,'Aarav','Delhi','Dragon Bowl','Chinese','2025-01-11',1590,48,'UPI','Delivered'),
(1011,'Priya','Mumbai','Pizza Corner','Italian','2025-01-12',710,29,'UPI','Cancelled'),
(1012,'Karan','Delhi','Burger Hub','Fast Food','2025-01-13',430,24,'Cash','Delivered'),
(1013,'Rahul','Bangalore','Spice Villa','North Indian','2025-01-14',880,33,'Card','Delivered'),
(1014,'Meera','Hyderabad','Dragon Bowl','Chinese','2025-01-15',1750,50,'UPI','Delivered'),
(1015,'Sneha','Chennai','Biryani House','Hyderabadi','2025-01-16',1100,39,'Card','Delivered'),
(1016,'Aarav','Delhi','Burger Hub','Fast Food','2025-01-17',510,21,'UPI','Delivered'),
(1017,'Karan','Delhi','Pizza Corner','Italian','2025-01-18',670,27,'Card','Delivered'),
(1018,'Rahul','Bangalore','Dragon Bowl','Chinese','2025-01-19',1540,46,'UPI','Delivered'),
(1019,'Priya','Mumbai','Biryani House','Hyderabadi','2025-01-20',990,34,'Cash','Delivered'),
(1020,'Meera','Hyderabad','Spice Villa','North Indian','2025-01-21',820,31,'Card','Delivered')

select * from FoodOrders


/*Display each customer total spending and sort them*/

select customername,sum(orderamount) as total_spending from foodorders group by customername order by sum(orderamount) desc

/* Find customers who have placed more than 3 delivered orders.*/
SELECT customername,
COUNT(*) AS total_count
FROM FoodOrders 
where orderstatus = 'Delivered'
GROUP BY customername 
having count(*) > 3

/* display every order along with avg order amount */

select CustomerName,orderID,orderamount ,avg(OrderAmount) over(partition by customerName) as avg_amount from Foodorders

/*Rank customer based on total_spending*/

select customername , sum(orderamount) as total_spending, 
rank() over (order by sum(orderamount) desc) as rank_ from foodorders 
where orderstatus = 'delivered'
group by customername

/* Find all the orders whose order is greater than the avg amt */

select * from foodorders where orderamount>(select avg(orderamount) from foodorders)

--create a view that displays the avg delivery time for each restaraunt



create view avg_time
as 
select  RestaurantName , avg(DeliveryTime) as avg_time 
from foodorders 
group by RestaurantName

select * from avg_time


---CTE
with avgCalculate as(
select CustomerName,avg(orderamount) as avgOrderAmount
from foodorders 
group by CustomerName)
select * from avgCalculate where avgOrderAmount>1000

---whenever a new order is inserted , display the message :
--New order added successfully

create trigger trig_i on foodorders
after insert  
as begin 
print 'New order added successfully'
end

