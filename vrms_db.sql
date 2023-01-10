-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2020 at 05:45 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vrms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nic` varchar(12) NOT NULL,
  `dl_no` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`first_name`, `last_name`, `gender`, `phone_no`, `email`, `nic`, `dl_no`, `dob`, `address`) VALUES
('Jeewantha', 'Upul', 'Male', '0776381824', 'upulj@gmail.com', '972340789V', 'GG123456', '1997-01-28', 'Kurunegala'),
('Thissa', 'Dukgannarala', 'Male', '0771234567', 'thissa@outlook.com', '981234564V', 'BL123456', '1998-05-22', 'Thissamaharama, Matara');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nic` varchar(12) NOT NULL,
  `dl_no` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`first_name`, `last_name`, `gender`, `phone_no`, `email`, `nic`, `dl_no`, `dob`, `address`) VALUES
('Santha', 'Rajapaksha', 'Male', '0771259883', 'santhaj@gmail.com', '1998092565', 'CL123456', '1964-02-04', 'Pitipana, Homagama'),
('Sudasun', 'Viraj', 'Male', '0767364795', 'sviraj@gmail.com', '987880652V', 'JJ987656', '1998-09-25', 'Kahawatte, Ratnapura');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(10) NOT NULL,
  `nic` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `resv_date` date NOT NULL,
  `resv_until` date NOT NULL,
  `vin` varchar(45) NOT NULL,
  `driver_status` varchar(45) NOT NULL,
  `start_mileage` varchar(10) NOT NULL,
  `end_mileage` varchar(45) DEFAULT NULL,
  `total` varchar(10) DEFAULT NULL,
  `pay_status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `nic`, `first_name`, `last_name`, `phone_no`, `resv_date`, `resv_until`, `vin`, `driver_status`, `start_mileage`, `end_mileage`, `total`, `pay_status`) VALUES
(1, '213156386V', 'Jessica', 'Harrison', '0771001048', '2020-09-22', '2020-09-22', 'CBL-3489', 'Without Driver', '12876', 'Yet to Update', '5000', 'Yet to Pay'),
(2, '638445220V', 'Tess', 'Gray', '0718247652', '2020-09-22', '2020-09-30', 'CBB-1998', 'Without Driver', '32456', 'Yet to Update', '14000', 'Paid'),
(3, '451428480V', 'Sawyer', 'Campbell', '0763355547', '2020-09-29', '2020-10-08', 'CBA-2017', 'JJ987656', '59134', 'Yet to Update', '12000', 'Yet To Pay');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_name` varchar(20) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `user_role` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_name`, `first_name`, `last_name`, `gender`, `phone_no`, `email`, `user_role`, `password`) VALUES
('admin', 'Kavinda', 'Jayasekara', 'Male', '0776104727', 'jgckavinda@gmail.com', 'admin', 'pass'),
('user', 'Pavani', 'Wijesekara', 'Female', '0771454311', 'wnpmanthila@gmail.com', 'user', 'pass');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `make` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `yor` varchar(4) NOT NULL,
  `vin` varchar(45) NOT NULL,
  `serv_from` date NOT NULL,
  `category` varchar(45) NOT NULL,
  `rate_per_day_wod` varchar(10) NOT NULL,
  `rate_per_week_wod` varchar(10) NOT NULL,
  `rate_per_month_wod` varchar(10) NOT NULL,
  `excess_mileage_wod` varchar(10) NOT NULL,
  `rate_per_day_wd` varchar(10) NOT NULL,
  `excess_mileage_wd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`make`, `model`, `yor`, `vin`, `serv_from`, `category`, `rate_per_day_wod`, `rate_per_week_wod`, `rate_per_month_wod`, `excess_mileage_wod`, `rate_per_day_wd`, `excess_mileage_wd`) VALUES
('Suzuki', 'Wagon R', '2017', 'CBA-2017', '2018-02-19', 'General', '4500', '10000', '24000', '60', '6000', '80'),
('Mitsubishi', 'Eclipse Cross', '2019', 'CBB-1998', '2019-03-24', 'Premium', '7000', '14000', '30000', '80', '10000', '100'),
('Toyota', 'Raize', '2020', 'CBL-3489', '2020-04-12', 'Premium', '5000', '12000', '27000', '70', '8000', '90');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`nic`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`dl_no`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_name`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
