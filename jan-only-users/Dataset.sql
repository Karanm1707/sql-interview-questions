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
(4, 103, '2024-02-10'),
(5, 102, '2024-02-12'),
(6, 104, '2024-01-18'),
(7, 105, '2024-03-01');
