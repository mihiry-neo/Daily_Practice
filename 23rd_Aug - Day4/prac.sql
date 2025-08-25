create table employee_manager (
    emp_id int,
    manager_id int,
    change_date date
);

insert into employee_manager (emp_id, manager_id, change_date) values
(1, 10, '2025-01-01'),
(1, 10, '2025-02-01'),
(2, 11, '2025-01-01'),
(2, 12, '2025-03-01'),
(3, 13, '2025-01-05');


select emp_id from employee_manager group by emp_id having count(distinct manager_id) = 1;

-- +--------+
-- | emp_id |
-- +--------+
-- |      1 |
-- |      3 |
-- +--------+
