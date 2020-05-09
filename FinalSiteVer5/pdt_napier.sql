-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2020 at 02:34 PM
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
-- Database: `pdt_napier`
--

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `optionID` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `questionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`optionID`, `description`, `correct`, `questionID`) VALUES
(1, 'Talk with them about this issue and direct them to resources that will help them', 1, 1),
(2, 'Ignore them and let them find their own help', 0, 1),
(3, 'Tell them to just learn the language', 0, 1),
(4, 'Ignore them', 0, 2),
(5, 'Tell them that everything will be alright', 0, 2),
(6, 'Find someone who could help them or try and help them yourself', 1, 2),
(7, 'Ignore them', 0, 3),
(8, 'Tell a co-worker or anyone about the issue  ', 0, 3),
(9, 'Work with the student to fix the issue and keep the information confidential', 1, 3),
(10, 'Tell them that they are not leaving', 0, 4),
(11, 'Inform the parents or partner of the student', 0, 4),
(12, 'Discuss what issues the student is having and tell them all the options they have ', 1, 4),
(13, 'Leave it, if they want you they will contact you', 0, 5),
(14, 'Email them to find out if they are having any issues', 1, 5),
(15, 'Try and find them when they are in a class', 0, 5),
(16, 'Email them back right now even though you are busy', 0, 6),
(17, 'Ignore them', 0, 6),
(18, 'Answer within 3 days', 1, 6),
(19, 'Tell them you would be their reference and give them some tips on how to find a job', 1, 7),
(20, 'Tell them to ask for a former lecturer', 0, 7),
(21, 'Tell them that you do not want to be their reference', 0, 7),
(22, 'Tell them that you cannot do this and if they want to talk about this they should contact their module leader', 1, 8),
(23, 'Ignore them', 0, 8),
(24, 'Tell them yes and that you will go and discuss with their module leader', 0, 8),
(25, 'Get in contact with them all to inform them that you are their new PDT and what yor role is within 3 weeks ', 1, 9),
(26, 'Leave them be, if they need you they will find you on Moodle', 0, 9),
(27, 'Tell them you are not their PDT to keep them from contacting you', 0, 9),
(28, 'Tell them to talk to their module leader', 0, 10),
(29, 'Ask them what issues they are having and support them in any way you can', 1, 10),
(30, 'Tell them that this is not what PDTs are for and that they should not contact you about this matter', 0, 10),
(31, 'Advise them that they can either talk to ENSA about the issue and ask them if they have applied for a loan from SAAS', 1, 11),
(32, 'Advise then to vist a money lending website and take out a short term loan', 0, 11),
(33, 'Tell them that there is nothing you can do', 0, 11),
(34, 'Tell them that there is nothing you can do', 0, 12),
(35, 'Attempt to resolve the issue and if that does not work then go through the Napier complaints procedure, starting at stage 1', 1, 12),
(36, 'Advise them to talk to the lecturer that is giving them the issue and attempt to resolve', 0, 12),
(37, 'Tell them to get in contact with the Disability and Inclusion team ASAP for an appointment', 1, 13),
(38, 'Tell them to just see how they do in the exams to test whether they need the time or not', 0, 13),
(39, 'Tell them this is not your responsibility and that they should go and find help elsewhere', 0, 13),
(40, 'Tell them that you cannot help them as this is not your field of work', 0, 14),
(41, 'Ignore them as they should know that you are not in charge of their work placements', 0, 14),
(42, 'Discuss what issues they are having and inform them to get in contact with the placement to let them know that they are struggling', 1, 14),
(43, 'Tell them that you cannot help them with this', 0, 15),
(44, 'Inform then that they are able to take time out of University and if they are a health and social care student then they can request a maternity leave bursary', 1, 15),
(45, 'Refer them to some facilities that can help them then tell them to discuss any decisions with a family member', 0, 15),
(46, 'Tell them to give it some time and they will feel better', 0, 16),
(47, 'Reassure them, discuss some past experiences of other students, give them links to the Napier self help site and, if need be, refer them to a mental health advisor', 1, 16),
(48, 'Tell them that they should speak to someone else about this like a family member', 0, 16),
(49, 'Refer them to the information about visas on the MyNapier site and discuss this issue with them', 1, 17),
(50, 'Inform them that this is not something you know about and tell them to discuss this with someone else', 0, 17),
(51, 'Tell them there is nothing you can do', 0, 17),
(52, 'Tell them it is fine', 0, 18),
(53, 'Tell them that they cannot go', 0, 18),
(54, 'Tell them that it is their responsibility whether or not they attend classes', 1, 18),
(55, 'Advise them that they should go to an iPoint or contact them', 1, 19),
(56, 'Tell them that this is not a PDT matter', 0, 19),
(57, 'Tell them they do not need one', 0, 19),
(58, 'Tell them to speak to someone else, like someone at the iPoint', 0, 20),
(59, 'Inform them that exception forms can be signed at iPoints and give them a link to more info on the MyNapier website', 1, 20),
(60, 'Tell them to contact the local council about this issue', 0, 20),
(61, 'Try and fix the problem yourself and if that fails tell them there is nothing you can do', 0, 21),
(62, 'Tell them that you are not \'versed\' in computers and that you cannot help them', 0, 21),
(63, 'Try and understand their issue and offer any help, if that does not work then tell them to contact the IS Service Desk', 1, 21),
(64, 'Remind the student that they are expected to engage in a full time course of study and refer them to the student charter', 1, 22),
(65, 'Tell them that they do not have to', 0, 22),
(66, 'Tell them that they must come in to reflection', 0, 22),
(67, 'Tell them to make an appointment with their local GP if possible and also show them more information on the MyNapier website and suggest a referal to the University Mental Health Advisory Office', 1, 23),
(68, 'Tell them you cannot help them with this', 0, 23),
(69, 'Tell them to just keep working and keep trying and hopefuly they will get through it', 0, 23),
(70, 'Tell them to just park in the carpark and buy a ticket', 0, 24),
(71, 'Inform them that driving to University is not always the best option', 0, 24),
(72, 'Refer them to Car Parking Info on the MyNapier website', 1, 24),
(73, 'Tell them that there is a form available at iPoints to explain their University status', 1, 25),
(74, 'Tell them to talk to the person at the court to discuss being made exempt from duty', 0, 25),
(75, 'Tell them there is nothing you can do and that they will have to attend', 0, 25),
(76, 'Tell them to contact their programme leader about this matter', 0, 26),
(77, 'Refer them to University Academic Regulations document which tells them all about the process', 1, 26),
(78, 'Tell them not to worry about it and that the University will handle all degree related-things', 0, 26),
(79, 'Give them proof of the meeting as you will have recored all meetings as is required of you', 1, 27),
(80, 'Tell them that you have no record of any meetings and therefore cannot help them', 0, 27),
(81, 'Tell them that you will not give them this proof as you do not feelm it to be necessary', 0, 27),
(82, 'Inform them that PDTs must and always do keep all personal information private and that you will try and resolve this issue', 1, 28),
(83, 'Tell them that you did inform someone about their personal info ', 0, 28),
(84, 'Tell them that they are lying', 0, 28),
(85, 'Tell them to reconsider as they still have studies', 0, 29),
(86, 'Tell them that there is nothing you can do to help', 0, 29),
(87, 'Inform them that they can suspend their studies if they wish and should talk to their programme leader about it', 1, 29),
(88, 'Tell them to talk to the module leader about this and that you are here any time they need you', 1, 30),
(89, 'Tell them there is nothing you can do about this matter', 0, 30),
(90, 'Tell them to just focus on the work and see how they get on', 0, 30);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `questionID` int(11) NOT NULL,
  `questionTitle` varchar(30) NOT NULL,
  `description` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`questionID`, `questionTitle`, `description`) VALUES
(1, 'question 1', 'A student has been having issues with understanding English, as they are a foreign student, what should you do?...'),
(2, 'question 2', 'A student is persistently emailing you about a problem they are having and you are struggling to find a solution, what do you do?...'),
(3, 'question 3', 'A student has come to you with personal information they have trusted to you, do you...'),
(4, 'question 4', 'A student has come to you and informed you that they are considering leaving the University, do you...'),
(5, 'question 5', 'A student you are in regular contact with has suddenly stopped talking to you, do you...'),
(6, 'question 6', 'A student has emailed you with an issue but you are currently busy, do you...'),
(7, 'question 7', 'A former student has emailed you and asked you if you would be a reference for them in their current job hunt. do you...'),
(8, 'question 8', 'A student has came and asked you if you could look into getting their exam results changed as they feel they done well but were not marked highly, do you...'),
(9, 'question 9', 'You have a new bunch of students who have been issued to you for the new term, do you...'),
(10, 'question 10', 'A student has came asking for help with their studies, do you...'),
(11, 'question 11', 'A student informs you that they are struggling financially and do not think they will be able to pay their rent this month, what should you do?...'),
(12, 'question 12', 'A student has come to you with a complaint about a lecturer, what should you do?...'),
(13, 'question 13', 'A student comes to you and notifies that they have a disability which gave them extra time on exams when they were in college, do you...'),
(14, 'question 14', 'A student informs you that they have been absent from their work placement multiple times as they are struggling with illness, what should you do?...'),
(15, 'question 15', 'A student has told you that they are pregnant and are not sure what to do, what should you do?...'),
(16, 'question 16', 'A student has came to you to discuss how to adapt to University life as they are struggling, do you...'),
(17, 'question 17', 'An overseas student has told you that they are worried about their visa, what do you do?...'),
(18, 'question 18', 'A student has come to you to ask for time off for a family event, what do you do?...'),
(19, 'question 19', 'A student has came to you for advice on how to get a new student card as they lost theirs, do you...'),
(20, 'question 20', 'A student is seeking advice on council tax, what do you do?...'),
(21, 'question 21', 'Your student comes to you as they are having issues with their laptop and need it to complete work, do you...'),
(22, 'question 22', 'A student emails you to ask if they need to come in for reflection, what do you do?...'),
(23, 'question 23', 'A student has come to you to discuss their issues and tells you they feel depressed, what do you do?...'),
(24, 'question 24', 'A student has come to you to ask about parking on the campus, do you...'),
(25, 'question 25', 'A student has informed you that they have been called up to jury duty, what do you do?...'),
(26, 'question 26', 'A student has come to you to ask for information on how the final degrees work, do you...'),
(27, 'question 27', 'A student needs to prove that they were in a meeting with you, what do you do?...'),
(28, 'question 28', 'A student comes to you and accuses you of spreading personal information that they say they only told you about and have referred this to the academic conduct, do you...'),
(29, 'question 29', 'A student has informed you that they wish to adopt a child, what do you do?...'),
(30, 'question 30', 'A student comes to you and tells you that they do not feel they are getting the level of support they need on their placement, do you...');

-- --------------------------------------------------------

--
-- Table structure for table `q_options`
--

CREATE TABLE `q_options` (
  `optionID` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `questionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `q_options`
