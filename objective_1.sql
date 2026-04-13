-- OBJECTIVE 1: EXPLORING THE ITEMS TABLE
-- ------------------------------------------------------
-- 1. View the menu_items 
-- ------------------------------------------------------
SELECT
	*
FROM
	restaurant.menu_items;

-- ------------------------------------------------------
-- 2. Write a query to find the number of items on the menu
-- ------------------------------------------------------
SELECT
	COUNT(*) AS num_items
FROM
	restaurant.menu_items;

-- ------------------------------------------------------
-- 3. What are the least and most expensive items on the menu?
-- ------------------------------------------------------
SELECT
	item_name,
	SUM(price) AS price
FROM
	restaurant.menu_items
GROUP BY
	item_name
ORDER BY
	price ASC;

SELECT
	item_name,
	SUM(price) AS price
FROM
	restaurant.menu_items
GROUP BY
	item_name
ORDER BY
	price DESC;

-- ------------------------------------------------------
-- 4. How many italian dishes are on the menu? 
-- ------------------------------------------------------
SELECT
	COUNT(*) AS num_italian
FROM
	restaurant.menu_items
WHERE
	category = 'Italian';

-- ------------------------------------------------------
-- 5. What are the least and most expensive italian dishes on the menu.
-- ------------------------------------------------------
SELECT
	*
FROM
	restaurant.menu_items
WHERE
	category = 'Italian'
ORDER BY
	price ASC;

SELECT
	*
FROM
	restaurant.menu_items
WHERE
	category = 'Italian'
ORDER BY
	price DESC;

-- ------------------------------------------------------
-- 6. How many dishes are  in each category? 
-- ------------------------------------------------------
SELECT
	category,
	COUNT(*) AS num_dishes
FROM
	restaurant.menu_items
GROUP BY
	category;

-- ------------------------------------------------------
-- 7. What is the average dish price within each category?
-- ------------------------------------------------------
SELECT
	category,
	ROUND(AVG(price), 2) AS avg_price
FROM
	restaurant.menu_items
GROUP BY
	category;