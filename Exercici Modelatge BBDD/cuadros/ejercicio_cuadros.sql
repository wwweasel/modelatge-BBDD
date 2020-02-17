-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 17, 2020 at 09:38 AM
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
-- Database: `ejercicio_cuadros`
--

-- --------------------------------------------------------

--
-- Table structure for table `compradores`
--

CREATE TABLE `compradores` (
  `id` int(10) UNSIGNED NOT NULL,
  `DNI` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `compradores`
--

INSERT INTO `compradores` (`id`, `DNI`, `name`, `surname`) VALUES
(1, 'L86R55F', 'Mark', 'Hab'),
(2, 'L5432HG3', 'Sven', 'Lauer'),
(3, 'L4752GF79', 'Nuria', 'Nar');

-- --------------------------------------------------------

--
-- Table structure for table `cuadros`
--

CREATE TABLE `cuadros` (
  `id_picture` int(10) UNSIGNED NOT NULL,
  `prize` decimal(10,2) UNSIGNED NOT NULL,
  `autor` varchar(30) NOT NULL DEFAULT '',
  `id_buyer` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cuadros`
--

INSERT INTO `cuadros` (`id_picture`, `prize`, `autor`, `id_buyer`) VALUES
(1, '4000.34', 'Steven King', 3),
(2, '3.00', 'Dan Brown', 1),
(3, '4799.46', 'Somebody', 2),
(4, '999999.00', '', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compradores`
--
ALTER TABLE `compradores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuadros`
--
ALTER TABLE `cuadros`
  ADD PRIMARY KEY (`id_picture`),
  ADD UNIQUE KEY `id_comprador` (`id_buyer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compradores`
--
ALTER TABLE `compradores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cuadros`
--
ALTER TABLE `cuadros`
  MODIFY `id_picture` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
