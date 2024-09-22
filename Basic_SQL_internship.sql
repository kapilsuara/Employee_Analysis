-- Problem 1: Calculate the average monthly salary for each department.

select * from internship.employee_performance_evaluation ;

select employee_performance_evaluation.Department , round(avg(employee_performance_evaluation.MonthlySalary),2) as average_salary
from internship.employee_performance_evaluation 
group by employee_performance_evaluation.Department;


-- Problem 2: Identify the employee with the highest performance score in the IT
-- department.
SELECT e.EmployeeID, e.Name, e.Department, e.performanceScore
FROM internship.employee_performance_evaluation AS e
WHERE e.Department = 'IT'
ORDER BY e.performanceScore DESC
LIMIT 1;





-- Problem 3: Count the number of employees in each department.

select e.Department , count(e.EmployeeID)
from internship.employee_performance_evaluation as e
group by e.Department;
 


-- Problem 4: Find the employee who has been with the company the longest.

select EmployeeID , Name , YearsAtCompany from internship.employee_performance_evaluation
where YearsAtCompany = (select  YearsAtCompany from internship.employee_performance_evaluation
order by YearsAtCompany Desc
limit 1 );



-- Problem 5: Determine the average performance score across all employees.
select avg(PerformanceScore) 
from internship.employee_performance_evaluation;
-- Problem 6: List all employees who have a performance score above 80.

select EmployeeID , Name , PerformanceScore 
from internship.employee_performance_evaluation
where PerformanceScore > 80 ;

-- Problem 7: Calculate the total monthly salary expenditure for the Finance
-- department.

select Department, sum(MonthlySalary) from internship.employee_performance_evaluation
where Department = "Finance" 




