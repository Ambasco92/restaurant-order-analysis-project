-- ------------------------------------------------------
-- 1. Combine the menu_items and the order_details table into a single table
-- ------------------------------------------------------
SELECT
	*
FROM
	restaurant.order_details AS od
	LEFT JOIN restaurant.menu_items AS mi ON od.item_id = mi.menu_item_id;

-- ------------------------------------------------------
-- 2. What were the least and most ordered items? What categories where they in?
-- ------------------------------------------------------
SELECT
	item_name,
	category,
	COUNT(item_id) AS num_purchases
FROM
	restaurant.order_details AS od
	LEFT JOIN restaurant.menu_items AS mi ON od.item_id = mi.menu_item_id
GROUP BY
	item_name,
	category
HAVING
	COUNT(item_id) != 0
ORDER BY
	num_purchases;

SELECT
	item_name,
	category,
	COUNT(item_id) AS num_purchases
FROM
	restaurant.order_details AS od
	LEFT JOIN restaurant.menu_items AS mi ON od.item_id = mi.menu_item_id
GROUP BY
	item_name,
	category
HAVING
	COUNT(item_id) != 0
ORDER BY
	num_purchases DESC;

-- ------------------------------------------------------
-- 3. What were the top 5 orders that spent the most money?
-- ------------------------------------------------------
SELECT
	TOP 5 order_id,
	SUM(price) AS amount_spent
FROM
	restaurant.order_details AS od
	LEFT JOIN restaurant.menu_items AS mi ON od.item_id = mi.menu_item_id
GROUP BY
	order_id
ORDER BY
	amount_spent DESC;

-- ------------------------------------------------------
-- 4. View the details of the highest spent order. What insights can you gather
-- ------------------------------------------------------
SELECT
	*
FROM
	restaurant.order_details AS od
	LEFT JOIN restaurant.menu_items AS mi ON od.item_id = mi.menu_item_id
WHERE
	order_id = 440;

-- ------------------------------------------------------
-- 5. View the details of the top 5 highest spent order. What insights can you gather
-- ------------------------------------------------------
SELECT
	*
FROM
	restaurant.order_details AS od
	LEFT JOIN restaurant.menu_items AS mi ON od.item_id = mi.menu_item_id
WHERE
	order_id IN (440, 2075, 1957, 330, 2675);