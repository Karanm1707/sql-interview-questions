-- products table
CREATE TABLE products (
    product_id INT,
    category VARCHAR(50),
    product_name VARCHAR(100)
);

INSERT INTO products (product_id, category, product_name) VALUES
(1, 'Electronics', 'Smartphone'),
(2, 'Electronics', 'Laptop'),
(3, 'Electronics', 'Tablet'),
(4, 'Clothing', 'Jeans'),
(5, 'Clothing', 'T-Shirt'),
(6, 'Clothing', 'Jacket'),
(7, 'Clothing', 'Shirt'),
(8, 'Books', 'SQL Guide'),
(9, 'Books', 'Python Basics'),
(10, 'Books', 'AI Handbook');

-- orders table
CREATE TABLE orders (
    order_id INT,
    product_id INT,
    revenue DECIMAL(10,2)
);

INSERT INTO orders (order_id, product_id, revenue) VALUES
(101, 1, 500.00),
(102, 1, 450.00),
(103, 2, 900.00),
(104, 2, 850.00),
(105, 3, 300.00),
(106, 3, 250.00),
(107, 4, 200.00),
(108, 4, 180.00),
(109, 5, 100.00),
(110, 6, 400.00),
(111, 6, 420.00),
(112, 7, 390.00),
(113, 8, 80.00),
(114, 9, 95.00),
(115, 10, 70.00);
