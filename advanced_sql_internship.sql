
select *from internship.employee_performance_evaluation;
-- Problem 1: Identify the top 5 employees with the highest performance scores
-- across all departments and list their department, job title, and years at the
-- company.

select EmployeeID ,PerformanceScore , Department , JobTitle, YearsAtCompany from 
internship.employee_performance_evaluation
order by PerformanceScore , YearsAtCompany desc
limit 5 ;



-- Problem 2: Determine the impact of department and job title on performance
-- scores by analysing the average performance score for each combination.

SELECT 
    Department, 
    JobTitle, 
    AVG(PerformanceScore) AS AveragePerformanceScore
FROM 
    internship.employee_performance_evaluation
GROUP BY 
    Department, 
    JobTitle
ORDER BY 
    AveragePerformanceScore DESC;



-- Problem 3: Create a performance evaluation report that ranks employees by
-- performance score, including their department, job title, and years at the
-- company.

select Department , JobTitle , YearsAtCompany , PerformanceScore 
from internship.employee_performance_evaluation
order by PerformanceScore;




-- Problem 4: Develop a recommendation system to suggest potential promotions
-- based on years at the company, job title, and performance score.
SELECT 
    Name, 
    Department, 
    JobTitle, 
    YearsAtCompany, 
    PerformanceScore,
    CASE 
        WHEN PerformanceScore >= 80 AND YearsAtCompany > 5 THEN 'High Promotion Potential'
        WHEN PerformanceScore >= 60 AND YearsAtCompany > 3 THEN 'Medium Promotion Potential'
        ELSE 'Low Promotion Potential'
    END AS PromotionRecommendation
FROM 
    internship.employee_performance_evaluation
ORDER BY 
    PerformanceScore DESC, 
    YearsAtCompany DESC;


-- Problem 5: Perform a year-wise analysis of hiring trends, identifying the number
-- of employees hired each year and any notable patterns.
select year(HireDate) as Hire_Year , count(year(HireDate)) as Employee_Hire from internship.employee_performance_evaluation
group by Hire_year
order by Hire_year;


-- Problem 6: Generate a report to identify employees whose salaries are below the
-- department average and have a high performance score (above 80).




SELECT 
    e.EmployeeID, 
    e.Name, 
    e.Department, 
    e.MonthlySalary, 
    e.PerformanceScore
FROM 
    internship.employee_performance_evaluation e
JOIN 
    (SELECT Department, AVG(MonthlySalary) AS avg_salary
     FROM internship.employee_performance_evaluation
     GROUP BY Department) dept_avg
ON 
    e.Department = dept_avg.Department
WHERE 
    e.PerformanceScore > 80 
    AND e.MonthlySalary < dept_avg.avg_salary;










