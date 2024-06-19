create table `category` (
    `category_id` INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL DEFAULT '',
    `sort_order` INT NOT NULL DEFAULT 0,
    `date_added` DATETIME,
    `date_edited` DATETIME
);

INSERT INTO `category` (`name`, `sort_order`, `date_added`, `date_edited`) VALUES
  ('Laptops',10, NOW(), NOW()),
  ('Tablets',20, NOW(), NOW()),
  ('Smartphones',30, NOW(), NOW()),
  ('Tv',40, NOW(), NOW()),
  ('Accessories',50, NOW(), NOW());

create table product (
     `product_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
     `category_id` INT UNSIGNED NOT NULL DEFAULT 0,
     `name` VARCHAR(255) NOT NULL DEFAULT '',
     `price` INT UNSIGNED NOT NULL DEFAULT 0,
     `date_added` DATETIME,
     `date_edited` DATETIME,
     FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`)
);

INSERT INTO `product` (`category_id`, `name`, `price`, `date_added`, `date_edited`) VALUES
    (2, 'Product 1', 1500, '2024-01-02 10:00:00', NOW()),
    (1, 'Product 2', 2300, '2024-03-02 10:00:00', NOW()),
    (3, 'Product 3', 5700, '2024-02-02 10:00:00', NOW()),
    (5, 'Product 4', 1100, '2024-05-02 10:00:00', NOW()),
    (2, 'Product 5', 7800, '2024-06-02 10:00:00', NOW()),
    (2, 'Product 6', 5300, '2024-03-08 10:00:00', NOW()),
    (2, 'Product 7', 6300, '2024-03-09 10:00:00', NOW()),
    (1, 'Product 8', 9800, '2024-02-10 10:00:00', NOW()),
    (5, 'Product 9', 10500, '2024-04-12 10:00:00', NOW()),
    (4, 'Product 10', 3700, '2024-05-03 10:00:00', NOW()),
    (4, 'Product 11', 2100, '2024-05-08 10:00:00', NOW()),
    (3, 'Product 12', 8300, '2024-06-12 10:00:00', NOW()),
    (1, 'Product 13', 4900, '2024-02-15 10:00:00', NOW()),
    (5, 'Product 14', 8800, '2024-01-21 10:00:00', NOW()),
    (3, 'Product 15', 5450, '2024-03-17 10:00:00', NOW()),
    (4, 'Product 16', 7600, '2024-05-08 10:00:00', NOW()),
    (4, 'Product 17', 1200, '2024-06-02 10:00:00', NOW()),
    (5, 'Product 18', 1900, '2024-04-02 10:00:00', NOW()),
    (5, 'Product 19', 2500, '2024-03-02 10:00:00', NOW()),
    (1, 'Product 20', 15000, '2024-05-25 10:00:00', NOW());
