-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2024 at 12:54 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mpesa`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add branch model', 7, 'add_branchmodel'),
(26, 'Can change branch model', 7, 'change_branchmodel'),
(27, 'Can delete branch model', 7, 'delete_branchmodel'),
(28, 'Can view branch model', 7, 'view_branchmodel'),
(29, 'Can add fee model', 8, 'add_feemodel'),
(30, 'Can change fee model', 8, 'change_feemodel'),
(31, 'Can delete fee model', 8, 'delete_feemodel'),
(32, 'Can view fee model', 8, 'view_feemodel'),
(33, 'Can add transaction info model', 9, 'add_transactioninfomodel'),
(34, 'Can change transaction info model', 9, 'change_transactioninfomodel'),
(35, 'Can delete transaction info model', 9, 'delete_transactioninfomodel'),
(36, 'Can view transaction info model', 9, 'view_transactioninfomodel'),
(37, 'Can add transaction model', 10, 'add_transactionmodel'),
(38, 'Can change transaction model', 10, 'change_transactionmodel'),
(39, 'Can delete transaction model', 10, 'delete_transactionmodel'),
(40, 'Can view transaction model', 10, 'view_transactionmodel'),
(41, 'Can add profile', 11, 'add_profile'),
(42, 'Can change profile', 11, 'change_profile'),
(43, 'Can delete profile', 11, 'delete_profile'),
(44, 'Can view profile', 11, 'view_profile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `profile_picture` varchar(255) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `profile_picture`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$8ELGCXb7tTNPvCPPcom5DC$0uEm0TEwN+Y2on9uIBZ5jcJnmpkJJyxP9GFotjVWU/g=', '2024-02-02 16:05:09.844501', 1, 'admin', 'Admin', 'Admin', 'admin@admin.com', 1, 1, 'card.jpg', '2024-01-08 13:44:03.000000'),
(6, 'pbkdf2_sha256$720000$aZJlP0uZZ7jV11Jjcm0Si7$D0XI/PaZqxTrQc+KfogPI36mLfrqm8P+xft8pUc5tcM=', '2024-01-10 16:45:36.619157', 0, 'Nicos', 'Nicolas', 'Sarkozy', 'nicolas@gmail.com', 1, 1, '', '2024-01-10 16:34:05.597274');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch_list`
--

