-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2024 at 07:57 AM
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
-- Database: `cardb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'password123');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `customername` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `bookingamount` int(11) NOT NULL,
  `bookingdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `employeeid` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id` int(11) NOT NULL,
  `carid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`customername`, `phone`, `bookingamount`, `bookingdate`, `deliverydate`, `employeeid`, `status`, `id`, `carid`) VALUES
('Wazid', '9113545025', 1000000, '2024-02-08', '2024-02-27', 1, 'delivered', 1, 1),
('Siddarath', '9740990085', 8500000, '2024-02-05', '2024-02-14', 1, 'delivered', 2, 2),
('William ', '6989653625', 100000, '2024-02-21', '2024-03-21', 5, 'delivered', 7, 5),
('Neha', '5698785412', 100000, '2024-01-25', '2024-03-21', 8, 'delivered', 8, 5),
('Ishika', '7896541236', 50000, '2024-03-01', '0000-00-00', 2, 'delivered', 9, 5),
('Arjun', '8965322145', 70000, '2024-03-02', '0000-00-00', 9, 'pending', 10, 4),
('Akash', '8796324512', 600000, '2024-03-01', '2024-03-02', 8, 'delivered', 11, 5),
('Daniel Martinez', '896532452', 696969, '2024-03-02', '0000-00-00', 2, 'pending', 12, 3),
('Brian Thompson', '3621894589', 300000, '2024-02-29', '0000-00-00', 2, 'pending', 13, 5),
('Chota Bheem', '8965315496', 2100000, '2024-03-02', '0000-00-00', 9, 'Pending', 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `modelname` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `carimage` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `color` varchar(30) NOT NULL,
  `stock` int(11) NOT NULL,
  `description` varchar(300) NOT NULL,
  `chassisno` varchar(18) NOT NULL,
  `engineno` int(12) NOT NULL,
  `sideview` varchar(100) NOT NULL,
  `interior` varchar(100) NOT NULL,
  `rearview` varchar(100) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`modelname`, `type`, `carimage`, `price`, `color`, `stock`, `description`, `chassisno`, `engineno`, `sideview`, `interior`, `rearview`, `id`) VALUES
('X7', 'SUV', 'Car_image_1708861269778.png', 9000000, 'red', 9, 'Nothing special', 'SB1280', 9185, 'sideView_1708861269780.png', 'interior_1708861269785.png', 'rearView_1708861269790.png', 5);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `name` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `licencenumber` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`name`, `phone`, `address`, `licencenumber`, `password`, `id`) VALUES
('Siddarath', '9740990085', 'Hanuman Nagar', 'ka22 2022', '123456789', 4),
('Sameer Nadaf', '8310087784', 'Belagavi', 'KA22202897', '123456789', 9),
('Akash', '8796324512', 'Belagavi', 'KA22202526', '123456', 12),
('Hritik', '9632215478', 'Belagavi', 'KA22202589', '123456', 13);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `name` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`name`, `department`, `salary`, `id`) VALUES
('Aftab', 'Spares Manager', 80000, 5),
('Robert Wilson', 'Technician', 100000, 6),
('Christopher Lee', 'Lot manager', 70000, 7),
('Sarah', 'sales', 20000, 8),
('Jessica Taylor', 'Sales Manager', 75000, 9),
('Mary Johnson', 'Finance Manager', 75000, 10),
('Samantha', 'Finance', 30000, 11),
('Aarav Gupta', 'Finance', 30000, 12),
('Vikram Singh', 'Customer service', 50000, 13);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `registrationnumber` varchar(16) NOT NULL,
  `customername` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `servicetype` varchar(50) NOT NULL,
  `arrivaldate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `servicedescription` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`registrationnumber`, `customername`, `phone`, `servicetype`, `arrivaldate`, `deliverydate`, `servicedescription`, `cost`, `status`, `id`) VALUES
('KA 22 HD 7816', 'Wazid', '9113545025', 'General', '2024-02-28', '2024-02-29', 'cghsadjasdhasvckahscvkjacbkjac', 20000, 'true', 1),
('KA 21 HP 3210', 'Siddarath', '9740990085', 'general', '2024-02-29', '2024-02-29', 'fxdfasfdasvahsvkasvf', 30000, 'false', 2),
('KA 57 C 3924', 'John Doe', '1234567890', 'Regular', '2024-02-25', '2024-03-05', 'Routine', 150, 'false', 3),
('KA 22 HC 8978', 'Naveen', '9632587416', 'Periodic Sevice', '2024-03-01', '2024-03-02', 'Brake pads replaced', 15000, 'false', 4),
('KA 21 GG 6969', 'URBRO', '789632154', 'Room Service', '2024-03-01', '2024-03-02', 'xD', 150, 'true', 5),
('KA 65 P 3216', 'Karl Benz', '8978632541', 'Periodic Sevice', '2024-03-01', '2024-03-02', 'Belts and hoses checked', 10000, 'false', 6),
('MH 09 HK 5698', 'Apex', '8978645562', 'Major Service', '2024-02-29', '2024-03-02', 'Wheel bearings and shock absorbers changed ', 50000, 'true', 7),
('KA 22 Z 8965', 'Nitin', '8965327845', 'Periodic Sevice', '2024-03-01', '2024-03-01', 'Radiator and coolant hose checked', 10000, 'true', 8),
('KA 25 JK 6325', 'John', '3216549632', 'Body Shop', '2024-02-01', '2024-03-01', 'Bumpers, damaged body panels Replaced', 100000, 'false', 9),
('KA 01 HG 8978', 'Sumit', '3021560696', 'Periodic Sevice', '2024-02-28', '2024-02-29', 'Engine Mounts repaired', 25000, 'false', 10);

-- --------------------------------------------------------

--
-- Table structure for table `spares`
--

CREATE TABLE `spares` (
  `partno` int(11) NOT NULL,
  `partname` varchar(20) NOT NULL,
  `manufacturedate` date NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spares`
--

INSERT INTO `spares` (`partno`, `partname`, `manufacturedate`, `cost`) VALUES
(1, 'Engine oil', '2023-12-14', 5000),
(2, 'Bearing', '2024-01-02', 1000),
(3, 'Fuel Injectors', '2024-01-17', 5000),
(4, 'Wiper Blade', '2024-02-05', 1000),
(5, 'Timing Belt', '2024-01-23', 1000),
(6, 'Clutch Pressure Plat', '2024-02-20', 10000),
(7, 'Turbo', '2024-01-16', 5000),
(9, 'Spark Plug', '2024-02-21', 1500),
(10, 'Brake Shoes', '2024-02-18', 506),
(11, 'Fuel Filter', '2024-02-12', 5000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spares`
--
ALTER TABLE `spares`
  ADD PRIMARY KEY (`partno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `spares`
--
ALTER TABLE `spares`
  MODIFY `partno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