--

INSERT INTO `q_options` (`optionID`, `description`, `correct`, `questionID`) VALUES
(1, 'Talk with them about this issue and direct them to resources that will help them', 1, 1),
(2, 'Ignore them and let them find their own help', 0, 1),
(3, 'Tell them to just learn the language', 0, 1),
(4, 'Ignore them', 0, 2),
(5, 'Tell them that everything will be alright', 0, 2),
(6, 'Find someone who could help them or try and help them yourself', 1, 2),
(7, 'Ignore them', 0, 3),
(8, 'Tell a co-worker or anyone about the issue  ', 0, 3),
(9, 'Work with the student to fix the issue and keep the information confidential', 1, 3),
(10, 'Tell them that they are not leaving', 0, 4),
(11, 'Inform the parents or partner of the student', 0, 4),
(12, 'Discuss what issues the student is having and tell them all the options they have ', 1, 4),
(13, 'Leave it, if they want you they will contact you', 0, 5),
(14, 'Email them to find out if they are having any issues', 1, 5),
(15, 'Try and find them when they are in a class', 0, 5),
(16, 'Email them back right now even though you are busy', 0, 6),
(17, 'Ignore them', 0, 6),
(18, 'Answer within 3 days', 1, 6),
(19, 'Tell them you would be their reference and give them some tips on how to find a job', 1, 7),
(20, 'Tell them to ask for a former lecturer', 0, 7),
(21, 'Tell them that you do not want to be their reference', 0, 7),
(22, 'Tell them that you cannot do this and if they want to talk about this they should contact their module leader', 1, 8),
(23, 'Ignore them', 0, 8),
(24, 'Tell them yes and that you will go and discuss with their module leader', 0, 8),
(25, 'Get in contact with them all to inform them that you are their new PDT and what yor role is within 3 weeks ', 1, 9),
(26, 'Leave them be, if they need you they will find you on Moodle', 0, 9),
(27, 'Tell them you are not their PDT to keep them from contacting you', 0, 9),
(28, 'Tell them to talk to their module leader', 0, 10),
(29, 'Ask them what issues they are having and support them in any way you can', 1, 10),
(30, 'Tell them that this is not what PDTs are for and that they should not contact you about this matter', 0, 10),
(31, 'Advise them that they can either talk to ENSA about the issue and ask them if they have applied for a loan from SAAS', 1, 11),
(32, 'Advise then to vist a money lending website and take out a short term loan', 0, 11),
(33, 'Tell them that there is nothing you can do', 0, 11),
(34, 'Tell them that there is nothing you can do', 0, 12),
(35, 'Attempt to resolve the issue and if that does not work then go through the Napier complaints procedure, starting at stage 1', 1, 12),
(36, 'Advise them to talk to the lecturer that is giving them the issue and attempt to resolve', 0, 12),
(37, 'Tell them to get in contact with the Disability and Inclusion team ASAP for an appointment', 1, 13),
(38, 'Tell them to just see how they do in the exams to test whether they need the time or not', 0, 13),
(39, 'Tell them this is not your responsibility and that they should go and find help elsewhere', 0, 13),
(40, 'Tell them that you cannot help them as this is not your field of work', 0, 14),
(41, 'Ignore them as they should know that you are not in charge of their work placements', 0, 14),
(42, 'Discuss what issues they are having and inform them to get in contact with the placement to let them know that they are struggling', 1, 14),
(43, 'Tell them that you cannot help them with this', 0, 15),
(44, 'Inform then that they are able to take time out of University and if they are a health and social care student then they can request a maternity leave bursary', 1, 15),
(45, 'Refer them to some facilities that can help them then tell them to discuss any decisions with a family member', 0, 15),
(46, 'Tell them to give it some time and they will feel better', 0, 16),
(47, 'Reassure them, discuss some past experiences of other students, give them links to the Napier self help site and, if need be, refer them to a mental health advisor', 1, 16),
(48, 'Tell them that they should speak to someone else about this like a family member', 0, 16),
(49, 'Refer them to the information about visas on the MyNapier site and discuss this issue with them', 1, 17),
(50, 'Inform them that this is not something you know about and tell them to discuss this with someone else', 0, 17),
(51, 'Tell them there is nothing you can do', 0, 17),
(52, 'Tell them it is fine', 0, 18),
(53, 'Tell them that they cannot go', 0, 18),
(54, 'Tell them that it is their responsibility whether or not they attend classes', 1, 18),
(55, 'Advise them that they should go to an iPoint or contact them', 1, 19),
(56, 'Tell them that this is not a PDT matter', 0, 19),
(57, 'Tell them they do not need one', 0, 19),
(58, 'Tell them to speak to someone else, like someone at the iPoint', 0, 20),
(59, 'Inform them that exception forms can be signed at iPoints and give them a link to more info on the MyNapier website', 1, 20),
(60, 'Tell them to contact the local council about this issue', 0, 20),
(61, 'Try and fix the problem yourself and if that fails tell them there is nothing you can do', 0, 21),
(62, 'Tell them that you are not \'versed\' in computers and that you cannot help them', 0, 21),
(63, 'Try and understand their issue and offer any help, if that does not work then tell them to contact the IS Service Desk', 1, 21),
(64, 'Remind the student that they are expected to engage in a full time course of study and refer them to the student charter', 1, 22),
(65, 'Tell them that they do not have to', 0, 22),
(66, 'Tell them that they must come in to reflection', 0, 22),
(67, 'Tell them to make an appointment with their local GP if possible and also show them more information on the MyNapier website and suggest a referal to the University Mental Health Advisory Office', 1, 23),
(68, 'Tell them you cannot help them with this', 0, 23),
(69, 'Tell them to just keep working and keep trying and hopefuly they will get through it', 0, 23),
(70, 'Tell them to just park in the carpark and buy a ticket', 0, 24),
(71, 'Inform them that driving to University is not always the best option', 0, 24),
(72, 'Refer them to Car Parking Info on the MyNapier website', 1, 24),
(73, 'Tell them that there is a form available at iPoints to explain their University status', 1, 25),
(74, 'Tell them to talk to the person at the court to discuss being made exempt from duty', 0, 25),
(75, 'Tell them there is nothing you can do and that they will have to attend', 0, 25),
(76, 'Tell them to contact their programme leader about this matter', 0, 26),
(77, 'Refer them to University Academic Regulations document which tells them all about the process', 1, 26),
(78, 'Tell them not to worry about it and that the University will handle all degree related-things', 0, 26),
(79, 'Give them proof of the meeting as you will have recored all meetings as is required of you', 1, 27),
(80, 'Tell them that you have no record of any meetings and therefore cannot help them', 0, 27),
(81, 'Tell them that you will not give them this proof as you do not feelm it to be necessary', 0, 27),
(82, 'Inform them that PDTs must and always do keep all personal information private and that you will try and resolve this issue', 1, 28),
(83, 'Tell them that you did inform someone about their personal info ', 0, 28),
(84, 'Tell them that they are lying', 0, 28),
(85, 'Tell them to reconsider as they still have studies', 0, 29),
(86, 'Tell them that there is nothing you can do to help', 0, 29),
(87, 'Inform them that they can suspend their studies if they wish and should talk to their programme leader about it', 1, 29),
(88, 'Discuss the issue with them then direct them to the module leader or InPlace', 1, 30),
(89, 'Tell them there is nothing you can do about this matter', 0, 30),
(90, 'Tell them to just focus on the work and see how they get on', 0, 30);

