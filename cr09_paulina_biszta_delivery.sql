-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 12:54 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_paulina_biszta_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_paulina_biszta_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_paulina_biszta_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `courier_id` int(11) NOT NULL,
  `fk_postbox_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`courier_id`, `fk_postbox_id`) VALUES
(3, 1),
(1, 2),
(4, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone` int(9) DEFAULT NULL,
  `fk_c_addresse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `phone`, `fk_c_addresse_id`) VALUES
(1, 'Liza', 'Moritz', 607890433, 1),
(2, 'Ben', 'Lopez', 617390478, 2),
(3, 'Sonja', 'Kohen', 639890493, 3),
(4, 'Elon', 'Jonas', 987666432, 4),
(5, 'Greta', 'Tomas', 887876412, 5),
(6, 'Bill', 'Morris', 334567890, 6);

-- --------------------------------------------------------

--
-- Table structure for table `c_addresse`
--

CREATE TABLE `c_addresse` (
  `c_addresse_id` int(11) NOT NULL,
  `city` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_addresse`
--

INSERT INTO `c_addresse` (`c_addresse_id`, `city`, `street`, `number`, `zip_code`) VALUES
(1, 'Vienna', 'Arbeitergasse', 15, 1050),
(2, 'Vienna', 'Blumengasse', 78, 1080),
(3, 'Vienna', 'Kohlgasse', 78, 1090),
(4, 'Vienna', 'Kettenbruckengasse', 44, 1050),
(5, 'Vienna', 'Stadtgasse', 12, 1040),
(6, 'Vienna', 'Wilhelmgasse', 90, 1010);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `gender` enum('F','M') DEFAULT NULL,
  `salary` int(11) NOT NULL,
  `fk_postoffice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `gender`, `salary`, `fk_postoffice_id`) VALUES
(1, 'Marina', 'F', 4800, 1),
(2, 'Theo', 'F', 2350, 2),
(3, 'Acilio', 'M', 3000, 2),
(4, 'Serri', 'M', 3570, 3);

-- --------------------------------------------------------

--
-- Table structure for table `package_mail`
--

CREATE TABLE `package_mail` (
  `item_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `size` varchar(2) NOT NULL,
  `type` enum('package','mail') NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_mail`
--

INSERT INTO `package_mail` (`item_id`, `weight`, `size`, `type`, `fk_customer_id`) VALUES
(1, 2, 'M', 'package', 2),
(2, 5, 'XL', 'package', 1),
(3, 1, 'S', 'mail', 3),
(4, 7, 'XL', 'package', 4),
(5, 3, 'M', 'package', 5),
(6, 1, 'S', 'mail', 6);

-- --------------------------------------------------------

--
-- Table structure for table `postbox`
--

CREATE TABLE `postbox` (
  `postbox_id` int(11) NOT NULL,
  `fk_item_id` int(11) DEFAULT NULL,
  `fk_postbox_addresse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postbox`
--

INSERT INTO `postbox` (`postbox_id`, `fk_item_id`, `fk_postbox_addresse_id`) VALUES
(1, 1, 2),
(2, 3, 3),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `postbox_addresse`
--

CREATE TABLE `postbox_addresse` (
  `postbox_addresse_id` int(11) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postbox_addresse`
--

INSERT INTO `postbox_addresse` (`postbox_addresse_id`, `city`, `street`, `number`, `zip_code`) VALUES
(1, 'Vienna', 'Mariahilferstrasse', 88, 1070),
(2, 'Vienna', 'Sibensterngasse', 23, 1060),
(3, 'Vienna', 'Westgasse', 44, 1020);

-- --------------------------------------------------------

--
-- Table structure for table `postoffice`
--

