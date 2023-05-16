-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 03:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(1) NOT NULL,
  `status_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'pending'),
(2, 'accepted'),
(3, 'resolved'),
(4, 'rejected');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(4) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `contact` text NOT NULL,
  `created_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `status_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `title`, `description`, `contact`, `created_time`, `update_time`, `status_id`) VALUES
(20, 'Unable to Access Company Email', 'Hello, I am having trouble accessing my company email. I have tried logging in several times, but I keep receiving an error message saying that my account has been locked. I have also tried resetting my password, but that doesn\'t seem to work either. I am not sure what the issue is, but I need to access my email as soon as possible to complete some urgent tasks.\nCould you please help me resolve this issue? If you need any additional information, please let me know. Thank you.', 'Phone: 555-1234', '2023-05-15 01:25:55', '2023-05-15 17:08:41', 1),
(23, 'Printer Not Working', 'Hi there, I am experiencing issues with the office printer. Whenever I try to print a document, the printer doesn\'t respond and the print job gets stuck in the queue. I have tried restarting the printer, but that hasn\'t resolved the issue. \nCould you please help me troubleshoot this problem? I have some urgent documents that need to be printed, so any assistance you could provide would be greatly appreciated.', 'Phone: 555-5678', '2023-05-15 01:50:55', '2023-05-15 16:50:58', 3),
(24, 'Unable to Connect to Wi-Fi', 'Hello, I am having trouble connecting to the office Wi-Fi network. I have tried connecting to several different networks, but none of them seem to work. I have also checked that my Wi-Fi is turned on and my device is in range of the network. However, I keep getting an error message saying that the connection was unsuccessful. \nCould you please help me resolve this issue? I need to connect to the Wi-Fi to access some important online documents. If you need any additional information, please let me know. Thank you.', 'Phone: 555-9012', '2023-05-15 01:55:51', '2023-05-15 17:08:56', 2),
(25, 'Software Installation Error', 'Hi, I am trying to install new software on my work computer, but I keep getting an error message during the installation process. The message says that the installation failed and to contact support for assistance. I am not sure what the problem is, as I have successfully installed software on this computer before. Could you please help me troubleshoot this issue? I need this software to complete some important work tasks. If you need any additional information, please let me know. Thank you.', 'Phone: 555-2468', '2023-05-15 14:06:58', '2023-05-15 22:57:28', 3),
(26, 'Account Access Issue', 'Hello, I am having trouble accessing my account on the company\'s website. Whenever I try to log in, I receive an error message saying that my username or password is incorrect. However, I have double-checked my credentials and they are correct. I have also tried resetting my password, but I never receive the email to reset it.\n\nCould you please assist me in resolving this issue? I need to access my account to complete some important work tasks. If you need any additional information, please let me know. Thank you.', 'Phone: 555-3690', '2023-05-15 23:35:33', '2023-05-15 23:37:07', 2),
(27, 'Website Login Issues', 'Hello, I am having trouble logging into the company website. I have tried using my usual login credentials, but I keep getting an error message saying that my username or password is incorrect. I have also tried resetting my password, but that doesn\'t seem to work either. I am not sure what the issue is, but I need to access the website as soon as possible to complete some important tasks.\n\nCould you please help me resolve this issue? If you need any additional information, please let me know. Thank you.', 'Phone: 555-3690', '2023-05-15 23:45:20', '2023-05-15 23:45:20', 1),
(28, 'Slow Computer Performance', 'Hi, my work computer has been running very slow lately. It takes a long time to start up and to open applications, and I am experiencing delays when I try to work on documents or browse the internet. I have tried freeing up some disk space and running antivirus software, but the performance issue persists.\n\nCould you please help me troubleshoot this issue? I need my computer to work efficiently to complete my work tasks. If you need any additional information, please let me know. Thank you.', 'Phone: 555-1234', '2023-05-15 19:14:22', '2023-05-16 10:52:37', 3),
(29, 'Printer Jam', 'Hi there, I am experiencing a paper jam in the office printer. I tried removing the jammed paper from the printer, but it seems that some pieces of paper are still stuck inside. I am not sure how to properly clear the jam, and I don\'t want to damage the printer further.\n\nCould you please help me resolve this issue? We have some important documents that need to be printed, so any assistance you could provide would be greatly appreciated.', 'Phone: 555-7890', '2023-05-16 02:00:58', '2023-05-16 10:54:24', 2),
(31, 'Audio Malfunction on Computer', 'Hello, I am experiencing issues with the audio on my work computer. The sound is distorted and sometimes cuts out completely. I have checked that my speakers and headphones are properly connected and that the volume is turned up, but the issue persists. I have also tried updating the audio drivers, but that hasn\'t resolved the issue.\n\nCould you please help me troubleshoot this problem? I need to be able to listen to audio for my work, so any assistance you could provide would be greatly appreciated.', 'Phone: 555-2468', '2023-05-16 11:36:59', '2023-05-16 11:37:16', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `status_id` (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
