-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2017 at 06:17 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flib`
--

-- --------------------------------------------------------

--
-- Table structure for table `completeride`
--

CREATE TABLE `completeride` (
  `ride_id` int(16) NOT NULL,
  `driver_id` int(16) NOT NULL,
  `p_id` int(16) NOT NULL,
  `pickup_location` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `surge` tinyint(1) NOT NULL,
  `total_distance` int(11) NOT NULL,
  `total_time` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currentride`
--

CREATE TABLE `currentride` (
  `ride_id` int(16) NOT NULL,
  `p_id` int(16) NOT NULL,
  `driver_id` int(16) NOT NULL,
  `pickup_location` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `surge` tinyint(1) NOT NULL,
  `elapsed_distance` int(11) NOT NULL,
  `elapsed_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(16) NOT NULL,
  `name` varchar(100) NOT NULL,
  `working_hours` decimal(8,2) NOT NULL,
  `avg_ratings` decimal(3,1) DEFAULT NULL,
  `num_ratings` int(11) NOT NULL,
  `phone_num` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `location`) VALUES
(1, 'Jasmine', 'Australia'),
(2, 'Jay', 'India'),
(3, 'Jim', 'Germany'),
(4, 'Lesley', 'Scotland'),
(5, 'Winnie', 'Australia');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `p_id` int(16) NOT NULL,
  `p_uuid` varchar(16) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_num` varchar(12) NOT NULL,
  `card_num` bigint(20) DEFAULT NULL,
  `card_exp_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `p_id` int(16) NOT NULL,
  `request_id` int(11) NOT NULL,
  `pickup_location` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request_info`
--

CREATE TABLE `request_info` (
  `request_id` int(11) NOT NULL,
  `request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `surge` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ride`
--

CREATE TABLE `ride` (
  `ride_id` int(16) NOT NULL,
  `p_id` int(16) NOT NULL,
  `driver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `completeride`
--
ALTER TABLE `completeride`
  ADD PRIMARY KEY (`ride_id`);

--
-- Indexes for table `currentride`
--
ALTER TABLE `currentride`
  ADD PRIMARY KEY (`ride_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `ride`
--
ALTER TABLE `ride`
  ADD PRIMARY KEY (`ride_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `completeride`
--
ALTER TABLE `completeride`
  MODIFY `ride_id` int(16) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currentride`
--
ALTER TABLE `currentride`
  MODIFY `ride_id` int(16) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `p_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ride`
--
ALTER TABLE `ride`
  MODIFY `ride_id` int(16) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
