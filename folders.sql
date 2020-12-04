-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 01, 2020 at 11:22 AM
-- Server version: 10.5.8-MariaDB-1:10.5.8+maria~focal
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `folders`
--

-- --------------------------------------------------------

--
-- Table structure for table `Level_1_1`
--

CREATE TABLE `Level_1_1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level_1_1`
--

INSERT INTO `Level_1_1` (`id`, `name`, `parent`) VALUES
(1, 'Name_1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Level_1_2`
--

CREATE TABLE `Level_1_2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level_1_2`
--

INSERT INTO `Level_1_2` (`id`, `name`, `parent`) VALUES
(2, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Level_2_1`
--

CREATE TABLE `Level_2_1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level_2_1`
--

INSERT INTO `Level_2_1` (`id`, `name`, `parent`) VALUES
(3, 'Name_2_1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Level_2_2`
--

CREATE TABLE `Level_2_2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level_2_2`
--

INSERT INTO `Level_2_2` (`id`, `name`, `parent`) VALUES
(4, 'Name_2_2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Level_3_1`
--

CREATE TABLE `Level_3_1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level_3_1`
--

INSERT INTO `Level_3_1` (`id`, `name`, `parent`) VALUES
(5, 'Name_3_1', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Level_3_2`
--

CREATE TABLE `Level_3_2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level_3_2`
--

INSERT INTO `Level_3_2` (`id`, `name`, `parent`) VALUES
(10, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Level_4_1`
--

CREATE TABLE `Level_4_1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level_4_1`
--

INSERT INTO `Level_4_1` (`id`, `name`, `parent`) VALUES
(9, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Level_4_2`
--

CREATE TABLE `Level_4_2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level_4_2`
--

INSERT INTO `Level_4_2` (`id`, `name`, `parent`) VALUES
(6, 'Name_4_2', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Level_4_3`
--

CREATE TABLE `Level_4_3` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level_4_3`
--

INSERT INTO `Level_4_3` (`id`, `name`, `parent`) VALUES
(8, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Root`
--

CREATE TABLE `Root` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Root`
--

INSERT INTO `Root` (`id`, `name`, `parent`) VALUES
(0, 'Root', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Level_1_1`
--
ALTER TABLE `Level_1_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Level_1_2`
--
ALTER TABLE `Level_1_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Level_2_1`
--
ALTER TABLE `Level_2_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Level_2_2`
--
ALTER TABLE `Level_2_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Level_3_1`
--
ALTER TABLE `Level_3_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Level_3_2`
--
ALTER TABLE `Level_3_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Level_4_1`
--
ALTER TABLE `Level_4_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Level_4_2`
--
ALTER TABLE `Level_4_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Level_4_3`
--
ALTER TABLE `Level_4_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Root`
--
ALTER TABLE `Root`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Level_1_1`
--
ALTER TABLE `Level_1_1`
  ADD CONSTRAINT `Level_1_1_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Root` (`id`);

--
-- Constraints for table `Level_1_2`
--
ALTER TABLE `Level_1_2`
  ADD CONSTRAINT `Level_1_2_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Root` (`id`);

--
-- Constraints for table `Level_2_1`
--
ALTER TABLE `Level_2_1`
  ADD CONSTRAINT `Level_2_1_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Level_1_1` (`id`);

--
-- Constraints for table `Level_2_2`
--
ALTER TABLE `Level_2_2`
  ADD CONSTRAINT `Level_2_2_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Level_1_2` (`id`);

--
-- Constraints for table `Level_3_1`
--
ALTER TABLE `Level_3_1`
  ADD CONSTRAINT `Level_3_1_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Level_2_1` (`id`);

--
-- Constraints for table `Level_3_2`
--
ALTER TABLE `Level_3_2`
  ADD CONSTRAINT `Level_3_2_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Level_2_1` (`id`);

--
-- Constraints for table `Level_4_1`
--
ALTER TABLE `Level_4_1`
  ADD CONSTRAINT `Level_4_1_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Level_3_1` (`id`);

--
-- Constraints for table `Level_4_2`
--
ALTER TABLE `Level_4_2`
  ADD CONSTRAINT `Level_4_2_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Level_3_1` (`id`);

--
-- Constraints for table `Level_4_3`
--
ALTER TABLE `Level_4_3`
  ADD CONSTRAINT `Level_4_3_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Level_3_1` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
