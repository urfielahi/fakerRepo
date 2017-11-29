-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2017 at 10:09 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faker`
--

-- --------------------------------------------------------

--
-- Table structure for table `completeride`
--

CREATE TABLE `completeride` (
  `ride_id` int(15) NOT NULL,
  `driver_id` int(15) NOT NULL,
  `p_id` int(15) NOT NULL,
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
  `ride_id` int(15) NOT NULL,
  `p_id` int(15) NOT NULL,
  `driver_id` int(15) NOT NULL,
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
  `driver_id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `working_hours` decimal(8,2) NOT NULL,
  `avg_ratings` decimal(3,1) DEFAULT NULL,
  `num_ratings` int(11) NOT NULL,
  `phone_num` varchar(10) NOT NULL
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
  `p_id` int(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_num` varchar(10) NOT NULL,
  `card_num` bigint(20) DEFAULT NULL,
  `card_exp_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`p_id`, `name`, `phone_num`, `card_num`, `card_exp_date`) VALUES
(1, 'Destiney McCullough', '587-127-53', 341098896281245, '2018-05-01'),
(7, 'Miss Justina Beer', '008-135-52', 6379983884806859, '2018-05-01'),
(8, 'Madilyn Adams', '190-588-84', 5018590890132409, '2017-06-01'),
(9, 'Felipe Pfannerstill', '814-289-95', 4026305829030969, '2019-04-01'),
(10, 'Kelsie Lueilwitz', '894-446-22', 4903731793233529, '2026-01-01'),
(11, 'Norma Green', '575-053-70', 6304147041969949, '2021-07-01'),
(12, 'Betsy Tremblay III', '169-676-27', 4807075332374783, '2025-06-01'),
(27, 'Amiya Hettinger', '720-894-65', 201498237266856, '2018-05-01'),
(94, 'Kelvin Mertz', '464-958-19', 5018530205181618, '2021-08-01'),
(99, 'Antonia Mills', '731-172-07', 4903945512208147, '2019-04-01'),
(705, 'Ms. Fae Lockman', '633-363-29', 36452467585155, '2020-11-01'),
(758, 'Antwan Ward', '571-242-88', 6304589974414239, '2017-05-01'),
(832, 'Andres Reinger', '941-030-54', 6334606589969011, '2017-11-01'),
(2442, 'Bradford West', '965-177-35', 4026992601698376, '2021-11-01'),
(2873, 'Margaret Konopelski DVM', '940-433-47', 6334992716460714, '2021-11-01'),
(5585, 'Bonita Hartmann', '525-567-14', 36803765510701, '2023-08-01'),
(7636, 'Joyce Mante', '136-281-64', 5610859761302140, '2021-11-01'),
(225982, 'Eve O\'Hara', '074-069-79', 201449898858465, '2019-04-01'),
(570814, 'Flavie Purdy', '318-773-11', 6375854491323634, '2027-08-01'),
(773190, 'Rowland Hyatt', '674-832-31', 348297287256559, '2021-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `p_id` int(11) NOT NULL,
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
  `ride_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
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
  MODIFY `ride_id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currentride`
--
ALTER TABLE `currentride`
  MODIFY `ride_id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ride`
--
ALTER TABLE `ride`
  MODIFY `ride_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
