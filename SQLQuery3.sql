--Unique key
use wipro
alter table employee add constraint uni_id unique(Id)
update employee set id = 2 where name = 'Amit' ---ERROR---

alter table employee drop constraint uni_id

--Primary key
alter table employee alter column Id int not null
alter table employee add constraint pri_id primary key(Id)
SELECT * from employee

---Practical--
CREATE TABLE PROJECT (
PID INT ,
Project_name varchar(255),
Technology varchar(255),
Postal int )

Insert into PROJECT Values(1,'Kalmar','Java',5534),
(2,'OTK','SQL',3323),
(3,'Posten','Azure',4325),
(4,'Telenor','AWS',4315),
(5,'BBG','Testing',5654),
(6,'Bata','Java',3546),
(7,'Nike','SQL',6645),
(8,'Verison','Azure',2534),
(9,'Qwerty','AWS',5656),
(10,'Bolp','Testing',3466),
(11,'Postm','Java',3435),
(12,'Opper','SQL',6666),
(13,'Kites','Azure',6443)
Select * from PROJECT

---Foreign key--
Alter table Project add constraint for_key foreign key(pid) references employee(id)

alter table project drop constraint for_key
alter table employee drop constraint pri_id


-----Import CSV file--
---STEPS --- Right click on wipro database-- go to task -- import flat file 
Select * from Lion

---system function
--MAX
select max(salary) as max_salary from employee
---MIN
select min(salary) as min_salary from employee
---AVG
select avg(salary) as avg_sal from employee
---count
select count(*) as total_count from employee
---Lower case
select lower(name) as low_name from employee
---Upper case
select upper(name) as upper_name from employee
---Reverse case
select reverse(name) as rev_name from employee
select lower(reverse(name)) as rev_name from employee
select upper(reverse(name)) as rev_name from employee

---concat
select id,name,age,salary, department from employee
select concat(id,'  ',name,'  ',age,'  ',salary,'  ',department) from employee
--practical use of concat
 /* Amit id is 1, age is 36, gender is male is earning a salary of Rs.56000 montly belongs to 
IT Department */

select id, name, concat(name, ' id is ', id, ' age is ', age, ' gender is ', gender,
' is earning a salary of Rs.', salary, ' monthly belongs to ', department, ' Department.') as
information from employee

----len
select name , len(name) as length_name from employee

---Substring

select substring('This is SQL class', 1, 4) --gap should also be counted

select substring('This is SQL class', 9, 3)

select substring('This is SQL class', 13, 5)

select name, substring(name, 1, 2) as initials from employee

select name, upper(substring(name, 1, 2)) as initials from employee
--Practical work of substring
/* Generate default username and password from employee table in below format
Username(First three letters of name in capital + first letter of gender in capital +
first three letters of city in capital )
Password (first two letters of namee in lower + age + first two letters of department in capital +
first four letters of city in lower) */


select id, name, concat(upper(substring(name, 1,3)), upper(substring(gender, 1,1)),
upper(substring(city, 1,3))) as USERNAME,
concat(lower(substring(name,1,2)), age, upper(substring(department, 1,2)),
lower(substring(city, 1,4))) as PASSWORD from employee

--user defined function

create function Multiply
(
@a int,
@b int,
@c int
)
returns int
as begin
return @a * @b * @c
end

select dbo.Multiply(23,45,67) as multi

select id,age,salary, dbo.multiply(id,age,salary) as result from employee

 --Create a function to find SI

create function SI
(
@a int, 
@b int, 
@c float
)
returns float
as begin
return (@a * @b * @c)/100
end

select dbo.si(2,3,4.45) as SI_result