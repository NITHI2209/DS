create database practice
use practice
CREATE TABLE Employee
(
    Id INT,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Salary DECIMAL(10,2),
    Department VARCHAR(50),
    City VARCHAR(50)
)

-- Insert Data
INSERT INTO Employee (Id, Name, Age, Gender, Salary, Department, City)
VALUES
(101, 'Arun', 25, 'Male', 35000, 'IT', 'Chennai'),
(102, 'Priya', 28, 'Female', 48000, 'HR', 'Bangalore'),
(103, 'Rahul', 32, 'Male', 62000, 'Finance', 'Mumbai'),
(104, 'Sneha', 27, 'Female', 55000, 'Marketing', 'Pune'),
(105, 'Karthik', 35, 'Male', 72000, 'IT', 'Hyderabad'),
(106, 'Divya', 30, 'Female', 68000, 'HR', 'Chennai'),
(107, 'Vikram', 41, 'Male', 85000, 'Sales', 'Delhi'),
(108, 'Anitha', 29, 'Female', 53000, 'Finance', 'Coimbatore'),
(109, 'Ramesh', 38, 'Male', 91000, 'IT', 'Bangalore'),
(110, 'Meena', 24, 'Female', 39000, 'Support', 'Madurai'),
(111, 'Suresh', 45, 'Male', 98000, 'Management', 'Chennai'),
(112, 'Keerthi', 31, 'Female', 61000, 'Marketing', 'Mysore'),
(113, 'Ajay', 26, 'Male', 45000, 'Support', 'Pune'),
(114, 'Nisha', 34, 'Female', 76000, 'IT', 'Hyderabad'),
(115, 'Manoj', 37, 'Male', 69000, 'HR', 'Kolkata')

/* Q1 (Easy)
Display all details of employees whose salary is greater than 60,000. */
select * from employee where salary > 60000

/*Display the Name, Department, and City of employees working in the IT department.*/
select name , department , city from employee where department = 'IT' 

/*Find employees whose age is between 28 and 35.*/
select * from employee where age between 28 and 35

/* Display employees who belong to HR or Finance departments */
select * from employee where Department = 'HR' or Department = 'Finance'

/*Find employees whose city is not Chennai*/
select * from employee where city <> 'chennai'

/*Display the top 5 highest-paid employees*/
select top (5) * from employee order by salary desc

/*Display employee names that start with 'A'*/
select name from employee where name like 'A%'

/*Display employee names that end with 'a'*/
select name from employee where name like '%A'


/* Find employees whose names contain 'ra'*/
select name from employee where name like '%ra%'

/*Display employees whose names have exactly 5 characters*/
select * from employee where len(name) = 5

/*Find employees whose salary is between 50,000 and 80,000, ordered by salary in descending order.*/
select * from employee where salary between 50000 and 80000 order by salary desc

/*Display all employees ordered by:Department (A–Z) ,Salary (Highest to Lowest within each department)*/
select * from employee order by Department asc , salary desc

/*Find employees who are:Male Age greater than 30 ,Salary greater than 70,000 */
select * from employee where gender = 'male' and age > 30 and salary > 70000

/* Display employees who satisfy either:Female employees from HR, OR , Male employees from IT.*/
select * from employee where gender = 'female' and department = 'Hr' or gender = 'male' and department = 'IT'

/*Display:
Name
Salary
A new column called AnnualSalary (Salary × 12)*/

select name , salary , (salary * 12) as annual_salary from employee
-------------------------------------------------------------------

/*Find the highest salary in the company.*/
select top(1) * from employee order by salary desc
select max(salary) as max_sal from employee

/*Find the lowest salary in the company.*/
select top(1) * from employee order by salary asc
select min(salary) as min_sal from employee

/*Find the average salary of all employees.*/
select avg(salary) as avg_salary from employee

/*Find the total salary paid to all employees.*/
select sum(salary) as total_salary from employee

/*Count the total number of employees.*/
select count(*) as total_count from employee

/*Display the number of employees in each department.*/
select department , count(*) as dept_count from employee group by department

/*Display the average salary of each department.*/
select department , avg(salary) as avg_sal from employee group by department

/*Display the maximum salary in each department*/
select department , max(salary) as maxi_sal from employee group by department 

/*Display only those departments whose average salary is greater than 60,000.*/
select department , avg(salary) as avg_salary from employee group by department having avg(salary) > 60000

