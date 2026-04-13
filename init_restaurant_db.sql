USE master;

GO
-- ------------------------------------------------------
-- Drop  and recreate the 'restaurant_db' database
-- ------------------------------------------------------
IF EXISTS (
	SELECT
		1
	FROM
		sys.databases
	WHERE
		name = 'restaurant_db'
) BEGIN
ALTER DATABASE restaurant_db
SET
	SINGLE_USER
WITH
	ROLLBACK IMMEDIATE;

DROP DATABASE restaurant_db;

END;

GO
-- ------------------------------------------------------
-- Creating the 'restaurant_db' database
-- ------------------------------------------------------
CREATE DATABASE restaurant_db;

GO USE restaurant_db;

GO
-- ------------------------------------------------------
-- Creating Schema 'restaurant'
-- ------------------------------------------------------
CREATE SCHEMA restaurant;

GO IF OBJECT_ID ('restaurant.menu_items', 'U') IS NOT NULL
DROP TABLE restaurant.menu_items;

CREATE TABLE
	restaurant.menu_items (
		menu_item_id INT NOT NULL,
		item_name NVARCHAR (45),
		category NVARCHAR (45),
		price DECIMAL(5, 2),
		PRIMARY KEY (menu_item_id)
	);

IF OBJECT_ID ('restaurant.order_details', 'U') IS NOT NULL
DROP TABLE restaurant.order_details;

CREATE TABLE
	restaurant.order_details (
		order_details_id INT NOT NULL,
		order_id INT NOT NULL,
		order_date DATE,
		order_time TIME,
		item_id INT,
		PRIMARY KEY (order_details_id)
	);

TRUNCATE TABLE restaurant.menu_items;

BULK INSERT restaurant.menu_items
FROM
	'C:\Users\Abdul Basit\OneDrive\Documents\Data Files\restaurant\Datasets\menu_items.csv'
WITH
	(FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

TRUNCATE TABLE restaurant.order_details;

BULK INSERT restaurant.order_details
FROM
	'C:\Users\Abdul Basit\order_details.csv'
WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		CODEPAGE = '65001',
		DATAFILETYPE = 'char',
		FORMAT = 'CSV',
		TABLOCK
	);