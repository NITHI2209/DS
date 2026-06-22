----Temp table ---
Table starts with # symbol
create table #student 

----Operators and clauses---
use wipro
---AND---
select * from employee where gender = 'male' and department = 'IT'

--OR---
select * from employee where gender = 'male' or department = 'IT'

----NOT
select * from employee where not  gender = 'male'
select * from employee where not department = 'IT'

---INTERSECT
select * from employee where gender = 'male'
INTERSECT
select * from employee where department = 'IT'

---UNION
select * from employee where gender = 'male'
union
select * from employee where department = 'IT'

---UNION ALL
select * from employee where gender = 'male'
union all
select * from employee where department = 'IT'

---Except
select * from employee where gender = 'male'
except
select * from employee where department = 'IT'

----Like
select * from employee where name like 'a%'
select * from employee where name like '%i'
select * from employee where name like '_a%'
select * from employee where name like '%a_'
select * from employee where age like '2%'

select * from employee where name like '[p,r,s,b]%'

select * from employee where name like '[_p,_ _r,s,_ _ _b]%'

---IN
select * from employee where Id in (1,2,5,7,8)
select * from employee where Name in ('Anjali', 'Rani', 'Anshu', 'Badal')

---BETWEEN
select * from employee where Id Between 2 and 7

---ORDER BY 
select * from employee order by name
select * from employee order by name desc
select * from employee order by salary
select * from employee order by salary desc
select * from employee order by department DESC ,salary
select * from employee order by department DESC ,salary DESC

---SUM
select sum(salary) as total_salary from employee

---GROUP BY
select department , sum(salary) as total_salary from employee GROUP BY department
select gender , sum(salary) as total_salary from employee GROUP BY gender
select department, gender, sum(salary) as total_salary from employee
group by department, gender

---Having
select department , sum(salary) as total_salary from employee GROUP BY department
Having department in ('IT','HR')

select department , sum(salary) as total_salary from employee GROUP BY department
Having department in ('IT','HR') Order by department DESC

-----CONSTRAINTS

--NOT NULL
alter table employee alter column ID int not null
update employee set id = null where id = 1
sp_help 'employee'

alter table employee alter column ID int null

--CHECK
insert into employee values (14, 'Tanuj', 7, 'Male', 72000, 'IT', 'Dehradun', 'India')

alter table employee add constraint chk_age CHECK( age between 22 and 60)

update employee set age = 27 where name = 'Tanuj'

alter table employee add constraint chk_age CHECK( age between 22 and 60)

sp_help 'employee'

alter table employee drop constraint chk_age

 --Create constraint while creating table

create table college
(CID int not null, Name varchar(255), marks int not null, sports varchar(255),
Constraint c_s CHECK (sports in ('Cricket', 'Badminton')))

sp_help 'college'

insert into college values (1, 'John', 56, 'Cricket')

select * from college

insert into college values (2, 'Richard', 67, ' Soccer')

--DEFAULT

alter table employee add constraint df_c Default 'India' for country

insert into employee (id, name, age, gender, salary) values
(15, 'Samreen', 27, 'Female', 65000)

select * from employee
insert into employee values 
(16, 'Williams', 34, 'Male', 65000, 'IT', 'San Jose', 'USA')

select * from employee