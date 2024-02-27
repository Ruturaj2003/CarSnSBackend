-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 05:29 AM
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
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_id` int(11) NOT NULL,
  `carId` int(11) NOT NULL,
  `C_name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `Booking_amt` int(11) NOT NULL,
  `Book_date` date NOT NULL,
  `Del_date` date NOT NULL,
  `emp_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booking_id`, `carId`, `C_name`, `phone`, `Booking_amt`, `Book_date`, `Del_date`, `emp_id`, `status`) VALUES
(1, 1, 'Wazid', '9113545025', 1000000, '2024-02-08', '2024-02-27', 1, 'delivered'),
(2, 2, 'Siddarath', '9740990085', 8500000, '2024-02-05', '2024-02-14', 1, 'delivered');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `chassis_no` varchar(18) NOT NULL,
  `Engine_no` int(12) NOT NULL,
  `Car_type` varchar(10) NOT NULL,
  `Model_name` varchar(10) NOT NULL,
  `Car_image` varchar(50) NOT NULL,
  `sideView` varchar(100) NOT NULL,
  `interior` varchar(100) NOT NULL,
  `rearView` varchar(100) NOT NULL,
  `Car_descrip` varchar(300) NOT NULL,
  `color` varchar(10) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `chassis_no`, `Engine_no`, `Car_type`, `Model_name`, `Car_image`, `sideView`, `interior`, `rearView`, `Car_descrip`, `color`, `price`, `stock`) VALUES
(5, 'SB1280', 9185, 'SUV', 'X7', 'Car_image_1708861269778.png', 'sideView_1708861269780.png', 'interior_1708861269785.png', 'rearView_1708861269790.png', 'fsdfhjdsgvfjkhsdvbfkjshfv', 'Red', 9000000, 9);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `C_id` int(11) NOT NULL,
  `C_Name` varchar(30) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `LIc_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_id`, `C_Name`, `Phone`, `Address`, `LIc_no`) VALUES
(4, 'Siddarath', '9740990085', 'xhagcxhacjasahc', 'ka22 2022');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `department`, `salary`) VALUES
(2, 'Sameer N', 'sales', 80000),
(3, 'Sameer', 'sales', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `Service_id` int(11) NOT NULL,
  `Reg_no` varchar(16) NOT NULL,
  `Cust_name` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `Service_type` varchar(50) NOT NULL,
  `Arrival_date` date NOT NULL,
  `Delivery_date` date NOT NULL,
  `ser_desc` varchar(50) NOT NULL,
  `Cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`Service_id`, `Reg_no`, `Cust_name`, `phone`, `Service_type`, `Arrival_date`, `Delivery_date`, `ser_desc`, `Cost`) VALUES
(1, 'ka 22 hd 7816', 'Wazid', '9113545025', 'General', '2024-02-28', '2024-02-29', 'cghsadjasdhasvckahscvkjacbkjac', 20000),
(2, 'ka 21 hp 3210', 'Siddarath', '9740990085', 'general', '2024-02-29', '2024-02-29', 'fxdfasfdasvahsvkasvf', 30000),
(3, 'ABC123', 'John Doe', '1234567890', 'Regular', '2024-02-25', '2024-03-05', 'Routine', 150);

-- --------------------------------------------------------

--
-- Table structure for table `spares`
--

CREATE TABLE `spares` (
  `Part_no` int(11) NOT NULL,
  `Part_name` varchar(20) NOT NULL,
  `mf_date` date NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spares`
--

INSERT INTO `spares` (`Part_no`, `Part_name`, `mf_date`, `cost`) VALUES
(1, 'Engine oil', '2023-12-14', 5000),
(2, 'Bearing', '2024-01-02', 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`C_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`Service_id`);

--
-- Indexes for table `spares`
--
ALTER TABLE `spares`
  ADD PRIMARY KEY (`Part_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `Booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `C_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `Service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spares`
--
ALTER TABLE `spares`
  MODIFY `Part_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
