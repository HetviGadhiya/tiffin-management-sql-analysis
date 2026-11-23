-- Tiffin Orders - Aggregate Functions Practice
-- Database: tiffin_management

-- Task 1: Handle NULL values in ratings
SELECT
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(COALESCE(rating, 0)), 2) AS avg_rating_null_as_zero,
    COUNT(*) - COUNT(rating) AS unrated_orders
FROM tiffin_orders;

-- Output:
-- avg_rating = 4.50
-- avg_rating_null_as_zero = 2.25
-- unrated_orders = 6

-- Task 2: Jain meal report for February 2026
SELECT
    COUNT(*) AS total_orders,
    SUM(quantity * price_inr) AS revenue_inr,
    ROUND(AVG(rating), 2) AS avg_rating,
    MAX(delivery_minutes) AS slowest_delivery_min
FROM tiffin_orders
WHERE meal_type = 'Jain'
AND order_date BETWEEN '2026-02-01' AND '2026-02-28';

-- Output:
-- total_orders = 3
-- revenue_inr = 540.00
-- avg_rating = 4.00
-- slowest_delivery_min = 65

-- Task 3: First check orders with delivery time above 60 minutes
SELECT *
FROM tiffin_orders
WHERE delivery_minutes > 60;

-- Update rating to NULL for late deliveries

UPDATE tiffin_orders
SET rating = NULL
WHERE delivery_minutes > 60;

-- Count total orders and orders having ratings
SELECT
    COUNT(*) AS total_orders,
    COUNT(rating) AS rated_orders
FROM tiffin_orders;

-- Output:
-- total_orders = 12
-- rated_orders = 6

-- Task 4: Calculate overall business KPIs
SELECT
    SUM(quantity * price_inr) AS revenue_inr,
    ROUND(AVG(price_inr), 2) AS avg_price_inr,
    MIN(delivery_minutes) AS fastest_min,
    MAX(delivery_minutes) AS slowest_min
FROM tiffin_orders;

-- Output:
-- revenue_inr = 2990.00
-- avg_price_inr = 135.83
-- fastest_min = 30
-- slowest_min = 80