CREATE TABLE `Foods` (
  `id` int AUTO_INCREMENT,
  `restaurant_id` int,
  `name` varchar(255),
  `price` int,
  `rated` float,
  `categorie_id` int,
  `description` varchar(255),
  `created at` timestamp,
  `update at` timestamp,
  PRIMARY KEY (`id`, `restaurant_id`)
);

CREATE TABLE `Restaurants` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `adress` varchar(255),
  `phone number` varchar(255),
  `rated` float,
  `created at` timestamp,
  `update at` timestamp
);

CREATE TABLE `Categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `email` varchar(255),
  `phone number` varchar(255),
  `created at` timestamp,
  `update at` timestamp
);

CREATE TABLE `order` (
  `id` int PRIMARY KEY,
  `user_id` int UNIQUE NOT NULL,
  `status` varchar(255),
  `created_at` varchar(255) COMMENT 'When order created'
);

CREATE TABLE `order_foods` (
  `order_id` int,
  `food_id` int,
  `quantity` int DEFAULT 1
);

CREATE TABLE `Restaurants_Categories` (
  `restaurant_id` int,
  `categorie_id` int
);

ALTER TABLE `Restaurants` ADD FOREIGN KEY (`id`) REFERENCES `Foods` (`restaurant_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`id`) REFERENCES `order_foods` (`order_id`);

ALTER TABLE `Foods` ADD FOREIGN KEY (`id`) REFERENCES `order_foods` (`food_id`);

ALTER TABLE `user` ADD FOREIGN KEY (`id`) REFERENCES `order` (`user_id`);

ALTER TABLE `Foods` ADD FOREIGN KEY (`categorie_id`) REFERENCES `Categories` (`id`);

ALTER TABLE `Restaurants` ADD FOREIGN KEY (`id`) REFERENCES `Restaurants_Categories` (`restaurant_id`);

ALTER TABLE `Categories` ADD FOREIGN KEY (`id`) REFERENCES `Restaurants_Categories` (`categorie_id`);

