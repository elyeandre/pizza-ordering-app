-- ============================================
-- Pizza Ordering App Database Schema
-- XAMPP/phpMyAdmin Compatible
-- Version: 1.0
-- Created: September 25, 2025
-- ============================================

-- Create database
CREATE DATABASE IF NOT EXISTS `pizza_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `pizza_app`;

-- ============================================
-- Table structure for table `users`
-- ============================================

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff') NOT NULL DEFAULT 'staff',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table structure for table `products`
-- ============================================

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` longblob NOT NULL,
  `stocks` int(11) NOT NULL DEFAULT 0,
  `description` text,
  `category` varchar(50) DEFAULT 'pizza',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`),
  KEY `idx_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table structure for table `ingredients`
-- ============================================

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `serving_size` varchar(50) NOT NULL,
  `price_per_serving` decimal(10,2) NOT NULL,
  `stock_available` decimal(10,2) NOT NULL DEFAULT 0,
  `unit` varchar(20) DEFAULT 'grams',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table structure for table `orders` (Optional - for future order tracking)
-- ============================================

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(20) NOT NULL,
  `user_id` int(11),
  `total_amount` decimal(10,2) NOT NULL,
  `order_status` enum('pending','preparing','ready','completed','cancelled') NOT NULL DEFAULT 'pending',
  `customer_name` varchar(100),
  `customer_phone` varchar(20),
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `fk_orders_user` (`user_id`),
  KEY `idx_status` (`order_status`),
  KEY `idx_date` (`order_date`),
  CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table structure for table `order_items` (Optional - for future order tracking)
-- ============================================

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `size` enum('small','medium','large') NOT NULL DEFAULT 'medium',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `ingredients` text COMMENT 'JSON array of selected ingredients',
  PRIMARY KEY (`id`),
  KEY `fk_order_items_order` (`order_id`),
  KEY `fk_order_items_product` (`product_id`),
  CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Sample Data Insertion
-- ============================================

-- Insert sample users
INSERT INTO `users` (`username`, `password`, `role`) VALUES
('admin', 'admin123', 'admin'),
('staff', 'staff123', 'staff'),
('manager', 'manager123', 'admin');

