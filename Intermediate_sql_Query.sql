-- Problem 1: Create a list of employees who have been with the company for more
-- than 10 years but have a performance score below 50.

select * from internship.employee_performance_evaluation;

select EmployeeID , Name , YearsAtCompany from internship.employee_performance_evaluation
where YearsAtCompany>10 and YearsAtCompany<50;

-- Problem 2: Determine the average number of years at the company for each job title.

select JobTitle , round(avg(YearsAtCompany),0) as Average_No_Of_Years  from internship.employee_performance_evaluation
group by JobTitle;


-- Problem 3: Find the top 3 highest-paid employees in the HR department.

select * from internship.employee_performance_evaluation 
where Department = "HR"
order by MonthlySalary desc 
limit 3;

-- Problem 4: Calculate the total number of years all employees have worked at the
-- company combined.
select sum(YearsAtCompany) as total_NO_of_Years 
from internship.employee_performance_evaluation;



-- Problem 5: Generate a list of employees who were hired before the year 2000.
select * from internship.employee_performance_evaluation
where year(HireDate)<2000;



-- Problem 6: Find the department with the highest average performance score.

select Department , avg(performanceScore) as Average_performance  from internship.employee_performance_evaluation
group by Department;

-- Problem 7: Analyse the distribution of monthly salaries across different
-- departments and identify any significant disparities.
select Department , sum(MonthlySalary) from internship.employee_performance_evaluation
group by Department;