CREATE TABLE `branch_list` (
  `id` int(30) NOT NULL,
  `location` text NOT NULL,
  `staff_name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch_list`
--

INSERT INTO `branch_list` (`id`, `location`, `staff_name`, `status`, `date_created`) VALUES
(1, 'kinshasa', 'Danny shabani', 1, '2024-01-03 07:13:08'),
(2, 'cyprus', 'Esther feza', 1, '2024-01-03 07:15:19'),
(3, 'USA', 'John Bones', 1, '2024-01-09 14:16:37'),
(4, 'Magusa', 'Daniel', 1, '2024-01-09 19:35:05'),
(5, 'Brazzaville', 'Felix Tchikaya', 1, '2024-01-10 08:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-01-10 13:31:27.439365', '1', 'Profile object (1)', 1, '[{\"added\": {}}]', 11, 1),
(2, '2024-01-10 15:18:55.593429', '2', 'admin Profile', 1, '[{\"added\": {}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'panel', 'branchmodel'),
(8, 'panel', 'feemodel'),
(11, 'panel', 'profile'),
(9, 'panel', 'transactioninfomodel'),
(10, 'panel', 'transactionmodel'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-01-07 21:02:50.196836'),
(2, 'auth', '0001_initial', '2024-01-07 21:02:50.911890'),
(3, 'admin', '0001_initial', '2024-01-07 21:02:51.247097'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-01-07 21:02:51.274101'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-07 21:02:51.288098'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-01-07 21:02:51.466422'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-01-07 21:02:51.562268'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-01-07 21:02:51.605269'),
(9, 'auth', '0004_alter_user_username_opts', '2024-01-07 21:02:51.630268'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-01-07 21:02:51.733207'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-01-07 21:02:51.743202'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-01-07 21:02:51.773888'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-01-07 21:02:51.829748'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-01-07 21:02:51.886042'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-01-07 21:02:51.936187'),
(16, 'auth', '0011_update_proxy_permissions', '2024-01-07 21:02:51.955190'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-01-07 21:02:51.983210'),
(18, 'sessions', '0001_initial', '2024-01-07 21:02:52.122664'),
(19, 'panel', '0001_initial', '2024-01-10 13:17:29.159139'),
(20, 'panel', '0002_delete_profile', '2024-01-10 13:28:51.872649'),
(21, 'panel', '0003_profile', '2024-01-10 13:28:51.918807');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('41jszf7mszr2qy5npdrfl58diy1uc3fg', '.eJxVjMEOgjAQBf-lZ9N0odDi0TvfQN52F0ENJBROxn83TTjodWYybzPg2KfhyLoNs5irIXP5ZYz01KUIeWC5rzaty77NbEtiT5ttv4q-bmf7N5iQp7IVAULUsUPHLZGHq8lBVH0EqkSKOPpaAgcfCVEZnKgV11TKLjXm8wUNfjj-:1rMpXU:ZZ6IyzpU0JtBN7mMcQEhRHHsdBCmt7P7Zx9iGvO0SMQ', '2024-01-22 13:19:36.962301'),
('kk6sm3w3d51vm37i2dbznzu4t3gfmsfh', '.eJxVjMEOgjAQBf-lZ9N0odDi0TvfQN52F0ENJBROxn83TTjodWYybzPg2KfhyLoNs5irIXP5ZYz01KUIeWC5rzaty77NbEtiT5ttv4q-bmf7N5iQp7IVAULUsUPHLZGHq8lBVH0EqkSKOPpaAgcfCVEZnKgV11TKLjXm8wUNfjj-:1rVuAH:iKbUs_0IC7t-ZDd0wRiwVQGwefSM2QMHHrMKBjvjNm4', '2024-02-16 16:05:09.855388'),
('qzw4e2b6u2y27wmue043mo8gwet5sfhs', '.eJxVjMEOgjAQBf-lZ9N0odDi0TvfQN52F0ENJBROxn83TTjodWYybzPg2KfhyLoNs5irIXP5ZYz01KUIeWC5rzaty77NbEtiT5ttv4q-bmf7N5iQp7IVAULUsUPHLZGHq8lBVH0EqkSKOPpaAgcfCVEZnKgV11TKLjXm8wUNfjj-:1rMoQO:si41B-e2lydOfXxH7XqfcmGMEmT_tiFPclUfnailFNg', '2024-01-22 12:08:12.480442');

-- --------------------------------------------------------

--
-- Table structure for table `fee_list`
--

CREATE TABLE `fee_list` (
  `id` int(30) NOT NULL,
  `amount_from` float NOT NULL DEFAULT 0,
  `amount_to` float NOT NULL DEFAULT 0,
  `fee` float NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fee_list`
--

INSERT INTO `fee_list` (`id`, `amount_from`, `amount_to`, `fee`, `status`, `date_created`) VALUES
(5, 0.01, 100, 8, 1, '2024-01-03 18:39:37'),
(6, 101, 200, 14, 1, '2024-01-03 18:41:48'),
(7, 201, 300, 18, 1, '2024-01-03 18:42:12'),
(8, 301, 400, 24, 1, '2024-01-03 18:42:32'),
(9, 401, 500, 28, 1, '2024-01-03 18:43:07'),
(10, 501, 600, 30, 1, '2024-01-03 18:43:33'),
(11, 601, 700, 34, 1, '2024-01-03 18:44:20'),
(12, 701, 800, 38, 1, '2024-01-03 18:45:06'),
(13, 801, 1400, 42, 1, '2024-01-03 18:45:55'),
(14, 1400, 1600, 60, 1, '2024-01-03 18:46:31'),
(15, 1601, 1800, 70, 1, '2024-01-03 18:47:16'),
(16, 1801, 2000, 80, 1, '2024-01-03 18:48:01'),
(17, 2001, 2500, 90, 1, '2024-01-03 18:48:33'),
(21, 3501, 4000, 130, 1, '2024-01-03 18:52:11'),
(22, 2501, 3500, 100, 1, '2024-01-03 18:54:25'),
(23, 4001, 4500, 150, 1, '2024-01-10 08:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `panel_profile`
--

CREATE TABLE `panel_profile` (
  `id` bigint(20) NOT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `panel_profile`
--

INSERT INTO `panel_profile` (`id`, `profile_picture`, `user_id`) VALUES
(2, 'digital_camera_photo-1080x675.jpg', 1),
(4, 'OQcaM3jmkw93EWWYlgu-JQh-ToNTd8F_flytBOfofBw.jpeg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Mpesa Management System '),
(6, 'short_name', 'Mpesa_MS'),
(11, 'logo', 'uploads/logo-1704320744.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1704320745.png');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_info`
--

CREATE TABLE `transaction_info` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `sender_first_name` varchar(255) DEFAULT NULL,
  `sender_last_name` varchar(255) DEFAULT NULL,
  `sender_middle_name` varchar(255) DEFAULT NULL,
  `sender_contact` varchar(255) DEFAULT NULL,
  `sender_address` varchar(255) DEFAULT NULL,
  `receiver_first_name` varchar(255) DEFAULT NULL,
  `receiver_last_name` varchar(255) DEFAULT NULL,
  `receiver_middle_name` varchar(255) DEFAULT NULL,
  `receiver_contact` varchar(255) DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `received_branch_id` int(11) DEFAULT NULL,
  `received_user_id` int(11) DEFAULT NULL,
  `presented_id_type` varchar(255) DEFAULT NULL,
  `presented_id_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transaction_info`
--

INSERT INTO `transaction_info` (`id`, `transaction_id`, `sender_first_name`, `sender_last_name`, `sender_middle_name`, `sender_contact`, `sender_address`, `receiver_first_name`, `receiver_last_name`, `receiver_middle_name`, `receiver_contact`, `receiver_address`, `received_branch_id`, `received_user_id`, `presented_id_type`, `presented_id_number`) VALUES
(0, 30, 'fgrgt4gt4g', 'Harveyrtgte5tgt54', 'ynhuyjmuyn', '09646465556', 'Kyrenia Girne', '32rd432fr43', ',miy,i,kiuui', 'umjuymkijy,iy,yu', '09646465556', 'Kyrenia Girne', NULL, NULL, '', ''),
(1, 24, 'Steve', 'Harvey', 'Johnson', '09646465556', 'Steve', 'Kevin', 'Oluwa', 'Olomide', '09646465556', 'Kevin', 3, 1, 'Election Card ID', '000564464998998'),
(2, 4, 'Koffi', 'Kingston', 'Ali', '031269549496', 'Koffi', 'Bob', 'Marley', 'Robert', '065469494', 'Bob', 1, 1, 'Diplomatic Passport', 'OP909897560');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_list`
--

CREATE TABLE `transaction_list` (
  `id` int(30) NOT NULL,
  `tracking_code` varchar(50) NOT NULL,
  `branch_id` int(30) DEFAULT NULL,
  `sending_amount` float NOT NULL DEFAULT 0,
  `fee` float NOT NULL DEFAULT 0,
  `purpose` text DEFAULT NULL,
  `user_id` int(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `db_status` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_list`
--

INSERT INTO `transaction_list` (`id`, `tracking_code`, `branch_id`, `sending_amount`, `fee`, `purpose`, `user_id`, `status`, `db_status`, `date_created`, `date_updated`) VALUES
(4, 'JNL-000000000000', 2, 50, 8, 'Wants to buy a new car', 1, 1, 1, '2024-01-03 19:40:20', '2024-01-11 13:01:27'),
(24, 'ZQS-87962310', 3, 2500, 90, 'Tuition Fees', 1, 1, 1, '2024-01-09 18:33:07', '2024-01-11 12:51:23'),
(30, 'DEL-48498485', 5, 1890, 80, 'yyyyyyyy', 1, 0, 1, '2024-01-11 14:04:32', '2024-01-11 14:04:32');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_meta`
--

CREATE TABLE `transaction_meta` (
  `transaction_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_meta`
--

INSERT INTO `transaction_meta` (`transaction_id`, `meta_field`, `meta_value`, `date_created`) VALUES
(4, 'sender_lastname', 'Miandabu', '2024-01-03 19:40:20'),
(4, 'sender_firstname', 'johanna', '2024-01-03 19:40:20'),
(4, 'sender_middlename', 'JTM', '2024-01-03 19:40:20'),
(4, 'sender_contact', '+905427823965', '2024-01-03 19:40:20'),
(4, 'sender_address', 'tunahan 18', '2024-01-03 19:40:20'),
(4, 'receiver_lastname', 'Makunduku', '2024-01-03 19:40:20'),
(4, 'receiver_firstname', 'Guilllaume', '2024-01-03 19:40:20'),
(4, 'receiver_middlename', 'Gye', '2024-01-03 19:40:20'),
(4, 'receiver_contact', '+243 9995623975', '2024-01-03 19:40:20'),
(4, 'receiver_address', 'debonhomme, aviar 18', '2024-01-03 19:40:20'),
(4, 'branch_id', '2', '2024-01-03 19:40:20'),
(4, 'receiver_presented_id_type', 'student card', '2024-01-03 19:53:45'),
(4, 'receiver_presented_id_num', 'JTM-010335689402', '2024-01-03 19:53:45'),
(4, 'received_branch_id', '1', '2024-01-03 19:53:45'),
(4, 'receive_user_id', '1', '2024-01-03 19:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(30) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `branch_id`, `date_added`, `date_updated`) VALUES
(1, 'joelle', 'Akilimali', 'joenie', '9d9959992f57623d5969ed3bb32a1925', 'uploads/avatar-1.png?v=1704320658', NULL, 1, NULL, '2021-01-20 14:02:37', '2024-01-04 00:27:00'),
(3, 'Danny', 'Shabanni', 'dannyShabanni', 'af97b2614f8896f8cd57c63c4d78c6c0', 'uploads/avatar-3.png?v=1704318628', NULL, 2, 1, '2021-10-28 17:23:45', '2024-01-03 23:51:28'),
(4, 'Esther', 'Feza', 'estherfeza', 'd1ff13c93a54f9ab797fca84ef855e52', 'uploads/avatar-4.png?v=1704319221', NULL, 2, 2, '2024-01-04 00:00:21', '2024-01-04 00:00:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `branch_list`
--
ALTER TABLE `branch_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `fee_list`
--
ALTER TABLE `fee_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_profile`
--
ALTER TABLE `panel_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_info`
--
ALTER TABLE `transaction_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `transaction_list`
--
ALTER TABLE `transaction_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transaction_meta`
--
ALTER TABLE `transaction_meta`
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch_list`
--
ALTER TABLE `branch_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `fee_list`
--
ALTER TABLE `fee_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `panel_profile`
--
ALTER TABLE `panel_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transaction_list`
--
ALTER TABLE `transaction_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `panel_profile`
--
ALTER TABLE `panel_profile`
  ADD CONSTRAINT `panel_profile_user_id_55168a93_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `transaction_info`
--
ALTER TABLE `transaction_info`
  ADD CONSTRAINT `transaction_info_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_list` (`id`);

--
-- Constraints for table `transaction_list`
--
ALTER TABLE `transaction_list`
  ADD CONSTRAINT `transaction_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transaction_list_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch_list` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `transaction_meta`
--
ALTER TABLE `transaction_meta`
  ADD CONSTRAINT `transaction_meta_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch_list` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
