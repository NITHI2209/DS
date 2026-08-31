use Jomato
select * from jomato

/*1. Create a stored procedure to display the restaurant name, type and cuisine where the
table booking is not zero.*/
create or alter procedure rest
as
select RestaurantName, RestaurantType , cuisinesType from jomato
where TableBooking <> 0

exec rest

/*Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
and rollback it.*/

begin try
begin transaction
update jomato
set RestaurantType = 'Cafeteria'
where RestaurantType = 'cafe'
select RestaurantName, RestaurantType, cuisinesType
from jomato
where RestaurantType = 'Cafeteria'
rollback transaction
print 'Transaction rollback'
end try
begin catch
if @@TRANCOUNT > 0
rollback transaction
print 'Transaction rollback due to error'
end catch

/*3. Generate a row number column and find the top 5 areas with the highest rating of
restaurants.*/
select * from (select area , rating , ROW_NUMBER() over (order by rating desc) as highest_rating 
from jomato ) result where highest_rating <= 5

/*4. Use the while loop to display the 1 to 50.*/
declare @i int  = 1
while @i <= 50
begin
print @i
set @i = @i + 1
end 

/*5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
restaurants.*/
create view top_rating
as
select top (5)
    RestaurantName,
    Area,
    Rating
from jomato
order by Rating desc

select * from top_rating

/*6. Create a trigger that give an message whenever a new record is inserted.*/
create trigger trig_i on jomato
after insert
as begin
print 'new record has been inserted into jomato table'
end


