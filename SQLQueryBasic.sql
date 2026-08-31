---create database----
CREATE DATABASE Wipro

----connect to database----
use Wipro

------create table-----
create table employee
(Id int , Name varchar(255),age int,gender varchar(255),salary int ,department varchar(255), 
city varchar(255))

select * from employee

---Insert---
Insert into employee values( 1,'Amit',34,'male',56000,'IT','chennai')

insert into employee values(2,'Anjali',35,'Female',60000,'HR','Bangalore'),
(3,'Abhay',31,'Male',45000,'Marketing','Delhi'),
(4,'Poonam',40,'Female',76000,'Accounts','Mumbai'),
(5,'Rohan',45,'Male',79000,'IT','Bangalore'),
(6,'Ananad',24,'Male',34000,'HR','Pune'),
(7,'Rani',25,'Female',40000,'Marketing','Chennai'),
(8,'Anshu',32,'Female',67000,'IT','Karnal'),
(9,'Shivani',27,'Female',56000,'HR','Agra'),
(10,'Badal',49,'Male',89000,'Marketing','Dehradun')

-----insert partial values---
insert into employee ( Id,Name,age,gender) Values
(11,'Arun',26,'Male'),
(12,'Nandani', 28,'Female')

------Select----
select name,Id , gender from employee
select * from employee
select name from employee

----where clause----
select * from employee where gender = 'Female'
select * from employee where department = 'IT'
select name , age , Id from employee where city = 'chennai'
select * from employee where age = 24
select * from employee where department is null

----top---
select top (5) * from employee
select top (8) * from employee

----distinct value----
insert into employee values (13, 'Ankit', 29, 'Male', 87000, 'HR', 'Pune')
select * from employee
select distinct * from employee

---update--
update employee set age = 36 where name = 'amit'
update employee set salary = 60000,department = 'HR',city = 'Bangalore' where name = 'Arun'
update employee set salary = 65000,department = 'IT',city = 'Pune' where name = 'Nandani'

---cloning of table---
select * into emp from employee
select * from emp
select * into empm from employee where gender = 'Male'
select * from empm

---delete---
delete from emp where Id = 1
select * from emp
delete from emp where gender = 'male'
select * from emp

---delete duplicate values----  (n-1 rule)
delete top (3) from empm where name = 'Ankit' 
select * from empm
delete top(3) from employee where name = 'Ankit'
select * from employee


---Truncate---
truncate table emp
select * from emp

----Drop---
drop table emp
select * from emp
drop table empm
select * from empm

----Alter----
alter table employee add country varchar(255)
update employee set country = 'India'

alter table employee add email varchar(255) , pincode int
select * from employee

alter table employee drop column email,pincode 

----Alias-----(display name)
select Id as roll_no , name as firstname , age , department as domain from employee
select * from employee

-----Rename---
sp_rename 'employee.department','Domain'
select * from employee
sp_rename 'employee.Domain','department'

select*from emp