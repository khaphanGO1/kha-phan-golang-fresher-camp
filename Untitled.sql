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

CREATE TABLE `Review_Foods` (
  `user_id` int,
  `food_id` int,
  `rated` int,
  `content` varchar(255),
  `created at` timestamp,
  `update at` timestamp,
  PRIMARY KEY (`user_id`, `food_id`)
);

CREATE TABLE `Review_Restaurants` (
  `user_id` int,
  `restaurant_id` int,
  `rated` int,
  `content` varchar(255),
  `created at` timestamp,
  `update at` timestamp,
  PRIMARY KEY (`user_id`, `restaurant_id`)
);



