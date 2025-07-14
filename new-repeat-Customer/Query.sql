-- dataset

-- Create the table
CREATE TABLE customer_orders (
  order_id INTEGER,
  customer_id INTEGER,
  order_date DATE,
  order_amount INTEGER
);

-- Insert records
INSERT INTO customer_orders (order_id, customer_id, order_date, order_amount)
VALUES
  (1, 100, CAST('2022-01-01' AS DATE), 2000),
  (2, 200, CAST('2022-01-01' AS DATE), 2500),
  (3, 300, CAST('2022-01-01' AS DATE), 2100),
  (4, 100, CAST('2022-01-02' AS DATE), 2000),
  (5, 400, CAST('2022-01-02' AS DATE), 2200),
  (6, 500, CAST('2022-01-02' AS DATE), 2700),
  (7, 100, CAST('2022-01-03' AS DATE), 3000),
  (8, 400, CAST('2022-01-03' AS DATE), 1000),
  (9, 600, CAST('2022-01-03' AS DATE), 3000);

-- View inserted data
SELECT * FROM customer_orders;


-- Solution Query

with first_visit_date as (
select customer_id, min(order_date) as first_visit_date 
from customer_orders
group by customer_id),

cust_count as (
select co.*, fcv.first_visit_date,
case when order_date = first_visit_date then 1 else 0 end as new_cust_count,
case when order_date != first_visit_date then 1 else 0 end as repeat_cust_count
from customer_orders co join first_visit_date fcv
on co.customer_id = fcv.customer_id)

select order_date, 
sum(new_cust_count) as new_customers,
sum(repeat_cust_count) as repeat_customers
from cust_count
group by order_date;
