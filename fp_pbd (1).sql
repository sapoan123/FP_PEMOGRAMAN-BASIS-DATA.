-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 03:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fp_pbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminuser`
--

CREATE TABLE `adminuser` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminuser`
--

INSERT INTO `adminuser` (`id`, `name`, `email`, `password`) VALUES
(1, 'Budi', 'budi@example.com', 'pass123'),
(2, 'Santi', 'santi@example.com', 'pass123');

-- --------------------------------------------------------

--
-- Table structure for table `big_products`
--

CREATE TABLE `big_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Elektronik'),
(2, 'Fashion'),
(3, 'Makanan'),
(4, 'Kesehatan'),
(5, 'Olahraga');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_users_log`
--

CREATE TABLE `deleted_users_log` (
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deleted_users_log`
--

INSERT INTO `deleted_users_log` (`user_id`, `name`, `deleted_at`) VALUES
(6, 'ilham', '2025-06-26');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `order_date`, `quantity`, `status`) VALUES
(1, 1, 12, '2025-06-20 10:00:00', 2, 'shipping'),
(2, 2, 3, '2025-06-20 11:00:00', 1, 'waiting confirm'),
(3, 3, 4, '2025-06-20 12:00:00', 4, 'shipping'),
(4, 4, 1, '2025-06-20 13:00:00', 3, 'shipping'),
(5, 5, 44, '2025-06-20 14:00:00', 2, 'shipping'),
(6, 5, 55, '2025-06-20 20:45:20', 50, 'shipping'),
(7, 1, 22, '2025-06-27 22:09:57', 90, 'shipping'),
(8, 1, 2, '2025-06-27 19:49:29', 23, 'shipping'),
(9, 7, 1, '2025-07-02 14:49:46', 50, 'shipping'),
(10, 4, 43, '2025-07-04 20:58:36', 2, 'shipping'),
(11, 1, 2, '2025-07-04 20:58:36', 1, 'waiting confirm');

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `trg_after_insert_order` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
  INSERT INTO order_log (order_id, action, action_time) 
  VALUES (NEW.id, 'INSERTED', NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_log`
--

CREATE TABLE `order_log` (
  `order_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_log`
--

INSERT INTO `order_log` (`order_id`, `action`, `action_time`) VALUES
(7, 'INSERTED', '2025-06-26'),
(8, 'INSERTED', '2025-06-27'),
(9, 'INSERTED', '2025-07-02'),
(10, 'INSERTED', '2025-07-04'),
(11, 'INSERTED', '2025-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`, `category_id`) VALUES
(1, 'Smartphone Z1', 3500000.00, 750, 1),
(2, 'Kaos Hitam', 100000.00, 4, 2),
(3, 'Keripik Kentang', 25000.00, 199, 3),
(4, 'Vitamin D', 60000.00, 76, 4),
(5, 'Sepatu Basket', 450000.00, 30, 2),
(6, 'Thermometer Inframerah', 765000.00, 49, 4),
(7, 'Smartphone Pro Max', 127000.00, 37, 1),
(8, 'Nugget Ayam Crispy', 665000.00, 70, 3),
(9, 'Nugget Ayam Crispy', 895000.00, 71, 3),
(10, 'Sepeda Lipat Sport', 436000.00, 26, 5),
(11, 'Sepeda Lipat Sport', 1000.00, 12, 5),
(12, 'Popcorn Caramel', 345000.00, 48, 3),
(13, 'Thermometer Inframerah', 445000.00, 18, 4),
(14, 'Coklat Kacang Crunchy', 842000.00, 98, 3),
(15, 'Topi Baseball', 971000.00, 46, 2),
(16, 'Celana Cargo Pria', 11000.00, 82, 2),
(17, 'Powerbank Slim 20000mAh', 332000.00, 63, 1),
(18, 'Powerbank Slim 20000mAh', 107000.00, 48, 1),
(19, 'Powerbank Slim 20000mAh', 839000.00, 82, 1),
(20, 'Popcorn Caramel', 227000.00, 99, 3),
(21, 'Kaos Polos Putih', 162000.00, 32, 2),
(22, 'Wireless Earbuds Z2', 225000.00, 64, 1),
(23, 'Roti Gandum Premium', 208000.00, 45, 3),
(24, 'Roti Gandum Premium', 79000.00, 72, 3),
(25, 'Jaket Parasut', 521000.00, 11, 2),
(26, 'Jersey Klub Bola', 270000.00, 9, 5),
(27, 'Kapsul Herbal Alami', 591000.00, 27, 4),
(28, 'Permen Susu Manis', 931000.00, 93, 3),
(29, 'Jersey Klub Bola', 571000.00, 61, 5),
(30, 'Topi Baseball', 660000.00, 16, 2),
(31, 'Sepatu Lari Ringan', 396000.00, 30, 5),
(32, 'Celana Cargo Pria', 592000.00, 52, 2),
(33, 'Jersey Klub Bola', 21000.00, 65, 5),
(34, 'Powerbank Slim 20000mAh', 442000.00, 90, 1),
(35, 'Smartphone Pro Max', 34000.00, 87, 1),
(36, 'Jaket Parasut', 963000.00, 24, 2),
(37, 'Topi Baseball', 689000.00, 33, 2),
(38, 'Minuman Coklat Dingin', 321000.00, 22, 3),
(39, 'Smartwatch UltraFit', 438000.00, 31, 1),
(40, 'Sneakers Canvas', 249000.00, 71, 2),
(41, 'Minyak Telon Plus', 62000.00, 33, 4),
(42, 'Coklat Kacang Crunchy', 296000.00, 16, 3),
(43, 'Bola Voli', 590000.00, 75, 5),
(44, 'Smartwatch UltraFit', 591000.00, 10, 1),
(45, 'Sepatu Lari Ringan', 887000.00, 47, 5),
(46, 'Kapsul Herbal Alami', 413000.00, 45, 4),
(47, 'Sepatu Lari Ringan', 123000.00, 76, 5),
(48, 'Minuman Coklat Dingin', 757000.00, 39, 3),
(49, 'Obat Demam Dewasa', 922000.00, 6, 4),
(50, 'Nugget Ayam Crispy', 138000.00, 72, 3),
(51, 'Kamera Mirrorless Lite', 698000.00, 60, 1),
(52, 'Sepatu Lari Ringan', 264000.00, 60, 5),
(53, 'Laptop AeroBook', 275000.00, 87, 1),
(54, 'Permen Susu Manis', 74000.00, 63, 3),
(55, 'Sepatu Lari Ringan', 162000.00, 0, 5),
(56, 'Laptop AeroBook', 864000.00, 59, 1),
(57, 'Kemeja Linen', 270000.00, 82, 2),
(58, 'Kemeja Linen', 642000.00, 55, 2),
(59, 'Jersey Klub Bola', 639000.00, 96, 5),
(60, 'Jersey Klub Bola', 275000.00, 30, 5),
(61, 'Masker KF94', 829000.00, 9, 4),
(62, 'Jersey Klub Bola', 0.00, 95, 5),
(63, 'Thermometer Inframerah', 916000.00, 12, 4),
(64, 'Resistance Band', 503000.00, 13, 5),
(65, 'Smartphone Pro Max', 417000.00, 66, 1),
(66, 'Smartphone Pro Max', 347000.00, 53, 1),
(67, 'Nugget Ayam Crispy', 556000.00, 4, 3),
(68, 'Popcorn Caramel', 854000.00, 83, 3),
(69, 'Popcorn Caramel', 31000.00, 13, 3),
(70, 'Nugget Ayam Crispy', 613000.00, 37, 3),
(71, 'Resistance Band', 930000.00, 35, 5),
(72, 'Sepatu Lari Ringan', 443000.00, 27, 5),
(73, 'Bola Voli', 728000.00, 24, 5),
(74, 'Bola Voli', 910000.00, 6, 5),
(75, 'Roti Gandum Premium', 281000.00, 65, 3),
(76, 'Kemeja Linen', 799000.00, 3, 2),
(77, 'Minyak Telon Plus', 414000.00, 54, 4),
(78, 'Roti Gandum Premium', 487000.00, 77, 3),
(79, 'Jaket Parasut', 691000.00, 78, 2),
(80, 'Minyak Telon Plus', 639000.00, 41, 4),
(81, 'Laptop AeroBook', 229000.00, 23, 1),
(82, 'Popcorn Caramel', 869000.00, 8, 3),
(83, 'Minyak Telon Plus', 794000.00, 12, 4),
(84, 'Kamera Mirrorless Lite', 118000.00, 2, 1),
(85, 'Masker KF94', 194000.00, 61, 4),
(86, 'Nugget Ayam Crispy', 187000.00, 8, 3),
(87, 'Thermometer Inframerah', 460000.00, 100, 4),
(88, 'Permen Susu Manis', 874000.00, 61, 3),
(89, 'Kaos Polos Putih', 486000.00, 5, 2),
(90, 'Thermometer Inframerah', 111000.00, 52, 4),
(91, 'Topi Baseball', 914000.00, 36, 2),
(92, 'Smartphone Pro Max', 641000.00, 74, 1),
(93, 'Minyak Telon Plus', 799000.00, 14, 4),
(94, 'Kaos Polos Putih', 398000.00, 83, 2),
(95, 'Bola Voli', 987000.00, 49, 5),
(96, 'Minuman Coklat Dingin', 537000.00, 37, 3),
(97, 'Kaos Polos Putih', 397000.00, 95, 2),
(98, 'Permen Susu Manis', 847000.00, 55, 3),
(99, 'Laptop AeroBook', 511000.00, 96, 1),
(100, 'Sneakers Canvas', 715000.00, 74, 2),
(101, 'Roti Gandum Premium', 50000.00, 63, 3),
(102, 'Bola Voli', 297000.00, 34, 5),
(103, 'Kapsul Herbal Alami', 915000.00, 5, 4),
(104, 'Nugget Ayam Crispy', 776000.00, 17, 3),
(105, 'Permen Susu Manis', 120000.00, 87, 3),
(106, 'Raket Tenis Fiber', 429000.00, 34, 5),
(107, 'Kemeja Linen', 593000.00, 11, 2),
(108, 'Masker KF94', 928000.00, 34, 4),
(109, 'Jersey Klub Bola', 387000.00, 73, 5),
(110, 'Coklat Kacang Crunchy', 839000.00, 11, 3),
(111, 'Powerbank Slim 20000mAh', 596000.00, 82, 1),
(112, 'Kemeja Linen', 599000.00, 37, 2),
(113, 'Smartphone Pro Max', 266000.00, 12, 1),
(114, 'Masker KF94', 973000.00, 53, 4),
(115, 'Kapsul Herbal Alami', 322000.00, 99, 4),
(116, 'Resistance Band', 922000.00, 38, 5),
(117, 'Wireless Earbuds Z2', 414000.00, 7, 1),
(118, 'Smartphone Pro Max', 455000.00, 90, 1),
(119, 'Powerbank Slim 20000mAh', 694000.00, 9, 1),
(120, 'Celana Cargo Pria', 419000.00, 62, 2),
(121, 'Raket Tenis Fiber', 544000.00, 15, 5),
(122, 'Smartphone Pro Max', 896000.00, 38, 1),
(123, 'Powerbank Slim 20000mAh', 342000.00, 39, 1),
(124, 'Jersey Klub Bola', 32000.00, 13, 5),
(125, 'Coklat Kacang Crunchy', 280000.00, 93, 3),
(126, 'Obat Demam Dewasa', 583000.00, 34, 4),
(127, 'Sepatu Lari Ringan', 269000.00, 53, 5),
(128, 'Sepatu Lari Ringan', 369000.00, 14, 5),
(129, 'Popcorn Caramel', 41000.00, 20, 3),
(130, 'Resistance Band', 102000.00, 29, 5),
(131, 'Smartwatch UltraFit', 761000.00, 30, 1),
(132, 'Kaos Polos Putih', 19000.00, 72, 2),
(133, 'Roti Gandum Premium', 54000.00, 68, 3),
(134, 'Smartwatch UltraFit', 165000.00, 99, 1),
(135, 'Coklat Kacang Crunchy', 272000.00, 7, 3),
(136, 'Popcorn Caramel', 189000.00, 93, 3),
(137, 'Wireless Earbuds Z2', 63000.00, 1, 1),
(138, 'Raket Tenis Fiber', 454000.00, 69, 5),
(139, 'Laptop AeroBook', 740000.00, 18, 1),
(140, 'Thermometer Inframerah', 103000.00, 5, 4),
(141, 'Jersey Klub Bola', 452000.00, 95, 5),
(142, 'Kemeja Linen', 838000.00, 24, 2),
(143, 'Minyak Telon Plus', 871000.00, 66, 4),
(144, 'Masker KF94', 882000.00, 28, 4),
(145, 'Kapsul Herbal Alami', 131000.00, 5, 4),
(146, 'Sepeda Lipat Sport', 473000.00, 41, 5),
(147, 'Minuman Coklat Dingin', 860000.00, 14, 3),
(148, 'Smartwatch UltraFit', 688000.00, 50, 1),
(149, 'Jaket Parasut', 403000.00, 46, 2),
(150, 'Smartwatch UltraFit', 580000.00, 5, 1),
(151, 'Nugget Ayam Crispy', 561000.00, 24, 3),
(152, 'Permen Susu Manis', 662000.00, 80, 3),
(153, 'Sepatu Lari Ringan', 871000.00, 65, 5),
(154, 'Obat Demam Dewasa', 165000.00, 20, 4),
(155, 'Minuman Coklat Dingin', 191000.00, 83, 3),
(156, 'Nugget Ayam Crispy', 426000.00, 52, 3),
(157, 'Kemeja Linen', 648000.00, 54, 2),
(158, 'Kapsul Herbal Alami', 773000.00, 92, 4),
(159, 'Jaket Parasut', 860000.00, 73, 2),
(160, 'Smartphone Pro Max', 476000.00, 98, 1),
(161, 'Popcorn Caramel', 616000.00, 87, 3),
(162, 'Permen Susu Manis', 743000.00, 20, 3),
(163, 'Vitamin B Kompleks', 266000.00, 5, 4),
(164, 'Coklat Kacang Crunchy', 137000.00, 40, 3),
(165, 'Minuman Coklat Dingin', 712000.00, 50, 3),
(166, 'Sneakers Canvas', 139000.00, 100, 2),
(167, 'Minuman Coklat Dingin', 197000.00, 68, 3),
(168, 'Sepeda Lipat Sport', 431000.00, 26, 5),
(169, 'Raket Tenis Fiber', 53000.00, 64, 5),
(170, 'Laptop AeroBook', 285000.00, 59, 1),
(171, 'Kamera Mirrorless Lite', 531000.00, 4, 1),
(172, 'Minuman Coklat Dingin', 369000.00, 37, 3),
(173, 'Minyak Telon Plus', 708000.00, 79, 4),
(174, 'Resistance Band', 5000.00, 97, 5),
(175, 'Raket Tenis Fiber', 609000.00, 40, 5),
(176, 'Kamera Mirrorless Lite', 439000.00, 46, 1),
(177, 'Jersey Klub Bola', 452000.00, 85, 5),
(178, 'Sepeda Lipat Sport', 662000.00, 74, 5),
(179, 'Vitamin B Kompleks', 620000.00, 74, 4),
(180, 'Sepeda Lipat Sport', 145000.00, 95, 5),
(181, 'Topi Baseball', 496000.00, 44, 2),
(182, 'Vitamin B Kompleks', 520000.00, 26, 4),
(183, 'Kapsul Herbal Alami', 221000.00, 46, 4),
(184, 'Thermometer Inframerah', 667000.00, 24, 4),
(185, 'Smartphone Pro Max', 122000.00, 25, 1),
(186, 'Sepatu Lari Ringan', 980000.00, 40, 5),
(187, 'Smartwatch UltraFit', 362000.00, 18, 1),
(188, 'Masker KF94', 770000.00, 57, 4),
(189, 'Permen Susu Manis', 35000.00, 42, 3),
(190, 'Sepatu Lari Ringan', 714000.00, 4, 5),
(191, 'Smartphone Pro Max', 116000.00, 47, 1),
(192, 'Jersey Klub Bola', 68000.00, 19, 5),
(193, 'Vitamin B Kompleks', 21000.00, 1, 4),
(194, 'Resistance Band', 755000.00, 63, 5),
(195, 'Jersey Klub Bola', 515000.00, 33, 5),
(196, 'Wireless Earbuds Z2', 637000.00, 9, 1),
(197, 'Nugget Ayam Crispy', 848000.00, 43, 3),
(198, 'Roti Gandum Premium', 541000.00, 73, 3),
(199, 'Resistance Band', 866000.00, 4, 5),
(200, 'Minuman Coklat Dingin', 337000.00, 24, 3),
(201, 'Smartphone Pro Max', 630000.00, 13, 1),
(202, 'Obat Demam Dewasa', 809000.00, 49, 4),
(203, 'Sepatu Lari Ringan', 568000.00, 32, 5),
(204, 'Jersey Klub Bola', 331000.00, 51, 5),
(205, 'Coklat Kacang Crunchy', 671000.00, 24, 3),
(206, 'Laptop AeroBook', 392000.00, 41, 1),
(207, 'Sepeda Lipat Sport', 224000.00, 30, 5),
(208, 'Vitamin B Kompleks', 177000.00, 54, 4),
(209, 'Laptop AeroBook', 592000.00, 31, 1),
(210, 'Thermometer Inframerah', 764000.00, 43, 4),
(211, 'Sepeda Lipat Sport', 246000.00, 36, 5),
(212, 'Smartphone Pro Max', 483000.00, 7, 1),
(213, 'Bola Voli', 918000.00, 30, 5),
(214, 'Thermometer Inframerah', 786000.00, 54, 4),
(215, 'Kemeja Linen', 525000.00, 99, 2),
(216, 'Topi Baseball', 606000.00, 87, 2),
(217, 'Coklat Kacang Crunchy', 506000.00, 49, 3),
(218, 'Bola Voli', 451000.00, 18, 5),
(219, 'Coklat Kacang Crunchy', 764000.00, 64, 3),
(220, 'Jersey Klub Bola', 700000.00, 12, 5),
(221, 'Permen Susu Manis', 438000.00, 31, 3),
(222, 'Smartphone Pro Max', 650000.00, 12, 1),
(223, 'Kapsul Herbal Alami', 467000.00, 69, 4),
(224, 'Smartphone Pro Max', 564000.00, 41, 1),
(225, 'Jaket Parasut', 678000.00, 75, 2),
(226, 'Obat Demam Dewasa', 181000.00, 14, 4),
(227, 'Laptop AeroBook', 171000.00, 89, 1),
(228, 'Sepeda Lipat Sport', 34000.00, 29, 5),
(229, 'Topi Baseball', 890000.00, 14, 2),
(230, 'Sepatu Lari Ringan', 669000.00, 78, 5),
(231, 'Bola Voli', 432000.00, 15, 5),
(232, 'Minuman Coklat Dingin', 257000.00, 16, 3),
(233, 'Kamera Mirrorless Lite', 187000.00, 98, 1),
(234, 'Topi Baseball', 497000.00, 41, 2),
(235, 'Popcorn Caramel', 452000.00, 6, 3),
(236, 'Jersey Klub Bola', 54000.00, 22, 5),
(237, 'Sepeda Lipat Sport', 958000.00, 97, 5),
(238, 'Sepeda Lipat Sport', 354000.00, 26, 5),
(239, 'Celana Cargo Pria', 117000.00, 51, 2),
(240, 'Wireless Earbuds Z2', 666000.00, 99, 1),
(241, 'Sepatu Lari Ringan', 139000.00, 100, 5),
(242, 'Minuman Coklat Dingin', 859000.00, 23, 3),
(243, 'Coklat Kacang Crunchy', 605000.00, 89, 3),
(244, 'Masker KF94', 28000.00, 4, 4),
(245, 'Wireless Earbuds Z2', 860000.00, 99, 1),
(246, 'Topi Baseball', 765000.00, 55, 2),
(247, 'Roti Gandum Premium', 736000.00, 83, 3),
(248, 'Bola Voli', 744000.00, 44, 5),
(249, 'Raket Tenis Fiber', 773000.00, 95, 5),
(250, 'Nugget Ayam Crispy', 63000.00, 52, 3),
(251, 'Celana Cargo Pria', 13000.00, 75, 2),
(252, 'Vitamin B Kompleks', 672000.00, 95, 4),
(253, 'Thermometer Inframerah', 366000.00, 75, 4),
(254, 'Thermometer Inframerah', 263000.00, 87, 4),
(255, 'Coklat Kacang Crunchy', 622000.00, 100, 3),
(256, 'Kamera Mirrorless Lite', 265000.00, 80, 1),
(257, 'Wireless Earbuds Z2', 723000.00, 29, 1),
(258, 'Jaket Parasut', 716000.00, 6, 2),
(259, 'Kamera Mirrorless Lite', 117000.00, 8, 1),
(260, 'Smartwatch UltraFit', 407000.00, 35, 1),
(261, 'Roti Gandum Premium', 257000.00, 60, 3),
(262, 'Smartphone Pro Max', 146000.00, 32, 1),
(263, 'Powerbank Slim 20000mAh', 478000.00, 4, 1),
(264, 'Thermometer Inframerah', 204000.00, 93, 4),
(265, 'Laptop AeroBook', 327000.00, 83, 1),
(266, 'Laptop AeroBook', 858000.00, 52, 1),
(267, 'Jersey Klub Bola', 871000.00, 28, 5),
(268, 'Kapsul Herbal Alami', 292000.00, 75, 4),
(269, 'Bola Voli', 901000.00, 20, 5),
(270, 'Kemeja Linen', 324000.00, 12, 2),
(271, 'Roti Gandum Premium', 309000.00, 70, 3),
(272, 'Minuman Coklat Dingin', 858000.00, 17, 3),
(273, 'Topi Baseball', 314000.00, 11, 2),
(274, 'Roti Gandum Premium', 405000.00, 13, 3),
(275, 'Jaket Parasut', 707000.00, 82, 2),
(276, 'Jersey Klub Bola', 843000.00, 19, 5),
(277, 'Celana Cargo Pria', 998000.00, 68, 2),
(278, 'Kemeja Linen', 103000.00, 99, 2),
(279, 'Vitamin B Kompleks', 637000.00, 91, 4),
(280, 'Masker KF94', 158000.00, 57, 4),
(281, 'Kaos Polos Putih', 684000.00, 94, 2),
(282, 'Masker KF94', 84000.00, 22, 4),
(283, 'Jersey Klub Bola', 622000.00, 89, 5),
(284, 'Coklat Kacang Crunchy', 578000.00, 79, 3),
(285, 'Kamera Mirrorless Lite', 138000.00, 10, 1),
(286, 'Smartwatch UltraFit', 706000.00, 62, 1),
(287, 'Bola Voli', 149000.00, 71, 5),
(288, 'Laptop AeroBook', 947000.00, 5, 1),
(289, 'Topi Baseball', 844000.00, 82, 2),
(290, 'Nugget Ayam Crispy', 778000.00, 5, 3),
(291, 'Raket Tenis Fiber', 699000.00, 70, 5),
(292, 'Topi Baseball', 798000.00, 65, 2),
(293, 'Bola Voli', 159000.00, 45, 5),
(294, 'Masker KF94', 978000.00, 54, 4),
(295, 'Obat Demam Dewasa', 668000.00, 78, 4),
(296, 'Sepeda Lipat Sport', 178000.00, 6, 5),
(297, 'Masker KF94', 24000.00, 82, 4),
(298, 'Kamera Mirrorless Lite', 804000.00, 34, 1),
(299, 'Celana Cargo Pria', 999000.00, 90, 2),
(300, 'Minuman Coklat Dingin', 534000.00, 26, 3),
(301, 'Masker KF94', 467000.00, 90, 4),
(302, 'Powerbank Slim 20000mAh', 174000.00, 84, 1),
(303, 'Thermometer Inframerah', 892000.00, 15, 4),
(304, 'Smartwatch UltraFit', 88000.00, 89, 1),
(305, 'Smartphone Pro Max', 90000.00, 13, 1),
(306, 'Celana Cargo Pria', 876000.00, 23, 2),
(307, 'Minuman Coklat Dingin', 333000.00, 40, 3),
(308, 'Sepatu Lari Ringan', 334000.00, 74, 5),
(309, 'Vitamin B Kompleks', 772000.00, 39, 4),
(310, 'Kapsul Herbal Alami', 804000.00, 23, 4),
(311, 'Kapsul Herbal Alami', 277000.00, 75, 4),
(312, 'Bola Voli', 139000.00, 24, 5),
(313, 'Vitamin B Kompleks', 497000.00, 99, 4),
(314, 'Nugget Ayam Crispy', 202000.00, 8, 3),
(315, 'Minyak Telon Plus', 351000.00, 21, 4),
(316, 'Raket Tenis Fiber', 991000.00, 45, 5),
(317, 'Kemeja Linen', 661000.00, 68, 2),
(318, 'Kemeja Linen', 489000.00, 65, 2),
(319, 'Kapsul Herbal Alami', 243000.00, 49, 4),
(320, 'Vitamin B Kompleks', 965000.00, 81, 4),
(321, 'Smartphone Pro Max', 303000.00, 15, 1),
(322, 'Sepatu Lari Ringan', 760000.00, 89, 5),
(323, 'Smartwatch UltraFit', 392000.00, 12, 1),
(324, 'Jaket Parasut', 984000.00, 2, 2),
(325, 'Kamera Mirrorless Lite', 852000.00, 30, 1),
(326, 'Resistance Band', 695000.00, 42, 5),
(327, 'Resistance Band', 514000.00, 49, 5),
(328, 'Sepeda Lipat Sport', 169000.00, 96, 5),
(329, 'Celana Cargo Pria', 493000.00, 10, 2),
(330, 'Resistance Band', 403000.00, 100, 5),
(331, 'Thermometer Inframerah', 623000.00, 80, 4),
(332, 'Smartphone Pro Max', 2000.00, 86, 1),
(333, 'Kemeja Linen', 462000.00, 72, 2),
(334, 'Powerbank Slim 20000mAh', 467000.00, 92, 1),
(335, 'Smartphone Pro Max', 26000.00, 81, 1),
(336, 'Jersey Klub Bola', 61000.00, 14, 5),
(337, 'Coklat Kacang Crunchy', 56000.00, 94, 3),
(338, 'Minuman Coklat Dingin', 403000.00, 64, 3),
(339, 'Sepeda Lipat Sport', 796000.00, 16, 5),
(340, 'Roti Gandum Premium', 525000.00, 99, 3),
(341, 'Topi Baseball', 566000.00, 70, 2),
(342, 'Kapsul Herbal Alami', 874000.00, 83, 4),
(343, 'Coklat Kacang Crunchy', 76000.00, 100, 3),
(344, 'Thermometer Inframerah', 504000.00, 28, 4),
(345, 'Jersey Klub Bola', 651000.00, 94, 5),
(346, 'Thermometer Inframerah', 796000.00, 62, 4),
(347, 'Minyak Telon Plus', 550000.00, 22, 4),
(348, 'Popcorn Caramel', 182000.00, 44, 3),
(349, 'Thermometer Inframerah', 157000.00, 38, 4),
(350, 'Permen Susu Manis', 361000.00, 6, 3),
(351, 'Powerbank Slim 20000mAh', 111000.00, 38, 1),
(352, 'Roti Gandum Premium', 984000.00, 39, 3),
(353, 'Resistance Band', 681000.00, 25, 5),
(354, 'Smartphone Pro Max', 903000.00, 29, 1),
(355, 'Thermometer Inframerah', 663000.00, 2, 4),
(356, 'Wireless Earbuds Z2', 510000.00, 51, 1),
(357, 'Jersey Klub Bola', 370000.00, 44, 5),
(358, 'Smartwatch UltraFit', 793000.00, 99, 1),
(359, 'Minuman Coklat Dingin', 3000.00, 86, 3),
(360, 'Topi Baseball', 22000.00, 82, 2),
(361, 'Powerbank Slim 20000mAh', 407000.00, 94, 1),
(362, 'Popcorn Caramel', 956000.00, 40, 3),
(363, 'Laptop AeroBook', 235000.00, 26, 1),
(364, 'Nugget Ayam Crispy', 137000.00, 14, 3),
(365, 'Kemeja Linen', 9000.00, 15, 2),
(366, 'Vitamin B Kompleks', 300000.00, 26, 4),
(367, 'Kaos Polos Putih', 253000.00, 6, 2),
(368, 'Popcorn Caramel', 515000.00, 35, 3),
(369, 'Powerbank Slim 20000mAh', 329000.00, 37, 1),
(370, 'Raket Tenis Fiber', 365000.00, 27, 5),
(371, 'Sneakers Canvas', 674000.00, 60, 2),
(372, 'Sepeda Lipat Sport', 882000.00, 59, 5),
(373, 'Jaket Parasut', 154000.00, 100, 2),
(374, 'Roti Gandum Premium', 453000.00, 47, 3),
(375, 'Jersey Klub Bola', 65000.00, 17, 5),
(376, 'Thermometer Inframerah', 649000.00, 10, 4),
(377, 'Popcorn Caramel', 345000.00, 56, 3),
(378, 'Vitamin B Kompleks', 879000.00, 35, 4),
(379, 'Wireless Earbuds Z2', 748000.00, 54, 1),
(380, 'Roti Gandum Premium', 590000.00, 21, 3),
(381, 'Topi Baseball', 804000.00, 86, 2),
(382, 'Resistance Band', 248000.00, 93, 5),
(383, 'Resistance Band', 952000.00, 57, 5),
(384, 'Bola Voli', 467000.00, 16, 5),
(385, 'Sneakers Canvas', 401000.00, 15, 2),
(386, 'Coklat Kacang Crunchy', 904000.00, 28, 3),
(387, 'Minyak Telon Plus', 635000.00, 59, 4),
(388, 'Wireless Earbuds Z2', 754000.00, 68, 1),
(389, 'Kamera Mirrorless Lite', 280000.00, 84, 1),
(390, 'Sneakers Canvas', 102000.00, 83, 2),
(391, 'Minyak Telon Plus', 273000.00, 77, 4),
(392, 'Resistance Band', 461000.00, 24, 5),
(393, 'Raket Tenis Fiber', 71000.00, 48, 5),
(394, 'Wireless Earbuds Z2', 333000.00, 59, 1),
(395, 'Sepeda Lipat Sport', 480000.00, 86, 5),
(396, 'Sepatu Lari Ringan', 686000.00, 51, 5),
(397, 'Minuman Coklat Dingin', 532000.00, 32, 3),
(398, 'Sepeda Lipat Sport', 9000.00, 6, 5),
(399, 'Kaos Polos Putih', 986000.00, 47, 2),
(400, 'Sneakers Canvas', 606000.00, 6, 2),
(401, 'Coklat Kacang Crunchy', 117000.00, 31, 3),
(402, 'Smartwatch UltraFit', 116000.00, 82, 1),
(403, 'Vitamin B Kompleks', 337000.00, 42, 4),
(404, 'Smartphone Pro Max', 226000.00, 88, 1),
(405, 'Kapsul Herbal Alami', 444000.00, 48, 4),
(406, 'Smartwatch UltraFit', 105000.00, 96, 1),
(407, 'Popcorn Caramel', 27000.00, 68, 3),
(408, 'Celana Cargo Pria', 961000.00, 74, 2),
(409, 'Resistance Band', 611000.00, 65, 5),
(410, 'Kemeja Linen', 744000.00, 80, 2),
(411, 'Obat Demam Dewasa', 955000.00, 11, 4),
(412, 'Vitamin B Kompleks', 243000.00, 6, 4),
(413, 'Roti Gandum Premium', 161000.00, 13, 3),
(414, 'Wireless Earbuds Z2', 555000.00, 56, 1),
(415, 'Smartwatch UltraFit', 402000.00, 15, 1),
(416, 'Coklat Kacang Crunchy', 150000.00, 34, 3),
(417, 'Kaos Polos Putih', 858000.00, 99, 2),
(418, 'Topi Baseball', 452000.00, 21, 2),
(419, 'Thermometer Inframerah', 795000.00, 69, 4),
(420, 'Smartphone Pro Max', 115000.00, 49, 1),
(421, 'Smartwatch UltraFit', 77000.00, 84, 1),
(422, 'Raket Tenis Fiber', 382000.00, 17, 5),
(423, 'Vitamin B Kompleks', 894000.00, 48, 4),
(424, 'Kapsul Herbal Alami', 726000.00, 79, 4),
(425, 'Masker KF94', 913000.00, 26, 4),
(426, 'Minuman Coklat Dingin', 604000.00, 53, 3),
(427, 'Sepatu Lari Ringan', 419000.00, 35, 5),
(428, 'Nugget Ayam Crispy', 941000.00, 92, 3),
(429, 'Vitamin B Kompleks', 952000.00, 63, 4),
(430, 'Celana Cargo Pria', 311000.00, 31, 2),
(431, 'Vitamin B Kompleks', 766000.00, 48, 4),
(432, 'Smartphone Pro Max', 755000.00, 77, 1),
(433, 'Roti Gandum Premium', 181000.00, 16, 3),
(434, 'Topi Baseball', 161000.00, 46, 2),
(435, 'Minyak Telon Plus', 691000.00, 61, 4),
(436, 'Sepeda Lipat Sport', 959000.00, 91, 5),
(437, 'Masker KF94', 287000.00, 14, 4),
(438, 'Sepatu Lari Ringan', 735000.00, 79, 5),
(439, 'Obat Demam Dewasa', 119000.00, 83, 4),
(440, 'Obat Demam Dewasa', 351000.00, 79, 4),
(441, 'Sepeda Lipat Sport', 920000.00, 93, 5),
(442, 'Sepatu Lari Ringan', 338000.00, 92, 5),
(443, 'Coklat Kacang Crunchy', 556000.00, 65, 3),
(444, 'Minuman Coklat Dingin', 436000.00, 73, 3),
(445, 'Jaket Parasut', 548000.00, 20, 2),
(446, 'Kaos Polos Putih', 737000.00, 22, 2),
(447, 'Sepatu Lari Ringan', 638000.00, 27, 5),
(448, 'Nugget Ayam Crispy', 259000.00, 39, 3),
(449, 'Kamera Mirrorless Lite', 353000.00, 11, 1),
(450, 'Permen Susu Manis', 277000.00, 62, 3),
(451, 'Celana Cargo Pria', 411000.00, 75, 2),
(452, 'Nugget Ayam Crispy', 621000.00, 46, 3),
(453, 'Jaket Parasut', 833000.00, 37, 2),
(454, 'Jaket Parasut', 691000.00, 86, 2),
(455, 'Celana Cargo Pria', 711000.00, 16, 2),
(456, 'Thermometer Inframerah', 932000.00, 34, 4),
(457, 'Jersey Klub Bola', 178000.00, 82, 5),
(458, 'Nugget Ayam Crispy', 808000.00, 18, 3),
(459, 'Roti Gandum Premium', 883000.00, 52, 3),
(460, 'Bola Voli', 565000.00, 63, 5),
(461, 'Popcorn Caramel', 449000.00, 17, 3),
(462, 'Permen Susu Manis', 205000.00, 23, 3),
(463, 'Permen Susu Manis', 106000.00, 73, 3),
(464, 'Celana Cargo Pria', 38000.00, 1, 2),
(465, 'Jersey Klub Bola', 531000.00, 34, 5),
(466, 'Wireless Earbuds Z2', 152000.00, 29, 1),
(467, 'Bola Voli', 371000.00, 66, 5),
(468, 'Smartwatch UltraFit', 31000.00, 43, 1),
(469, 'Powerbank Slim 20000mAh', 844000.00, 91, 1),
(470, 'Raket Tenis Fiber', 127000.00, 99, 5),
(471, 'Minuman Coklat Dingin', 419000.00, 65, 3),
(472, 'Sepeda Lipat Sport', 471000.00, 75, 5),
(473, 'Celana Cargo Pria', 810000.00, 100, 2),
(474, 'Minuman Coklat Dingin', 870000.00, 27, 3),
(475, 'Thermometer Inframerah', 794000.00, 61, 4),
(476, 'Masker KF94', 172000.00, 60, 4),
(477, 'Popcorn Caramel', 931000.00, 30, 3),
(478, 'Minyak Telon Plus', 656000.00, 66, 4),
(479, 'Jaket Parasut', 732000.00, 9, 2),
(480, 'Kemeja Linen', 127000.00, 72, 2),
(481, 'Powerbank Slim 20000mAh', 382000.00, 55, 1),
(482, 'Nugget Ayam Crispy', 787000.00, 1, 3),
(483, 'Obat Demam Dewasa', 82000.00, 82, 4),
(484, 'Sepatu Lari Ringan', 539000.00, 93, 5),
(485, 'Laptop AeroBook', 275000.00, 60, 1),
(486, 'Smartphone Pro Max', 659000.00, 21, 1),
(487, 'Kamera Mirrorless Lite', 830000.00, 39, 1),
(488, 'Permen Susu Manis', 630000.00, 21, 3),
(489, 'Smartphone Pro Max', 855000.00, 13, 1),
(490, 'Smartwatch UltraFit', 368000.00, 12, 1),
(491, 'Coklat Kacang Crunchy', 981000.00, 64, 3),
(492, 'Sneakers Canvas', 842000.00, 27, 2),
(493, 'Obat Demam Dewasa', 533000.00, 12, 4),
(494, 'Sepatu Lari Ringan', 611000.00, 55, 5),
(495, 'Sepeda Lipat Sport', 667000.00, 72, 5),
(496, 'Roti Gandum Premium', 564000.00, 89, 3),
(497, 'Kapsul Herbal Alami', 597000.00, 14, 4),
(498, 'Sepeda Lipat Sport', 156000.00, 93, 5),
(499, 'Smartwatch UltraFit', 454000.00, 33, 1),
(500, 'Celana Cargo Pria', 215000.00, 85, 2),
(501, 'Popcorn Caramel', 164000.00, 68, 3),
(502, 'Raket Tenis Fiber', 922000.00, 71, 5),
(503, 'Thermometer Inframerah', 256000.00, 15, 4),
(504, 'Jersey Klub Bola', 134000.00, 45, 5),
(505, 'Resistance Band', 245000.00, 2, 5),
(506, 'Topi Baseball', 434000.00, 9, 2),
(507, 'Laptop AeroBook', 35000.00, 38, 1),
(508, 'Thermometer Inframerah', 64000.00, 32, 4),
(509, 'Coklat Kacang Crunchy', 138000.00, 48, 3),
(510, 'Jersey Klub Bola', 245000.00, 93, 5),
(511, 'Resistance Band', 0.00, 78, 5),
(512, 'Sepeda Lipat Sport', 323000.00, 68, 5),
(513, 'Coklat Kacang Crunchy', 947000.00, 63, 3),
(514, 'Jaket Parasut', 906000.00, 88, 2),
(515, 'Minyak Telon Plus', 180000.00, 3, 4),
(516, 'Permen Susu Manis', 636000.00, 54, 3),
(517, 'Obat Demam Dewasa', 719000.00, 100, 4),
(518, 'Bola Voli', 53000.00, 97, 5),
(519, 'Masker KF94', 214000.00, 74, 4),
(520, 'Smartphone Pro Max', 122000.00, 44, 1),
(521, 'Resistance Band', 526000.00, 24, 5),
(522, 'Masker KF94', 863000.00, 31, 4),
(523, 'Sepatu Lari Ringan', 558000.00, 82, 5),
(524, 'Jaket Parasut', 496000.00, 88, 2),
(525, 'Resistance Band', 209000.00, 75, 5),
(526, 'Laptop AeroBook', 737000.00, 10, 1),
(527, 'Kemeja Linen', 19000.00, 25, 2),
(528, 'Smartphone Pro Max', 22000.00, 80, 1),
(529, 'Bola Voli', 12000.00, 63, 5),
(530, 'Kamera Mirrorless Lite', 511000.00, 90, 1),
(531, 'Bola Voli', 311000.00, 48, 5),
(532, 'Minuman Coklat Dingin', 321000.00, 45, 3),
(533, 'Kemeja Linen', 968000.00, 1, 2),
(534, 'Kamera Mirrorless Lite', 295000.00, 91, 1),
(535, 'Minyak Telon Plus', 758000.00, 16, 4),
(536, 'Coklat Kacang Crunchy', 104000.00, 12, 3),
(537, 'Kaos Polos Putih', 354000.00, 66, 2),
(538, 'Kaos Polos Putih', 129000.00, 16, 2),
(539, 'Roti Gandum Premium', 585000.00, 25, 3),
(540, 'Roti Gandum Premium', 307000.00, 95, 3),
(541, 'Vitamin B Kompleks', 142000.00, 42, 4),
(542, 'Vitamin B Kompleks', 87000.00, 42, 4),
(543, 'Resistance Band', 480000.00, 7, 5),
(544, 'Raket Tenis Fiber', 789000.00, 6, 5),
(545, 'Raket Tenis Fiber', 716000.00, 77, 5),
(546, 'Kapsul Herbal Alami', 988000.00, 97, 4),
(547, 'Jersey Klub Bola', 848000.00, 75, 5),
(548, 'Powerbank Slim 20000mAh', 136000.00, 45, 1),
(549, 'Resistance Band', 223000.00, 92, 5),
(550, 'Sepeda Lipat Sport', 550000.00, 16, 5),
(551, 'Laptop AeroBook', 793000.00, 24, 1),
(552, 'Obat Demam Dewasa', 651000.00, 67, 4),
(553, 'Kemeja Linen', 104000.00, 100, 2),
(554, 'Masker KF94', 96000.00, 19, 4),
(555, 'Thermometer Inframerah', 504000.00, 45, 4),
(556, 'Obat Demam Dewasa', 132000.00, 89, 4),
(557, 'Kamera Mirrorless Lite', 606000.00, 40, 1),
(558, 'Kamera Mirrorless Lite', 462000.00, 56, 1),
(559, 'Sneakers Canvas', 374000.00, 94, 2),
(560, 'Permen Susu Manis', 945000.00, 99, 3),
(561, 'Wireless Earbuds Z2', 890000.00, 19, 1),
(562, 'Topi Baseball', 744000.00, 63, 2),
(563, 'Sepatu Lari Ringan', 225000.00, 39, 5),
(564, 'Kaos Polos Putih', 911000.00, 15, 2),
(565, 'Jersey Klub Bola', 303000.00, 19, 5),
(566, 'Wireless Earbuds Z2', 457000.00, 80, 1),
(567, 'Minyak Telon Plus', 443000.00, 26, 4),
(568, 'Sepeda Lipat Sport', 883000.00, 60, 5),
(569, 'Kemeja Linen', 268000.00, 80, 2),
(570, 'Wireless Earbuds Z2', 401000.00, 91, 1),
(571, 'Topi Baseball', 94000.00, 8, 2),
(572, 'Laptop AeroBook', 711000.00, 99, 1),
(573, 'Kapsul Herbal Alami', 403000.00, 18, 4),
(574, 'Thermometer Inframerah', 906000.00, 21, 4),
(575, 'Kemeja Linen', 385000.00, 38, 2),
(576, 'Masker KF94', 866000.00, 15, 4),
(577, 'Laptop AeroBook', 929000.00, 84, 1),
(578, 'Celana Cargo Pria', 804000.00, 86, 2),
(579, 'Resistance Band', 501000.00, 3, 5),
(580, 'Permen Susu Manis', 814000.00, 32, 3),
(581, 'Kamera Mirrorless Lite', 868000.00, 42, 1),
(582, 'Coklat Kacang Crunchy', 891000.00, 30, 3),
(583, 'Bola Voli', 381000.00, 43, 5),
(584, 'Sepatu Lari Ringan', 802000.00, 41, 5),
(585, 'Thermometer Inframerah', 259000.00, 86, 4),
(586, 'Permen Susu Manis', 865000.00, 74, 3),
(587, 'Laptop AeroBook', 948000.00, 2, 1),
(588, 'Kemeja Linen', 374000.00, 88, 2),
(589, 'Jaket Parasut', 455000.00, 35, 2),
(590, 'Topi Baseball', 801000.00, 68, 2),
(591, 'Resistance Band', 120000.00, 20, 5),
(592, 'Masker KF94', 497000.00, 10, 4),
(593, 'Sepatu Lari Ringan', 974000.00, 14, 5),
(594, 'Masker KF94', 791000.00, 71, 4),
(595, 'Kamera Mirrorless Lite', 543000.00, 94, 1),
(596, 'Wireless Earbuds Z2', 251000.00, 80, 1),
(597, 'Topi Baseball', 197000.00, 65, 2),
(598, 'Obat Demam Dewasa', 391000.00, 18, 4),
(599, 'Kapsul Herbal Alami', 429000.00, 47, 4),
(600, 'Powerbank Slim 20000mAh', 601000.00, 81, 1),
(601, 'Jaket Parasut', 609000.00, 11, 2),
(602, 'Vitamin B Kompleks', 284000.00, 25, 4),
(603, 'Kaos Polos Putih', 133000.00, 56, 2),
(604, 'Kaos Polos Putih', 656000.00, 85, 2),
(605, 'Jaket Parasut', 538000.00, 75, 2),
(606, 'Wireless Earbuds Z2', 518000.00, 46, 1),
(607, 'Obat Demam Dewasa', 285000.00, 54, 4),
(608, 'Jersey Klub Bola', 874000.00, 99, 5),
(609, 'Jaket Parasut', 866000.00, 67, 2),
(610, 'Thermometer Inframerah', 367000.00, 68, 4),
(611, 'Celana Cargo Pria', 978000.00, 81, 2),
(612, 'Smartphone Pro Max', 997000.00, 82, 1),
(613, 'Smartphone Pro Max', 895000.00, 37, 1),
(614, 'Kamera Mirrorless Lite', 202000.00, 48, 1),
(615, 'Masker KF94', 117000.00, 11, 4),
(616, 'Wireless Earbuds Z2', 872000.00, 97, 1),
(617, 'Smartphone Pro Max', 719000.00, 43, 1),
(618, 'Sepatu Lari Ringan', 153000.00, 92, 5),
(619, 'Powerbank Slim 20000mAh', 466000.00, 8, 1),
(620, 'Resistance Band', 601000.00, 87, 5),
(621, 'Permen Susu Manis', 421000.00, 13, 3),
(622, 'Celana Cargo Pria', 735000.00, 62, 2),
(623, 'Sepatu Lari Ringan', 105000.00, 89, 5),
(624, 'Powerbank Slim 20000mAh', 698000.00, 12, 1),
(625, 'Coklat Kacang Crunchy', 969000.00, 59, 3),
(626, 'Wireless Earbuds Z2', 979000.00, 65, 1),
(627, 'Celana Cargo Pria', 445000.00, 87, 2),
(628, 'Raket Tenis Fiber', 474000.00, 54, 5),
(629, 'Topi Baseball', 701000.00, 42, 2),
(630, 'Sepatu Lari Ringan', 52000.00, 50, 5),
(631, 'Kaos Polos Putih', 269000.00, 25, 2),
(632, 'Nugget Ayam Crispy', 258000.00, 41, 3),
(633, 'Kaos Polos Putih', 761000.00, 48, 2),
(634, 'Smartwatch UltraFit', 404000.00, 26, 1),
(635, 'Kamera Mirrorless Lite', 987000.00, 100, 1),
(636, 'Bola Voli', 44000.00, 21, 5),
(637, 'Resistance Band', 350000.00, 36, 5),
(638, 'Minyak Telon Plus', 719000.00, 86, 4),
(639, 'Smartwatch UltraFit', 462000.00, 45, 1),
(640, 'Sepeda Lipat Sport', 231000.00, 27, 5),
(641, 'Masker KF94', 56000.00, 10, 4),
(642, 'Sneakers Canvas', 488000.00, 58, 2),
(643, 'Popcorn Caramel', 853000.00, 98, 3),
(644, 'Jaket Parasut', 219000.00, 21, 2),
(645, 'Sneakers Canvas', 229000.00, 33, 2),
(646, 'Resistance Band', 40000.00, 87, 5),
(647, 'Wireless Earbuds Z2', 139000.00, 69, 1),
(648, 'Sepeda Lipat Sport', 488000.00, 78, 5),
(649, 'Jaket Parasut', 136000.00, 69, 2),
(650, 'Smartphone Pro Max', 358000.00, 52, 1),
(651, 'Coklat Kacang Crunchy', 726000.00, 46, 3),
(652, 'Smartphone Pro Max', 310000.00, 20, 1),
(653, 'Kamera Mirrorless Lite', 604000.00, 43, 1),
(654, 'Sneakers Canvas', 352000.00, 1, 2),
(655, 'Resistance Band', 800000.00, 82, 5),
(656, 'Vitamin B Kompleks', 993000.00, 93, 4),
(657, 'Masker KF94', 997000.00, 86, 4),
(658, 'Kemeja Linen', 591000.00, 28, 2),
(659, 'Obat Demam Dewasa', 136000.00, 12, 4),
(660, 'Wireless Earbuds Z2', 920000.00, 16, 1),
(661, 'Kamera Mirrorless Lite', 783000.00, 25, 1),
(662, 'Sepatu Lari Ringan', 112000.00, 97, 5),
(663, 'Roti Gandum Premium', 246000.00, 61, 3),
(664, 'Topi Baseball', 565000.00, 75, 2),
(665, 'Powerbank Slim 20000mAh', 90000.00, 98, 1),
(666, 'Obat Demam Dewasa', 43000.00, 67, 4),
(667, 'Kaos Polos Putih', 572000.00, 75, 2),
(668, 'Powerbank Slim 20000mAh', 974000.00, 48, 1),
(669, 'Permen Susu Manis', 926000.00, 6, 3),
(670, 'Nugget Ayam Crispy', 838000.00, 43, 3),
(671, 'Minuman Coklat Dingin', 691000.00, 38, 3),
(672, 'Sepeda Lipat Sport', 217000.00, 30, 5),
(673, 'Raket Tenis Fiber', 423000.00, 61, 5),
(674, 'Vitamin B Kompleks', 798000.00, 94, 4),
(675, 'Celana Cargo Pria', 648000.00, 80, 2),
(676, 'Powerbank Slim 20000mAh', 593000.00, 78, 1),
(677, 'Smartphone Pro Max', 110000.00, 35, 1),
(678, 'Permen Susu Manis', 738000.00, 72, 3),
(679, 'Topi Baseball', 401000.00, 90, 2),
(680, 'Topi Baseball', 772000.00, 69, 2),
(681, 'Kamera Mirrorless Lite', 445000.00, 54, 1),
(682, 'Kaos Polos Putih', 311000.00, 38, 2),
(683, 'Sepatu Lari Ringan', 797000.00, 45, 5),
(684, 'Resistance Band', 353000.00, 49, 5),
(685, 'Sneakers Canvas', 523000.00, 67, 2),
(686, 'Kapsul Herbal Alami', 948000.00, 19, 4),
(687, 'Powerbank Slim 20000mAh', 912000.00, 8, 1),
(688, 'Vitamin B Kompleks', 329000.00, 46, 4),
(689, 'Kaos Polos Putih', 895000.00, 99, 2),
(690, 'Sneakers Canvas', 598000.00, 20, 2),
(691, 'Laptop AeroBook', 839000.00, 39, 1),
(692, 'Permen Susu Manis', 383000.00, 14, 3),
(693, 'Nugget Ayam Crispy', 655000.00, 53, 3),
(694, 'Thermometer Inframerah', 663000.00, 13, 4),
(695, 'Kapsul Herbal Alami', 519000.00, 91, 4),
(696, 'Bola Voli', 333000.00, 56, 5),
(697, 'Raket Tenis Fiber', 208000.00, 8, 5),
(698, 'Minyak Telon Plus', 521000.00, 94, 4),
(699, 'Powerbank Slim 20000mAh', 63000.00, 32, 1),
(700, 'Kemeja Linen', 536000.00, 89, 2),
(701, 'Jersey Klub Bola', 721000.00, 31, 5),
(702, 'Kemeja Linen', 160000.00, 28, 2),
(703, 'Sepatu Lari Ringan', 517000.00, 67, 5),
(704, 'Kapsul Herbal Alami', 456000.00, 38, 4),
(705, 'Popcorn Caramel', 767000.00, 45, 3),
(706, 'Raket Tenis Fiber', 249000.00, 68, 5),
(707, 'Vitamin B Kompleks', 367000.00, 72, 4),
(708, 'Nugget Ayam Crispy', 728000.00, 95, 3),
(709, 'Permen Susu Manis', 123000.00, 74, 3),
(710, 'Sneakers Canvas', 266000.00, 67, 2),
(711, 'Roti Gandum Premium', 341000.00, 98, 3),
(712, 'Jersey Klub Bola', 561000.00, 50, 5),
(713, 'Masker KF94', 914000.00, 21, 4),
(714, 'Topi Baseball', 124000.00, 25, 2),
(715, 'Jersey Klub Bola', 663000.00, 3, 5),
(716, 'Kamera Mirrorless Lite', 335000.00, 6, 1),
(717, 'Sneakers Canvas', 324000.00, 92, 2),
(718, 'Masker KF94', 0.00, 88, 4),
(719, 'Sneakers Canvas', 993000.00, 31, 2),
(720, 'Permen Susu Manis', 669000.00, 74, 3),
(721, 'Obat Demam Dewasa', 24000.00, 48, 4),
(722, 'Kemeja Linen', 148000.00, 75, 2),
(723, 'Kaos Polos Putih', 938000.00, 24, 2),
(724, 'Kemeja Linen', 905000.00, 59, 2),
(725, 'Laptop AeroBook', 536000.00, 2, 1),
(726, 'Nugget Ayam Crispy', 658000.00, 70, 3),
(727, 'Popcorn Caramel', 472000.00, 19, 3),
(728, 'Coklat Kacang Crunchy', 661000.00, 18, 3),
(729, 'Sepeda Lipat Sport', 713000.00, 97, 5),
(730, 'Masker KF94', 159000.00, 52, 4),
(731, 'Smartwatch UltraFit', 4000.00, 49, 1),
(732, 'Roti Gandum Premium', 598000.00, 31, 3),
(733, 'Thermometer Inframerah', 763000.00, 42, 4),
(734, 'Resistance Band', 463000.00, 99, 5),
(735, 'Minuman Coklat Dingin', 213000.00, 76, 3),
(736, 'Wireless Earbuds Z2', 564000.00, 66, 1),
(737, 'Permen Susu Manis', 517000.00, 8, 3),
(738, 'Sepeda Lipat Sport', 892000.00, 86, 5),
(739, 'Popcorn Caramel', 336000.00, 41, 3),
(740, 'Powerbank Slim 20000mAh', 34000.00, 75, 1),
(741, 'Kapsul Herbal Alami', 712000.00, 80, 4),
(742, 'Sepeda Lipat Sport', 655000.00, 77, 5),
(743, 'Sepeda Lipat Sport', 997000.00, 29, 5),
(744, 'Nugget Ayam Crispy', 157000.00, 93, 3),
(745, 'Smartwatch UltraFit', 350000.00, 89, 1),
(746, 'Kaos Polos Putih', 472000.00, 6, 2),
(747, 'Bola Voli', 711000.00, 42, 5),
(748, 'Sepatu Lari Ringan', 718000.00, 5, 5),
(749, 'Laptop AeroBook', 738000.00, 14, 1),
(750, 'Permen Susu Manis', 188000.00, 20, 3),
(751, 'Celana Cargo Pria', 855000.00, 5, 2),
(752, 'Obat Demam Dewasa', 41000.00, 58, 4),
(753, 'Vitamin B Kompleks', 960000.00, 67, 4),
(754, 'Nugget Ayam Crispy', 958000.00, 1, 3),
(755, 'Powerbank Slim 20000mAh', 100000.00, 39, 1),
(756, 'Kapsul Herbal Alami', 826000.00, 33, 4),
(757, 'Powerbank Slim 20000mAh', 186000.00, 78, 1),
(758, 'Sneakers Canvas', 183000.00, 25, 2),
(759, 'Thermometer Inframerah', 644000.00, 98, 4),
(760, 'Sepeda Lipat Sport', 392000.00, 41, 5),
(761, 'Bola Voli', 475000.00, 38, 5),
(762, 'Coklat Kacang Crunchy', 357000.00, 36, 3),
(763, 'Masker KF94', 257000.00, 86, 4),
(764, 'Permen Susu Manis', 422000.00, 14, 3),
(765, 'Minuman Coklat Dingin', 115000.00, 56, 3),
(766, 'Roti Gandum Premium', 487000.00, 74, 3),
(767, 'Kemeja Linen', 929000.00, 89, 2),
(768, 'Masker KF94', 318000.00, 30, 4),
(769, 'Minuman Coklat Dingin', 975000.00, 77, 3),
(770, 'Bola Voli', 870000.00, 6, 5),
(771, 'Vitamin B Kompleks', 691000.00, 6, 4),
(772, 'Powerbank Slim 20000mAh', 556000.00, 30, 1),
(773, 'Vitamin B Kompleks', 967000.00, 64, 4),
(774, 'Celana Cargo Pria', 585000.00, 48, 2),
(775, 'Thermometer Inframerah', 634000.00, 7, 4),
(776, 'Permen Susu Manis', 197000.00, 32, 3),
(777, 'Smartphone Pro Max', 322000.00, 42, 1),
(778, 'Laptop AeroBook', 764000.00, 21, 1),
(779, 'Vitamin B Kompleks', 185000.00, 69, 4),
(780, 'Raket Tenis Fiber', 522000.00, 97, 5),
(781, 'Celana Cargo Pria', 255000.00, 6, 2),
(782, 'Popcorn Caramel', 349000.00, 63, 3),
(783, 'Wireless Earbuds Z2', 133000.00, 27, 1),
(784, 'Sepeda Lipat Sport', 547000.00, 13, 5),
(785, 'Sepatu Lari Ringan', 58000.00, 46, 5),
(786, 'Laptop AeroBook', 596000.00, 43, 1),
(787, 'Celana Cargo Pria', 958000.00, 62, 2),
(788, 'Sneakers Canvas', 295000.00, 93, 2),
(789, 'Vitamin B Kompleks', 778000.00, 86, 4),
(790, 'Bola Voli', 921000.00, 16, 5),
(791, 'Kamera Mirrorless Lite', 174000.00, 93, 1),
(792, 'Powerbank Slim 20000mAh', 321000.00, 44, 1),
(793, 'Topi Baseball', 129000.00, 39, 2),
(794, 'Roti Gandum Premium', 253000.00, 53, 3),
(795, 'Resistance Band', 442000.00, 77, 5),
(796, 'Coklat Kacang Crunchy', 218000.00, 69, 3),
(797, 'Kapsul Herbal Alami', 959000.00, 21, 4),
(798, 'Laptop AeroBook', 470000.00, 78, 1),
(799, 'Coklat Kacang Crunchy', 682000.00, 36, 3),
(800, 'Minyak Telon Plus', 68000.00, 36, 4),
(801, 'Minuman Coklat Dingin', 233000.00, 80, 3),
(802, 'Kaos Polos Putih', 579000.00, 62, 2),
(803, 'Topi Baseball', 810000.00, 80, 2),
(804, 'Nugget Ayam Crispy', 916000.00, 67, 3),
(805, 'Permen Susu Manis', 864000.00, 55, 3),
(806, 'Smartphone Pro Max', 138000.00, 34, 1),
(807, 'Sneakers Canvas', 534000.00, 91, 2),
(808, 'Resistance Band', 277000.00, 1, 5),
(809, 'Smartwatch UltraFit', 783000.00, 34, 1),
(810, 'Jaket Parasut', 153000.00, 89, 2),
(811, 'Raket Tenis Fiber', 287000.00, 70, 5),
(812, 'Vitamin B Kompleks', 305000.00, 42, 4),
(813, 'Kamera Mirrorless Lite', 547000.00, 90, 1),
(814, 'Jersey Klub Bola', 863000.00, 91, 5),
(815, 'Sepeda Lipat Sport', 810000.00, 31, 5),
(816, 'Wireless Earbuds Z2', 193000.00, 51, 1),
(817, 'Raket Tenis Fiber', 677000.00, 44, 5),
(818, 'Wireless Earbuds Z2', 817000.00, 72, 1),
(819, 'Kamera Mirrorless Lite', 422000.00, 40, 1),
(820, 'Masker KF94', 742000.00, 59, 4),
(821, 'Thermometer Inframerah', 301000.00, 50, 4),
(822, 'Popcorn Caramel', 357000.00, 53, 3),
(823, 'Nugget Ayam Crispy', 269000.00, 80, 3),
(824, 'Wireless Earbuds Z2', 579000.00, 67, 1),
(825, 'Permen Susu Manis', 18000.00, 22, 3),
(826, 'Kamera Mirrorless Lite', 441000.00, 69, 1),
(827, 'Wireless Earbuds Z2', 815000.00, 82, 1),
(828, 'Thermometer Inframerah', 841000.00, 95, 4),
(829, 'Sneakers Canvas', 444000.00, 58, 2),
(830, 'Permen Susu Manis', 332000.00, 69, 3),
(831, 'Coklat Kacang Crunchy', 910000.00, 46, 3),
(832, 'Popcorn Caramel', 471000.00, 7, 3),
(833, 'Raket Tenis Fiber', 810000.00, 15, 5),
(834, 'Kaos Polos Putih', 679000.00, 3, 2),
(835, 'Wireless Earbuds Z2', 465000.00, 30, 1),
(836, 'Kamera Mirrorless Lite', 499000.00, 85, 1),
(837, 'Kapsul Herbal Alami', 817000.00, 14, 4),
(838, 'Topi Baseball', 991000.00, 76, 2),
(839, 'Minyak Telon Plus', 931000.00, 70, 4),
(840, 'Obat Demam Dewasa', 164000.00, 14, 4),
(841, 'Wireless Earbuds Z2', 877000.00, 95, 1),
(842, 'Kamera Mirrorless Lite', 814000.00, 23, 1),
(843, 'Thermometer Inframerah', 375000.00, 85, 4),
(844, 'Smartphone Pro Max', 840000.00, 9, 1),
(845, 'Jersey Klub Bola', 1000.00, 95, 5),
(846, 'Thermometer Inframerah', 445000.00, 9, 4),
(847, 'Laptop AeroBook', 612000.00, 55, 1),
(848, 'Resistance Band', 75000.00, 17, 5),
(849, 'Popcorn Caramel', 414000.00, 78, 3),
(850, 'Thermometer Inframerah', 156000.00, 37, 4),
(851, 'Jaket Parasut', 172000.00, 94, 2),
(852, 'Smartphone Pro Max', 549000.00, 73, 1),
(853, 'Resistance Band', 451000.00, 25, 5),
(854, 'Sepatu Lari Ringan', 250000.00, 56, 5),
(855, 'Kamera Mirrorless Lite', 400000.00, 50, 1),
(856, 'Kemeja Linen', 999000.00, 7, 2),
(857, 'Celana Cargo Pria', 353000.00, 36, 2),
(858, 'Masker KF94', 280000.00, 96, 4),
(859, 'Sepeda Lipat Sport', 421000.00, 56, 5),
(860, 'Permen Susu Manis', 970000.00, 15, 3),
(861, 'Sepatu Lari Ringan', 619000.00, 28, 5),
(862, 'Minuman Coklat Dingin', 931000.00, 60, 3),
(863, 'Sneakers Canvas', 438000.00, 57, 2),
(864, 'Permen Susu Manis', 89000.00, 65, 3),
(865, 'Resistance Band', 138000.00, 32, 5),
(866, 'Powerbank Slim 20000mAh', 395000.00, 69, 1),
(867, 'Sneakers Canvas', 344000.00, 5, 2),
(868, 'Kemeja Linen', 8000.00, 25, 2),
(869, 'Sneakers Canvas', 10000.00, 6, 2),
(870, 'Kaos Polos Putih', 896000.00, 8, 2),
(871, 'Vitamin B Kompleks', 765000.00, 36, 4),
(872, 'Nugget Ayam Crispy', 895000.00, 71, 3),
(873, 'Bola Voli', 179000.00, 46, 5),
(874, 'Obat Demam Dewasa', 183000.00, 11, 4),
(875, 'Jersey Klub Bola', 389000.00, 61, 5),
(876, 'Jersey Klub Bola', 641000.00, 90, 5),
(877, 'Coklat Kacang Crunchy', 623000.00, 96, 3),
(878, 'Resistance Band', 11000.00, 79, 5),
(879, 'Sepeda Lipat Sport', 361000.00, 84, 5),
(880, 'Smartwatch UltraFit', 4000.00, 51, 1),
(881, 'Permen Susu Manis', 372000.00, 95, 3),
(882, 'Obat Demam Dewasa', 426000.00, 37, 4),
(883, 'Roti Gandum Premium', 164000.00, 18, 3),
(884, 'Celana Cargo Pria', 733000.00, 55, 2),
(885, 'Permen Susu Manis', 383000.00, 95, 3),
(886, 'Permen Susu Manis', 245000.00, 27, 3),
(887, 'Coklat Kacang Crunchy', 50000.00, 76, 3),
(888, 'Kapsul Herbal Alami', 347000.00, 22, 4),
(889, 'Wireless Earbuds Z2', 92000.00, 19, 1),
(890, 'Thermometer Inframerah', 620000.00, 96, 4),
(891, 'Sepatu Lari Ringan', 337000.00, 89, 5),
(892, 'Popcorn Caramel', 577000.00, 82, 3),
(893, 'Sneakers Canvas', 589000.00, 95, 2),
(894, 'Bola Voli', 331000.00, 50, 5),
(895, 'Permen Susu Manis', 868000.00, 79, 3),
(896, 'Kaos Polos Putih', 913000.00, 8, 2),
(897, 'Kapsul Herbal Alami', 892000.00, 59, 4),
(898, 'Celana Cargo Pria', 257000.00, 13, 2),
(899, 'Sepeda Lipat Sport', 991000.00, 22, 5),
(900, 'Smartwatch UltraFit', 356000.00, 96, 1),
(901, 'Minyak Telon Plus', 888000.00, 68, 4),
(902, 'Masker KF94', 35000.00, 93, 4),
(903, 'Minuman Coklat Dingin', 181000.00, 70, 3),
(904, 'Sepatu Lari Ringan', 236000.00, 35, 5),
(905, 'Smartphone Pro Max', 356000.00, 53, 1),
(906, 'Nugget Ayam Crispy', 236000.00, 66, 3),
(907, 'Minuman Coklat Dingin', 355000.00, 38, 3),
(908, 'Kapsul Herbal Alami', 803000.00, 52, 4),
(909, 'Laptop AeroBook', 712000.00, 86, 1),
(910, 'Smartphone Pro Max', 357000.00, 32, 1),
(911, 'Popcorn Caramel', 6000.00, 56, 3),
(912, 'Vitamin B Kompleks', 92000.00, 27, 4),
(913, 'Wireless Earbuds Z2', 187000.00, 53, 1),
(914, 'Powerbank Slim 20000mAh', 738000.00, 32, 1),
(915, 'Topi Baseball', 971000.00, 45, 2),
(916, 'Sneakers Canvas', 531000.00, 75, 2),
(917, 'Wireless Earbuds Z2', 701000.00, 26, 1),
(918, 'Smartphone Pro Max', 649000.00, 18, 1),
(919, 'Raket Tenis Fiber', 21000.00, 61, 5),
(920, 'Sepeda Lipat Sport', 672000.00, 67, 5),
(921, 'Jaket Parasut', 66000.00, 52, 2),
(922, 'Sneakers Canvas', 267000.00, 53, 2),
(923, 'Sepatu Lari Ringan', 432000.00, 41, 5),
(924, 'Obat Demam Dewasa', 509000.00, 58, 4),
(925, 'Kemeja Linen', 797000.00, 11, 2),
(926, 'Laptop AeroBook', 212000.00, 11, 1),
(927, 'Raket Tenis Fiber', 206000.00, 49, 5),
(928, 'Sepatu Lari Ringan', 678000.00, 52, 5),
(929, 'Coklat Kacang Crunchy', 967000.00, 51, 3),
(930, 'Minyak Telon Plus', 746000.00, 20, 4),
(931, 'Obat Demam Dewasa', 628000.00, 61, 4),
(932, 'Smartwatch UltraFit', 221000.00, 30, 1),
(933, 'Raket Tenis Fiber', 876000.00, 56, 5),
(934, 'Smartphone Pro Max', 715000.00, 50, 1),
(935, 'Sneakers Canvas', 253000.00, 49, 2),
(936, 'Thermometer Inframerah', 173000.00, 39, 4),
(937, 'Topi Baseball', 973000.00, 38, 2),
(938, 'Sepatu Lari Ringan', 946000.00, 9, 5),
(939, 'Minuman Coklat Dingin', 643000.00, 18, 3),
(940, 'Bola Voli', 914000.00, 15, 5),
(941, 'Sepatu Lari Ringan', 557000.00, 28, 5),
(942, 'Minyak Telon Plus', 138000.00, 77, 4),
(943, 'Topi Baseball', 226000.00, 10, 2),
(944, 'Minyak Telon Plus', 641000.00, 44, 4),
(945, 'Kemeja Linen', 708000.00, 90, 2),
(946, 'Kemeja Linen', 898000.00, 56, 2),
(947, 'Powerbank Slim 20000mAh', 719000.00, 20, 1),
(948, 'Jersey Klub Bola', 998000.00, 53, 5),
(949, 'Minyak Telon Plus', 112000.00, 75, 4),
(950, 'Minuman Coklat Dingin', 683000.00, 8, 3),
(951, 'Jaket Parasut', 459000.00, 80, 2),
(952, 'Roti Gandum Premium', 197000.00, 20, 3),
(953, 'Celana Cargo Pria', 658000.00, 20, 2),
(954, 'Jersey Klub Bola', 902000.00, 39, 5),
(955, 'Kaos Polos Putih', 356000.00, 75, 2),
(956, 'Kapsul Herbal Alami', 26000.00, 16, 4),
(957, 'Vitamin B Kompleks', 284000.00, 17, 4),
(958, 'Jersey Klub Bola', 324000.00, 24, 5),
(959, 'Celana Cargo Pria', 248000.00, 10, 2),
(960, 'Masker KF94', 839000.00, 96, 4),
(961, 'Jaket Parasut', 740000.00, 16, 2),
(962, 'Nugget Ayam Crispy', 898000.00, 56, 3),
(963, 'Powerbank Slim 20000mAh', 303000.00, 41, 1),
(964, 'Wireless Earbuds Z2', 464000.00, 24, 1),
(965, 'Obat Demam Dewasa', 577000.00, 35, 4),
(966, 'Sepeda Lipat Sport', 471000.00, 71, 5),
(967, 'Wireless Earbuds Z2', 888000.00, 11, 1),
(968, 'Bola Voli', 620000.00, 96, 5),
(969, 'Resistance Band', 885000.00, 25, 5),
(970, 'Coklat Kacang Crunchy', 469000.00, 28, 3),
(971, 'Bola Voli', 145000.00, 70, 5),
(972, 'Laptop AeroBook', 876000.00, 75, 1),
(973, 'Laptop AeroBook', 789000.00, 32, 1),
(974, 'Kaos Polos Putih', 812000.00, 81, 2),
(975, 'Roti Gandum Premium', 880000.00, 82, 3),
(976, 'Minuman Coklat Dingin', 246000.00, 11, 3),
(977, 'Resistance Band', 50000.00, 18, 5),
(978, 'Vitamin B Kompleks', 526000.00, 20, 4),
(979, 'Sneakers Canvas', 465000.00, 37, 2),
(980, 'Coklat Kacang Crunchy', 58000.00, 8, 3),
(981, 'Topi Baseball', 518000.00, 10, 2),
(982, 'Jersey Klub Bola', 989000.00, 89, 5),
(983, 'Roti Gandum Premium', 357000.00, 19, 3),
(984, 'Resistance Band', 421000.00, 68, 5),
(985, 'Kamera Mirrorless Lite', 655000.00, 46, 1),
(986, 'Kaos Polos Putih', 559000.00, 55, 2),
(987, 'Kamera Mirrorless Lite', 947000.00, 88, 1),
(988, 'Coklat Kacang Crunchy', 684000.00, 25, 3),
(989, 'Smartphone Pro Max', 869000.00, 14, 1),
(990, 'Smartwatch UltraFit', 662000.00, 38, 1),
(991, 'Raket Tenis Fiber', 976000.00, 90, 5),
(992, 'Permen Susu Manis', 273000.00, 46, 3),
(993, 'Permen Susu Manis', 861000.00, 81, 3),
(994, 'Minuman Coklat Dingin', 213000.00, 99, 3),
(995, 'Celana Cargo Pria', 594000.00, 50, 2),
(996, 'Kapsul Herbal Alami', 473000.00, 68, 4),
(997, 'Sepatu Lari Ringan', 395000.00, 7, 5),
(998, 'Kamera Mirrorless Lite', 207000.00, 45, 1),
(999, 'Thermometer Inframerah', 982000.00, 61, 4),
(1000, 'Kamera Mirrorless Lite', 326000.00, 13, 1),
(1001, 'Kapsul Herbal Alami', 348000.00, 17, 4),
(1002, 'Masker KF94', 46000.00, 77, 4),
(1003, 'Vitamin B Kompleks', 634000.00, 76, 4),
(1004, 'Bola Voli', 927000.00, 31, 5),
(1005, 'Thermometer Inframerah', 606000.00, 75, 4);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `trg_before_update_stock` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
  IF NEW.stock < 0 THEN
    SET NEW.stock = 0;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `phone`, `address`) VALUES
(1, 1, '0811111111', 'Jakarta'),
(2, 2, '0822222222', 'Bandung'),
(3, 3, '0833333333', 'Surabaya'),
(4, 4, '0844444444', 'Yogyakarta'),
(5, 5, '0855555555', 'Semarang');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Andi Wijaya', 'andi@example.com', 'pass123'),
(2, 'Budi Santoso', 'budi@example.com', 'pass123'),
(3, 'Citra Dewi', 'citra@example.com', 'pass123'),
(4, 'Dodi Maulana', 'dodi@example.com', 'pass123'),
(5, 'Eka Nur', 'eka@example.com', 'pass123'),
(7, 'Bagus Dwi', 'bagusdwi@example.com', 'pass123');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `trg_before_delete_user` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
  INSERT INTO deleted_users_log (user_id, name, deleted_at)
  VALUES (OLD.id, OLD.name, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_orders_filtered`
-- (See below for the actual view)
--
CREATE TABLE `v_orders_filtered` (
`name` varchar(100)
,`order_id` int(11)
,`status` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_product_name_price`
-- (See below for the actual view)
--
CREATE TABLE `v_product_name_price` (
`name` varchar(100)
,`price` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_user_orders`
-- (See below for the actual view)
--
CREATE TABLE `v_user_orders` (
`name` varchar(100)
,`order_id` int(11)
,`status` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `v_orders_filtered`
--
DROP TABLE IF EXISTS `v_orders_filtered`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_orders_filtered`  AS SELECT `v_user_orders`.`name` AS `name`, `v_user_orders`.`order_id` AS `order_id`, `v_user_orders`.`status` AS `status` FROM `v_user_orders` WHERE `v_user_orders`.`status` = 'completed'WITH CASCADED CHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `v_product_name_price`
--
DROP TABLE IF EXISTS `v_product_name_price`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_name_price`  AS SELECT `products`.`name` AS `name`, `products`.`price` AS `price` FROM `products` ;

-- --------------------------------------------------------

--
-- Structure for view `v_user_orders`
--
DROP TABLE IF EXISTS `v_user_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_orders`  AS SELECT `u`.`name` AS `name`, `o`.`id` AS `order_id`, `o`.`status` AS `status` FROM (`users` `u` join `orders` `o` on(`u`.`id` = `o`.`user_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminuser`
--
ALTER TABLE `adminuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `big_products`
--
ALTER TABLE `big_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_price` (`category_id`,`price`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_user_status` (`user_id`,`status`),
  ADD KEY `product_id` (`product_id`) USING BTREE;

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `idx_product_name` (`name`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_user_email` (`email`,`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminuser`
--
ALTER TABLE `adminuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `big_products`
--
ALTER TABLE `big_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