-- --------------------------------------------------------

--
-- Table structure for table `refs`
--

CREATE TABLE `refs` (
  `referenceID` int(11) NOT NULL,
  `referenceLink` varchar(255) NOT NULL,
  `questionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refs`
--

INSERT INTO `refs` (`referenceID`, `referenceLink`, `questionID`) VALUES
(1, 'https://my.napier.ac.uk/International/International-Students/Pages/In-Session-Support.aspx', 1),
(2,'https://staff.napier.ac.uk/services/dlte/resources/PDT/Documents/PDT_web.pdf',2),
(3,'https://staff.napier.ac.uk/services/dlte/resources/PDT/Documents/PDT_web.pdf',3),
(4,'https://my.napier.ac.uk/Academic-Study-Skills/Thinking-of-Leaving/Pages/Thinking-of-Leaving.aspx',4),
(5,'https://ask.napier.ac.uk/article.php?id=967',5),
(6,'https://staff.napier.ac.uk/services/dlte/resources/PDT/Documents/PDT_web.pdf',6),
(7,'https://ask.napier.ac.uk/article.php?id=990',7),
(8,'https://ask.napier.ac.uk/article.php?id=975',8),
(9,'https://staff.napier.ac.uk/services/dlte/resources/PDT/Documents/PDT_web.pdf',9),
(10,'https://staff.napier.ac.uk/services/dlte/resources/PDT/Documents/PDT_student_web.pdf',10),
(11,'https://ask.napier.ac.uk/article.php?id=1003',11),
(12,'https://ask.napier.ac.uk/article.php?id=981',12),
(13,'https://ask.napier.ac.uk/article.php?id=1004',13),
(14,'https://ask.napier.ac.uk/article.php?id=986',14),
(15,'https://ask.napier.ac.uk/article.php?id=994',15),
(16,'https://ask.napier.ac.uk/article.php?id=1008',16),
(17,'https://ask.napier.ac.uk/article.php?id=976',17),
(18,'https://ask.napier.ac.uk/article.php?id=972',18),
(19,'https://ask.napier.ac.uk/article.php?id=968',19),
(20,'https://ask.napier.ac.uk/article.php?id=966',20),
(21,'https://ask.napier.ac.uk/article.php?id=1002',21),
(22,'https://ask.napier.ac.uk/article.php?id=993',22),
(23,'https://ask.napier.ac.uk/article.php?id=964',23),
(24,'https://ask.napier.ac.uk/article.php?id=970',24),
(25,'https://ask.napier.ac.uk/article.php?id=965',25),
(26,'https://ask.napier.ac.uk/article.php?id=985',26),
(27,'https://staff.napier.ac.uk/services/dlte/resources/PDT/Documents/PDT_web.pdf',27),
(28,'https://ask.napier.ac.uk/article.php?id=1014',28),
(29,'https://ask.napier.ac.uk/article.php?id=1010',29),
(30,'https://ask.napier.ac.uk/article.php?id=995',30);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `testID` int(11) NOT NULL,
  `takenDate` date NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`testID`, `takenDate`, `userID`) VALUES