-- Insert sample products (Note: You'll need to add actual image data via the application)
INSERT INTO `products` (`name`, `price`, `stocks`, `description`, `image`) VALUES
('Margherita Pizza', 299.00, 20, 'Classic pizza with tomato sauce, mozzarella cheese, and fresh basil', 0x424D36040000000000003604000028000000100000001000000001002000000000000000000074120000741200000000000000000000),
('Pepperoni Pizza', 349.00, 15, 'Delicious pizza topped with pepperoni slices and mozzarella cheese', 0x424D36040000000000003604000028000000100000001000000001002000000000000000000074120000741200000000000000000000),
('Hawaiian Pizza', 389.00, 12, 'Sweet and savory combination of ham, pineapple, and mozzarella cheese', 0x424D36040000000000003604000028000000100000001000000001002000000000000000000074120000741200000000000000000000),
('Meat Lovers Pizza', 449.00, 10, 'Hearty pizza loaded with pepperoni, sausage, ham, and bacon', 0x424D36040000000000003604000028000000100000001000000001002000000000000000000074120000741200000000000000000000),
('Vegetarian Supreme', 379.00, 18, 'Garden fresh vegetables including bell peppers, mushrooms, onions, and olives', 0x424D36040000000000003604000028000000100000001000000001002000000000000000000074120000741200000000000000000000),
('BBQ Chicken Pizza', 419.00, 14, 'Tender BBQ chicken with red onions and tangy barbecue sauce', 0x424D36040000000000003604000028000000100000001000000001002000000000000000000074120000741200000000000000000000);

-- Insert sample ingredients
INSERT INTO `ingredients` (`name`, `serving_size`, `price_per_serving`, `stock_available`, `unit`) VALUES
('Extra Cheese', '50g', 25.00, 100.00, 'grams'),
('Pepperoni', '30g', 35.00, 80.00, 'grams'),
('Italian Sausage', '40g', 40.00, 60.00, 'grams'),
('Ham', '35g', 30.00, 75.00, 'grams'),
('Bacon', '25g', 45.00, 50.00, 'grams'),
('Mushrooms', '40g', 20.00, 90.00, 'grams'),
('Bell Peppers', '30g', 15.00, 85.00, 'grams'),
('Red Onions', '25g', 10.00, 95.00, 'grams'),
('Green Olives', '20g', 30.00, 45.00, 'grams'),
('Black Olives', '20g', 28.00, 55.00, 'grams'),
('Pineapple', '35g', 22.00, 40.00, 'grams'),
('Tomatoes', '30g', 18.00, 70.00, 'grams'),
('Spinach', '25g', 20.00, 60.00, 'grams'),
('Jalapeños', '15g', 25.00, 35.00, 'grams'),
('Garlic', '10g', 12.00, 80.00, 'grams');

-- ============================================
-- Views for reporting (Optional)
-- ============================================

-- View for product inventory status
CREATE OR REPLACE VIEW `product_inventory_view` AS
SELECT 
    p.id,
    p.name,
    p.price,
    p.stocks,
    p.category,
    CASE 
        WHEN p.stocks <= 5 THEN 'Low Stock'
        WHEN p.stocks <= 10 THEN 'Medium Stock'
        ELSE 'Good Stock'
    END as stock_status,
    p.is_active,
    p.updated_at
FROM `products` p
WHERE p.is_active = 1
ORDER BY p.stocks ASC;

-- View for ingredient inventory status
CREATE OR REPLACE VIEW `ingredient_inventory_view` AS
SELECT 
    i.id,
    i.name,
    i.serving_size,
    i.price_per_serving,
    i.stock_available,
    i.unit,
    CASE 
        WHEN i.stock_available <= 10 THEN 'Low Stock'
        WHEN i.stock_available <= 25 THEN 'Medium Stock'
        ELSE 'Good Stock'
    END as stock_status,
    i.is_active,
    i.updated_at
FROM `ingredients` i
WHERE i.is_active = 1
ORDER BY i.stock_available ASC;

-- ============================================
-- Stored Procedures (Optional)
-- ============================================

DELIMITER //

-- Procedure to check user credentials
CREATE PROCEDURE `ValidateUser`(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255)
)
BEGIN
    SELECT id, username, role 
    FROM users 
    WHERE username = p_username 
    AND password = p_password 
    AND EXISTS(SELECT 1 FROM users WHERE username = p_username);
END //

-- Procedure to get low stock products
CREATE PROCEDURE `GetLowStockProducts`(IN threshold INT)
BEGIN
    SELECT id, name, price, stocks, category
    FROM products 
    WHERE stocks <= threshold 
    AND is_active = 1
    ORDER BY stocks ASC;
END //

-- Procedure to get low stock ingredients  
CREATE PROCEDURE `GetLowStockIngredients`(IN threshold DECIMAL(10,2))
BEGIN
    SELECT id, name, serving_size, price_per_serving, stock_available, unit
    FROM ingredients 
    WHERE stock_available <= threshold 
    AND is_active = 1
    ORDER BY stock_available ASC;
END //

DELIMITER ;

-- ============================================
-- Indexes for Performance
-- ============================================

-- Additional indexes for better query performance
CREATE INDEX idx_products_name ON products(name);
CREATE INDEX idx_products_price ON products(price);
CREATE INDEX idx_ingredients_name ON ingredients(name);
CREATE INDEX idx_users_username ON users(username);

-- ============================================
-- Sample Data Verification Queries
-- ============================================

-- Uncomment these to verify data after import:
-- SELECT COUNT(*) as user_count FROM users;
-- SELECT COUNT(*) as product_count FROM products;  
-- SELECT COUNT(*) as ingredient_count FROM ingredients;
-- SELECT * FROM product_inventory_view;
-- SELECT * FROM ingredient_inventory_view;

-- ============================================
-- Database Setup Complete
-- ============================================

-- IMPORTANT NOTES:
-- 1. Update DatabaseHelper.cs connection string to match your MySQL setup
-- 2. Product images are placeholder BMP headers - upload actual images via the application
-- 3. Password storage is plain text - consider hashing for production use
-- 4. Optional tables (orders, order_items) are included for future enhancements
-- 5. Views and procedures provide additional functionality for reporting

SELECT 'Database setup completed successfully!' as Status;