-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 06:11 AM
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
-- Database: `sbs-aaaos-buhi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'DEVELOPMENT', 'no-avatar.jpg', 'admin', 'admin', NULL, NULL, NULL, '2023-02-19 07:36:32', '2023-05-28 05:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `arrangements`
--

CREATE TABLE `arrangements` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `competition_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `competition_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'ambassador-buhi-2024', 'Ambassador 2024', '2023-04-06 13:25:10', '2024-11-24 17:47:54'),
(2, 1, 'ambassadress-buhi-2024', 'Ambassadress 2024', '2023-04-23 09:59:52', '2024-11-24 17:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 'mmaos-sbs-buhi-2024', 'Ambassador and Ambassadress of Sports 2024', '2023-04-06 13:24:04', '2024-11-24 17:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `percentage` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `event_id`, `title`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 'Face Value', 40, '2023-04-23 09:33:48', '2024-11-24 18:01:15'),
(2, 1, 'Performance and Self Introduction', 40, '2023-04-23 09:34:06', '2024-11-24 18:01:37'),
(3, 1, 'Stage Presence and Over-all Impact', 20, '2023-04-23 09:35:02', '2024-11-24 18:01:58'),
(5, 2, 'Face Value', 40, '2023-04-23 09:37:40', '2024-11-24 18:02:23'),
(6, 2, 'Appropriateness of Sports Attire', 40, '2023-04-23 09:38:14', '2024-11-24 18:02:51'),
(7, 2, 'Stage Presence and Over-all Impact', 20, '2023-04-23 09:38:42', '2024-11-24 18:03:17'),
(9, 3, 'Face Value', 40, '2023-04-23 09:39:35', '2024-11-24 18:03:48'),
(10, 3, 'Intelligence & Relevance', 40, '2023-04-23 09:40:27', '2024-11-24 18:04:10'),
(11, 3, 'Stage Presence and Over-all Impact', 20, '2023-04-23 09:41:01', '2024-11-24 18:04:32'),
(13, 4, 'Face Value', 40, '2023-04-23 09:42:04', '2024-11-24 18:05:11'),
(14, 4, 'Over-all Design and Formal Wear', 40, '2023-04-23 09:42:18', '2024-11-24 18:05:39'),
(15, 4, 'Stage Presence and Over-all Impact', 20, '2023-04-23 09:42:27', '2024-11-24 18:06:00'),
(17, 5, 'Intelligence/Personality (Content of the Answer and Delivery)', 40, '2023-04-23 09:43:16', '2024-11-24 18:09:28'),
(18, 5, 'Beauty of the Face and Body Proportion', 60, '2023-04-23 09:43:27', '2024-11-24 18:10:04'),
(21, 6, 'Face Value', 40, '2023-04-23 10:11:09', '2024-11-24 18:10:37'),
(22, 6, 'Performance and Self Introduction', 40, '2023-04-23 10:11:15', '2024-11-24 18:10:57'),
(23, 6, 'Stage Presence and Over-all Impact', 20, '2023-04-23 10:11:23', '2024-11-24 18:11:09'),
(25, 7, 'Face Value', 40, '2023-04-23 10:11:59', '2024-11-24 18:12:01'),
(26, 7, 'Appropriateness of Sports Attire', 40, '2023-04-23 10:12:05', '2024-11-24 18:12:18'),
(27, 7, 'Stage Presence and Over-all Impact', 20, '2023-04-23 10:12:20', '2024-11-24 18:12:33'),
(29, 8, 'Face Value', 40, '2023-04-23 10:12:56', '2024-11-24 18:13:23'),
(30, 8, 'Intelligence & Relevance', 40, '2023-04-23 10:13:03', '2024-11-24 18:13:38'),
(31, 8, 'Stage Presence and Over-all Impact', 20, '2023-04-23 10:13:09', '2024-11-24 18:13:54'),
(33, 9, 'Face Value', 40, '2023-04-23 10:13:29', '2024-11-24 18:14:21'),
(34, 9, 'Over-all Design and Formal Wear', 40, '2023-04-23 10:13:35', '2024-11-24 18:14:46'),
(35, 9, 'Stage Presence and Over-all Impact', 20, '2023-04-23 10:13:40', '2024-11-24 18:15:02'),
(37, 10, 'Intelligence/Personality (Content of the Answer and Delivery)', 40, '2023-04-23 10:14:32', '2024-11-24 18:15:30'),
(38, 10, 'Beauty of the Face and Body Proportion', 60, '2023-04-23 10:14:39', '2024-11-24 18:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `duos`
--

CREATE TABLE `duos` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `event_id_1` smallint(5) UNSIGNED NOT NULL,
  `event_id_2` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `duos`
--

INSERT INTO `duos` (`id`, `slug`, `title`, `event_id_1`, `event_id_2`, `created_at`, `updated_at`) VALUES
(1, 'production', 'PRODUCTION', 1, 6, '2023-04-24 01:29:03', '2023-04-24 01:29:03'),
(2, 'swimwear', 'SPORTSWEAR', 2, 7, '2023-04-24 01:29:37', '2024-11-25 03:00:19'),
(3, 'formal-wear-long-gown', 'PRELIMINARY INTERVIEW', 3, 8, '2023-04-24 01:30:43', '2024-11-25 03:00:30'),
(4, 'preliminary-qa', 'FORMAL WEAR', 4, 9, '2023-04-24 01:31:18', '2024-11-25 03:00:39'),
(5, 'final-qa', 'FINAL Q&A', 5, 10, '2023-04-24 01:31:44', '2023-05-03 07:55:57');

-- --------------------------------------------------------

--
-- Table structure for table `eliminations`
--

CREATE TABLE `eliminations` (
  `id` mediumint(9) NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eliminations`