(1, '2020-10-30', 1),
(2, '2020-05-04', 2),
(3, '2020-05-01', 3),
(4, '2020-11-07', 4);

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `testID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `optionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`testID`, `questionID`, `optionID`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 2, 4),
(1, 2, 5),
(1, 2, 6),
(1, 3, 7),
(1, 3, 8),
(1, 3, 9),
(1, 4, 10),
(1, 4, 11),
(1, 4, 12),
(1, 5, 13),
(1, 5, 14),
(1, 5, 15),
(1, 6, 16),
(1, 6, 17),
(1, 6, 18),
(1, 7, 19),
(1, 7, 20),
(1, 7, 21),
(1, 8, 22),
(1, 8, 23),
(1, 8, 24),
(1, 9, 25),
(1, 9, 26),
(1, 9, 27),
(1, 10, 28),
(1, 10, 29),
(1, 10, 30),
(2, 11, 31),
(2, 11, 32),
(2, 11, 33),
(2, 12, 34),
(2, 12, 35),
(2, 12, 36),
(2, 13, 37),
(2, 13, 38),
(2, 13, 39),
(2, 14, 40),
(2, 14, 41),
(2, 14, 42),
(2, 15, 43),
(2, 15, 44),
(2, 15, 45),
(2, 16, 46),
(2, 16, 47),
(2, 16, 48),
(2, 17, 49),
(2, 17, 50),
(2, 17, 51),
(2, 18, 52),
(2, 18, 53),
(2, 18, 54),
(2, 19, 55),
(2, 19, 56),
(2, 19, 57),
(2, 20, 58),
(2, 20, 59),
(2, 20, 60),
(3, 21, 61),
(3, 21, 62),
(3, 21, 63),
(3, 22, 64),
(3, 22, 65),
(3, 22, 66),
(3, 23, 67),
(3, 23, 68),
(3, 23, 69),
(3, 24, 70),
(3, 24, 71),
(3, 24, 72),
(3, 25, 73),
(3, 25, 74),
(3, 25, 75),
(3, 26, 76),
(3, 26, 77),
(3, 26, 78),
(3, 27, 79),
(3, 27, 80),
(3, 27, 81),
(3, 28, 82),
(3, 28, 83),
(3, 28, 84),
(3, 29, 85),
(3, 29, 86),
(3, 29, 87),
(3, 30, 88),
(3, 30, 89),
(3, 30, 90);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `type` varchar(10) NOT NULL,
  `score` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `type`, `score`) VALUES
