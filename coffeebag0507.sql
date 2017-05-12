-- --------------------------------------------------------
-- Host:                         192.168.0.118
-- Server version:               10.1.16-MariaDB - Source distribution
-- Server OS:                    osx10.6
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for coffeebag
DROP DATABASE IF EXISTS `coffeebag`;
CREATE DATABASE IF NOT EXISTS `coffeebag` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `coffeebag`;

-- Dumping structure for table coffeebag.answers
DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `machine_question_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_user_id_machine_question_id_created_at_index` (`user_id`,`machine_question_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table coffeebag.answers: ~2 rows (approximately)
DELETE FROM `answers`;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`id`, `user_id`, `machine_question_id`, `created_at`, `updated_at`) VALUES
	(13, 7, 1, '2017-05-05 04:09:56', '2017-05-05 04:09:56'),
	(14, 7, 3, '2017-05-05 04:09:56', '2017-05-05 04:09:56');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table coffeebag.machines
DROP TABLE IF EXISTS `machines`;
CREATE TABLE IF NOT EXISTS `machines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `machines_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table coffeebag.machines: ~8 rows (approximately)
DELETE FROM `machines`;
/*!40000 ALTER TABLE `machines` DISABLE KEYS */;
INSERT INTO `machines` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Machine 1', '', NULL, NULL),
	(2, 'Machine 2', '', NULL, NULL),
	(3, 'Machine 3', '', NULL, NULL),
	(4, 'Machine 4', '', NULL, NULL),
	(5, 'Machine 5', '', NULL, NULL),
	(6, 'Machine 6', '', NULL, NULL),
	(7, 'Machine 7', '', NULL, NULL),
	(8, 'Machine 8', '', NULL, NULL);
/*!40000 ALTER TABLE `machines` ENABLE KEYS */;

-- Dumping structure for table coffeebag.machine_products
DROP TABLE IF EXISTS `machine_products`;
CREATE TABLE IF NOT EXISTS `machine_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `machine_products_machine_id_product_id_index` (`machine_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table coffeebag.machine_products: ~81 rows (approximately)
DELETE FROM `machine_products`;
/*!40000 ALTER TABLE `machine_products` DISABLE KEYS */;
INSERT INTO `machine_products` (`id`, `machine_id`, `product_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL),
	(2, 1, 2, NULL, NULL),
	(3, 1, 3, NULL, NULL),
	(4, 1, 4, NULL, NULL),
	(5, 1, 5, NULL, NULL),
	(6, 1, 6, NULL, NULL),
	(7, 1, 7, NULL, NULL),
	(8, 1, 8, NULL, NULL),
	(9, 1, 9, NULL, NULL),
	(10, 1, 10, NULL, NULL),
	(11, 1, 11, NULL, NULL),
	(12, 1, 12, NULL, NULL),
	(13, 1, 13, NULL, NULL),
	(14, 2, 1, NULL, NULL),
	(15, 2, 2, NULL, NULL),
	(16, 2, 3, NULL, NULL),
	(17, 2, 4, NULL, NULL),
	(18, 2, 5, NULL, NULL),
	(19, 2, 6, NULL, NULL),
	(20, 2, 7, NULL, NULL),
	(21, 2, 8, NULL, NULL),
	(22, 2, 9, NULL, NULL),
	(23, 2, 10, NULL, NULL),
	(24, 2, 11, NULL, NULL),
	(25, 2, 12, NULL, NULL),
	(26, 2, 13, NULL, NULL),
	(27, 3, 1, NULL, NULL),
	(28, 3, 2, NULL, NULL),
	(29, 3, 3, NULL, NULL),
	(30, 3, 4, NULL, NULL),
	(31, 3, 5, NULL, NULL),
	(32, 3, 6, NULL, NULL),
	(33, 3, 7, NULL, NULL),
	(34, 3, 8, NULL, NULL),
	(35, 3, 9, NULL, NULL),
	(36, 3, 10, NULL, NULL),
	(37, 3, 11, NULL, NULL),
	(38, 3, 12, NULL, NULL),
	(39, 3, 13, NULL, NULL),
	(40, 4, 14, NULL, NULL),
	(41, 4, 15, NULL, NULL),
	(42, 4, 16, NULL, NULL),
	(43, 4, 17, NULL, NULL),
	(44, 4, 18, NULL, NULL),
	(45, 4, 19, NULL, NULL),
	(46, 4, 20, NULL, NULL),
	(47, 4, 21, NULL, NULL),
	(48, 5, 22, NULL, NULL),
	(49, 5, 23, NULL, NULL),
	(50, 5, 24, NULL, NULL),
	(51, 6, 25, NULL, NULL),
	(52, 6, 26, NULL, NULL),
	(53, 6, 27, NULL, NULL),
	(54, 6, 28, NULL, NULL),
	(55, 6, 29, NULL, NULL),
	(56, 6, 30, NULL, NULL),
	(57, 6, 31, NULL, NULL),
	(58, 6, 32, NULL, NULL),
	(59, 6, 33, NULL, NULL),
	(60, 6, 34, NULL, NULL),
	(61, 6, 35, NULL, NULL),
	(62, 6, 36, NULL, NULL),
	(63, 6, 37, NULL, NULL),
	(64, 6, 38, NULL, NULL),
	(65, 7, 25, NULL, NULL),
	(66, 7, 26, NULL, NULL),
	(67, 7, 27, NULL, NULL),
	(68, 7, 28, NULL, NULL),
	(69, 7, 29, NULL, NULL),
	(70, 7, 30, NULL, NULL),
	(71, 7, 31, NULL, NULL),
	(72, 7, 32, NULL, NULL),
	(73, 7, 33, NULL, NULL),
	(74, 7, 34, NULL, NULL),
	(75, 7, 35, NULL, NULL),
	(76, 7, 36, NULL, NULL),
	(77, 7, 37, NULL, NULL),
	(78, 7, 38, NULL, NULL),
	(79, 8, 39, NULL, NULL),
	(80, 8, 40, NULL, NULL),
	(81, 8, 41, NULL, NULL);
/*!40000 ALTER TABLE `machine_products` ENABLE KEYS */;

-- Dumping structure for table coffeebag.machine_questions
DROP TABLE IF EXISTS `machine_questions`;
CREATE TABLE IF NOT EXISTS `machine_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `machine_questions_machine_id_question_id_index` (`machine_id`,`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table coffeebag.machine_questions: ~109 rows (approximately)
DELETE FROM `machine_questions`;
/*!40000 ALTER TABLE `machine_questions` DISABLE KEYS */;
INSERT INTO `machine_questions` (`id`, `machine_id`, `question_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL),
	(2, 1, 2, NULL, NULL),
	(3, 1, 3, NULL, NULL),
	(4, 1, 4, NULL, NULL),
	(5, 1, 5, NULL, NULL),
	(6, 1, 6, NULL, NULL),
	(7, 1, 7, NULL, NULL),
	(8, 1, 8, NULL, NULL),
	(9, 1, 9, NULL, NULL),
	(10, 1, 10, NULL, NULL),
	(11, 1, 11, NULL, NULL),
	(12, 1, 12, NULL, NULL),
	(13, 1, 13, NULL, NULL),
	(14, 1, 14, NULL, NULL),
	(15, 1, 15, NULL, NULL),
	(16, 1, 16, NULL, NULL),
	(17, 2, 1, NULL, NULL),
	(18, 2, 2, NULL, NULL),
	(19, 2, 3, NULL, NULL),
	(20, 2, 4, NULL, NULL),
	(21, 2, 5, NULL, NULL),
	(22, 2, 6, NULL, NULL),
	(23, 2, 7, NULL, NULL),
	(24, 2, 8, NULL, NULL),
	(25, 2, 9, NULL, NULL),
	(26, 2, 10, NULL, NULL),
	(27, 2, 11, NULL, NULL),
	(28, 2, 12, NULL, NULL),
	(29, 2, 13, NULL, NULL),
	(30, 2, 14, NULL, NULL),
	(31, 2, 15, NULL, NULL),
	(32, 2, 16, NULL, NULL),
	(33, 3, 1, NULL, NULL),
	(34, 3, 2, NULL, NULL),
	(35, 3, 3, NULL, NULL),
	(36, 3, 4, NULL, NULL),
	(37, 3, 5, NULL, NULL),
	(38, 3, 6, NULL, NULL),
	(39, 3, 7, NULL, NULL),
	(40, 3, 8, NULL, NULL),
	(41, 3, 9, NULL, NULL),
	(42, 3, 10, NULL, NULL),
	(43, 3, 11, NULL, NULL),
	(44, 3, 12, NULL, NULL),
	(45, 3, 13, NULL, NULL),
	(46, 3, 14, NULL, NULL),
	(47, 3, 15, NULL, NULL),
	(48, 3, 16, NULL, NULL),
	(49, 4, 17, NULL, NULL),
	(50, 4, 18, NULL, NULL),
	(51, 4, 19, NULL, NULL),
	(52, 4, 20, NULL, NULL),
	(53, 4, 21, NULL, NULL),
	(54, 4, 22, NULL, NULL),
	(55, 4, 23, NULL, NULL),
	(56, 4, 24, NULL, NULL),
	(57, 4, 25, NULL, NULL),
	(58, 4, 26, NULL, NULL),
	(59, 4, 27, NULL, NULL),
	(60, 4, 28, NULL, NULL),
	(61, 4, 29, NULL, NULL),
	(62, 5, 30, NULL, NULL),
	(63, 5, 31, NULL, NULL),
	(64, 5, 32, NULL, NULL),
	(65, 5, 33, NULL, NULL),
	(66, 5, 34, NULL, NULL),
	(67, 5, 35, NULL, NULL),
	(68, 5, 36, NULL, NULL),
	(69, 5, 37, NULL, NULL),
	(70, 5, 38, NULL, NULL),
	(71, 5, 39, NULL, NULL),
	(72, 5, 40, NULL, NULL),
	(73, 5, 41, NULL, NULL),
	(74, 5, 42, NULL, NULL),
	(75, 6, 43, NULL, NULL),
	(76, 6, 44, NULL, NULL),
	(77, 6, 45, NULL, NULL),
	(78, 6, 46, NULL, NULL),
	(79, 6, 47, NULL, NULL),
	(80, 6, 48, NULL, NULL),
	(81, 6, 49, NULL, NULL),
	(82, 6, 50, NULL, NULL),
	(83, 6, 51, NULL, NULL),
	(84, 6, 52, NULL, NULL),
	(85, 6, 53, NULL, NULL),
	(86, 6, 54, NULL, NULL),
	(87, 6, 55, NULL, NULL),
	(88, 7, 43, NULL, NULL),
	(89, 7, 44, NULL, NULL),
	(90, 7, 45, NULL, NULL),
	(91, 7, 46, NULL, NULL),
	(92, 7, 47, NULL, NULL),
	(93, 7, 48, NULL, NULL),
	(94, 7, 49, NULL, NULL),
	(95, 7, 50, NULL, NULL),
	(96, 7, 51, NULL, NULL),
	(97, 7, 52, NULL, NULL),
	(98, 7, 53, NULL, NULL),
	(99, 7, 54, NULL, NULL),
	(100, 7, 55, NULL, NULL),
	(101, 8, 56, NULL, NULL),
	(102, 8, 57, NULL, NULL),
	(103, 8, 58, NULL, NULL),
	(104, 8, 59, NULL, NULL),
	(105, 8, 60, NULL, NULL),
	(106, 8, 61, NULL, NULL),
	(107, 8, 62, NULL, NULL),
	(108, 8, 63, NULL, NULL),
	(109, 8, 64, NULL, NULL);
/*!40000 ALTER TABLE `machine_questions` ENABLE KEYS */;

-- Dumping structure for table coffeebag.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table coffeebag.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table coffeebag.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table coffeebag.products: ~41 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Product 1', '', NULL, NULL),
	(2, 'Product 2', '', NULL, NULL),
	(3, 'Product 3', '', NULL, NULL),
	(4, 'Product 4', '', NULL, NULL),
	(5, 'Product 5', '', NULL, NULL),
	(6, 'Product 6', '', NULL, NULL),
	(7, 'Product 7', '', NULL, NULL),
	(8, 'Product 8', '', NULL, NULL),
	(9, 'Product 9', '', NULL, NULL),
	(10, 'Product 10', '', NULL, NULL),
	(11, 'Product 11', '', NULL, NULL),
	(12, 'Product 12', '', NULL, NULL),
	(13, 'Product 13', '', NULL, NULL),
	(14, 'Product 14', '', NULL, NULL),
	(15, 'Product 15', '', NULL, NULL),
	(16, 'Product 16', '', NULL, NULL),
	(17, 'Product 17', '', NULL, NULL),
	(18, 'Product 18', '', NULL, NULL),
	(19, 'Product 19', '', NULL, NULL),
	(20, 'Product 20', '', NULL, NULL),
	(21, 'Product 21', '', NULL, NULL),
	(22, 'Product 22', '', NULL, NULL),
	(23, 'Product 23', '', NULL, NULL),
	(24, 'Product 24', '', NULL, NULL),
	(25, 'Product 25', '', NULL, NULL),
	(26, 'Product 26', '', NULL, NULL),
	(27, 'Product 27', '', NULL, NULL),
	(28, 'Product 28', '', NULL, NULL),
	(29, 'Product 29', '', NULL, NULL),
	(30, 'Product 30', '', NULL, NULL),
	(31, 'Product 31', '', NULL, NULL),
	(32, 'Product 32', '', NULL, NULL),
	(33, 'Product 33', '', NULL, NULL),
	(34, 'Product 34', '', NULL, NULL),
	(35, 'Product 35', '', NULL, NULL),
	(36, 'Product 36', '', NULL, NULL),
	(37, 'Product 37', '', NULL, NULL),
	(38, 'Product 38', '', NULL, NULL),
	(39, 'Product 39', '', NULL, NULL),
	(40, 'Product 40', '', NULL, NULL),
	(41, 'Product 41', '', NULL, NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table coffeebag.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table coffeebag.questions: ~64 rows (approximately)
DELETE FROM `questions`;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Question 1', '', NULL, NULL),
	(2, 'Question 2', '', NULL, NULL),
	(3, 'Question 3', '', NULL, NULL),
	(4, 'Question 4', '', NULL, NULL),
	(5, 'Question 5', '', NULL, NULL),
	(6, 'Question 6', '', NULL, NULL),
	(7, 'Question 7', '', NULL, NULL),
	(8, 'Question 8', '', NULL, NULL),
	(9, 'Question 9', '', NULL, NULL),
	(10, 'Question 10', '', NULL, NULL),
	(11, 'Question 11', '', NULL, NULL),
	(12, 'Question 12', '', NULL, NULL),
	(13, 'Question 13', '', NULL, NULL),
	(14, 'Question 14', '', NULL, NULL),
	(15, 'Question 15', '', NULL, NULL),
	(16, 'Question 16', '', NULL, NULL),
	(17, 'Question 17', '', NULL, NULL),
	(18, 'Question 18', '', NULL, NULL),
	(19, 'Question 19', '', NULL, NULL),
	(20, 'Question 20', '', NULL, NULL),
	(21, 'Question 21', '', NULL, NULL),
	(22, 'Question 22', '', NULL, NULL),
	(23, 'Question 23', '', NULL, NULL),
	(24, 'Question 24', '', NULL, NULL),
	(25, 'Question 25', '', NULL, NULL),
	(26, 'Question 26', '', NULL, NULL),
	(27, 'Question 27', '', NULL, NULL),
	(28, 'Question 28', '', NULL, NULL),
	(29, 'Question 29', '', NULL, NULL),
	(30, 'Question 30', '', NULL, NULL),
	(31, 'Question 31', '', NULL, NULL),
	(32, 'Question 32', '', NULL, NULL),
	(33, 'Question 33', '', NULL, NULL),
	(34, 'Question 34', '', NULL, NULL),
	(35, 'Question 35', '', NULL, NULL),
	(36, 'Question 36', '', NULL, NULL),
	(37, 'Question 37', '', NULL, NULL),
	(38, 'Question 38', '', NULL, NULL),
	(39, 'Question 39', '', NULL, NULL),
	(40, 'Question 40', '', NULL, NULL),
	(41, 'Question 41', '', NULL, NULL),
	(42, 'Question 42', '', NULL, NULL),
	(43, 'Question 43', '', NULL, NULL),
	(44, 'Question 44', '', NULL, NULL),
	(45, 'Question 45', '', NULL, NULL),
	(46, 'Question 46', '', NULL, NULL),
	(47, 'Question 47', '', NULL, NULL),
	(48, 'Question 48', '', NULL, NULL),
	(49, 'Question 49', '', NULL, NULL),
	(50, 'Question 50', '', NULL, NULL),
	(51, 'Question 51', '', NULL, NULL),
	(52, 'Question 52', '', NULL, NULL),
	(53, 'Question 53', '', NULL, NULL),
	(54, 'Question 54', '', NULL, NULL),
	(55, 'Question 55', '', NULL, NULL),
	(56, 'Question 56', '', NULL, NULL),
	(57, 'Question 57', '', NULL, NULL),
	(58, 'Question 58', '', NULL, NULL),
	(59, 'Question 59', '', NULL, NULL),
	(60, 'Question 60', '', NULL, NULL),
	(61, 'Question 61', '', NULL, NULL),
	(62, 'Question 62', '', NULL, NULL),
	(63, 'Question 63', '', NULL, NULL),
	(64, 'Question 64', '', NULL, NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping structure for table coffeebag.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table coffeebag.users: ~4 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
	(1, 'Bobby Rodriguez', 'bobby', NULL, '$2y$10$pTK4FMecTYXXSYjVylv9YOEz93GGBqCZkAqKqZc4bQvznHAb9pnMK', 'QVWWlf0t4DoG8jqSliblHOMnGiSRUOMoNcqsKcbsPoA59wml76JsBHwhgA6Z', 'admin', '2017-04-30 08:28:50', '2017-05-05 04:09:10'),
	(2, 'Hiroki Matsumoto', 'hiroki', NULL, '$2y$10$i0gCtQhrm4Ch0u2JTFAu2ezVR2mcYdAiK3cFuZtdsTaVbAdKqujj6', 'I9ooeLS94DeoKDs4Y6EBt4sDuWNCvQ8BCO7uNj1Kj44r0h4yySE9r49rplR5', '', '2017-04-30 08:29:10', '2017-05-05 03:35:43'),
	(7, 'aa aa', 'aaaaaa', NULL, '$2y$10$QitSONwuiVE3ZtSZJ3LwQu0Yqu4bnlt8UPzo/YOVoJ6VjGrkCU.yS', 'VTc4U3UNrrvFgdyGwulvZduoRrJBIIG16s9aAruWcoJ8d3Qqpp1GcfcvULwl', '', '2017-05-05 04:08:35', '2017-05-05 04:10:45'),
	(8, 'bb bb', 'bbbbbb', NULL, '$2y$10$Tu9W1SmnP1AkBqKyUaiYhupeQI85UuOXJKG759nCPBVcA.5vvYDBe', 'sKOtCYvWH6zDP1gs9ZxMOaQAo6IbbNVeNGIY8Cx7yMpnODZcO9nsLJ1gmM5D', '', '2017-05-05 04:09:03', '2017-05-05 04:11:03'),
	(10, 'ccc ccc', 'cccccc', NULL, '$2y$10$Drf91Ymy/naZFx1044VRZu7GBSsEfJBa5w2HAmnLxdrVVSpWHxO9i', NULL, '', '2017-05-06 23:08:21', '2017-05-06 23:08:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table coffeebag.weights
DROP TABLE IF EXISTS `weights`;
CREATE TABLE IF NOT EXISTS `weights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `total` float unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `machine_product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `weights_user_id_machine_product_id_created_at_index` (`user_id`,`machine_product_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table coffeebag.weights: ~0 rows (approximately)
DELETE FROM `weights`;
/*!40000 ALTER TABLE `weights` DISABLE KEYS */;
INSERT INTO `weights` (`id`, `user_id`, `total`, `count`, `machine_product_id`, `created_at`, `updated_at`) VALUES
	(34, 7, 5, 2, 1, '2017-05-05 04:09:56', '2017-05-05 04:09:56'),
	(35, 1, 123.46, 34, 1, '2017-05-06 23:07:23', '2017-05-06 23:07:23');
/*!40000 ALTER TABLE `weights` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