--

INSERT INTO `eliminations` (`id`, `event_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 15, '2024-11-25 04:33:37', '2024-11-25 04:33:37'),
(2, 1, 16, '2024-11-25 04:33:40', '2024-11-25 04:33:40'),
(3, 1, 17, '2024-11-25 04:33:41', '2024-11-25 04:33:41'),
(4, 1, 18, '2024-11-25 04:33:43', '2024-11-25 04:33:43'),
(5, 1, 19, '2024-11-25 04:33:44', '2024-11-25 04:33:44'),
(6, 1, 20, '2024-11-25 04:33:47', '2024-11-25 04:33:47'),
(7, 1, 21, '2024-11-25 04:33:50', '2024-11-25 04:33:50'),
(8, 1, 22, '2024-11-25 04:33:52', '2024-11-25 04:33:52'),
(9, 1, 23, '2024-11-25 04:33:53', '2024-11-25 04:33:53'),
(10, 1, 24, '2024-11-25 04:33:54', '2024-11-25 04:33:54'),
(11, 1, 25, '2024-11-25 04:33:55', '2024-11-25 04:33:55'),
(12, 1, 26, '2024-11-25 04:33:57', '2024-11-25 04:33:57'),
(13, 1, 27, '2024-11-25 04:33:58', '2024-11-25 04:33:58'),
(14, 1, 28, '2024-11-25 04:33:59', '2024-11-25 04:33:59'),
(15, 2, 15, '2024-11-25 04:34:04', '2024-11-25 04:34:04'),
(16, 2, 16, '2024-11-25 04:34:05', '2024-11-25 04:34:05'),
(17, 2, 17, '2024-11-25 04:34:06', '2024-11-25 04:34:06'),
(18, 2, 18, '2024-11-25 04:34:07', '2024-11-25 04:34:07'),
(19, 2, 19, '2024-11-25 04:34:08', '2024-11-25 04:34:08'),
(20, 2, 20, '2024-11-25 04:34:09', '2024-11-25 04:34:09'),
(21, 2, 21, '2024-11-25 04:34:10', '2024-11-25 04:34:10'),
(22, 2, 22, '2024-11-25 04:34:11', '2024-11-25 04:34:11'),
(23, 2, 23, '2024-11-25 04:34:12', '2024-11-25 04:34:12'),
(24, 2, 24, '2024-11-25 04:34:13', '2024-11-25 04:34:13'),
(25, 2, 25, '2024-11-25 04:34:14', '2024-11-25 04:34:14'),
(26, 2, 26, '2024-11-25 04:34:15', '2024-11-25 04:34:15'),
(27, 2, 27, '2024-11-25 04:34:15', '2024-11-25 04:34:15'),
(28, 2, 28, '2024-11-25 04:34:16', '2024-11-25 04:34:16'),
(29, 3, 15, '2024-11-25 04:34:19', '2024-11-25 04:34:19'),
(30, 3, 16, '2024-11-25 04:34:21', '2024-11-25 04:34:21'),
(31, 3, 17, '2024-11-25 04:34:22', '2024-11-25 04:34:22'),
(32, 3, 18, '2024-11-25 04:34:23', '2024-11-25 04:34:23'),
(33, 3, 19, '2024-11-25 04:34:24', '2024-11-25 04:34:24'),
(34, 3, 20, '2024-11-25 04:34:25', '2024-11-25 04:34:25'),
(35, 3, 21, '2024-11-25 04:34:26', '2024-11-25 04:34:26'),
(36, 3, 22, '2024-11-25 04:34:27', '2024-11-25 04:34:27'),
(37, 3, 23, '2024-11-25 04:34:27', '2024-11-25 04:34:27'),
(38, 3, 24, '2024-11-25 04:34:28', '2024-11-25 04:34:28'),
(39, 3, 25, '2024-11-25 04:34:29', '2024-11-25 04:34:29'),
(40, 3, 26, '2024-11-25 04:34:30', '2024-11-25 04:34:30'),
(41, 3, 27, '2024-11-25 04:34:31', '2024-11-25 04:34:31'),
(42, 3, 28, '2024-11-25 04:34:32', '2024-11-25 04:34:32'),
(43, 4, 15, '2024-11-25 04:34:34', '2024-11-25 04:34:34'),
(44, 4, 16, '2024-11-25 04:34:35', '2024-11-25 04:34:35'),
(45, 4, 17, '2024-11-25 04:34:36', '2024-11-25 04:34:36'),
(46, 4, 18, '2024-11-25 04:34:38', '2024-11-25 04:34:38'),
(47, 4, 19, '2024-11-25 04:34:38', '2024-11-25 04:34:38'),
(48, 4, 20, '2024-11-25 04:34:39', '2024-11-25 04:34:39'),
(49, 4, 21, '2024-11-25 04:34:41', '2024-11-25 04:34:41'),
(50, 4, 22, '2024-11-25 04:34:42', '2024-11-25 04:34:42'),
(51, 4, 23, '2024-11-25 04:34:43', '2024-11-25 04:34:43'),
(52, 4, 24, '2024-11-25 04:34:44', '2024-11-25 04:34:44'),
(53, 4, 25, '2024-11-25 04:34:44', '2024-11-25 04:34:44'),
(54, 4, 26, '2024-11-25 04:34:45', '2024-11-25 04:34:45'),
(55, 4, 27, '2024-11-25 04:34:46', '2024-11-25 04:34:46'),
(56, 4, 28, '2024-11-25 04:34:47', '2024-11-25 04:34:47'),
(57, 5, 1, '2024-11-25 04:34:50', '2024-11-25 04:34:50'),
(58, 5, 15, '2024-11-25 04:34:50', '2024-11-25 04:34:50'),
(59, 5, 2, '2024-11-25 04:34:50', '2024-11-25 04:34:50'),
(60, 5, 16, '2024-11-25 04:34:51', '2024-11-25 04:34:51'),
(61, 5, 3, '2024-11-25 04:34:52', '2024-11-25 04:34:52'),
(62, 5, 17, '2024-11-25 04:34:52', '2024-11-25 04:34:52'),
(63, 5, 4, '2024-11-25 04:34:53', '2024-11-25 04:34:53'),
(64, 5, 18, '2024-11-25 04:34:53', '2024-11-25 04:34:53'),
(65, 5, 5, '2024-11-25 04:34:54', '2024-11-25 04:34:54'),
(66, 5, 19, '2024-11-25 04:34:55', '2024-11-25 04:34:55'),
(67, 5, 6, '2024-11-25 04:34:56', '2024-11-25 04:34:56'),
(68, 5, 20, '2024-11-25 04:34:56', '2024-11-25 04:34:56'),
(69, 5, 7, '2024-11-25 04:34:56', '2024-11-25 04:34:56'),
(70, 5, 21, '2024-11-25 04:34:57', '2024-11-25 04:34:57'),
(71, 5, 8, '2024-11-25 04:34:58', '2024-11-25 04:34:58'),
(72, 5, 22, '2024-11-25 04:34:58', '2024-11-25 04:34:58'),
(73, 5, 9, '2024-11-25 04:34:59', '2024-11-25 04:34:59'),
(74, 5, 23, '2024-11-25 04:34:59', '2024-11-25 04:34:59'),
(75, 5, 10, '2024-11-25 04:34:59', '2024-11-25 04:34:59'),
(76, 5, 24, '2024-11-25 04:35:00', '2024-11-25 04:35:00'),
(77, 5, 11, '2024-11-25 04:35:00', '2024-11-25 04:35:00'),
(78, 5, 25, '2024-11-25 04:35:01', '2024-11-25 04:35:01'),
(79, 5, 12, '2024-11-25 04:35:01', '2024-11-25 04:35:01'),
(80, 5, 26, '2024-11-25 04:35:02', '2024-11-25 04:35:02'),
(81, 5, 13, '2024-11-25 04:35:03', '2024-11-25 04:35:03'),
(82, 5, 27, '2024-11-25 04:35:03', '2024-11-25 04:35:03'),
(83, 5, 14, '2024-11-25 04:35:03', '2024-11-25 04:35:03'),
(84, 5, 28, '2024-11-25 04:35:04', '2024-11-25 04:35:04'),
(85, 6, 1, '2024-11-25 04:35:12', '2024-11-25 04:35:12'),
(86, 6, 2, '2024-11-25 04:35:13', '2024-11-25 04:35:13'),
(87, 6, 3, '2024-11-25 04:35:14', '2024-11-25 04:35:14'),
(88, 6, 4, '2024-11-25 04:35:15', '2024-11-25 04:35:15'),
(89, 6, 5, '2024-11-25 04:35:16', '2024-11-25 04:35:16'),
(90, 6, 6, '2024-11-25 04:35:17', '2024-11-25 04:35:17'),
(91, 6, 7, '2024-11-25 04:35:18', '2024-11-25 04:35:18'),
(92, 6, 8, '2024-11-25 04:35:19', '2024-11-25 04:35:19'),
(93, 6, 9, '2024-11-25 04:35:20', '2024-11-25 04:35:20'),
(94, 6, 10, '2024-11-25 04:35:21', '2024-11-25 04:35:21'),
(95, 6, 11, '2024-11-25 04:35:22', '2024-11-25 04:35:22'),
(96, 6, 12, '2024-11-25 04:35:23', '2024-11-25 04:35:23'),
(97, 6, 13, '2024-11-25 04:35:24', '2024-11-25 04:35:24'),
(98, 6, 14, '2024-11-25 04:35:25', '2024-11-25 04:35:25'),
(99, 7, 1, '2024-11-25 04:35:28', '2024-11-25 04:35:28'),
(100, 7, 2, '2024-11-25 04:35:30', '2024-11-25 04:35:30'),
(101, 7, 3, '2024-11-25 04:35:33', '2024-11-25 04:35:33'),
(102, 7, 4, '2024-11-25 04:35:34', '2024-11-25 04:35:34'),
(103, 7, 5, '2024-11-25 04:35:35', '2024-11-25 04:35:35'),
(104, 7, 6, '2024-11-25 04:35:37', '2024-11-25 04:35:37'),
(105, 7, 7, '2024-11-25 04:35:38', '2024-11-25 04:35:38'),
(106, 7, 8, '2024-11-25 04:35:42', '2024-11-25 04:35:42'),
(107, 7, 9, '2024-11-25 04:35:44', '2024-11-25 04:35:44'),
(108, 7, 10, '2024-11-25 04:35:45', '2024-11-25 04:35:45'),
(109, 7, 11, '2024-11-25 04:35:46', '2024-11-25 04:35:46'),
(110, 7, 12, '2024-11-25 04:35:48', '2024-11-25 04:35:48'),
(111, 7, 13, '2024-11-25 04:35:49', '2024-11-25 04:35:49'),
(112, 7, 14, '2024-11-25 04:35:51', '2024-11-25 04:35:51'),
(113, 8, 1, '2024-11-25 04:35:58', '2024-11-25 04:35:58'),
(114, 8, 2, '2024-11-25 04:35:59', '2024-11-25 04:35:59'),
(115, 8, 3, '2024-11-25 04:36:00', '2024-11-25 04:36:00'),
(116, 8, 4, '2024-11-25 04:36:01', '2024-11-25 04:36:01'),
(117, 8, 5, '2024-11-25 04:36:02', '2024-11-25 04:36:02'),
(118, 8, 6, '2024-11-25 04:36:03', '2024-11-25 04:36:03'),
(119, 8, 7, '2024-11-25 04:36:05', '2024-11-25 04:36:05'),
(120, 8, 8, '2024-11-25 04:36:06', '2024-11-25 04:36:06'),
(121, 8, 9, '2024-11-25 04:36:07', '2024-11-25 04:36:07'),
(122, 8, 10, '2024-11-25 04:36:08', '2024-11-25 04:36:08'),
(123, 8, 11, '2024-11-25 04:36:09', '2024-11-25 04:36:09'),
(124, 8, 12, '2024-11-25 04:36:10', '2024-11-25 04:36:10'),
(125, 8, 13, '2024-11-25 04:36:12', '2024-11-25 04:36:12'),
(126, 8, 14, '2024-11-25 04:36:12', '2024-11-25 04:36:12'),
(127, 9, 1, '2024-11-25 04:36:27', '2024-11-25 04:36:27'),
(128, 9, 2, '2024-11-25 04:36:28', '2024-11-25 04:36:28'),
(129, 9, 3, '2024-11-25 04:36:29', '2024-11-25 04:36:29'),
(130, 9, 4, '2024-11-25 04:36:29', '2024-11-25 04:36:29'),
(131, 9, 5, '2024-11-25 04:36:31', '2024-11-25 04:36:31'),
(132, 9, 6, '2024-11-25 04:36:32', '2024-11-25 04:36:32'),
(133, 9, 7, '2024-11-25 04:36:32', '2024-11-25 04:36:32'),
(134, 9, 8, '2024-11-25 04:36:34', '2024-11-25 04:36:34'),
(135, 9, 9, '2024-11-25 04:36:35', '2024-11-25 04:36:35'),
(136, 9, 10, '2024-11-25 04:36:36', '2024-11-25 04:36:36'),
(137, 9, 11, '2024-11-25 04:36:37', '2024-11-25 04:36:37'),
(138, 9, 12, '2024-11-25 04:36:38', '2024-11-25 04:36:38'),
(139, 9, 13, '2024-11-25 04:36:39', '2024-11-25 04:36:39'),
(140, 9, 14, '2024-11-25 04:36:40', '2024-11-25 04:36:40'),
(141, 10, 1, '2024-11-25 04:36:42', '2024-11-25 04:36:42'),
(142, 10, 15, '2024-11-25 04:36:43', '2024-11-25 04:36:43'),
(143, 10, 2, '2024-11-25 04:36:43', '2024-11-25 04:36:43'),
(144, 10, 16, '2024-11-25 04:36:44', '2024-11-25 04:36:44'),
(145, 10, 3, '2024-11-25 04:36:44', '2024-11-25 04:36:44'),
(146, 10, 17, '2024-11-25 04:36:45', '2024-11-25 04:36:45'),
(147, 10, 4, '2024-11-25 04:36:45', '2024-11-25 04:36:45'),
(148, 10, 18, '2024-11-25 04:36:46', '2024-11-25 04:36:46'),
(149, 10, 5, '2024-11-25 04:36:47', '2024-11-25 04:36:47'),
(150, 10, 19, '2024-11-25 04:36:47', '2024-11-25 04:36:47'),
(151, 10, 6, '2024-11-25 04:36:48', '2024-11-25 04:36:48'),
(152, 10, 20, '2024-11-25 04:36:48', '2024-11-25 04:36:48'),
(153, 10, 7, '2024-11-25 04:36:49', '2024-11-25 04:36:49'),
(154, 10, 21, '2024-11-25 04:36:50', '2024-11-25 04:36:50'),
(155, 10, 8, '2024-11-25 04:36:50', '2024-11-25 04:36:50'),
(156, 10, 22, '2024-11-25 04:36:50', '2024-11-25 04:36:50'),
(157, 10, 9, '2024-11-25 04:36:51', '2024-11-25 04:36:51'),
(158, 10, 23, '2024-11-25 04:36:52', '2024-11-25 04:36:52'),
(159, 10, 10, '2024-11-25 04:36:53', '2024-11-25 04:36:53'),
(160, 10, 24, '2024-11-25 04:36:54', '2024-11-25 04:36:54'),
(161, 10, 11, '2024-11-25 04:36:54', '2024-11-25 04:36:54'),
(162, 10, 25, '2024-11-25 04:36:55', '2024-11-25 04:36:55'),
(163, 10, 12, '2024-11-25 04:36:56', '2024-11-25 04:36:56'),
(164, 10, 26, '2024-11-25 04:36:57', '2024-11-25 04:36:57'),
(165, 10, 13, '2024-11-25 04:36:57', '2024-11-25 04:36:57'),
(166, 10, 27, '2024-11-25 04:36:57', '2024-11-25 04:36:57'),
(167, 10, 14, '2024-11-25 04:36:58', '2024-11-25 04:36:58'),
(168, 10, 28, '2024-11-25 04:36:59', '2024-11-25 04:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'production-1', '(M) PRODUCTION', '2023-04-23 09:27:10', '2023-05-03 06:09:03'),
(2, 1, 'sportswear-1', '(M) SPORTSWEAR', '2023-04-23 09:28:36', '2024-11-24 17:51:12'),
(3, 1, 'preliminary-interview-1', '(M) PRELIMINARY INTERVIEW', '2023-04-23 09:29:12', '2024-11-24 17:55:46'),
(4, 1, 'formal-wear-1', '(M) FORMAL WEAR', '2023-04-23 09:29:44', '2024-11-24 17:56:12'),
(5, 1, 'final-qa-1', '(M) FINAL Q&A', '2023-04-23 09:30:11', '2023-05-03 07:53:21'),
(6, 2, 'production-2', '(F) PRODUCTION', '2023-04-23 10:08:26', '2023-05-03 06:09:52'),
(7, 2, 'sportswear-2', '(F) SPORTSWEAR', '2023-04-23 10:08:43', '2024-11-24 17:58:45'),
(8, 2, 'preliminary-interview-2', '(F) PRELIMINARY INTERVIEW', '2023-04-23 10:09:14', '2024-11-25 00:57:43'),
(9, 2, 'formal-wear-2', '(F) FORMAL WEAR', '2023-04-23 10:09:48', '2024-11-24 17:59:55'),
(10, 2, 'final-qa-2', '(F) FINAL Q&A', '2023-04-23 10:10:04', '2023-05-03 07:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Judge 01', 'no-avatar.jpg', 'judge01', 'judge01', 'swimwear', NULL, NULL, '2023-04-06 13:58:11', '2024-11-25 04:41:16'),
(2, 2, 'Judge 02', 'no-avatar.jpg', 'judge02', 'judge02', NULL, NULL, NULL, '2023-04-06 13:58:28', '2024-11-24 17:44:31'),
(3, 3, 'Judge 03', 'no-avatar.jpg', 'judge03', 'judge03', NULL, NULL, NULL, '2023-04-06 13:58:42', '2024-11-24 17:44:31'),
(4, 4, 'Judge 04', 'no-avatar.jpg', 'judge04', 'judge04', NULL, NULL, NULL, '2023-04-06 13:59:26', '2024-11-24 17:44:31'),
(5, 5, 'Judge 05', 'no-avatar.jpg', 'judge05', 'judge05', NULL, NULL, NULL, '2023-04-06 14:00:00', '2024-11-24 17:44:31'),
(6, 6, 'Judge 06', 'no-avatar.jpg', 'judge06', 'judge06', NULL, NULL, NULL, '2024-11-24 18:27:51', '2024-11-24 18:27:51'),
(7, 7, 'Judge 07', 'no-avatar.jpg', 'juge07', 'judge07', NULL, NULL, NULL, '2024-11-24 18:28:18', '2024-11-24 18:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `judge_event`
--

CREATE TABLE `judge_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `is_chairman` tinyint(1) NOT NULL DEFAULT 0,
  `active_team_id` tinyint(3) UNSIGNED NOT NULL,
  `has_active_team` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judge_event`
--

INSERT INTO `judge_event` (`id`, `judge_id`, `event_id`, `is_chairman`, `active_team_id`, `has_active_team`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(2, 1, 2, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(3, 1, 3, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(4, 1, 4, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(5, 1, 5, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(6, 1, 6, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(7, 1, 7, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(8, 1, 8, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(9, 1, 9, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(10, 1, 10, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(11, 2, 1, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(12, 2, 2, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(13, 2, 3, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(14, 2, 4, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(15, 2, 5, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(16, 2, 6, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(17, 2, 7, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(18, 2, 8, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(19, 2, 9, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(20, 2, 10, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(21, 3, 1, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(22, 3, 2, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(23, 3, 3, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(24, 3, 4, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(25, 3, 5, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(26, 3, 6, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(27, 3, 7, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(28, 3, 8, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(29, 3, 9, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(30, 3, 10, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(31, 4, 1, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(32, 4, 2, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(33, 4, 3, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(34, 4, 4, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(35, 4, 5, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(36, 4, 6, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(37, 4, 7, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(38, 4, 8, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(39, 4, 9, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(40, 4, 10, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(41, 5, 1, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(42, 5, 2, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(43, 5, 3, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(44, 5, 4, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(45, 5, 5, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(46, 5, 6, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(47, 5, 7, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(48, 5, 8, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(49, 5, 9, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(50, 5, 10, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(51, 6, 1, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(52, 6, 2, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(53, 6, 3, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(54, 6, 4, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(55, 6, 5, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(56, 6, 6, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(57, 6, 7, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(58, 6, 8, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(59, 6, 9, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(60, 6, 10, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(61, 7, 1, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(62, 7, 2, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(63, 7, 3, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(64, 7, 4, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(65, 7, 5, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(66, 7, 6, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(67, 7, 7, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(68, 7, 8, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(69, 7, 9, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35'),
(70, 7, 10, 0, 1, 0, '2024-11-25 00:10:35', '2024-11-25 00:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `noshows`
--

CREATE TABLE `noshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `number` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `criteria_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `location` enum('JHS','SHS') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `number`, `name`, `location`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'John Paul Barazon', 'JHS', 'mr-1-john-paul-barazon.jpg', '2023-04-23 09:20:41', '2024-11-25 00:15:36'),
(2, 2, 'Ely John Yapan', 'JHS', 'mr-2-ely-john-yapan.jpg', '2023-04-23 09:20:41', '2024-11-25 00:15:39'),
(3, 3, 'Heziekia Uriel Alura', 'JHS', 'mr-3-heziekia-uriel-alura.jpg', '2023-04-23 09:20:41', '2024-11-25 00:15:42'),
(4, 4, 'Francis Sanglay', 'JHS', 'mr-4-francis-sanglay.jpg', '2023-04-23 09:20:41', '2024-11-25 04:30:22'),
(5, 5, 'Jethro Mesalucha', 'JHS', 'mr-5-jethro-mesalucha.jpg', '2023-04-23 09:20:41', '2024-11-25 00:15:49'),
(6, 6, 'Francis Xavier Pantaleon', 'JHS', 'mr-6-francis-xavier-pantaleon.jpg', '2023-04-23 09:20:41', '2024-11-25 00:15:52'),
(7, 7, 'Kendrick Torres', 'JHS', 'mr-7-kendrick-torres.jpg', '2023-04-23 09:20:41', '2024-11-25 00:15:56'),
(8, 8, 'Elyxzer Nathaniel Tapil', 'JHS', 'mr-8-elyxzer-nathaniel-tapil.jpg', '2023-04-23 09:20:41', '2024-11-25 00:15:59'),
(9, 9, 'Noli Jr. Alabastro', 'SHS', 'mr-9-noli-jr-alabastro.jpg', '2024-11-24 18:42:54', '2024-11-25 00:16:06'),
(10, 10, 'Kenneth Alfelor', 'SHS', 'mr-10-kenneth-alfelor.jpg', '2024-11-24 18:45:16', '2024-11-25 00:16:09'),
(11, 11, 'Lincolne Polvorido', 'SHS', 'mr-11-lincolne-polvorido.jpg', '2024-11-24 18:45:55', '2024-11-25 00:16:12'),
(12, 12, 'Lenard Salamanque', 'SHS', 'mr-12-lenard-salamanque.jpg', '2024-11-24 18:46:26', '2024-11-25 00:16:15'),
(13, 13, 'John Carlo Espiritu', 'SHS', 'mr-13-john-carlo-espiritu.jpg', '2024-11-24 18:46:59', '2024-11-25 00:16:18'),
(14, 14, 'Shan Emmanuel Canet', 'SHS', 'mr-14-shan-emmanuel-canet.jpg', '2024-11-24 18:47:25', '2024-11-25 00:16:20'),
(15, 1, 'Isabel Brizeth Libreja', 'JHS', 'ms-1-isabel-brizeth-libreja.jpg', '2023-04-23 09:20:41', '2024-11-25 00:16:28'),
(16, 2, 'Shilo Louise Cañada', 'JHS', 'ms-2-shilo-louise-cañada.jpg', '2023-04-23 09:20:41', '2024-11-25 00:16:31'),
(17, 3, '.Kyle Monique Serafico', 'JHS', 'ms-3-kyle-monique-serafico.jpg', '2023-04-23 09:20:41', '2024-11-25 00:16:34'),
(18, 4, 'Ira Bee Merced Ritcha', 'JHS', 'ms-4-ira-bee-merced-ritcha.jpg', '2023-04-23 09:20:41', '2024-11-25 00:16:37'),
(19, 5, 'Monica Jed Morada', 'JHS', 'ms-5-monica-jed-morada.jpg', '2023-04-23 09:20:41', '2024-11-25 00:16:39'),
(20, 6, 'Zamantha Obiasca', 'JHS', 'ms-6-zamantha-obiasca.jpg', '2023-04-23 09:20:41', '2024-11-25 00:16:42'),
(21, 7, 'Ynna Mikaela Pretoritis', 'JHS', 'ms-7-ynna-mikaela-pretoritis.jpg', '2023-04-23 09:20:41', '2024-11-25 00:16:46'),
(22, 8, 'Julianne Miles Barrientos', 'JHS', 'ms-8-julianne-miles-barrientos.jpg', '2023-04-23 09:20:41', '2024-11-25 00:16:55'),
(23, 9, 'Xhanne Frances Claveria', 'SHS', 'ms-9-xhanne-frances-claveria.jpg', '2024-11-24 17:43:53', '2024-11-25 00:16:59'),
(24, 10, 'Angela Ishi Ricafranca', 'SHS', 'ms-10-angela-ishi-ricafranca.jpg', '2024-11-24 18:52:08', '2024-11-25 04:44:06'),
(25, 11, 'Charmel Monte', 'SHS', 'ms-11-charmel-monte.jpg', '2024-11-24 18:52:34', '2024-11-25 04:44:10'),
(26, 12, 'Anna Jelena Sabinorio', 'SHS', 'ms-12-anna-jelena-sabinorio.jpg', '2024-11-24 18:53:01', '2024-11-25 04:44:17'),
(27, 13, 'Jillian Chloe Tabajonda', 'SHS', 'ms-13-jillian-chloe-tabajonda.jpg', '2024-11-24 18:53:21', '2024-11-25 04:44:20'),
(28, 14, 'Jhane Elizabeth Cornelio', 'SHS', 'ms-14-jhane-elizabeth-cornelio.jpg', '2024-11-24 18:53:44', '2024-11-25 04:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `technicals`
--

CREATE TABLE `technicals` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technicals`
--

INSERT INTO `technicals` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Technical 01', 'no-avatar.jpg', 'technical01', 'technical01', NULL, NULL, NULL, '2023-02-19 08:58:58', '2023-04-06 14:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `technical_event`
--

CREATE TABLE `technical_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `active_team_id` tinyint(3) UNSIGNED NOT NULL,
  `has_active_team` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `event_id`, `rank`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '(Male) Best in Production', '2024-11-25 04:16:11', '2024-11-25 04:25:37'),
(2, 2, 1, '(Male) Best in Sports Attire', '2024-11-25 04:16:11', '2024-11-25 04:25:44'),
(3, 4, 1, '(Male) Best in Formal Wear', '2024-11-25 04:16:11', '2024-11-25 04:25:50'),
(4, 5, 1, 'Ambassador of Sports 2024', '2024-11-25 04:16:11', '2024-11-25 04:28:10'),
(5, 5, 2, 'SHS Mr. Wellness Icon 2024', '2024-11-25 04:16:11', '2024-11-25 04:26:10'),
(6, 5, 3, 'JHS Mr. Wellness Icon 2024', '2024-11-25 04:16:11', '2024-11-25 04:26:15'),
(7, 5, 4, '1st Runner Up', '2024-11-25 04:16:11', '2024-11-25 04:27:04'),
(8, 5, 5, '2nd Runner Up', '2024-11-25 04:16:11', '2024-11-25 04:27:07'),
(9, 6, 1, '(Female) Best in Production', '2024-11-25 04:16:11', '2024-11-25 04:27:37'),
(10, 7, 1, '(Female) Best in Sports Attire', '2024-11-25 04:16:11', '2024-11-25 04:27:43'),
(11, 9, 1, '(Female) Best in Formal Wear', '2024-11-25 04:16:11', '2024-11-25 04:27:47'),
(12, 10, 1, 'Ambassadress of Sports 2024', '2024-11-25 04:16:12', '2024-11-25 04:28:40'),
(13, 10, 2, 'SHS Ms. Wellness Icon 2024', '2024-11-25 04:16:12', '2024-11-25 04:28:44'),
(14, 10, 3, 'JHS Ms. Wellness Icon 2024', '2024-11-25 04:16:12', '2024-11-25 04:28:46'),
(15, 10, 4, '1st Runner Up', '2024-11-25 04:16:12', '2024-11-25 04:28:51'),
(16, 10, 5, '2nd Runner Up', '2024-11-25 04:16:12', '2024-11-25 04:28:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `duos`
--
ALTER TABLE `duos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event1` (`event_id_1`),
  ADD KEY `event2` (`event_id_2`);

--
-- Indexes for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`category_id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `active_team_id` (`active_team_id`);

--
-- Indexes for table `noshows`
--
ALTER TABLE `noshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technicals`
--
ALTER TABLE `technicals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `active_team_id` (`active_team_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arrangements`
--
ALTER TABLE `arrangements`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duos`
--
ALTER TABLE `duos`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `eliminations`
--
ALTER TABLE `eliminations`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `judge_event`
--
ALTER TABLE `judge_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `noshows`
--
ALTER TABLE `noshows`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `technicals`
--
ALTER TABLE `technicals`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `technical_event`
--
ALTER TABLE `technical_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD CONSTRAINT `arrangements_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arrangements_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `criteria_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `deductions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_3` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `duos`
--
ALTER TABLE `duos`
  ADD CONSTRAINT `duos_ibfk_1` FOREIGN KEY (`event_id_1`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `duos_ibfk_2` FOREIGN KEY (`event_id_2`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD CONSTRAINT `eliminations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eliminations_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD CONSTRAINT `judge_event_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_3` FOREIGN KEY (`active_team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `noshows`
--
ALTER TABLE `noshows`
  ADD CONSTRAINT `noshows_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noshows_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD CONSTRAINT `technical_event_ibfk_2` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_4` FOREIGN KEY (`active_team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
