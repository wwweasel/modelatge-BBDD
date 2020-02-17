-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 17, 2020 at 12:31 PM
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
-- Database: `ejercicio_amazon`
--

-- --------------------------------------------------------

--
-- Table structure for table `amazon_autor`
--

CREATE TABLE `amazon_autor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(10) NOT NULL,
  `cantidad_libros` smallint(5) UNSIGNED NOT NULL,
  `dirrecion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `amazon_autor`
--

INSERT INTO `amazon_autor` (`id`, `nombre`, `apellido`, `cantidad_libros`, `dirrecion`) VALUES
(1, 'Noam', 'Chomsky', 99, 'Somewhere near the MIT'),
(2, 'Richard', 'Precht', 7, 'Irgendwo in D');

-- --------------------------------------------------------

--
-- Table structure for table `amazon_factura`
--

CREATE TABLE `amazon_factura` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `amazon_factura`
--

INSERT INTO `amazon_factura` (`id`, `product_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 1, 2),
(5, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `amazon_libros`
--

CREATE TABLE `amazon_libros` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `prize` decimal(10,2) UNSIGNED NOT NULL,
  `id_autor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `amazon_libros`
--

INSERT INTO `amazon_libros` (`id`, `title`, `stock`, `prize`, `id_autor`) VALUES
(1, 'Erkenne dich selbst', 3, '9.99', 2),
(2, 'Titulo Grave', 99, '17.99', 1),
(3, 'Bla', 4, '7.99', 1),
(4, 'BlaBla', 1, '1.99', 1);

-- --------------------------------------------------------

--
-- Table structure for table `amazon_usario`
--

CREATE TABLE `amazon_usario` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `amazon_usario`
--

INSERT INTO `amazon_usario` (`id`, `name`, `email`, `password`) VALUES
(1, 'ma', 'haberpursch@gmx.de', 'blabla13!'),
(2, 'nu', 'nununuc@gmx.de', 'nunubla123!');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amazon_autor`
--
ALTER TABLE `amazon_autor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amazon_factura`
--
ALTER TABLE `amazon_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `amazon_libros`
--
ALTER TABLE `amazon_libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Indexes for table `amazon_usario`
--
ALTER TABLE `amazon_usario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amazon_autor`
--
ALTER TABLE `amazon_autor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `amazon_factura`
--
ALTER TABLE `amazon_factura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `amazon_libros`
--
ALTER TABLE `amazon_libros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `amazon_usario`
--
ALTER TABLE `amazon_usario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amazon_factura`
--
ALTER TABLE `amazon_factura`
  ADD CONSTRAINT `amazon_factura_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `amazon_usario` (`id`),
  ADD CONSTRAINT `amazon_factura_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `amazon_libros` (`id`);

--
-- Constraints for table `amazon_libros`
--
ALTER TABLE `amazon_libros`
  ADD CONSTRAINT `amazon_libros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `amazon_autor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
