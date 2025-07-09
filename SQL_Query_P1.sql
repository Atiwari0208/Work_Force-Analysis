-- SQL Employee Diversity Analysis -P1

Create database sql_project_1;
use sql_project_1;

-- Creating employee info table

Create Table Emp_info (
	EEID Int Primary Key,	
    Full_Name VARCHAR(50),	
    Department Varchar(50),	
    Business_Unit Varchar(50),	
    Gender VARCHAR(10),	
    Ethnicity VARCHAR(20),		
    Age INT,	
    Annual_Salary int,
 	Country VARCHAR(30),	
	City VARCHAR(30)
	);
    
SELECT * FROM Emp_info; 
--------------------------------------------------------------------------------------------------------------------------------------------
-- My Data Exploration

Select count(*)
from Emp_info;

Select * from Emp_info; 

select * from emp_info 
	where 
		Full_Name= null
		OR
        City= null
        OR
        Business_Unit= null
        OR 
        Department= null;

-- Entering Country name acoording to city.
Set SQL_SAFE_UPDATES =0;

Update emp_info
set country= "United States"
Where city In('Miami','Austin','Columbus','Seattle','Chicago','Phoenix','Columbus');

Update emp_info
set country= "China"
Where city In("Beijing", "Chongqing", "Shanghai", "Chengdu");

Update emp_info
set country= "Brazil"
Where city In("Rio de Janerio",'Sao Paulo', "Manaus");
--------------------------------------------------------------------------------------------------------------------------------------------

-- My Analysis and findings:

-- Q.1 Write a SQL Query to find all employees who belong to Asian Ethnicity.?
-- Q.2 Write a SQL Query to find which city has most employee above the age of 55.?
-- Q.3 Write a SQL Query to find the country with most number of employees from particular department.?
-- Q.4 Write a SQL Query to compare number of IT employees working in IT Department in various countries.?
-- Q.5 Write a SQL Query to create country wise distribution in Buisness Units.? 
-- Q.6 Write a SQL Query to find details of 5 most senior employees of the company.? 
-- Q.7 Write a SQL Query to compare the gender diversity among various Business Units.?



-- Q.1 Write a SQL Query to find all employees who belong to Asian Ethnicity.?

select * 
from Emp_info 
where ethnicity="Asian";

-- Q.2 Write a SQL Query to find which city has most employee above the age of 55.?

select city, count( Full_Name)
from Emp_info
where age >= 55
group by city;

-- Q.3 Write a SQL Query to find the country with most number of employees from a particular department.?

Select country, Department, count(Full_Name) as ecount
from emp_info
group by department, country
having ecount= (
	select max(ecount) 
    from(
			Select  country, Department, count(Full_Name) as ecount
			from emp_info
			group by department, country
		) As SubQuery
        Where SubQuery.country= emp_info.country
	);
    
-- Q.4 Write a SQL Query to compare number of IT employees working in IT Department in various countries.?

Select Country, count(Full_Name)
from Emp_info
where Department= "IT"
group by country;

-- Q.5 Write a SQL Query to create country wise distribution in Buisness Units.? 

Select country, Business_Unit, count(Full_Name) 
from emp_info
group by country, Business_Unit;

-- Q.6 Write a SQL Query to find details of 5 most senior employees of the company.? 

Select * from emp_info 
order by age desc
limit 5;

-- Q.7 Write a SQL Query to compare the gender diversity among various Business Units.?

Select Gender, Business_Unit, count(*)
from emp_info
group by gender, Business_Unit;

-- End of Project
--------------------------------------------------------------------------------------------------------------------------------------------




