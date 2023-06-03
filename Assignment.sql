
-- first
SELECT order_date, SUM(orders.price * orders.quantity) AS sales, SUM((orders.price - products.cost) * orders.quantity) AS margin
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY order_date
HAVING SUM((orders.price - products.cost) * orders.quantity) > 1000

-- second
SELECT customer_id, customer_name, phone, city
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders)

-- third
SELECT products.product_id, product_name, SUM((orders.price - products.cost) * orders.quantity) AS margin
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY products.product_id
ORDER BY margin DESC