-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 10:52 AM
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
('Siddarath', '9740990085', 8500000, '2024-02-05', '2024-02-14', 1, 'delivered', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `modelname` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `carimage` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `color` varchar(10) NOT NULL,
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
('X7', 'SUV', 'Car_image_1708861269778.png', 9000000, 'Red', 9, 'fsdfhjdsgvfjkhsdvbfkjshfv', 'SB1280', 9185, 'sideView_1708861269780.png', 'interior_1708861269785.png', 'rearView_1708861269790.png', 5),
('M340i', 'Sedan', 'carimage_1709372836739.png', 7500000, 'Black', 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac justo eu neque cursus ullamcorper. Nulla facilisi. Mauris efficitur augue eget diam accumsan, ', '123456', 654321, 'sideview_1709372836746.png', 'interior_1709372836752.png', 'rearview_1709372836761.png', 6);

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
('Siddarath', '9740990085', 'xhagcxhacjasahc', 'ka22 2022', '123456789', 4),
('Sameer Nadaf', '8310087784', 'Belagavi', '2545616', '123456789', 9),
('HeartRate', '9740346544', 'sdfysdgfsf', 'sdsgsdg', '12345678', 10),
('SAMEER NADAF', '9740346544', 'fsfsd', 'sfsfsf', '754542424', 11);

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
('Sameer N', 'sales', 80000, 2),
('Sameer', 'sales', 50000, 3),
('Sameer', 'zxcvbnm', 234567, 4),
('Aftab', 'Afgani', 12000, 5);

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
  `servicedescription` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL,
  `deliverydate` date NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`registrationnumber`, `customername`, `phone`, `servicetype`, `arrivaldate`, `servicedescription`, `cost`, `deliverydate`, `id`) VALUES
('ka 22 hd 7816', 'Wazid', '9113545025', 'General', '2024-02-28', 'cghsadjasdhasvckahscvkjacbkjac', 20000, '2024-02-29', 1),
('ka 21 hp 3210', 'Siddarath', '9740990085', 'general', '2024-02-29', 'fxdfasfdasvahsvkasvf', 30000, '2024-02-29', 2),
('ABC123', 'John Doe', '1234567890', 'Regular', '2024-02-25', 'Routine', 150, '2024-03-05', 3);

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
(2, 'Bearing', '2024-01-02', 1000);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spares`
--
ALTER TABLE `spares`
  MODIFY `partno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
