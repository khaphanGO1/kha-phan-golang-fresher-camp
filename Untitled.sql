CREATE TABLE `Foods` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `restaurant_id` int,
  `name` varchar(255),
  `price` int,
  `rated` float,
  `categorie_id` int,
  `description` varchar(255),
  `created at` timestamp,
  `update at` timestamp
);

CREATE TABLE `Restaurants` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `adress_id` int,
  `phone number` varchar(255),
  `rated` float,
  `created at` timestamp,
  `update at` timestamp
);

CREATE TABLE `Categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `email` varchar(255),
  `adress_id` int,
  `phone number` varchar(255),
  `created at` timestamp,
  `update at` timestamp
);

CREATE TABLE `orders` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int UNIQUE NOT NULL,
  `status` varchar(255),
  `created at` timestamp,
  `update at` timestamp
);

CREATE TABLE `order_foods` (
  `order_id` int,
  `food_id` int,
  `quantity` int DEFAULT 1,
  PRIMARY KEY (`order_id`, `food_id`)
);

CREATE TABLE `Restaurants_Categories` (
  `restaurant_id` int,
  `categorie_id` int,
  `created at` timestamp,
  `update at` timestamp,
  PRIMARY KEY (`restaurant_id`, `categorie_id`)
);

CREATE TABLE `Adresses` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `phone number` varchar(255),
  `roll` int,
  `state` varchar(255),
  `city` varchar(255),
  `street` varchar(255),
  `adress` varchar(255)
);

CREATE TABLE `Favorites_Restaurants` (
  `user_id` int,
  `restaurant_id` int,
  `created at` timestamp,
  PRIMARY KEY (`user_id`, `restaurant_id`)
);

CREATE TABLE `Favorites_Foods` (
  `user_id` int,
  `food_id` int,
  `created at` timestamp,
  PRIMARY KEY (`user_id`, `food_id`)
);

ALTER TABLE `Foods` ADD FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants` (`id`);

ALTER TABLE `Restaurants_Categories` ADD FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants` (`id`);

ALTER TABLE `Favorites_Restaurants` ADD FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants` (`id`);

ALTER TABLE `Restaurants_Categories` ADD FOREIGN KEY (`categorie_id`) REFERENCES `Categories` (`id`);

ALTER TABLE `order_foods` ADD FOREIGN KEY (`food_id`) REFERENCES `Foods` (`id`);

ALTER TABLE `order_foods` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`adress_id`) REFERENCES `Adresses` (`id`);

ALTER TABLE `Restaurants` ADD FOREIGN KEY (`adress_id`) REFERENCES `Adresses` (`id`);

ALTER TABLE `Favorites_Restaurants` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `Favorites_Foods` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `Favorites_Foods` ADD FOREIGN KEY (`food_id`) REFERENCES `Foods` (`id`);

ALTER TABLE `Foods` ADD FOREIGN KEY (`categorie_id`) REFERENCES `Categories` (`id`);

