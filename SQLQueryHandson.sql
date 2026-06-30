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
