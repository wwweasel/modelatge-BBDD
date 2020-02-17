-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 17, 2020 at 01:46 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ejercicio_optica`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `name` varchar(30) NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`name`, `provider_id`) VALUES
('Brand_One', 1),
('Brand_Two', 1),
('Brand_Three', 2);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `postal_code` smallint(5) UNSIGNED NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `recommandation_from` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `name`, `postal_code`, `phone`, `email`, `register_date`, `recommandation_from`) VALUES
(1, 'Mark', 24212, '1423453463', 'hab@hab.com', '2020-02-13 12:56:41', NULL),
(2, 'Nu', 3252, '843723872934', 'hab@bla.com', '2020-02-13 12:57:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `surname`) VALUES
(1, 'ma', 'ha'),
(2, 'nu', 'hu');

-- --------------------------------------------------------

--
-- Table structure for table `glasses`
--

CREATE TABLE `glasses` (
  `id` int(10) UNSIGNED NOT NULL,
  `l_graduation` decimal(2,1) NOT NULL,
  `r_graduation` decimal(2,1) NOT NULL,
  `frame_type` enum('floating','paste','metallic','') NOT NULL,
  `frame_color` varchar(30) NOT NULL,
  `l_glass_color` varchar(30) NOT NULL,
  `r_glass_color` varchar(30) NOT NULL,
  `prize` decimal(10,2) UNSIGNED NOT NULL,
  `brand` varchar(30) NOT NULL,
  `seller` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `glasses`
--

INSERT INTO `glasses` (`id`, `l_graduation`, `r_graduation`, `frame_type`, `frame_color`, `l_glass_color`, `r_glass_color`, `prize`, `brand`, `seller`, `client_id`) VALUES
(2, '0.1', '0.0', 'floating', 'green', 'red', 'white', '34.99', 'Brand_One', 1, 1),
(3, '0.9', '1.1', 'paste', 'white', 'white', 'white', '444.99', 'Brand_Three', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `street` varchar(30) NOT NULL,
  `street_number` smallint(5) UNSIGNED NOT NULL,
  `floor` varchar(3) NOT NULL,
  `apartment` varchar(3) NOT NULL,
  `city` varchar(30) NOT NULL,
  `postal code` smallint(5) NOT NULL,
  `country` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `NIF` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`id`, `name`, `street`, `street_number`, `floor`, `apartment`, `city`, `postal code`, `country`, `phone`, `fax`, `NIF`) VALUES
(1, '', 'Lull', 33, '2n', '1a', 'Barcelona', 8017, 'Spain', '901239482309', '234234634', 'HA7'),
(2, 'another_provider', 'blaStreet', 4, '2', '1', 'Stuttgart', 7417, 'Germany', '230959284759', '43556456', 'fhla784sjf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`name`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recommandation_from` (`recommandation_from`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surname` (`surname`);

--
-- Indexes for table `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller` (`seller`),
  ADD KEY `brand` (`brand`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`recommandation_from`) REFERENCES `client` (`id`);

--
-- Constraints for table `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `brands` (`name`),
  ADD CONSTRAINT `glasses_ibfk_2` FOREIGN KEY (`seller`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `glasses_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
