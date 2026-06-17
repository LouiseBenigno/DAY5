-- -- --PART A: AND, OR, NOT

SELECT * FROM sales
WHERE region = 'NCR' AND total_amount > 10000;
--RESULTS: 8 ROWS

SELECT * FROM sales
WHERE city = 'Manila' OR city = 'Cebu City';
--RESULTS: 18 ROWS

SELECT * FROM sales
WHERE NOT category = 'Accessories';
--RESULTS: 26 ROWS

SELECT * FROM sales
WHERE region = 'Visayas' AND payment_method = 'Credit Card';
--RESULTS: 4 ROWS

SELECT * FROM sales
WHERE category = 'Electronics' AND quantity > 1;
--RESULTS: 1 ROW


-- -- --PART B: BETWEEN, IN, LIKE

SELECT * FROM sales
WHERE total_amount BETWEEN 2000 AND 10000;
--RESULTS: 23 ROWS

SELECT * FROM sales
WHERE sale_date BETWEEN '2025-01-01' AND '2025-03-31';
--RESULTS: 17 ROWS

SELECT * FROM sales
WHERE city IN ('Makati', 'Quezon City', 'Pasig');
--RESULTS: 19 ROWS

SELECT * FROM sales
WHERE product_name LIKE 'Laptop%';
--RESULTS: 7 ROWS

SELECT * FROM sales
WHERE product_name LIKE '%USB%';
--RESULTS: 6 ROWS

-- -- --PART C: ORDER BY and LIMIT

SELECT * FROM sales
ORDER BY total_amount DESC;
--RESULTS: 50 ROWS

SELECT * FROM sales
ORDER BY total_amount DESC
LIMIT 5;
--RESULTS: 5 ROWS

SELECT * FROM sales
WHERE category = 'Electronics'
ORDER BY sale_date ASC;
--RESULTS: 16 ROWS

SELECT * FROM sales
ORDER BY sale_date DESC
LIMIT 10;
--RESULTS: 10 ROWS

SELECT * FROM sales
WHERE region = 'NCR'
ORDER BY category ASC, total_amount DESC;
--RESULTS: 27 ROWS


-- --Scenario 1: Restocking Alert

SELECT *
FROM inventory
WHERE quantity_on_hand <= reorder_level
ORDER BY quantity_on_hand ASC;
--RESULTS: 4 ROWS

-- --Scenario 2: Regional Sales Analysis

SELECT customer_name, product_name, city, total_amount
FROM sales
WHERE region = 'NCR' AND total_amount >= 10000
ORDER BY total_amount DESC;
--RESULTS: 8 ROWS

-- --Scenario 3: Customer Outreach

SELECT name, city, total_orders, total_spent
FROM customers
WHERE city IN ('Manila', 'Makati', 'Quezon City', 'Pasig')
AND total_orders > 5;

-- --Scenario 4: Product Search

SELECT item_name, warehouse, quantity_on_hand, unit_cost
FROM inventory
WHERE item_name LIKE '%Keyboard%';
--RESULTS: 1 ROW

-- --Scenario 5: Q2 Payment Analysis

SELECT sale_date, customer_name, product_name, total_amount, payment_method
FROM sales
WHERE sale_date BETWEEN '2025-04-01' AND '2025-06-30'
AND payment_method = 'GCash'
ORDER BY sale_date;
--RESULTS: 4 ROWS