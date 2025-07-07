-- Dataset

-- Create orders table
CREATE TABLE orders (
    order_id INT,
    user_id INT,
    order_date DATE
);

-- Insert dummy data
INSERT INTO orders (order_id, user_id, order_date) VALUES
(1, 101, '2024-01-05'),
(2, 101, '2024-01-20'),
(3, 102, '2024-01-15'),
(4, 102, '2024-02-10'),
(5, 102, '2024-02-22'),
(6, 103, '2024-03-01'),
(7, 104, '2024-01-12'),
(8, 104, '2024-01-18'),
(9, 104, '2024-03-25');

-- SQL Query

SELECT DISTINCT user_id
FROM orders
GROUP BY user_id, YEAR(order_date), MONTH(order_date)
HAVING COUNT(*) > 1;
