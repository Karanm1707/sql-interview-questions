-- Dataset

CREATE TABLE user_events (
    user_id INT,
    event_type VARCHAR(50),
    event_time DATETIME
);
INSERT INTO user_events (user_id, event_type, event_time) VALUES
(1, 'login',  '2024-01-01 08:00:00'),
(2, 'click',  '2024-01-02 09:15:00'),
(1, 'click',  '2024-01-03 08:30:00'),
(3, 'logout', '2024-01-01 10:45:00'),
(2, 'login',  '2024-01-01 07:45:00'),
(4, 'click',  '2024-01-02 12:00:00'),
(1, 'logout', '2024-01-05 09:00:00'),
(3, 'click',  '2024-01-04 11:15:00'),
(5, 'login',  '2024-01-03 10:00:00'),
(2, 'logout', '2024-01-06 13:30:00'),
(3, 'login',  '2024-01-03 07:00:00'),
(5, 'click',  '2024-01-05 14:00:00'),
(1, 'login',  '2024-01-06 10:00:00'),
(4, 'login',  '2024-01-01 06:00:00'),
(2, 'click',  '2024-01-07 15:00:00'),
(3, 'logout', '2024-01-06 08:00:00'),
(1, 'click',  '2024-01-07 16:00:00'),
(5, 'logout', '2024-01-06 17:00:00'),
(3, 'click',  '2024-01-05 11:00:00'),
(4, 'logout', '2024-01-07 18:00:00'),
(2, 'login',  '2024-01-08 10:00:00'),
(1, 'logout', '2024-01-09 09:00:00'),
(5, 'login',  '2024-01-08 08:30:00'),
(4, 'click',  '2024-01-06 13:00:00'),
(3, 'login',  '2024-01-07 14:00:00');

-- Solution Query

with cte_event as (
select user_id,event_type, event_time,
row_number() over(partition by user_id order by event_time desc) as events_sequence
from user_events)
select user_id, event_type, event_time
from cte_event
where events_sequence <= 3;
