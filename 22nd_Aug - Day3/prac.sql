create table employee_salaries (
    emp_id int,
    effective_date date,
    salary int
);

insert into employee_salaries (emp_id, effective_date, salary) values
(1, '2025-01-01', 50000),
(1, '2025-02-01', 55000),
(1, '2025-03-01', 60000),
(2, '2025-01-15', 40000),
(2, '2025-03-01', 45000),
(3, '2025-01-10', 30000);


with salary_diff as (
    select 
        emp_id,
        salary,
        lag(salary) over (partition by emp_id order by effective_date) as prev_salary
    from employee_salaries
)
select
    emp_id,
    count(*) as salary_change_count
from salary_diff
where prev_salary is not null and salary <> prev_salary
group by emp_id;


-- +--------+---------------------+
-- | emp_id | salary_change_count |
-- +--------+---------------------+
-- |      1 |                   2 |
-- |      2 |                   1 |
-- +--------+---------------------+
