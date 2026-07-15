---JOINS---
use wipro
insert into project values (15, 'Rames', 'SQL', 3722), (16, 'Hensy', 'Java', 6382)
select * from PROJECT

---Inner join 
select * from employee inner join project on employee.id = project.pid

select * from employee e inner join project p on e.id = p.pid

select e.id ,e.name,e.gender,e.department,p.project_name,p.technology from employee e
inner join project p on e.id = p.pid where e.department = 'HR' order by e.name

select p.technology, sum(e.salary) as total_sal from employee e inner join project p
on e.id = p.pid group by p.technology

----Full join
select * from employee e full join project p on e.id = p.pid

----Left join 
select * from employee e left join project p on e.id = p.pid
select E.name , E.age , E.city , p.project_name , p.technology from Employee e 
left join project p 
on e.Id=p.PID

----Right join
select * from employee e right join project p on e.id = p.pid

----Cross join(A*B) 13*15 = 195 rows
select * from employee ---13 rows
select * from project ----15 rows
select * from employee cross join project
select * from employee cross join project where name = 'Poonam'

----Subqueries (query inside a query)
--find the second highest salary
select max(salary) from employee where salary < (
select max(salary) from employee)

---third highest sal
select max(salary) as third_highest from employee where salary <(
select max(salary) from employee where salary <(
select max(salary) from employee))

---Nth highest salary
select salary from employee 
select top(9) salary from employee order by salary desc
select distinct top(9) salary from employee order by salary desc

select min(salary) from employee where salary in
(select distinct top(9) salary from employee order by salary desc)

select min(salary) from employee where salary in
(select distinct top(8) salary from employee order by salary desc)

select min(salary) from employee where salary in
(select distinct top(2) salary from employee order by salary desc)

---IIF()
select *, iif(salary>60000 ,'30% tax slab' ,'15% tax slab') as tax_slab from employee
select *, iif(age>34 ,'Managment domain' ,'Engineering domain') as domain
from employee order by age

---Nested iif()
select *, iif(age < 25 ,'Intern',
iif(age < 26,'Jr.Software Engineer', 
iif( age < 28,'Software engineer',
iif( age < 31,'Sr.Software engineer',
iif(age < 35 , 'Technical Lead' , 
iif( age < 40 , 'Team Lead',
iif(age < 45 , 'Manager','Vice president'))))))) as Designation
from employee

select *, iif( age < 25, 'Intern', iif( age < 26, 'Jr. Software engineer', 
iif( age < 28, 'Software engineer', iif(age < 31 , 'Sr. Software engineer',
iif( age < 35, 'Technical Lead', iif( age < 40 , 'Team Lead', 
iif(age < 45, 'Manager', 'Vice President'))))))) as Designation
into empd from employee

select * from empd

alter table employee add Designation varchar(255)
update employee set Designation =
iif(age < 25 ,'Intern',
iif(age < 26,'Jr.Software Engineer', 
iif( age < 28,'Software engineer',
iif( age < 31,'Sr.Software engineer',
iif(age < 35 , 'Technical Lead' , 
iif( age < 40 , 'Team Lead',
iif(age < 45 , 'Manager','Vice president')))))))
select * from employee
select *, iif(gender = 'Male', concat('Mr. ', name), concat('Miss. ', name)) as Title
from employee