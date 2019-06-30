-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 17, 2019 at 09:57 AM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webTeori`
--

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
`noteID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postedDate` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`noteID`, `userID`, `title`, `content`, `postedDate`) VALUES
(1, 1, 'Note 1', '', '2019-06-14'),
(2, 1, 'Note 2', 'ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ini isi note 2. ', '2019-06-15'),
(3, 1, 'Note 3', 'ini isi note 3. ini isi note 3. ini isi note 3. ini isi note 3. ini isi note 3. ini isi note 3. ini isi note 3. ', '2019-06-15'),
(4, 1, 'Note 4', 'ini isi note 4. ini isi note 4. ini isi note 4. ini isi note 4. ini isi note 4. ini isi note 4. ini isi note 4. ini isi note 4. ini isi note 4. ', '2019-06-15'),
(5, 2, 'Note 4', 'ini isi note 3', '2019-06-16'),
(6, 5, 'Note 1', 'update - ini isii note 1', '2019-06-16'),
(7, 6, 'Note 1', 'update - ini isi note 1', '2019-06-16');

-- --------------------------------------------------------

--
-- Table structure for table `sharenotes`
--

CREATE TABLE IF NOT EXISTS `sharenotes` (
`shareID` int(10) NOT NULL,
  `noteID` int(10) NOT NULL,
  `fromUserID` int(10) NOT NULL,
  `toUserID` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sharenotes`
--

INSERT INTO `sharenotes` (`shareID`, `noteID`, `fromUserID`, `toUserID`) VALUES
(1, 1, 1, 2),
(2, 3, 1, 2),
(3, 1, 1, 3),
(4, 6, 5, 1),
(5, 7, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`userID` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `name`, `email`, `password`) VALUES
(1, 'Salsabila', 'herniza@live.com', 'asdqwe'),
(2, 'Akun 2', 'a@a.com', 'asdqwe'),
(3, 'Akun 3', 'c@c.com', 'asdqwe'),
(6, 'Stephanus', 'se@se.com', 'asdqwe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
 ADD PRIMARY KEY (`noteID`);

--
-- Indexes for table `sharenotes`
--
ALTER TABLE `sharenotes`
 ADD PRIMARY KEY (`shareID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
MODIFY `noteID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sharenotes`
--
ALTER TABLE `sharenotes`
MODIFY `shareID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
