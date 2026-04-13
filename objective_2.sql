-- ------------------------------------------------------
-- 1. view the order_details table
-- ------------------------------------------------------
SELECT
	*
FROM
	restaurant.order_details;

-- ------------------------------------------------------
-- 2. What is the date range of the table?
-- ------------------------------------------------------
SELECT
	MIN(order_date) AS min_date,
	MAX(order_date) AS max_date
FROM
	restaurant.order_details;

-- ------------------------------------------------------
-- 3. How many order where made within this date range?
-- ------------------------------------------------------
SELECT
	COUNT(DISTINCT (order_id)) AS num_orders
FROM
	restaurant.order_details;

-- ------------------------------------------------------
-- 4. How many items where ordered within this date range?
-- ------------------------------------------------------
SELECT
	COUNT(item_id)
FROM
	restaurant.order_details;

-- ------------------------------------------------------
-- 5. Which orders have the most number of items?
-- ------------------------------------------------------
SELECT
	order_id,
	COUNT(item_id) AS num_items
FROM
	restaurant.order_details
GROUP BY
	order_id
ORDER BY
	num_items DESC;

-- ------------------------------------------------------
-- 6. How many orders have more than 12 items?
-- ------------------------------------------------------
WITH
	temp_table AS (
		SELECT
			order_id,
			COUNT(item_id) AS num_items
		FROM
			restaurant.order_details
		GROUP BY
			order_id
		HAVING
			COUNT(item_id) > 12
	)
SELECT
	COUNT(*) AS num_orders
FROM
	temp_table;

-- ------------------------------------------------------
-- 7. How many orders are made on each date?
-- ------------------------------------------------------
SELECT
	order_date,
	COUNT(DISTINCT (order_id)) AS num_orders
FROM
	restaurant.order_details
GROUP BY
	order_date
ORDER BY
	order_date;

-- ------------------------------------------------------
-- 8. How many items are sold on each date?
-- ------------------------------------------------------
SELECT
	order_date,
	COUNT(item_id) AS num_items
FROM
	restaurant.order_details
GROUP BY
	order_date
ORDER BY
	order_date;