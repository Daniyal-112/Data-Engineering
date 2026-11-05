-- Q1 Show the order_id, customer and product of all delivered orders from Karachi.
SELECT
  order_id,
  customer,
  product
FROM
  orders
WHERE
  status = 'Delivered'
  AND city = 'Karachi';

-- Q2 Show Electronics orders where the unit price is more than 10,000.
SELECT
  order_id,
  product,
  price
FROM
  orders
WHERE
  category = 'Electronics'
  AND price > 10000;

-- Q3 	Using IN, show orders paid via JazzCash or EasyPaisa.
SELECT
  order_id
FROM
  orders
WHERE
  payment_method IN ('JazzCash', 'EasyPaisa');

-- Q4 Show Books orders placed between March 1 and May 31, 2025 (inclusive).
SELECT
  order_id,
  product
FROM
  orders
WHERE
  category = 'Books'
  AND order_date BETWEEN '2025-03-01' AND '2025-05-31';

-- Q5 Show the unique customers whose name ends with ‘Khan’ or starts with ‘S’.
SELECT DISTINCT
  (customer)
FROM
  orders
WHERE
  customer LIKE 'S%'
  OR customer LIKE '%Khan';

-- Q6 Show the 3 orders with the highest discount (ignore orders with no discount).
SELECT
  order_id,
  customer,
  product,
  discount
FROM
  orders
WHERE
  discount IS NOT NULL
ORDER BY
  discount DESC
LIMIT
  3;

-- Q7 Show a unique list of cities, sorted A–Z.
SELECT DISTINCT
  (city)
FROM
  orders
ORDER BY
  city;

-- Q8 Show the top 5 orders by total amount (quantity * price), with order_id, product and total_amount.
SELECT
  order_id,
  product,
  quantity * price AS total_amount
FROM
  orders
ORDER BY
  total_amount DESC
LIMIT
  5;

-- Q9 In one query, show: total number of orders, number of orders that got a discount, and number of unique customers.
SELECT
  COUNT(*) AS total_orders,
  COUNT(discount) AS discounted_orders,
  COUNT(DISTINCT customer) AS unique_customers
FROM
  orders;

-- Q10 For delivered orders only, show the total revenue and the average order value (rounded to 0 decimals).
SELECT
  SUM(quantity * price) AS total_revenue,
  ROUND(AVG(quantity * price), 0) AS avg_order_value
FROM
  orders
WHERE
  status = 'Delivered';

-- Q11 Show the first and the last order date for the Electronics category.
SELECT
  MIN(order_date) AS first_order,
  MAX(order_date) AS last_order
FROM
  orders
WHERE
  category = 'Electronics';

-- Q12 Count the orders for each status, most orders first.
SELECT
  status,
  COUNT(*) AS total_order
FROM
  orders
GROUP BY
  status
ORDER BY
  total_order DESC;

-- Q13 Show the total revenue for each category (delivered orders only), highest first.
SELECT
  category,
  SUM(quantity * price) AS total_revenue
FROM
  orders
WHERE
  status = 'Delivered'
GROUP BY
  category
ORDER BY
  total_revenue DESC;

-- Q14 Count the orders from each city, most orders first.
SELECT
  city,
  COUNT(*) AS total_orders
FROM
  orders
GROUP BY
  city
ORDER BY
  count(*) DESC;

-- Q15 Show the average order value for each payment method, rounded to 0 decimals, highest first.
SELECT
  payment_method,
  ROUND(AVG(quantity * price), 0) AS avg_order_value
FROM
  orders
GROUP BY
  payment_method
ORDER BY
  avg_order_value DESC;

-- Q16For each month of 2025, show the number of orders and the total revenue, sorted by month.
SELECT
  MONTH (order_date) AS month_of_2025,
  COUNT(*) AS num_of_orders,
  SUM(quantity * price) AS total_revenue
FROM
  orders
WHERE
  YEAR (order_date) = 2025
GROUP BY
  MONTH (order_date)
ORDER BY
  MONTH (order_date);