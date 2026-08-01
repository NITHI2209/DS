create database quiz
use quiz

select * from student

/*- Count how many students cheated and how many did not*/
SELECT Cheated, COUNT(*) AS total_students
FROM Student
GROUP BY Cheated

/*) Penalty Distribution:
- Retrieve the average, minimum, and maximum penalty points given to students.*/

select 
avg(penalty_points) as avg_penalty,
min(penalty_points) as minimum_penalty,
max(penalty_points) as maximum_penalty 
from student

/* Behavior and Cheating:
- Find the most common behavior among students who were caught cheating.*/
select top 1 student_behavior , count(*) as total_count from student
where cheated = 1
group by student_behavior
order by total_count desc

/*4) Proctor Impact:
- Count how many students cheated in exams with a proctor present vs. without a proctor.*/

select case 
when Proctor_Present = 1 then 'Proctor Present'
else 'No Proctor'
end as Proctor_Status,
COUNT(*) as Cheated_Students
from Student
where Cheated = 1
group by Proctor_Present

/*5)*/
select Subject,
count(case when Cheated = 1 then 1 end) * 100.0 / COUNT(*) as Cheating_Percentage
from Student
group by Subject



