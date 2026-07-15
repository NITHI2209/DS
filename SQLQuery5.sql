---Indexes
use wipro
select * from employee where city = 'Pune' --(it will search all the 13 rows to fetch 3 rows)
create index inx_city on employee(city) 
select * from employee where city = 'Pune' --(index will point out only 3 rows with city pune so here it will only fetch 3 rows to find the output)
sp_helpindex employee

---Types of index
---1) nonclustered index
select * from employee where department = 'HR' --(it will search all the rows to fetch the output)
create nonclustered index in_dep on employee(department)
select * from employee where department = 'HR' --- (it will automatically fetch the output the index point it out)

---2)clustered index --this index is created automatically by creating primary key
alter table employee alter column name varchar(255) not null
alter table employee add constraint pri_name primary key (name)
select* from employee
sp_helpindex employee

alter table employee drop constraint pri_name
select * from employee
create clustered index in_id on employee(id)
select * from employee -- again sorted by id 

---drop index
drop index employee.in_dep

---Views 
create view v_male 
as
select * from employee where gender = 'Age'
select * from v_male

insert into v_male values
(15, 'Kabir', 28, 'male', 67000, 'IT', 'Bhopal', 'India', 'Software Engineer')

select * from v_male

select * from employee

insert into v_male values
(16, 'Samreen', 22, 'Female', 56000, 'HR', 'Pune', 'India', 'Intern')

select * from v_male

select * from employee

---Rank and dense rank()
select * , rank() over (order by salary) as sal_rank from employee ---skip of rank
select * , dense_rank() over (order by salary) as sal_dense_rank from employee --do not skip rank
select *, rank() over (order by salary desc) as rank_sal,
dense_rank() over (order by salary desc) as d_rank_sal from employee

---Floor & ceiling
---Floor (gives the least integer value)
select floor (10.9)
select floor (20.4)
select floor (0.3)
select floor (-10.3)
-----Ceiling (gives the upper integer value)
select ceiling(10.9)
select ceiling (20.4)
select ceiling (0.3)
select ceiling (-10.3)

----Stored procedure

select * from employee

create procedure Hike
as 
select *, (salary * 1.2) as New_salary from employee

exec Hike


select * from employee e inner join project p on e.id = p.pid

/* Generate salary slip using tables employee and project */
create procedure salary_slip
as
select e.id , e.name , e.department , p.project_name,
(e.salary * 0.4) as HRA, (e.salary * 0.3) as special_allowance,
(e.age * 30) as professional_tax , (p.postal * 2) as income_tax,
(e.age * 50) as Bonus , (p.postal * 1.2) as LTA,
(p.postal * 0.6) as food_allowance from employee e 
inner join project p on e.id = p.pid

exec salary_slip

sp_helptext 'salary_slip'