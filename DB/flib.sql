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
  `p_uuid` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_num` varchar(10) NOT NULL,
  `card_num` bigint(20) DEFAULT NULL,
  `card_exp_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`p_id`, `p_uuid`, `name`, `phone_num`, `card_num`, `card_exp_date`) VALUES
(1, 'cjam0ze9300003ovs91mtbg1l', 'Alison Reichel', '438-460-37', 6280848433391059, '2018-04-01'),
(2, 'cjam0ze9700013ovswh9umhp2', 'Dr. Aracely Mraz', '703-202-49', 6227713768827406, '2018-09-01'),
(3, 'cjam0ze9800023ovssnzfph4v', 'Jordi Schumm', '393-836-04', 5106015313953796, '2022-07-01'),
(4, 'cjam0ze9800033ovstxty99k6', 'Diego Kihn', '350-094-19', 5175050739308867, '2025-11-01'),
(5, 'cjam0ze9800043ovs20tcoknj', 'Mekhi Larson', '944-495-42', 5018639129095323, '2024-11-01'),
(6, 'cjam0ze9800053ovsllpk286x', 'Sven Hirthe', '795-322-84', 5018387895978898, '2018-05-01'),
(7, 'cjam0ze9800063ovswi4dmy7m', 'Amparo O\'Reilly', '480-421-20', 6304579419458800, '2023-02-01'),
(8, 'cjam0ze9900073ovs517xojyz', 'Bud Wilkinson', '655-113-31', 201407963730902, '2020-06-01'),
(9, 'cjam0ze9900083ovsf2tb29au', 'Jeremie Rohan', '097-758-20', 4416616195955003, '2023-01-01'),
(10, 'cjam0ze9900093ovs9xbmt23j', 'Antwon Douglas', '535-395-20', 201489832936332, '2027-11-01'),
(11, 'cjam0ze99000a3ovso11f7wpo', 'Merlin Mertz', '556-704-66', 4903874752153641, '2026-02-01'),
(12, 'cjam0ze99000b3ovsgj0xkymt', 'Mr. Connie Tromp', '355-074-35', 6282323290109075, '2020-09-01'),
(13, 'cjam0ze9a000c3ovsrq0n7wt2', 'Miss Ella Fisher', '822-923-89', 4594871013182546, '2021-09-01'),
(14, 'cjam0ze9a000d3ovs8885rlbm', 'Theron Hammes', '493-426-55', 5610745825464622, '2019-03-01'),
(15, 'cjam0ze9a000e3ovsldvt6fhs', 'Nola Dicki', '293-816-44', 4903913837271547, '2022-11-01'),
(16, 'cjam0ze9a000f3ovs8qxpk8sv', 'Ronaldo Gottlieb', '197-786-63', 4903753628857025, '2025-01-01'),
(17, 'cjam0ze9a000g3ovs6pksnows', 'Marques Shields DDS', '671-620-00', 5439790267590277, '2019-12-01'),
(18, 'cjam0ze9b000h3ovs4o4o6qrm', 'Phyllis Thiel', '825-324-74', 4650066269680126, '2027-10-01'),
(19, 'cjam0ze9b000i3ovsa361x618', 'Lucas Pfannerstill', '230-680-78', 5489584766928891, '2018-06-01'),
(20, 'cjam0ze9b000j3ovs7j2rmocu', 'Rhea Gorczany', '035-123-38', 4552529418664605, '2017-03-01'),
(21, 'cjam0ze9b000k3ovs5pkkywmn', 'Miss Haylee Goldner', '410-686-78', 4026861085816467, '2026-12-01'),
(22, 'cjam0ze9c000l3ovsnde3tz5z', 'Curtis Littel', '173-697-74', 4903175989539218, '2017-07-01'),
(23, 'cjam0ze9c000m3ovs4o0xqunl', 'Macy Schowalter V', '610-446-19', 6378864097715577, '2022-12-01'),
(24, 'cjam0ze9c000n3ovsi0tfi232', 'Rebecca Lakin', '075-483-03', 6304699045707014, '2022-10-01'),
(25, 'cjam0ze9c000o3ovs0sancdxu', 'Rasheed Kirlin', '788-086-54', 5018387478498512, '2017-06-01'),
(26, 'cjam0ze9d000p3ovs200u587n', 'Celia Cartwright DDS', '453-943-76', 3528394326585407, '2022-06-01'),
(27, 'cjam0ze9d000q3ovsnyd89ppl', 'Rosetta Koelpin', '214-217-75', 5610197848732884, '2027-01-01'),
(28, 'cjam0ze9d000r3ovsnkepir4t', 'Lenna Schimmel DDS', '002-466-08', 6011027079989783, '2026-07-01'),
(29, 'cjam0ze9d000s3ovsjq3teacd', 'Jairo Hackett', '970-485-14', 6286970633776725, '2027-06-01'),
(30, 'cjam0ze9e000t3ovsl3zmruwm', 'Abigail Bernier', '020-969-04', 5100055972721403, '2020-05-01'),
(31, 'cjam0ze9e000u3ovsvleu9k3k', 'Dale Witting', '553-506-86', 6304513445556501, '2027-10-01'),
(32, 'cjam0ze9e000v3ovsea2rmnfz', 'Lea Quitzon', '363-903-68', 4026936544746818, '2026-01-01'),
(33, 'cjam0ze9e000w3ovs5t3s8piz', 'Bernie Johnston', '758-739-66', 5156709736705002, '2020-01-01'),
(34, 'cjam0ze9e000x3ovs1nrqg0sl', 'Juston Williamson', '292-027-11', 4903555233643579, '2019-07-01'),
(35, 'cjam0ze9f000y3ovsrx6ga2wi', 'Bernita Monahan', '729-880-45', 6334301521239257, '2022-03-01'),
(36, 'cjam0ze9f000z3ovspmmyovvp', 'Marielle Turner DDS', '790-454-39', 6378780383232384, '2020-01-01'),
(37, 'cjam0ze9f00103ovscpq1nus1', 'Aiyana Will', '261-390-53', 4026877324259830, '2025-11-01'),
(38, 'cjam0ze9f00113ovs4c3dvbex', 'Abagail Kub', '144-283-51', 4903621480853152, '2019-03-01'),
(39, 'cjam0ze9f00123ovslkx5gw42', 'Duane Frami', '335-083-08', 5610524807596192, '2023-09-01'),
(40, 'cjam0ze9g00133ovsaok9savj', 'Dolly Johns', '863-968-76', 4026972204643474, '2018-03-01'),
(41, 'cjam0ze9g00143ovstj4uy02i', 'Avis Roberts', '784-444-06', 6011943449258784, '2017-03-01'),
(42, 'cjam0ze9g00153ovsmv7kppx3', 'Aisha Buckridge', '561-952-74', 3528285274332794, '2023-11-01'),
(43, 'cjam0ze9g00163ovsyd4bhgjy', 'Luther Kulas', '528-225-75', 6370470859631164, '2025-04-01'),
(44, 'cjam0ze9g00173ovs68xqkt3a', 'Lamar Monahan', '809-152-71', 30059980173124, '2027-03-01'),
(45, 'cjam0ze9h00183ovs6f046qw7', 'Jacky Kunze', '088-200-69', 6379188803262859, '2017-10-01'),
(46, 'cjam0ze9h00193ovspslt4xk3', 'Wade Bayer', '365-181-46', 6304751234881652, '2025-06-01'),
(47, 'cjam0ze9h001a3ovs0oisv5gx', 'Penelope Parisian', '449-994-62', 6334903712505113, '2017-08-01'),
(48, 'cjam0ze9h001b3ovs9o08gej4', 'Oma Swift', '078-925-10', 6304108801701468, '2017-01-01'),
(49, 'cjam0ze9i001c3ovs4bwtx294', 'Cooper O\'Connell', '344-958-87', 5018035899078534, '2024-06-01'),
(50, 'cjam0ze9i001d3ovsgns43n1l', 'Mr. Stan Murphy', '991-690-57', 3528076811255071, '2025-04-01'),
(51, 'cjam0ze9i001e3ovsprcwgczp', 'Mateo Zulauf', '636-209-60', 5128446055395892, '2020-01-01'),
(52, 'cjam0ze9i001f3ovslt4hqrua', 'Rosanna Ward', '030-890-72', 5610650854233627, '2024-03-01'),
(53, 'cjam0ze9j001g3ovs1cq6de03', 'Adam Nolan', '868-047-78', 6378129906496888, '2022-04-01'),
(54, 'cjam0ze9j001h3ovscfnni3ts', 'Trinity Keebler', '718-712-28', 3528058052689176, '2027-02-01'),
(55, 'cjam0ze9j001i3ovsxawz9scx', 'Jeanie Abbott', '422-424-32', 36309021257517, '2022-04-01'),
(56, 'cjam0ze9j001j3ovsoyk1ah0h', 'Loyal Lesch', '737-488-97', 5610392626358966, '2025-04-01'),
(57, 'cjam0ze9j001k3ovs0agz83x4', 'Dahlia Hoeger DDS', '625-202-60', 36576778892049, '2017-12-01'),
(58, 'cjam0ze9k001l3ovs5wzue2uz', 'Madge Paucek I', '113-333-25', 6011785195479266, '2026-07-01'),
(59, 'cjam0ze9k001m3ovsud6gqybr', 'Benton Ebert', '771-297-00', 6011485684154757, '2026-06-01'),
(60, 'cjam0ze9k001n3ovsiluktfw4', 'Miss Araceli Will', '403-396-95', 5610091474999992, '2018-01-01'),
(61, 'cjam0ze9k001o3ovs2a9cpchs', 'Trent Schultz', '957-846-40', 5610595907765994, '2019-01-01'),
(62, 'cjam0ze9k001p3ovsrpjkvrkx', 'Nathanael Ebert', '243-763-03', 6334078018431064, '2019-10-01'),
(63, 'cjam0ze9k001q3ovss88seiru', 'Josiane Wintheiser', '490-889-66', 4903641465064245, '2023-07-01'),
(64, 'cjam0ze9l001r3ovsqzjq3cth', 'Ettie Bergnaum', '575-261-87', 5610522452464294, '2019-08-01'),
(65, 'cjam0ze9l001s3ovsnmhfufic', 'Alycia Denesik', '587-469-60', 6011210408685195, '2024-06-01'),
(66, 'cjam0ze9l001t3ovsy2a6mc92', 'Bettye Durgan', '670-578-00', 36895525944691, '2019-10-01'),
(67, 'cjam0ze9l001u3ovsym5supuq', 'Zoila Kautzer', '424-929-64', 3528857034474627, '2020-09-01'),
(68, 'cjam0ze9l001v3ovsuji3cc4l', 'Jasper Smith', '247-410-11', 5610625462187175, '2020-02-01'),
(69, 'cjam0ze9m001w3ovs9lpau13n', 'Loma Harvey', '928-659-60', 6375719876194431, '2021-05-01'),
(70, 'cjam0ze9m001x3ovsdy720v9k', 'Tate Muller', '021-916-91', 3528049871537894, '2019-12-01'),
(71, 'cjam0ze9m001y3ovsr9rjruen', 'Lauren Crooks', '375-518-06', 30027498882882, '2026-04-01'),
(72, 'cjam0ze9m001z3ovsu870ywop', 'Nicole Mayer', '994-304-15', 5438814186813023, '2021-06-01'),
(73, 'cjam0ze9m00203ovszenatsr9', 'Arlo Mertz', '887-373-73', 4739968807849359, '2023-10-01'),
(74, 'cjam0ze9n00213ovsej90cxji', 'Miss Dion Hermiston', '316-685-20', 4903225754069485, '2022-11-01'),
(75, 'cjam0ze9n00223ovskmlblsag', 'Wallace Upton', '304-061-44', 4173491254861507, '2018-08-01'),
(76, 'cjam0ze9n00233ovs1vrbw77q', 'Henderson Zieme', '327-824-45', 30000511287694, '2024-10-01'),
(77, 'cjam0ze9n00243ovsss64xejg', 'Amparo Reinger', '972-703-05', 6334809548079787, '2024-09-01'),
(78, 'cjam0ze9n00253ovsnmm8mc16', 'Moriah Hilll', '078-302-50', 6373461308846443, '2025-09-01'),
(79, 'cjam0ze9o00263ovs1adziwr7', 'Dr. Yazmin DuBuque', '227-429-32', 5018325446509614, '2018-03-01'),
(80, 'cjam0ze9o00273ovsqgl6lbzq', 'Abbey Durgan Sr.', '219-394-81', 5181120739111710, '2017-02-01'),
(81, 'cjam0ze9o00283ovs2cklmetv', 'Kale Cummerata', '925-209-92', 4903131945255480, '2027-11-01'),
(82, 'cjam0ze9o00293ovsogz9ywgj', 'Micaela Gleichner', '415-671-34', 4903152036798634, '2023-05-01'),
(83, 'cjam0ze9o002a3ovsbjdy4svq', 'Kailee Welch', '416-617-81', 340442356233117, '2017-07-01'),
(84, 'cjam0ze9p002b3ovsthhiubb3', 'Sadie Kirlin', '275-112-07', 5133214682716515, '2022-03-01'),
(85, 'cjam0ze9p002c3ovsg8o91ne1', 'Elijah Hackett', '663-516-15', 5610256823777338, '2024-02-01'),
(86, 'cjam0ze9p002d3ovsjbe0vl19', 'Laurence Hane', '414-854-34', 3528718699037051, '2020-07-01'),
(87, 'cjam0ze9p002e3ovszr5x26kr', 'Lexi Barrows', '123-171-76', 348503287249308, '2023-07-01'),
(88, 'cjam0ze9p002f3ovsloga7ci8', 'Aida Jast', '804-710-05', 6271986862967253, '2018-09-01'),
(89, 'cjam0ze9q002g3ovs7p2kbry1', 'Lorna Bergnaum', '986-449-52', 6200680587496682, '2022-05-01'),
(90, 'cjam0ze9q002h3ovs8i3tuzx1', 'Roselyn Mosciski', '729-372-95', 3528711667572076, '2018-11-01'),
(91, 'cjam0ze9q002i3ovs6ltz0bwi', 'Ryan Schmitt', '855-840-07', 201435910103634, '2022-12-01'),
(92, 'cjam0ze9r002j3ovs7583l2md', 'Lula Bernier', '809-076-41', 3528929311304296, '2025-05-01'),
(93, 'cjam0ze9r002k3ovsvlkiehx7', 'Miss Deanna Lesch', '969-832-90', 347779055423496, '2023-09-01'),
(94, 'cjam0ze9r002l3ovsupowa89d', 'Caden Baumbach DDS', '272-458-44', 30048814626993, '2026-10-01'),
(95, 'cjam0ze9r002m3ovs4qmqe3z6', 'Devyn Gerhold IV', '843-762-12', 5610279624648334, '2021-04-01'),
(96, 'cjam0ze9s002n3ovswix487qh', 'Garret Wintheiser', '195-448-28', 6373152359448417, '2021-01-01'),
(97, 'cjam0ze9s002o3ovsfa3lov6m', 'Mrs. Keegan Luettgen', '596-089-71', 6334701562230828, '2025-03-01'),
(98, 'cjam0ze9s002p3ovszzltrj4d', 'Merlin Leffler', '146-607-54', 3528425664840325, '2018-11-01'),
(99, 'cjam0ze9s002q3ovsp9cji2y0', 'Dr. Marcelle Stoltenberg', '403-198-15', 4774598127712973, '2023-05-01'),
(100, 'cjam0ze9s002r3ovsvev2ye95', 'Victor Carter', '435-363-71', 201488671135014, '2017-11-01');

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
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `p_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ride`
--
ALTER TABLE `ride`
  MODIFY `ride_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
