create database casestudy2
use casestudy2

---LOCATION TABLE ----
create table location
(Location_Id int primary key,city varchar(255))
select * from location

insert into location values
(122,'New york'),
(123,'Dallas'),
(124,'chicago'),
(167,'Boston') 

----Department table 
create table Department
(Department_Id int primary key, Name varchar(255), 
Location_Id int Foreign key(location_Id) references location(Location_Id))

Insert into Department values
(10,'Accounting',122),
(20,'sales',124),
(30,'Research',123),
(40,'operations',167)

select * from Department


---Job table
create table job
(Job_Id int primary key, Designation varchar(255))

select * from job

insert into job values
(667,'Clerk'),(668,'staff'),
(669,'Analyst'),(670,'sales person'),
(671,'Manager'),(672,'president')

----Employee table 
Create table employee
(Employee_Id int,Last_Name varchar(255),First_Name varchar(255),Middle_Name varchar(255),
Job_Id int Foreign key references job(Job_Id),Hire_Date date,salary int,comm int,
Department_ID int Foreign key references Department(Department_Id))

insert into employee values
(7369,'SMITH','JOHN','Q',667,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,'22-FEB-85',1250,500,30)

select * from employee


/*1. List all the employee details */
select * from employee

/*2. List all the department details*/
select * from department

/*3. List all job details.*/
select * from job

/*4. List all the locations.*/
select * from location

/*5. List out the First Name, Last Name, Salary, Commission for all Employees.*/
select first_name , last_name , salary , comm from employee


/* 6. List out the Employee ID, Last Name, Department ID for all employees and
alias
Employee ID as "ID of the Employee", Last Name as "Name of the
Employee", Department ID as "Dep_id".*/

select Employee_ID AS 'Id of the employee' , last_name as 'Name of the employee' , 
Department_ID as 'Dep_id' from employee

/*7. List out the annual salary of the employees with their names only.*/
select concat(first_name , ' ' ,Last_name) as name , 
(12 * salary) as annual_salary from employee

/*WHERE Condition:
1. List the details about "Smith"*/
select * from employee where last_name = 'Smith'

/* 2. List out the employees who are working in department 20.*/
select * from department where Department_Id = 20

/*3. List out the employees who are earning salary between 2000 and 3000.*/
select * from employee where salary between 2000 and 3000

/*4. List out the employees who are working in department 10 or 20.*/
select * from employee where Department_ID = 10 or Department_ID = 20

/*5. Find out the employees who are not working in department 10 or 30.*/
select * from employee where Department_ID not in (10,30)

/*6. List out the employees whose name starts with 'L'.*/
select * from employee where first_name like 'l%'

/*7. List out the employees whose name starts with 'L' and ends with 'E'.*/
select * from employee where concat(first_name, ' ',last_name) like 'l%e'

/*8. List out the employees whose name length is 4 and start with 'J'*/
select * from employee where len(first_name) = 4 and
first_name like 'j%'

/*9. List out the employees who are working in department 30 and draw the
salaries more than 2500.*/
select * from employee where Department_ID = 30 and salary > 2500

/*ORDER BY Clause*/
/*1. List out the Employee ID and Last Name in ascending order based on the
Employee ID.*/
select Employee_Id,last_name from employee 
order by Employee_Id Asc

/*2. List out the Employee ID and Name in descending order based on salary.*/
select employee_id , CONCAT(first_name, ' ',last_name) as name from employee
order by salary desc

/*3. List out the employee details according to their Last Name in ascending-order.*/
select * from employee
order by last_name asc

/*4. List out the employee details according to their Last Name in ascending
order and then Department ID in descending order.*/
select * from employee
order by last_name asc, Department_ID desc

/*GROUP BY and HAVING Clause*/

/*1. List out the department wise maximum salary, minimum salary and
average salary of the employees*/
select department_id,max(salary) as max_sal, min(salary) as minimum_sal , 
avg(salary) as average_sal
from employee
group by department_id

/*2. List out the job wise maximum salary, minimum salary and average
salary of the employees.*/
select job_id ,max(salary) as max_sal, min(salary) as minimum_sal , 
avg(salary) as average_sal from employee
group by job_id

/*3. List out the number of employees who joined each month in ascending order.*/
select month(hire_date) as joining_month,
count(*) as number_of_employee from employee
group by month(hire_date)
order by joining_month asc

/*4. List out the number of employees for each month and year in
ascending order based on the year and month.*/
select year(hire_date) as joining_year,
month(hire_date) as joining_month,
count(*) as number_of_employee from employee
group by year(hire_date),month(hire_date)
order by joining_year asc , joining_month asc

/*5. List out the Department ID having at least four employees.*/
select department_id ,count(*) as number_of_employee
from employee
group by Department_ID
having count(*) >= 4

/*6. How many employees joined in February month.*/
select MONTH(Hire_Date) as month_,
COUNT(*) AS number_of_employee
from employee
Group by MONTH(Hire_Date)
having MONTH(Hire_Date) = 2

/*7. How many employees joined in May or June month.*/
select month(hire_date) as month_,
count(*) as number_of_employee
from employee
where month(hire_date) in (5,6)
group by month(hire_date)


/*8. How many employees joined in 1985?*/
select year(hire_date) as year_,
count(*) as number_of_employee
from employee
group by year(hire_date)
having year(hire_date) = '1985'

/*9. How many employees joined each month in 1985?*/
select year(hire_date) as year_, month(hire_date) as month_,
count(*) as number_of_employee from employee
where year(hire_date) = '1985'
group by year(hire_date) ,month(hire_date)
order by month(hire_date)

/*10. How many employees were joined in April 1985?*/
select year(hire_date) as year_ ,month(hire_date) as month_,
count(*) as number_of_employee from employee
where year(hire_date) = '1985'
group by year(hire_date),month(hire_date)
having month(hire_date) = 4 

/*11. Which is the Department ID having greater than or equal to 3 employees
joining in April 1985?*/
select department_id from employee
where year(Hire_Date) = '1985' and month(hire_date) = 4
group by Department_ID
having count(*) >= 3


/*Joins*/
/*1. List out employees with their department names.*/
select e.first_name,e.last_name,d.Name from employee e
inner join department d on e.Department_ID = d.Department_Id

/*2. Display employees with their designations.*/
select e.first_name,e.last_name,j.designation from employee e 
inner join job j on e.Job_Id = j.Job_Id

/*3. Display the employees with their department names and city*/
select e.first_name,e.last_name, d.name,l.city
from employee e inner join department d on e.Department_ID = d.Department_Id
inner join location l on d.Location_Id = l.Location_Id

