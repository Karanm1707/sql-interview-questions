select distinct user_id from orders1
where month(order_date) = 1 and
user_id not in
(select user_id from orders1
where month(order_date) = 2)
