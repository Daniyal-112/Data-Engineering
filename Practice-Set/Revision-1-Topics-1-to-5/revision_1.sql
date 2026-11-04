-- Q1 Show the order_id, customer and product of all delivered orders from Karachi.

SELECT order_id, customer,product
FROM orders
WHERE status ='Delivered' AND city = 'Karachi';

-- Q2 Show Electronics orders where the unit price is more than 10,000.

SELECT order_id, product,price
FROM orders
WHERE category = 'Electronics' AND price >10000;

-- Q3 	Using IN, show orders paid via JazzCash or EasyPaisa.

SELECT order_id
FROM orders 
WHERE payment_method IN ('JazzCash','EasyPaisa');

-- Q4 Show Books orders placed between March 1 and May 31, 2025 (inclusive).

SELECT order_id, product
FROM orders
WHERE category = 'Books' AND order_date BETWEEN '2025-03-01' AND '2025-05-31';

-- Q5 Show the unique customers whose name ends with ‘Khan’ or starts with ‘S’.

SELECT DISTINCT(customer)
FROM orders
WHERE customer LIKE 'S%' 
OR
customer LIKE '%Khan';
