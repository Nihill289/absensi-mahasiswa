-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2026 at 07:39 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mhs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensis`
--

CREATE TABLE `absensis` (
  `id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `pertemuan_id` bigint UNSIGNED NOT NULL,
  `status` enum('hadir','izin','sakit','alfa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'alfa',
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `waktu_absen` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1794129037),
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1794129037;', 1794129037);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_kuliahs`
--

CREATE TABLE `jadwal_kuliahs` (
  `id` bigint UNSIGNED NOT NULL,
  `mata_kuliah_id` bigint UNSIGNED NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `ruangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Jayapura',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal_kuliahs`
--

INSERT INTO `jadwal_kuliahs` (`id`, `mata_kuliah_id`, `hari`, `jam_mulai`, `jam_selesai`, `ruangan`, `timezone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Senin', '15:20:00', '16:40:00', 'Lab 2 LT.1', 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17'),
(2, 2, 'Senin', '16:40:00', '18:00:00', 'Lab 2 LT.1', 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17'),
(3, 3, 'Selasa', '14:00:00', '15:20:00', 'Lab 2 LT.1', 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17'),
(4, 4, 'Selasa', '15:20:00', '16:40:00', 'El-Faqih/ur', 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17'),
(5, 5, 'Selasa', '16:40:00', '18:00:00', 'Lab 2 LT.1', 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17'),
(6, 6, 'Rabu', '14:00:00', '15:20:00', 'Lab 1 LT.2', 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17'),
(7, 7, 'Kamis', '14:00:00', '15:20:00', 'Lab 2 LT.1', 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17'),
(8, 8, 'Kamis', '16:40:00', '18:00:00', NULL, 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17'),
(9, 9, 'Jumat', '14:00:00', '15:20:00', 'Lab 1 LT.2', 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17'),
(10, 10, 'Jumat', '15:20:00', '16:40:00', 'Lab 2 LT.1', 'Asia/Jayapura', '2026-11-06 20:23:17', '2026-11-06 20:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kehadirans`
--

CREATE TABLE `kehadirans` (
  `id` bigint UNSIGNED NOT NULL,
  `mahasiswa_id` bigint UNSIGNED NOT NULL,
  `mata_kuliah_id` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kehadirans`
--

INSERT INTO `kehadirans` (`id`, `mahasiswa_id`, `mata_kuliah_id`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, 7, 3, '2026-08-18', '2026-11-07 01:28:08', '2026-11-07 01:28:08'),
(2, 7, 4, '2026-08-18', '2026-11-07 01:28:08', '2026-11-07 01:28:08'),
(3, 7, 5, '2026-08-18', '2026-11-07 01:28:08', '2026-11-07 01:28:08'),
(4, 7, 6, '2026-08-19', '2026-11-07 01:28:10', '2026-11-07 01:28:10'),
(5, 7, 7, '2026-08-20', '2026-11-07 01:28:16', '2026-11-07 01:28:16'),
(6, 7, 8, '2026-08-20', '2026-11-07 01:28:16', '2026-11-07 01:28:16'),
(7, 7, 9, '2026-08-21', '2026-11-07 01:28:17', '2026-11-07 01:28:17'),
(8, 7, 10, '2026-08-21', '2026-11-07 01:28:17', '2026-11-07 01:28:17'),
(9, 7, 1, '2026-08-24', '2026-11-07 01:28:18', '2026-11-07 01:28:18'),
(10, 7, 2, '2026-08-24', '2026-11-07 01:28:18', '2026-11-07 01:28:18'),
(11, 7, 3, '2026-08-25', '2026-11-07 01:28:19', '2026-11-07 01:28:19'),
(12, 7, 4, '2026-08-25', '2026-11-07 01:28:19', '2026-11-07 01:28:19'),
(13, 7, 5, '2026-08-25', '2026-11-07 01:28:19', '2026-11-07 01:28:19'),
(14, 7, 6, '2026-08-26', '2026-11-07 01:28:20', '2026-11-07 01:28:20'),
(15, 7, 7, '2026-08-27', '2026-11-07 01:28:21', '2026-11-07 01:28:21'),
(16, 7, 8, '2026-08-27', '2026-11-07 01:28:21', '2026-11-07 01:28:21'),
(17, 7, 9, '2026-08-28', '2026-11-07 01:28:22', '2026-11-07 01:28:22'),
(18, 7, 10, '2026-08-28', '2026-11-07 01:28:22', '2026-11-07 01:28:22'),
(19, 7, 1, '2026-08-31', '2026-11-07 01:28:24', '2026-11-07 01:28:24'),
(20, 7, 2, '2026-08-31', '2026-11-07 01:28:24', '2026-11-07 01:28:24'),
(24, 7, 6, '2026-09-02', '2026-11-07 01:30:16', '2026-11-07 01:30:16'),
(25, 7, 7, '2026-09-03', '2026-11-07 01:30:17', '2026-11-07 01:30:17'),
(26, 7, 8, '2026-09-03', '2026-11-07 01:30:17', '2026-11-07 01:30:17'),
(27, 7, 9, '2026-09-04', '2026-11-07 01:30:19', '2026-11-07 01:30:19'),
(28, 7, 10, '2026-09-04', '2026-11-07 01:30:19', '2026-11-07 01:30:19'),
(29, 7, 1, '2026-09-07', '2026-11-07 01:30:23', '2026-11-07 01:30:23'),
(30, 7, 2, '2026-09-07', '2026-11-07 01:30:23', '2026-11-07 01:30:23'),
(31, 7, 3, '2026-09-08', '2026-11-07 01:30:24', '2026-11-07 01:30:24'),
(32, 7, 4, '2026-09-08', '2026-11-07 01:30:24', '2026-11-07 01:30:24'),
(33, 7, 5, '2026-09-08', '2026-11-07 01:30:24', '2026-11-07 01:30:24'),
(34, 7, 6, '2026-09-09', '2026-11-07 01:30:25', '2026-11-07 01:30:25'),
(35, 7, 7, '2026-09-10', '2026-11-07 01:30:26', '2026-11-07 01:30:26'),
(36, 7, 8, '2026-09-10', '2026-11-07 01:30:26', '2026-11-07 01:30:26'),
(37, 7, 9, '2026-09-11', '2026-11-07 01:30:27', '2026-11-07 01:30:27'),
(38, 7, 10, '2026-09-11', '2026-11-07 01:30:27', '2026-11-07 01:30:27'),
(39, 7, 1, '2026-09-14', '2026-11-07 01:30:31', '2026-11-07 01:30:31'),
(40, 7, 2, '2026-09-14', '2026-11-07 01:30:31', '2026-11-07 01:30:31'),
(41, 7, 3, '2026-09-15', '2026-11-07 01:30:31', '2026-11-07 01:30:31'),
(42, 7, 4, '2026-09-15', '2026-11-07 01:30:31', '2026-11-07 01:30:31'),
(43, 7, 5, '2026-09-15', '2026-11-07 01:30:31', '2026-11-07 01:30:31'),
(44, 7, 6, '2026-09-16', '2026-11-07 01:30:33', '2026-11-07 01:30:33'),
(45, 7, 7, '2026-09-17', '2026-11-07 01:30:35', '2026-11-07 01:30:35'),
(46, 7, 8, '2026-09-17', '2026-11-07 01:30:35', '2026-11-07 01:30:35'),
(47, 7, 9, '2026-09-18', '2026-11-07 01:30:36', '2026-11-07 01:30:36'),
(48, 7, 10, '2026-09-18', '2026-11-07 01:30:36', '2026-11-07 01:30:36'),
(49, 7, 1, '2026-09-21', '2026-11-07 01:30:38', '2026-11-07 01:30:38'),
(50, 7, 2, '2026-09-21', '2026-11-07 01:30:38', '2026-11-07 01:30:38'),
(51, 7, 3, '2026-09-22', '2026-11-07 01:30:39', '2026-11-07 01:30:39'),
(52, 7, 4, '2026-09-22', '2026-11-07 01:30:39', '2026-11-07 01:30:39'),
(53, 7, 5, '2026-09-22', '2026-11-07 01:30:39', '2026-11-07 01:30:39'),
(54, 7, 6, '2026-09-23', '2026-11-07 01:30:40', '2026-11-07 01:30:40'),
(55, 7, 7, '2026-09-24', '2026-11-07 01:30:42', '2026-11-07 01:30:42'),
(56, 7, 8, '2026-09-24', '2026-11-07 01:30:42', '2026-11-07 01:30:42'),
(57, 7, 9, '2026-09-25', '2026-11-07 01:30:43', '2026-11-07 01:30:43'),
(58, 7, 10, '2026-09-25', '2026-11-07 01:30:43', '2026-11-07 01:30:43'),
(59, 7, 1, '2026-09-28', '2026-11-07 01:30:46', '2026-11-07 01:30:46'),
(60, 7, 2, '2026-09-28', '2026-11-07 01:30:46', '2026-11-07 01:30:46'),
(61, 7, 3, '2026-09-29', '2026-11-07 01:30:46', '2026-11-07 01:30:46'),
(62, 7, 4, '2026-09-29', '2026-11-07 01:30:46', '2026-11-07 01:30:46'),
(63, 7, 5, '2026-09-29', '2026-11-07 01:30:46', '2026-11-07 01:30:46'),
(64, 7, 6, '2026-09-30', '2026-11-07 01:30:47', '2026-11-07 01:30:47'),
(65, 7, 7, '2026-10-01', '2026-11-07 01:32:24', '2026-11-07 01:32:24'),
(66, 7, 8, '2026-10-01', '2026-11-07 01:32:24', '2026-11-07 01:32:24'),
(67, 7, 9, '2026-10-02', '2026-11-07 01:32:25', '2026-11-07 01:32:25'),
(68, 7, 10, '2026-10-02', '2026-11-07 01:32:25', '2026-11-07 01:32:25'),
(69, 7, 1, '2026-10-05', '2026-11-07 01:32:26', '2026-11-07 01:32:26'),
(70, 7, 2, '2026-10-05', '2026-11-07 01:32:26', '2026-11-07 01:32:26'),
(71, 7, 3, '2026-10-06', '2026-11-07 01:32:28', '2026-11-07 01:32:28'),
(72, 7, 4, '2026-10-06', '2026-11-07 01:32:28', '2026-11-07 01:32:28'),
(73, 7, 5, '2026-10-06', '2026-11-07 01:32:28', '2026-11-07 01:32:28'),
(74, 7, 6, '2026-10-07', '2026-11-07 01:32:29', '2026-11-07 01:32:29'),
(75, 7, 7, '2026-10-08', '2026-11-07 01:32:31', '2026-11-07 01:32:31'),
(76, 7, 8, '2026-10-08', '2026-11-07 01:32:31', '2026-11-07 01:32:31'),
(77, 7, 9, '2026-10-09', '2026-11-07 01:32:32', '2026-11-07 01:32:32'),
(78, 7, 10, '2026-10-09', '2026-11-07 01:32:32', '2026-11-07 01:32:32'),
(79, 7, 1, '2026-10-12', '2026-11-07 01:32:33', '2026-11-07 01:32:33'),
(80, 7, 2, '2026-10-12', '2026-11-07 01:32:33', '2026-11-07 01:32:33'),
(81, 7, 3, '2026-10-13', '2026-11-07 01:32:34', '2026-11-07 01:32:34'),
(82, 7, 4, '2026-10-13', '2026-11-07 01:32:34', '2026-11-07 01:32:34'),
(83, 7, 5, '2026-10-13', '2026-11-07 01:32:34', '2026-11-07 01:32:34'),
(84, 7, 6, '2026-10-14', '2026-11-07 01:32:35', '2026-11-07 01:32:35'),
(85, 7, 7, '2026-10-15', '2026-11-07 01:32:36', '2026-11-07 01:32:36'),
(86, 7, 8, '2026-10-15', '2026-11-07 01:32:36', '2026-11-07 01:32:36'),
(87, 7, 9, '2026-10-16', '2026-11-07 01:32:38', '2026-11-07 01:32:38'),
(88, 7, 10, '2026-10-16', '2026-11-07 01:32:38', '2026-11-07 01:32:38'),
(89, 7, 1, '2026-10-19', '2026-11-07 01:32:39', '2026-11-07 01:32:39'),
(90, 7, 2, '2026-10-19', '2026-11-07 01:32:39', '2026-11-07 01:32:39'),
(91, 7, 3, '2026-10-20', '2026-11-07 01:32:40', '2026-11-07 01:32:40'),
(92, 7, 4, '2026-10-20', '2026-11-07 01:32:40', '2026-11-07 01:32:40'),
(93, 7, 5, '2026-10-20', '2026-11-07 01:32:40', '2026-11-07 01:32:40'),
(94, 7, 6, '2026-10-21', '2026-11-07 01:32:41', '2026-11-07 01:32:41'),
(95, 7, 7, '2026-10-22', '2026-11-07 01:32:41', '2026-11-07 01:32:41'),
(96, 7, 8, '2026-10-22', '2026-11-07 01:32:41', '2026-11-07 01:32:41'),
(97, 7, 9, '2026-10-23', '2026-11-07 01:32:42', '2026-11-07 01:32:42'),
(98, 7, 10, '2026-10-23', '2026-11-07 01:32:42', '2026-11-07 01:32:42'),
(99, 7, 1, '2026-10-26', '2026-11-07 01:32:44', '2026-11-07 01:32:44'),
(100, 7, 2, '2026-10-26', '2026-11-07 01:32:44', '2026-11-07 01:32:44'),
(101, 7, 3, '2026-10-27', '2026-11-07 01:32:45', '2026-11-07 01:32:45'),
(102, 7, 4, '2026-10-27', '2026-11-07 01:32:45', '2026-11-07 01:32:45'),
(103, 7, 5, '2026-10-27', '2026-11-07 01:32:45', '2026-11-07 01:32:45'),
(104, 7, 6, '2026-10-28', '2026-11-07 01:32:46', '2026-11-07 01:32:46'),
(105, 7, 7, '2026-10-29', '2026-11-07 01:32:47', '2026-11-07 01:32:47'),
(106, 7, 8, '2026-10-29', '2026-11-07 01:32:47', '2026-11-07 01:32:47'),
(107, 7, 9, '2026-10-30', '2026-11-07 01:32:48', '2026-11-07 01:32:48'),
(108, 7, 10, '2026-10-30', '2026-11-07 01:32:48', '2026-11-07 01:32:48'),
(109, 7, 1, '2026-11-02', '2026-11-07 01:33:30', '2026-11-07 01:33:30'),
(110, 7, 2, '2026-11-02', '2026-11-07 01:33:30', '2026-11-07 01:33:30'),
(111, 7, 3, '2026-11-03', '2026-11-07 01:33:31', '2026-11-07 01:33:31'),
(112, 7, 4, '2026-11-03', '2026-11-07 01:33:31', '2026-11-07 01:33:31'),
(113, 7, 5, '2026-11-03', '2026-11-07 01:33:31', '2026-11-07 01:33:31'),
(114, 7, 7, '2026-11-05', '2026-11-07 01:33:32', '2026-11-07 01:33:32'),
(115, 7, 8, '2026-11-05', '2026-11-07 01:33:32', '2026-11-07 01:33:32'),
(116, 7, 6, '2026-11-04', '2026-11-07 01:33:34', '2026-11-07 01:33:34'),
(117, 7, 9, '2026-11-06', '2026-11-07 01:33:34', '2026-11-07 01:33:34'),
(118, 7, 10, '2026-11-06', '2026-11-07 01:33:35', '2026-11-07 01:33:35'),
(119, 7, 3, '2026-09-01', '2026-11-07 02:13:50', '2026-11-07 02:13:50'),
(120, 7, 4, '2026-09-01', '2026-11-07 02:13:50', '2026-11-07 02:13:50'),
(121, 7, 5, '2026-09-01', '2026-11-07 02:13:50', '2026-11-07 02:13:50'),
(125, 34, 6, '2026-08-19', '2026-11-07 02:39:21', '2026-11-07 02:39:21'),
(126, 34, 7, '2026-08-20', '2026-11-07 02:39:25', '2026-11-07 02:39:25'),
(127, 34, 8, '2026-08-20', '2026-11-07 02:39:25', '2026-11-07 02:39:25'),
(131, 34, 9, '2026-08-21', '2026-11-07 02:39:30', '2026-11-07 02:39:30'),
(132, 34, 10, '2026-08-21', '2026-11-07 02:39:30', '2026-11-07 02:39:30'),
(136, 34, 3, '2026-08-18', '2026-11-07 02:39:35', '2026-11-07 02:39:35'),
(137, 34, 4, '2026-08-18', '2026-11-07 02:39:35', '2026-11-07 02:39:35'),
(138, 34, 5, '2026-08-18', '2026-11-07 02:39:35', '2026-11-07 02:39:35'),
(139, 34, 3, '2026-08-25', '2026-11-07 02:40:15', '2026-11-07 02:40:15'),
(140, 34, 4, '2026-08-25', '2026-11-07 02:40:15', '2026-11-07 02:40:15'),
(141, 34, 5, '2026-08-25', '2026-11-07 02:40:15', '2026-11-07 02:40:15'),
(142, 34, 6, '2026-08-26', '2026-11-07 02:40:17', '2026-11-07 02:40:17'),
(143, 34, 1, '2026-09-28', '2026-11-07 02:40:33', '2026-11-07 02:40:33'),
(144, 34, 2, '2026-09-28', '2026-11-07 02:40:33', '2026-11-07 02:40:33'),
(145, 34, 1, '2026-08-24', '2026-11-07 02:40:46', '2026-11-07 02:40:46'),
(146, 34, 2, '2026-08-24', '2026-11-07 02:40:46', '2026-11-07 02:40:46'),
(147, 34, 7, '2026-08-27', '2026-11-07 02:40:50', '2026-11-07 02:40:50'),
(148, 34, 8, '2026-08-27', '2026-11-07 02:40:50', '2026-11-07 02:40:50'),
(149, 34, 9, '2026-08-28', '2026-11-07 02:40:53', '2026-11-07 02:40:53'),
(150, 34, 10, '2026-08-28', '2026-11-07 02:40:53', '2026-11-07 02:40:53'),
(151, 34, 1, '2026-08-31', '2026-11-07 02:40:59', '2026-11-07 02:40:59'),
(152, 34, 2, '2026-08-31', '2026-11-07 02:40:59', '2026-11-07 02:40:59'),
(153, 34, 3, '2026-09-01', '2026-11-07 02:41:02', '2026-11-07 02:41:02'),
(154, 34, 4, '2026-09-01', '2026-11-07 02:41:02', '2026-11-07 02:41:02'),
(155, 34, 5, '2026-09-01', '2026-11-07 02:41:02', '2026-11-07 02:41:02'),
(156, 34, 6, '2026-09-02', '2026-11-07 02:41:04', '2026-11-07 02:41:04'),
(159, 34, 7, '2026-09-03', '2026-11-07 02:41:06', '2026-11-07 02:41:06'),
(160, 34, 8, '2026-09-03', '2026-11-07 02:41:06', '2026-11-07 02:41:06'),
(161, 34, 9, '2026-09-04', '2026-11-07 02:41:08', '2026-11-07 02:41:08'),
(162, 34, 10, '2026-09-04', '2026-11-07 02:41:08', '2026-11-07 02:41:08'),
(163, 34, 1, '2026-09-07', '2026-11-07 02:41:10', '2026-11-07 02:41:10'),
(164, 34, 2, '2026-09-07', '2026-11-07 02:41:10', '2026-11-07 02:41:10'),
(165, 34, 3, '2026-09-08', '2026-11-07 02:41:12', '2026-11-07 02:41:12'),
(166, 34, 4, '2026-09-08', '2026-11-07 02:41:12', '2026-11-07 02:41:12'),
(167, 34, 5, '2026-09-08', '2026-11-07 02:41:12', '2026-11-07 02:41:12'),
(168, 34, 6, '2026-09-09', '2026-11-07 02:41:14', '2026-11-07 02:41:14'),
(169, 34, 7, '2026-09-10', '2026-11-07 02:41:16', '2026-11-07 02:41:16'),
(170, 34, 8, '2026-09-10', '2026-11-07 02:41:16', '2026-11-07 02:41:16'),
(171, 34, 1, '2026-09-14', '2026-11-07 02:41:38', '2026-11-07 02:41:38'),
(172, 34, 2, '2026-09-14', '2026-11-07 02:41:38', '2026-11-07 02:41:38'),
(173, 34, 9, '2026-09-11', '2026-11-07 02:41:41', '2026-11-07 02:41:41'),
(174, 34, 10, '2026-09-11', '2026-11-07 02:41:41', '2026-11-07 02:41:41'),
(175, 34, 1, '2026-09-21', '2026-11-07 02:41:46', '2026-11-07 02:41:46'),
(176, 34, 2, '2026-09-21', '2026-11-07 02:41:46', '2026-11-07 02:41:46'),
(177, 34, 3, '2026-09-15', '2026-11-07 02:41:48', '2026-11-07 02:41:48'),
(178, 34, 4, '2026-09-15', '2026-11-07 02:41:48', '2026-11-07 02:41:48'),
(179, 34, 5, '2026-09-15', '2026-11-07 02:41:48', '2026-11-07 02:41:48'),
(180, 34, 3, '2026-09-22', '2026-11-07 02:41:50', '2026-11-07 02:41:50'),
(181, 34, 4, '2026-09-22', '2026-11-07 02:41:50', '2026-11-07 02:41:50'),
(182, 34, 5, '2026-09-22', '2026-11-07 02:41:50', '2026-11-07 02:41:50'),
(183, 34, 3, '2026-09-29', '2026-11-07 02:41:53', '2026-11-07 02:41:53'),
(184, 34, 4, '2026-09-29', '2026-11-07 02:41:53', '2026-11-07 02:41:53'),
(185, 34, 5, '2026-09-29', '2026-11-07 02:41:53', '2026-11-07 02:41:53'),
(186, 1, 3, '2026-08-18', '2026-11-07 02:55:23', '2026-11-07 02:55:23'),
(187, 1, 4, '2026-08-18', '2026-11-07 02:55:23', '2026-11-07 02:55:23'),
(188, 1, 5, '2026-08-18', '2026-11-07 02:55:23', '2026-11-07 02:55:23'),
(189, 1, 6, '2026-08-19', '2026-11-07 02:55:25', '2026-11-07 02:55:25'),
(190, 14, 3, '2026-08-18', '2026-11-08 00:09:48', '2026-11-08 00:09:48'),
(191, 14, 4, '2026-08-18', '2026-11-08 00:09:48', '2026-11-08 00:09:48'),
(192, 14, 5, '2026-08-18', '2026-11-08 00:09:48', '2026-11-08 00:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` bigint UNSIGNED NOT NULL,
  `nim` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` tinyint UNSIGNED NOT NULL DEFAULT '3',
  `status` enum('aktif','nonaktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `nim`, `nama`, `password`, `jenis_kelamin`, `semester`, `status`, `created_at`, `updated_at`) VALUES
(1, '2511001', 'ADRIAN SUDIRMAN', '$2y$12$68fF0RVMqNhOiBkhKlqz0uaGA23Tt2Nynm9apJA2DKyjmnxl.H4Qi', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:07'),
(2, '2511002', 'ALFIN MAHMUD', '$2y$12$e1b6IXDF21muGD9FrKSCfuxolY7znzi/MK/vPhjeb1.vIMGiLkKW2', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:07'),
(3, '2511003', 'ANDY RICANDI MAKASAR', '$2y$12$GD6hvzbEfilvw6MNN4yLyufenIXG/o8Sxlgr/p8VDPdJGXPkfPP6S', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:07'),
(4, '2511006', 'APRILIA PHILADELPIA', '$2y$12$mqu/0lw0VdXakrgOJILuq.kXx.BJlT7xynQfW4QNW/5J43lwxOjhW', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:08'),
(5, '2511007', 'APTORO NIRIGI', '$2y$12$4jbSHVQAnLMkcs/EY14s6esUfEhdRBxuOCf5veBVgi7E6zghyZgmi', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:08'),
(6, '2511008', 'BERNARDUS KABRAHANUBUN', '$2y$12$QYEFdoTn6Zz7zvyj5I7Qd.oZ8kHagBxQFhY.arTQy4H9Fua00pIJm', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:08'),
(7, '2511009', 'CAESAR LANDS RISYET YANUARING', '$2y$12$o1.nWKn1tTEXt6OdKKiiF.on4jB2sbinkk/2GVQABNCJbnyKOwNqe', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 00:36:32'),
(8, '2511010', 'CELSI O. OHOIULUN', '$2y$12$AfAM8sWVfus90QW.m/dXy.We3tBE5gs.Uzz9yHFy8VK8KBIEe0.R.', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:08'),
(9, '2511011', 'DAMIANUS KUDIAI', '$2y$12$kLAKW9wAMZ67djmsYwYzSOOYn8.mgb8F1VKi7aumD2yz68DKTRAlC', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:08'),
(10, '2511012', 'FEBRIANTO SIPAHELUT', '$2y$12$gJ4MuAbPHe0Kme8qnbIyNuPMq06qAQlDYjyB1kHdZb5VLf89q4aPa', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:09'),
(11, '2511013', 'JELITON ALOM', '$2y$12$r3nZSGrXQvCNkRKS2QLt.eDrhy/wCHk5/8eJVbRqf6/FcKvkdNnBy', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:09'),
(12, '2511014', 'JHELANSY SNAE', '$2y$12$Mtj2XTrwgPZ7LcPycbNnye/7lBqaqCFRpKpye5l7TB2GRfpgGL3vO', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:09'),
(13, '2511015', 'JULIO JHOSUWA SADSUITUBUN', '$2y$12$ShYZiJRIBNR8TaHZK1IpTew8CYEihpnZH0ggIZ8EHp94QJR7L4Fx2', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:09'),
(14, '2511017', 'LIONEL. N. E. RAHANGMETAN', '$2y$12$MpyF2gN0H1rZDUmGYJb50u/daIoYI0fPK6yord5nRtVIhxc.lUxtO', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:09'),
(15, '2511018', 'LOINA MAATOKE', '$2y$12$lUSYIEkI/LjupTWLULMt9uM.IW/pEmiiGeTb.wKu5rUhpRW6yjh32', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:10'),
(16, '2511019', 'MARIA A. JANWARIN', '$2y$12$AsiMJHSxN5cPVqhHUKe6hODo3SWeEZhl8tKCNDbrf3T6IDBbCWkm2', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:10'),
(17, '2511020', 'MARIA BEATRIX CATERINA RESAM', '$2y$12$O6Z7wyMVGBTMSgz7cSFkyeSlOY3u42LeYPRL6JEBr8UspdVfE48zG', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:10'),
(18, '2511021', 'MARIA LODOWINA RUMSORY', '$2y$12$rICr9Fpp.2GwhaJEzJCeXuKUzTR8SmkDMnuQrdJM/rKD0BkQxyy2S', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:10'),
(19, '2511022', 'MARIO JULIAR AGUSTINO LASOL', '$2y$12$6WaSjJCtR1Lh2nH69kRi6uEDGe.5KwE64epbIq9LB4/UNiRkAjCpq', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:10'),
(20, '2511023', 'MUH. ABIM PANGESTU', '$2y$12$Jt62IeI60nt679eJfOiHjOCWQ7K5IfeMev7wkKdtz2aM7t2rGFiKu', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:11'),
(21, '2511024', 'MUHAMMAD IRIANTO', '$2y$12$8EH2v8xe9rgDb9l47KAKJ.gyIt9OscmpYPvM7lqLIcmJgHoSt8e2O', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:11'),
(22, '2511025', 'MUHAMMAD SYAHRIL', '$2y$12$yIdrQ0O2.oxkTwR2aNPTCOvr2YSJQWTLP3I3xkvXx6Byjl3fA/npm', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:11'),
(23, '2511026', 'MUHAMMAD TAUFIQ ILHAM', '$2y$12$OmsM4F89BkYV5prZ9yo8guOTcL9bjel6qAPMRYNG4EJ1C3y.3A.Lq', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:11'),
(24, '2511027', 'MUHAMMAD YUSUF', '$2y$12$NEzAV0ICOBCLc2GE.79ZsebpBZk5cD28xRO/z37Ad1VrCzcJVLHty', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:11'),
(25, '2511028', 'MULIA HAMDAN BAKTI', '$2y$12$/AJGf.Q4OuP9CV456E.a.u4fQPcZdUj1aZ2xPRoCr5exgb2fn2Gee', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:12'),
(26, '2511029', 'NAJWA ALICIA PINKAN ZAHRA', '$2y$12$c79pyZyQ3BzIGw6taB.B1etmhMppV6t7oF4I/Y8X9c7oISQJvQRV6', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:12'),
(27, '2511030', 'NURUL RATNA ANDAYANI', '$2y$12$VLrjow68KQOGByZ/CRJIpO.v3zcT7yvyhEcVMwH9Wm.8p2kC0a.pi', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:12'),
(28, '2511031', 'PRISKILA HAGABAL', '$2y$12$XOPBZhYr9oA7IIau79uPbOAZBCUslTcVN.LR0w8MOIdKYk.Jmbt.e', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:12'),
(29, '2511032', 'RAHMAT HIDAYATULLAH', '$2y$12$nB00PJR7vSZcMvqJ6Ucuy.GziD0JXdIb7ultnFs0HKUJywWiEl.xq', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:12'),
(30, '2511033', 'RINCE JARINAP', '$2y$12$j0.rXGYQtMk/2dXe.hs7LuonXmtWMG85HO6Z.8yM1/wHzw8QLGI/y', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:13'),
(31, '2511034', 'SURIANTI ALIAS', '$2y$12$0QkS6nZ1MsD6zgxumM33dOydK3QTFJwZHRwLAHj.QrK9p6b3sDv7O', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:13'),
(32, '2511035', 'TIKAYANTI RO\'SON', '$2y$12$1kKKPaK4RPpDvTgHA7DY/OKqH7PZfV889mnbaciAG1s.1c6f3hXqK', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:13'),
(33, '2511036', 'THERESIA INQE NDVENA', '$2y$12$ueseHTuQ7afkO97wSMD4geyRjH4m7Lbo4oqf2N5aF.jmjdDwIT19i', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:13'),
(34, '2511037', 'YULI MINCE DEGEI', '$2y$12$TKrwZFq3BXs1lsDnS1/age3wKS0DJ2dmHgrKwxNDSCZ.HAK26zIkK', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:13'),
(35, '2511038', 'YULINCE MAGAI', '$2y$12$y/M3Q9WT5Oot9/jAB0lV2uTsYrkbQ1pn.TWo84i34rgvm7Iz9NdVe', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:14'),
(36, '2511039', 'YUSTINA FAUWAWAN', '$2y$12$6KhAhrEb/p6D02dlZHrvRuGlxfMCu4DpsITBRfzJZrDC/G8fzonqe', NULL, 3, 'aktif', '2026-11-06 19:32:11', '2026-11-07 02:38:14');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliahs`
--

CREATE TABLE `mata_kuliahs` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` tinyint UNSIGNED NOT NULL DEFAULT '2',
  `semester` tinyint UNSIGNED NOT NULL DEFAULT '3',
  `dosen` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('aktif','nonaktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_pertemuan` tinyint UNSIGNED NOT NULL DEFAULT '14'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mata_kuliahs`
--

INSERT INTO `mata_kuliahs` (`id`, `kode`, `nama`, `sks`, `semester`, `dosen`, `status`, `created_at`, `updated_at`, `total_pertemuan`) VALUES
(1, 'TRI329', 'PEMROGRAMAN WEB 2', 2, 3, 'SYAWAL APRIAN', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14),
(2, 'TRI331', 'PRAKTIK BASIS DATA', 2, 3, 'ADHE RONNY JULIANS', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14),
(3, 'TRI325', 'JARINGAN KOMPUTER 2', 2, 3, 'AMANDO CHRISTIANO RENWARIN', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14),
(4, 'TRI324', 'STATISTIKA', 2, 3, 'NURSAHAR BUANG', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14),
(5, 'TRI323', 'SISTEM OPERASI JARINGAN', 2, 3, 'SYAWAL APRIAN', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14),
(6, 'TRI327', 'ADMINISTRASI DAN MANAJEMEN JARINGAN 1', 2, 3, 'SYAWAL APRIAN', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14),
(7, 'TRI328', 'PRAKTIK ADMINISTRASI DAN MANAJEMEN JARINGAN 1', 2, 3, 'SYAWAL APRIAN', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14),
(8, 'TRI322', 'PERANCANGAN JARINGAN 1', 2, 3, 'YOSEF AGUNG PRATAMA', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14),
(9, 'TRI330', 'PRAKTIK PEMROGRAMAN WEB 2', 2, 3, 'SYAWAL APRIAN', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14),
(10, 'TRI326', 'PRAKTIK JARINGAN KOMPUTER 2', 2, 3, 'AMANDO CHRISTIANO RENWARIN', 'aktif', '2026-11-06 20:05:01', '2026-11-06 20:05:01', 14);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_11_06_180901_create_mahasiswas_table', 2),
(5, '2026_11_06_181429_create_mata_kuliahs_table', 3),
(6, '2026_11_06_181549_create_pertemuans_table', 4),
(7, '2026_11_06_181848_create_absensis_table', 5),
(8, '2026_11_06_200837_create_jadwal_kuliahs_table', 6),
(9, '2026_11_06_202133_add_columns_to_jadwal_kuliahs_table', 7),
(10, '2026_11_06_204031_add_unique_constraint_to_absensis_table', 8),
(11, '2026_11_07_100000_create_kehadirans_table', 9),
(12, '2026_11_07_102506_add_total_pertemuan_to_mata_kuliahs_table', 9),
(13, '2026_11_07_112421_add_nim_role_status_to_users_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pertemuans`
--

CREATE TABLE `pertemuans` (
  `id` bigint UNSIGNED NOT NULL,
  `mata_kuliah_id` bigint UNSIGNED NOT NULL,
  `pertemuan_ke` tinyint UNSIGNED NOT NULL,
  `tanggal` date DEFAULT NULL,
  `materi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('terjadwal','berlangsung','selesai','dibatalkan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'terjadwal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pertemuans`
--

INSERT INTO `pertemuans` (`id`, `mata_kuliah_id`, `pertemuan_ke`, `tanggal`, `materi`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2026-08-18', 'pembuka', 'selesai', '2026-11-06 12:08:16', '2026-11-06 12:08:16'),
(2, 4, 1, '2026-08-18', 'pembuka', 'selesai', '2026-11-06 12:08:41', '2026-11-06 12:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `semester` int NOT NULL,
  `major` varchar(255) NOT NULL,
  `campus` varchar(255) NOT NULL,
  `hobby` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `portfolios`
--

INSERT INTO `portfolios` (`id`, `name`, `nim`, `birth_date`, `birth_place`, `semester`, `major`, `campus`, `hobby`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Aptoro Nirigi', '2511007', '2004-06-16', 'Wuarem', 3, 'Teknologi Rekayasa Internet', 'Politeknik Amamapare Timika', 'Bermain Bola', 'Mahasiswa Teknologi Rekayasa Internet yang tertarik pada teknologi dan pengembangan website.', '2026-11-09 10:26:26', '2026-11-09 10:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Umsz53ZZM4iT9PKgSn3NJGtj1h7k1zOuF8g2CL20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJtTzkxMms1c1dtcnQxdE1SWGdxNHFOVXlMRzlrMVUweXRCelRiSWdMIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2xvZ2luIiwicm91dGUiOiJsb2dpbiJ9fQ==', 1794129051);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `nim` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mahasiswa',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nim`, `name`, `email`, `email_verified_at`, `password`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '2511001', 'ADRIAN SUDIRMAN', '2511001@mahasiswa.tri.local', NULL, '$2y$12$SvMMWzbgjbsVdwDOTx7vOuUiOPs1s3GD0YJGyVUKnNFlT4jE9cam2', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:17', '2026-11-07 02:32:32'),
(2, '2511002', 'ALFIN MAHMUD', '2511002@mahasiswa.tri.local', NULL, '$2y$12$eeFg98cgyEfLp/ghFe575ObdAAQMe8rUX9WXvReDXvakSmMF8.OC6', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:17', '2026-11-07 02:32:32'),
(3, '2511003', 'ANDY RICANDI MAKASAR', '2511003@mahasiswa.tri.local', NULL, '$2y$12$9q3zhLP52gNCv/.FDaNu7uGGiw9.WHmKIAIS9OTBvAft.Xot4.equ', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:18', '2026-11-07 02:32:32'),
(4, '2511006', 'APRILIA PHILADELPIA', '2511006@mahasiswa.tri.local', NULL, '$2y$12$A/SsTOOEgg0Q0rLUIjrxKueSHYA7s6lCp0hf.GX2304okry.BBKsC', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:18', '2026-11-07 02:32:33'),
(5, '2511007', 'APTORO NIRIGI', '2511007@mahasiswa.tri.local', NULL, '$2y$12$CwBeKJpTBLtCyQSv0LRfpOl3od/WDz6Fl/xq2Z.ccQSB4PUBdlrr2', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:18', '2026-11-07 02:32:33'),
(6, '2511008', 'BERNARDUS KABRAHANUBUN', '2511008@mahasiswa.tri.local', NULL, '$2y$12$iWTWrnYw0wh7irpSGRA30.sesmuZbEF3ot8kL3/gxMChUHLlCSs..', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:18', '2026-11-07 02:32:33'),
(7, '2511010', 'CELSI O. OHOIULUN', '2511010@mahasiswa.tri.local', NULL, '$2y$12$0nqBiJ.lzAncNOTKi93avu5G7XHbB13ogc.Ns1545IhV5cCXH8.wq', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:18', '2026-11-07 02:32:33'),
(8, '2511011', 'DAMIANUS KUDIAI', '2511011@mahasiswa.tri.local', NULL, '$2y$12$O3DiXXE3QJ52kLl0oA84EuQ.VkhQoEZ024T0TsvdyJwhmp3esO3hq', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:19', '2026-11-07 02:32:33'),
(9, '2511012', 'FEBRIANTO SIPAHELUT', '2511012@mahasiswa.tri.local', NULL, '$2y$12$t1QPKvWiL5AFJ3urMSx.fu78Ahq6n72qmFQ9/yivzIvvD2EUk33VG', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:19', '2026-11-07 02:32:34'),
(10, '2511013', 'JELITON ALOM', '2511013@mahasiswa.tri.local', NULL, '$2y$12$DLDTVEhPFT866vmNkPsNJOIKSP4k3SZItzDJg7yJzcXwEdlqWtQL.', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:19', '2026-11-07 02:32:34'),
(11, '2511014', 'JHELANSY SNAE', '2511014@mahasiswa.tri.local', NULL, '$2y$12$J6Q3s1hGVES8UeaDHMpw4ugnHPAoiE5gEt7kjNcg5caBm.5Pv0EpG', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:19', '2026-11-07 02:32:34'),
(12, '2511015', 'JULIO JHOSUWA SADSUITUBUN', '2511015@mahasiswa.tri.local', NULL, '$2y$12$qGFSpfXgYxzXGKxLlSi5IOV4drKejYZjmTZRvwgv/4N4NGBr/yB2m', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:19', '2026-11-07 02:32:34'),
(13, '2511017', 'LIONEL. N. E. RAHANGMETAN', '2511017@mahasiswa.tri.local', NULL, '$2y$12$NVhgdoAUS1goQ0IfD7s3neTZLHUKi0mmZ3c2WPPkLCN6ix10utH4y', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:20', '2026-11-07 02:32:34'),
(14, '2511018', 'LOINA MAATOKE', '2511018@mahasiswa.tri.local', NULL, '$2y$12$XeEVWCi7JqJNpEKHiD1bsenW/HokbxWTUVfwqKsLJjRbwBcXj/0rC', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:20', '2026-11-07 02:32:35'),
(15, '2511019', 'MARIA A. JANWARIN', '2511019@mahasiswa.tri.local', NULL, '$2y$12$t8CvoqBpnGPOCV0l0U.INuV0iK4b1VTqyEkmDAXnagNmV6iGHkxVu', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:20', '2026-11-07 02:32:35'),
(16, '2511020', 'MARIA BEATRIX CATERINA RESAM', '2511020@mahasiswa.tri.local', NULL, '$2y$12$x/6CIKJY.eY5sVq.cnsm2ezZnXB/1/a5uHaHEjZp42BX2jytMEKBW', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:20', '2026-11-07 02:32:35'),
(17, '2511021', 'MARIA LODOWINA RUMSORY', '2511021@mahasiswa.tri.local', NULL, '$2y$12$CYen/Q.G/3G5qxoBrC8UleZNt3pL7CAIx9MagdZUHmTVN6qkHXhVO', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:21', '2026-11-07 02:32:35'),
(18, '2511022', 'MARIO JULIAR AGUSTINO LASOL', '2511022@mahasiswa.tri.local', NULL, '$2y$12$q1E02LEjEjEd2BHyeNmIw.A2BozorScHEXcucrsTm88Sz6vCAMEsC', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:21', '2026-11-07 02:32:35'),
(19, '2511023', 'MUH. ABIM PANGESTU', '2511023@mahasiswa.tri.local', NULL, '$2y$12$vjzK6mXLN6SKYcz6vdOlEesPErDWpm/w7ZpnbhIHAA2uU0JallUHy', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:21', '2026-11-07 02:32:36'),
(20, '2511024', 'MUHAMMAD IRIANTO', '2511024@mahasiswa.tri.local', NULL, '$2y$12$UjiY3J06pciJt/EffclBZeNObgoCw5tlKJp9cD79fZ02HpPXIJ0yK', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:21', '2026-11-07 02:32:36'),
(21, '2511025', 'MUHAMMAD SYAHRIL', '2511025@mahasiswa.tri.local', NULL, '$2y$12$Gv72c5WBww963uVhVfT2yuARKcA7aECYqIDmolci2qB1GlpnFThne', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:21', '2026-11-07 02:32:36'),
(22, '2511026', 'MUHAMMAD TAUFIQ ILHAM', '2511026@mahasiswa.tri.local', NULL, '$2y$12$6qMVN3wHN1JFjmkAjRloEOjxbV2sppUnuRJDH0WXYl0.YaKnlB9Oa', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:22', '2026-11-07 02:32:36'),
(23, '2511027', 'MUHAMMAD YUSUF', '2511027@mahasiswa.tri.local', NULL, '$2y$12$WUdcSg7ijcBWyRfqwg/bVOzzpeO5gdJwYlWUFaV4m0w8MstOHseRu', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:22', '2026-11-07 02:32:36'),
(24, '2511028', 'MULIA HAMDAN BAKTI', '2511028@mahasiswa.tri.local', NULL, '$2y$12$O91KAXraYS7iBKiw5E6MxuO433lPJE57fnRUEg1ms/P66QphUUpBm', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:22', '2026-11-07 02:32:37'),
(25, '2511029', 'NAJWA ALICIA PINKAN ZAHRA', '2511029@mahasiswa.tri.local', NULL, '$2y$12$mtjabY21Xn5pkQkFLQlIueM6wQt11guCLqsXGf.Iqmt.79RZiuon.', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:22', '2026-11-07 02:32:37'),
(26, '2511030', 'NURUL RATNA ANDAYANI', '2511030@mahasiswa.tri.local', NULL, '$2y$12$ZS6ue760125WU29LNTvS1ewyzqG80tu1FRDzQKVv88vEcrT7trfrS', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:22', '2026-11-07 02:32:37'),
(27, '2511031', 'PRISKILA HAGABAL', '2511031@mahasiswa.tri.local', NULL, '$2y$12$ehTCvaBBBAftfoI7wzUbwugYaryeMS5F3CWoEl/jn861JWwYDCOWO', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:23', '2026-11-07 02:32:37'),
(28, '2511032', 'RAHMAT HIDAYATULLAH', '2511032@mahasiswa.tri.local', NULL, '$2y$12$ymbVvZ8U9tAam15KwL6qs.3PgPNLoB.0clueGBfDgIGLmZF5Wu1Za', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:23', '2026-11-07 02:32:37'),
(29, '2511033', 'RINCE JARINAP', '2511033@mahasiswa.tri.local', NULL, '$2y$12$XEBnyQBav19XVutQFkZ1B.TvLUwHHP.Bomg5Jd5R7d5zk7VGWYNkC', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:23', '2026-11-07 02:32:38'),
(30, '2511034', 'SURIANTI ALIAS', '2511034@mahasiswa.tri.local', NULL, '$2y$12$TxNQXXN0va.EvVZWbB2RjOXLRvrH62T0hnZ4oPK/MeshpnPZb2Fb6', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:23', '2026-11-07 02:32:38'),
(31, '2511035', 'TIKAYANTI RO\'SON', '2511035@mahasiswa.tri.local', NULL, '$2y$12$fELFWjTsIS1MKiNmshCVuupiWgqdQtn75jINCqd2v8Q1UdIn.dYui', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:23', '2026-11-07 02:32:38'),
(32, '2511036', 'THERESIA INQE NDVENA', '2511036@mahasiswa.tri.local', NULL, '$2y$12$7FqUpedDXg0ulU1hrqY0Wuq88KJQ2Pl/1xfroLoRG2ltj3bEPLs7K', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:24', '2026-11-07 02:32:38'),
(33, '2511037', 'YULI MINCE DEGEI', '2511037@mahasiswa.tri.local', NULL, '$2y$12$ZwxwFvokcW7ehYJ/hY8kM.ahef4juRO5ISDbTJwKOPmDwrUjk5Ldm', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:24', '2026-11-07 02:32:38'),
(34, '2511038', 'YULINCE MAGAI', '2511038@mahasiswa.tri.local', NULL, '$2y$12$W9Jl4eXaPrRYUxyDlDkGaOlV.7OmSUX5oJPAT1pO4wweu3km6e7cu', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:24', '2026-11-07 02:32:39'),
(35, '2511039', 'YUSTINA FAUWAWAN', '2511039@mahasiswa.tri.local', NULL, '$2y$12$fD9wNXereKSgaH05jHM8YOw8R.3LY90u.BpLj7R0wJhAZCDfDTHhG', 'mahasiswa', 'aktif', NULL, '2026-11-07 02:28:24', '2026-11-07 02:32:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensis`
--
ALTER TABLE `absensis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `absensis_mahasiswa_id_pertemuan_id_unique` (`mahasiswa_id`,`pertemuan_id`),
  ADD UNIQUE KEY `absensi_mahasiswa_pertemuan_unique` (`mahasiswa_id`,`pertemuan_id`),
  ADD KEY `absensis_pertemuan_id_foreign` (`pertemuan_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jadwal_kuliahs`
--
ALTER TABLE `jadwal_kuliahs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jadwal_kuliahs_mata_kuliah_id_hari_unique` (`mata_kuliah_id`,`hari`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kehadirans`
--
ALTER TABLE `kehadirans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kehadirans_mahasiswa_id_mata_kuliah_id_tanggal_unique` (`mahasiswa_id`,`mata_kuliah_id`,`tanggal`),
  ADD KEY `kehadirans_mata_kuliah_id_foreign` (`mata_kuliah_id`),
  ADD KEY `kehadirans_tanggal_index` (`tanggal`);

--
-- Indexes for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswas_nim_unique` (`nim`);

--
-- Indexes for table `mata_kuliahs`
--
ALTER TABLE `mata_kuliahs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mata_kuliahs_kode_unique` (`kode`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pertemuans`
--
ALTER TABLE `pertemuans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pertemuans_mata_kuliah_id_pertemuan_ke_unique` (`mata_kuliah_id`,`pertemuan_ke`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nim_unique` (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensis`
--
ALTER TABLE `absensis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal_kuliahs`
--
ALTER TABLE `jadwal_kuliahs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kehadirans`
--
ALTER TABLE `kehadirans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `mata_kuliahs`
--
ALTER TABLE `mata_kuliahs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pertemuans`
--
ALTER TABLE `pertemuans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensis`
--
ALTER TABLE `absensis`
  ADD CONSTRAINT `absensis_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absensis_pertemuan_id_foreign` FOREIGN KEY (`pertemuan_id`) REFERENCES `pertemuans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jadwal_kuliahs`
--
ALTER TABLE `jadwal_kuliahs`
  ADD CONSTRAINT `jadwal_kuliahs_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliahs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kehadirans`
--
ALTER TABLE `kehadirans`
  ADD CONSTRAINT `kehadirans_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kehadirans_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliahs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pertemuans`
--
ALTER TABLE `pertemuans`
  ADD CONSTRAINT `pertemuans_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliahs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