CREATE TABLE `postoffice` (
  `postoffice_id` int(11) NOT NULL,
  `deposited_date` datetime DEFAULT NULL,
  `fk_postoffice_addresse_id` int(11) DEFAULT NULL,
  `fk_item_id` int(11) DEFAULT NULL,
  `fk_courier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postoffice`
--

INSERT INTO `postoffice` (`postoffice_id`, `deposited_date`, `fk_postoffice_addresse_id`, `fk_item_id`, `fk_courier_id`) VALUES
(1, '2020-05-11 15:30:00', 1, 2, NULL),
(2, '2020-06-30 11:25:00', 3, 3, NULL),
(3, '2020-06-30 09:38:00', 3, 4, NULL),
(4, '2020-07-01 16:01:00', 2, 1, 1),
(5, '2020-07-02 13:30:00', 1, 5, 2),
(6, '2020-07-05 10:58:00', 1, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `postoffice_addresse`
--

CREATE TABLE `postoffice_addresse` (
  `postoffice_addresse_id` int(11) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postoffice_addresse`
--

INSERT INTO `postoffice_addresse` (`postoffice_addresse_id`, `city`, `street`, `number`, `zip_code`) VALUES
(1, 'Vienna', 'Grunergasse', 48, 1030),
(2, 'Vienna', 'Blaugasse', 23, 1100),
(3, 'Vienna', 'Swartzgasse', 3, 1011);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `fk_r_addresse_id` int(11) DEFAULT NULL,
  `fk_warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `first_name`, `last_name`, `delivery_time`, `fk_r_addresse_id`, `fk_warehouse_id`) VALUES
(1, 'Judi', 'Meier', '2020-07-06 15:30:00', 2, 1),
(2, 'Tom', 'Grau', '2020-07-06 08:55:00', 1, 2),
(3, 'Georg', 'Cruz', '2020-07-07 17:00:00', 3, 3),
(4, 'Chris', 'Bolt', '2020-07-07 11:10:00', 4, 2),
(5, 'Anna', 'Trulk', '2020-07-08 10:50:00', 6, 1),
(6, 'Sophie', 'Benz', '2020-07-10 16:05:00', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `r_addresse`
--

CREATE TABLE `r_addresse` (
  `r_addresse_id` int(11) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `r_addresse`
--

INSERT INTO `r_addresse` (`r_addresse_id`, `city`, `street`, `number`, `zip_code`) VALUES
(1, 'Vienna', 'Linzgasse', 45, 1090),
(2, 'Vienna', 'Salzgasse', 78, 1012),
(3, 'Vienna', 'Gurkengasse', 88, 1030),
(4, 'Vienna', 'Himbergasse', 12, 1010),
(5, 'Vienna', 'Linzgasse', 99, 1020),
(6, 'Vienna', 'Grugasse', 134, 1013);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `addresse` varchar(50) DEFAULT NULL,
  `fk_postoffice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `addresse`, `fk_postoffice_id`) VALUES
(1, 'Blagasse 45, 1020, Vienna', 1),
(2, 'Lulugasse 5, 1090, Vienna', 2),
(3, 'Anonogasse 15, 1022, Vienna', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`courier_id`),
  ADD KEY `fk_postbox_id` (`fk_postbox_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_c_addresse_id` (`fk_c_addresse_id`);

--
-- Indexes for table `c_addresse`
--
ALTER TABLE `c_addresse`
  ADD PRIMARY KEY (`c_addresse_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_postoffice_id` (`fk_postoffice_id`);

--
-- Indexes for table `package_mail`
--
ALTER TABLE `package_mail`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `postbox`
--
ALTER TABLE `postbox`
  ADD PRIMARY KEY (`postbox_id`),
  ADD KEY `fk_item_id` (`fk_item_id`),
  ADD KEY `fk_postbox_addresse_id` (`fk_postbox_addresse_id`);

--
-- Indexes for table `postbox_addresse`
--
ALTER TABLE `postbox_addresse`
  ADD PRIMARY KEY (`postbox_addresse_id`);

--
-- Indexes for table `postoffice`
--
ALTER TABLE `postoffice`
  ADD PRIMARY KEY (`postoffice_id`),
  ADD KEY `fk_postoffice_addresse_id` (`fk_postoffice_addresse_id`),
  ADD KEY `fk_item_id` (`fk_item_id`),
  ADD KEY `fk_courier_id` (`fk_courier_id`);

--
-- Indexes for table `postoffice_addresse`
--
ALTER TABLE `postoffice_addresse`
  ADD PRIMARY KEY (`postoffice_addresse_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_r_addresse_id` (`fk_r_addresse_id`),
  ADD KEY `fk_warehouse_id` (`fk_warehouse_id`);

--
-- Indexes for table `r_addresse`
--
ALTER TABLE `r_addresse`
  ADD PRIMARY KEY (`r_addresse_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `fk_postoffice_id` (`fk_postoffice_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courier`
--
ALTER TABLE `courier`
  MODIFY `courier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `package_mail`
--
ALTER TABLE `package_mail`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `postbox`
--
ALTER TABLE `postbox`
  MODIFY `postbox_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `postoffice`
--
ALTER TABLE `postoffice`
  MODIFY `postoffice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courier`
--
ALTER TABLE `courier`
  ADD CONSTRAINT `courier_ibfk_1` FOREIGN KEY (`fk_postbox_id`) REFERENCES `postbox` (`postbox_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_c_addresse_id`) REFERENCES `c_addresse` (`c_addresse_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_postoffice_id`) REFERENCES `postoffice` (`postoffice_id`);

--
-- Constraints for table `package_mail`
--
ALTER TABLE `package_mail`
  ADD CONSTRAINT `package_mail_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `postbox`
--
ALTER TABLE `postbox`
  ADD CONSTRAINT `postbox_ibfk_1` FOREIGN KEY (`fk_item_id`) REFERENCES `package_mail` (`item_id`),
  ADD CONSTRAINT `postbox_ibfk_2` FOREIGN KEY (`fk_postbox_addresse_id`) REFERENCES `postbox_addresse` (`postbox_addresse_id`);

--
-- Constraints for table `postoffice`
--
ALTER TABLE `postoffice`
  ADD CONSTRAINT `postoffice_ibfk_1` FOREIGN KEY (`fk_postoffice_addresse_id`) REFERENCES `postoffice_addresse` (`postoffice_addresse_id`),
  ADD CONSTRAINT `postoffice_ibfk_2` FOREIGN KEY (`fk_item_id`) REFERENCES `package_mail` (`item_id`),
  ADD CONSTRAINT `postoffice_ibfk_3` FOREIGN KEY (`fk_courier_id`) REFERENCES `courier` (`courier_id`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_r_addresse_id`) REFERENCES `r_addresse` (`r_addresse_id`),
  ADD CONSTRAINT `recipient_ibfk_2` FOREIGN KEY (`fk_warehouse_id`) REFERENCES `warehouse` (`warehouse_id`);

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`fk_postoffice_id`) REFERENCES `postoffice` (`postoffice_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