(1, 'JoeBloggs@demo.com', 'route', 'Admin', 0),
(2, 'spowers@demo.com', 'PDTsystem', 'regular', 0),
(3, 'JaneDoe@demo.com', 'IMPDT', 'regular', 0),
(4, 'pchapman@demo.com', 'dBsRule', 'Admin', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD KEY `questionID` (`questionID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`questionID`);

--
-- Indexes for table `q_options`
--
ALTER TABLE `q_options`
  ADD PRIMARY KEY (`optionID`),
  ADD KEY `questionID` (`questionID`);

--
-- Indexes for table `refs`
--
ALTER TABLE `refs`
  ADD PRIMARY KEY (`referenceID`),
  ADD KEY `questionID` (`questionID`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`testID`,`takenDate`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`testID`,`questionID`,`optionID`),
  ADD KEY `questionID` (`questionID`),
  ADD KEY `optionID` (`optionID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `questionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `q_options`
--
ALTER TABLE `q_options`
  MODIFY `optionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `refs`
--
ALTER TABLE `refs`
  MODIFY `referenceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `testID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `questions` (`questionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `q_options`
--
ALTER TABLE `q_options`
  ADD CONSTRAINT `q_options_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `questions` (`questionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `refs`
--
ALTER TABLE `refs`
  ADD CONSTRAINT `refs_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `questions` (`questionID`);

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD CONSTRAINT `test_questions_ibfk_1` FOREIGN KEY (`testID`) REFERENCES `tests` (`testID`),
  ADD CONSTRAINT `test_questions_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `questions` (`questionID`),
  ADD CONSTRAINT `test_questions_ibfk_3` FOREIGN KEY (`optionID`) REFERENCES `q_options` (`optionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
