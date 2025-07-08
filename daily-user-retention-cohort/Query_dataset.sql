CREATE TABLE users (
    user_id INT PRIMARY KEY,
    signup_date DATE
);

INSERT INTO users (user_id, signup_date) VALUES
(1, '2024-01-01'),
(2, '2024-01-01'),
(3, '2024-01-02'),
(4, '2024-01-03'),
(5, '2024-01-01'),
(6, '2024-01-02');

-- Dataset

CREATE TABLE user_activity (
    user_id INT,
    activity_date DATE
);

CREATE TABLE user_activity (
    user_id INT,
    activity_date DATE
);

INSERT INTO user_activity (user_id, activity_date) VALUES
(1, '2024-01-01'),
(1, '2024-01-02'),
(1, '2024-01-05'),
(2, '2024-01-01'),
(2, '2024-01-03'),
(3, '2024-01-01'),
(3, '2024-01-04'),
(3, '2024-01-10'),
(4, '2024-01-01'),
(4, '2024-01-08'),
(5, '2024-01-01'),
(5, '2024-01-15'),
(6, '2024-01-01'),
(6, '2024-01-10'),
(6, '2024-01-25'),
(7, '2024-01-01'),
(8, '2024-01-01'),
(8, '2024-01-02'),
(8, '2024-01-03'),
(9, '2024-01-01'),
(10, '2024-01-01'),
(10, '2024-01-30');

-- Solution Query

with 
cohort_base as (
select min(activity_date) as cohort_date from user_activity),

cohort_users as (
select u.user_id, u.signup_date
from users u join cohort_base cb on
u.signup_date = cb.cohort_date),

cohort_activity as (
select ua.user_id,
datediff(ua.activity_date, cu.signup_date) as active_day
from user_activity ua join cohort_users cu 
on ua.user_id = cu.user_id)

select active_day,
count(distinct user_id) as retained_users,
round(count(distinct user_id) * 100 / (select count(user_id) from cohort_users),2) as retention_rate
from cohort_activity 
where active_day between 0 and 30
group by active_day
order by active_day
