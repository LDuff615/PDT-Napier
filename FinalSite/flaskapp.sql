-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2020 at 10:35 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `questionID` int(11) NOT NULL,
  `questionTitle` varchar(200) NOT NULL,
  `questionDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`questionID`, `questionTitle`, `questionDescription`) VALUES
(2, 'question 1', 'liam has 46 banna and want to get 3 more where can them get some more'),
(3, 'question 2', 'hey there hio bobs '),
(12, 'question 3', 'is liam has 3  banna and eats 1 how many does he has left over'),
(13, 'question 4', 'Amy is having trouble studying what advice can you give her'),
(16, 'question 5', 'liam has 4 banna and want to get 3 more where can them get some more'),
(17, 'question 6', 'how to do revision effectively');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(20) NOT NULL,
  `num` int(20) NOT NULL,
  `titles` varchar(40) NOT NULL,
  `description` varchar(60) NOT NULL,
  `answer` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `num`, `titles`, `description`, `answer`) VALUES
(1, 1, 'test1', 'this is to show the data going into a database', 'worked'),
(3, 2, 'finsishedit', 'here the work has been changed', 'edited'),
(4, 3, 'why', 'show the created  data', 'worked'),
(5, 3, 'test2', 'show the inserted data', 'worked');

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `referenceID` int(255) NOT NULL,
  `referenceLink` varchar(255) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `responseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reference`
--

INSERT INTO `reference` (`referenceID`, `referenceLink`, `feedback`, `responseID`) VALUES
(1, 'www.stackflow', 'good work boys', 11),
(2, 'www.facebook', 'good work', 4),
(3, 'www.stackflow', 'test referncer', 4);

-- --------------------------------------------------------

--
-- Table structure for table `response`
--

CREATE TABLE `response` (
  `responseID` int(11) NOT NULL,
  `responseDescription` varchar(255) NOT NULL,
  `questionID` int(11) NOT NULL,
  `correctAnswer` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `response`
--

INSERT INTO `response` (`responseID`, `responseDescription`, `questionID`, `correctAnswer`) VALUES
(4, 'edited', 3, 0),
(11, 'can you do', 3, 1),
(13, 'inserted', 2, 1),
(15, 'works', 2, 1),
(21, 'it the right asnwer', 3, 0),
(24, 'A student has came asking for help with their studies, do you...   A. Tell them to talk to their module leader   B. Ask them what issues they are having and support them in any way you can (correct)   C. Tell them that this is not what PDTs are for and th', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(25) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` int(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `phone`) VALUES
(2, 'test', 'test\'@gmail', 214742231),
(3, 'sean', 'Seanmullen35@gmail.com', 2147483647),
(4, 'jack', 'Jackie@pleebs', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `type`, `score`) VALUES
(2, 'sean', 'root', 1, 34),
(3, 'johnCon', 'root', 1, 34),
(4, 'Amy', 'test', 2, 45),
(6, 'admin', 'test1', 2, 68),
(7, 'guest', 'password', 0, 45);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`questionID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`referenceID`),
  ADD KEY `response` (`responseID`);

--
-- Indexes for table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`responseID`),
  ADD KEY `response_ibfk_1` (`questionID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `questionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `referenceID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `response`
--
ALTER TABLE `response`
  MODIFY `responseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reference`
--
ALTER TABLE `reference`
  ADD CONSTRAINT `response` FOREIGN KEY (`responseID`) REFERENCES `response` (`responseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `response`
--
ALTER TABLE `response`
  ADD CONSTRAINT `response_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
