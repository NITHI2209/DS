---Triggers
---Types of triggers
use wipro
select * from employee
----1)After trigger 
create trigger trig_up on employee
after update
as begin 
print 'you have updated in employee table'
end

update employee set age = 37 where name = 'amit'

create trigger trig_d on employee
after insert,delete
as begin
print ' you have inserted or deleted data '
end

delete from employee where id = 16

----2)Instead of : restrict the opertion to happen 
create trigger trig_u on employee
instead of update
as begin 
print 'You cannot able to update'
end 

update employee set age = 38 where name = 'amit'  --It will not work 

create trigger trig_del on employee
instead of delete
as begin 
print 'you cannot delete any record'
end

delete from employee where name = 'kabir'
alter table employee disable trigger trig_del
alter table employee enable trigger trig_del

alter trigger trig_u on employee
instead of insert
as begin 
print 'You cannot able to update'
end 

drop trigger trig_d , trig_del , trig_u , trig_up


----Transactions in sql 

update employee set age = 38 where name = 'amit'
update employee set department = 'Marketing' where name = 'anjali'
update employee set city = 'Noida' where name = 'Abhay'
update employee set salary = 80000/0 where name = 'Poonam' --- if we run together 1st 3 commands will work but last one doesn't as it is not valid

select * from employee


begin try 
begin transaction
update employee set age = 46 where name = 'Rohan'
update employee set city = 'Bangalore' where name = 'Anand'
update employee set department = 'IT' where name = 'Rani'
update employee set salary = 70000/0 where name = 'Anshu'
print 'Transaction commited'
end try
begin catch
rollback transaction
print 'Transaction rollback'
end catch 
 
select * from employee

----Identity (auto increament)
create table school(
ID int identity(1001,1) , name varchar(255) , age int , subject varchar(255))

insert into school values(
'Arun' , 22, 'Maths' ),( 'Arunima',21,'Chemistry'),('kajal',19,'Geography'),( 'Anjali',20,'Science')
select * from school

-----Table valued function

create function dept(
@d varchar(255)
)
returns table 
as 
return 
select department,sum(salary) as total_sal from employee
group by department having department = @d

select * from dept('IT')
select * from dept('HR')

---Row number
select * from employee
select * , ROW_NUMBER() over (order by name) as roll_num from employee
select *,row_number() over (order by department) as dept_no from employee
select *,row_number() over (order by department desc) as dept_no from employee
select *, row_number() over(partition by department order by department) 
as dept_no from employee
select *, row_number() over(partition by id order by id) 
as id_no from employee	

insert into employee(id,name,age,gender,salary) values
(16,'John',34,'Male',76000),
(17,'william',40,'Male',80000),
(18,'Sahara',29,'Female',87000),
(19,'Richard',30,'Male',90000),
(20,'Renne',31,'Female',92000)


----CTE
with rabbit as --to delete duplicate
(select * , row_number() over (partition by id order by id ) as id_no from employee )
delete from rabbit where id_no > 1

select * from employee