/*Display only those departments having at least 2 employees.*/
select department , count(*) as emp_count from employee group by department having count(*) >= 2

/*Find the department with the highest total salary.*/
select top (1) department , sum(salary) as total_salary from employee
group by department order by sum( salary) desc

/*Find the department that has the maximum number of employees.*/
select top(1) department , count(*) as emp_count from employee group by department order by count(*) desc
-------------------------------------------------------------------------------------------------------

/*Display all employee names in uppercase.*/
select * , upper(name) as upper_name from employee

/*Display all employee names in lowercase.*/
select * , lower(name) as lower_name from employee

/*Reverse every employee's name.*/
select * , reverse(name) as rev_name from employee

/*Display the length of each employee's name.*/
select *,len(name) as len_name from employee

/*Display the first 3 letters of every employee's name.*/
select name, substring(name,1,3) as int_name from employee

/*Create a username using:

First 3 letters of Name (uppercase)
First letter of Department (uppercase)
First 2 letters of City (uppercase) */
select * , concat(upper( substring(name, 1,3)) , upper(substring(department,1,1)) , upper(substring(city,1,2))) 
as username from employee

/*Create a sentence like:

Arun works in IT department and earns Rs.35000 per month.*/

select name , concat (name, ' works in ', department, ' deparment and earns Rs ', salary, 'per month') as 
employee_details from employee

/*Display employees whose names are longer than 5 characters.*/
select name , len(name) as len_name from employee where len(name) > 5

/*Display employees whose city contains the letter 'a'.*/
select * from employee where city like '%a%'

/*Find the employee whose name has the maximum number of characters.*/
select top(1) name , len(name) as len_name from employee order by len(name) desc

CREATE TABLE Project
(
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    Technology VARCHAR(50),
    EmployeeID INT
)

INSERT INTO Project VALUES
(201, 'Banking App', 'Java', 101),
(202, 'HR Portal', 'SQL', 102),
(203, 'Finance Dashboard', 'Power BI', 103),
(204, 'E-Commerce Website', 'Python', 105),
(205, 'CRM System', 'SQL', 106),
(206, 'Inventory System', 'Java', 109),
(207, 'Sales Dashboard', 'Power BI', 111),
(208, 'Hospital Management', 'Python', 114),
(209, 'Library System', 'C#', 120),     
(210, 'Payroll System', 'SQL', NULL)

select * from project

/*Display all employees along with their project names.*/
select e.id ,e.name , p.projectname from employee e left join project p on e.id = p.EmployeeID

/*Display only employees who have been assigned a project.*/
select e.id ,e.name , p.projectname from employee e inner join project p on e.id = p.EmployeeID

/*Display all projects, even if no employee is assigned.*/
select e.id ,e.name , p.projectname from employee e right join project p on e.id = p.EmployeeID

/*Display all employees and all projects, whether they match or not.*/
select e.id ,e.name , p.projectname from employee e full join project p on e.id = p.EmployeeID

/*Find the employee(s) who earn the highest salary without using TOP.*/
select * from employee where salary = ( select max(salary) from employee)

/*Find the employee(s) with the second highest salary using a subquery (don't use TOP, RANK, or window functions).*/
select * from employee where salary =
(select max(salary) as second_high from employee where salary < (select max(salary) from employee))

/*Find all employees whose salary is greater than the average salary of the company.*/
select * from employee where salary > (select avg(salary) from employee)

select * from employee where salary < (select avg(salary) from employee)

/*Find employees who work in the same department as 'Arun'.*/
select * from employee where department = (select department from employee where name = 'Arun') and name <> 'Arun'

/*Find employees who earn more than the average salary of their own department.*/
select * from employee e where salary > (select avg(salary) from employee where department = e.Department)

/*Assign a row number to every employee based on salary (highest to lowest).*/
select * , ROW_NUMBER()  over (order by salary desc) as roll_no from employee

/*Stored procedure*/
/*Create a stored procedure to display all employees.*/
create procedure dis_employee
as 
begin
select * from employee 
end

exec dis_employee

/*Create a stored procedure to display only IT employees.*/
create procedure dept_IT
as
begin 
select * from employee where department = 'IT'
end

exec dept_IT

/*Create a stored procedure that accepts a Department as input and displays employees from that department.*/
create procedure dept
(@d varchar(255))
as 
begin
select * from employee where department = @d
end

exec dept 'Finance'

