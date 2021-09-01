-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Вер 01 2021 р., 02:56
-- Версія сервера: 8.0.19
-- Версія PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `new_laravel`
--

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-08-31 18:13:14', '2021-08-31 18:13:14');

-- --------------------------------------------------------

--
-- Структура таблиці `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 0, 1, 1, 1, 1, '{}', 3),
(58, 7, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(59, 7, 'profession_id', 'text', 'Profession Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(60, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 8, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(63, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(64, 8, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(65, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(66, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(67, 9, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(68, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(69, 9, 'profession_id', 'select_multiple', 'Profession Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(70, 9, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(71, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(72, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(73, 9, 'skill_hasmany_profession_relationship', 'relationship', 'professions', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Profession\",\"table\":\"professions\",\"type\":\"hasMany\",\"column\":\"id\",\"key\":\"profession_id\",\"label\":\"display_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(74, 7, 'institution_hasmany_profession_relationship', 'relationship', 'professions', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Profession\",\"table\":\"professions\",\"type\":\"hasMany\",\"column\":\"id\",\"key\":\"profession_id\",\"label\":\"display_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7);

-- --------------------------------------------------------

--
-- Структура таблиці `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(7, 'institutions', 'institutions', 'Institution', 'Institutions', 'voyager-company', 'App\\Models\\Institution', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-31 18:25:06', '2021-08-31 20:54:53'),
(8, 'professions', 'professions', 'Profession', 'Professions', 'voyager-paw', 'App\\Models\\Profession', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-31 18:25:42', '2021-08-31 20:55:10'),
(9, 'skills', 'skills', 'Skill', 'Skills', 'voyager-dollar', 'App\\Models\\Skill', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-31 18:26:37', '2021-08-31 20:55:20');

-- --------------------------------------------------------

--
-- Структура таблиці `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `institutions`
--

CREATE TABLE `institutions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profession_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `institutions`
--

INSERT INTO `institutions` (`id`, `name`, `display_name`, `profession_id`, `created_at`, `updated_at`) VALUES
(1, 'TiWw7', 'institution   OcsS0OpLuN', 2, NULL, NULL),
(2, '5PX5k', 'institution   SqJBBJP5ny', 2, NULL, NULL),
(3, '9A5fJ', 'institution   fTa12XF2Wz', 2, NULL, NULL),
(4, '9Sjen', 'institution   SAsFimSzrO', 2, NULL, NULL),
(5, '5FTbj', 'institution   8T7n5dKB4N', 4, NULL, NULL),
(6, 'jMuzz', 'institution   JQCZDHcGIy', 4, NULL, NULL),
(7, 'vNp4i', 'institution   RgOu5kL11l', 4, NULL, NULL),
(8, 'eEJFc', 'institution   7xKpMM4CGt', 4, NULL, NULL),
(9, '2ENi0', 'institution   JcAolLeluh', 4, NULL, NULL),
(10, 'TYA9n', 'institution   S5cJGUJFAo', 4, NULL, NULL),
(11, 'vKqqY', 'institution   9TU1g3c7uw', 5, NULL, NULL),
(12, '9uZp0', 'institution   46HTVIBvJm', 5, NULL, NULL),
(13, 'lnedv', 'institution   z9LBWtEKHF', 5, NULL, NULL),
(14, 'lJUis', 'institution   brefshKobZ', 7, NULL, NULL),
(15, 'ZPPgj', 'institution   wjHrI5ZtdV', 7, NULL, NULL),
(16, 'WiRN3', 'institution   8TuocZVjdj', 7, NULL, NULL),
(17, 'oKtPr', 'institution   uUhaFpqmEN', 7, NULL, NULL),
(18, 'xLHCl', 'institution   soz41cqy6K', 7, NULL, NULL),
(19, 'qZjeF', 'institution   HmM5If7fQz', 12, NULL, NULL),
(20, 'BndRZ', 'institution   Rf4QLDyceG', 12, NULL, NULL),
(21, 'vVA8O', 'institution   Y8kT3RXgf6', 12, NULL, NULL),
(22, 'SG92X', 'institution   OWChBoAcPS', 12, NULL, NULL),
(23, 'hrYB0', 'institution   xUVY0l8Cma', 12, NULL, NULL),
(24, '6ImUN', 'institution   5DV1goODsx', 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-08-31 18:13:13', '2021-08-31 18:13:13');

-- --------------------------------------------------------

--
-- Структура таблиці `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-08-31 18:13:13', '2021-08-31 18:13:13', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-08-31 18:13:13', '2021-08-31 18:13:13', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-08-31 18:13:13', '2021-08-31 18:13:13', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-08-31 18:13:13', '2021-08-31 18:13:13', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-08-31 18:13:13', '2021-08-31 18:13:13', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-08-31 18:13:13', '2021-08-31 18:13:13', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-08-31 18:13:13', '2021-08-31 18:13:13', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-08-31 18:13:13', '2021-08-31 18:13:13', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-08-31 18:13:13', '2021-08-31 18:13:13', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-08-31 18:13:13', '2021-08-31 18:13:13', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-08-31 18:13:14', '2021-08-31 18:13:14', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-08-31 18:13:14', '2021-08-31 18:13:14', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-08-31 18:13:14', '2021-08-31 18:13:14', 'voyager.pages.index', NULL),
(14, 1, 'Institutions', '', '_self', NULL, NULL, NULL, 15, '2021-08-31 18:25:06', '2021-08-31 18:25:06', 'voyager.institutions.index', NULL),
(15, 1, 'Professions', '', '_self', NULL, NULL, NULL, 16, '2021-08-31 18:25:42', '2021-08-31 18:25:42', 'voyager.professions.index', NULL),
(16, 1, 'Skills', '', '_self', NULL, NULL, NULL, 17, '2021-08-31 18:26:37', '2021-08-31 18:26:37', 'voyager.skills.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(29, '2021_08_30_202015_create_professions_table', 1),
(30, '2021_08_30_202016_create_skills_table', 1),
(31, '2021_08_30_202109_create_institutions_table', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-08-31 18:13:14', '2021-08-31 18:13:14');

-- --------------------------------------------------------

--
-- Структура таблиці `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(2, 'browse_bread', NULL, '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(3, 'browse_database', NULL, '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(4, 'browse_media', NULL, '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(5, 'browse_compass', NULL, '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(6, 'browse_menus', 'menus', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(7, 'read_menus', 'menus', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(8, 'edit_menus', 'menus', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(9, 'add_menus', 'menus', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(10, 'delete_menus', 'menus', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(11, 'browse_roles', 'roles', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(12, 'read_roles', 'roles', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(13, 'edit_roles', 'roles', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(14, 'add_roles', 'roles', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(15, 'delete_roles', 'roles', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(16, 'browse_users', 'users', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(17, 'read_users', 'users', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(18, 'edit_users', 'users', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(19, 'add_users', 'users', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(20, 'delete_users', 'users', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(21, 'browse_settings', 'settings', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(22, 'read_settings', 'settings', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(23, 'edit_settings', 'settings', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(24, 'add_settings', 'settings', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(25, 'delete_settings', 'settings', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(26, 'browse_categories', 'categories', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(27, 'read_categories', 'categories', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(28, 'edit_categories', 'categories', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(29, 'add_categories', 'categories', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(30, 'delete_categories', 'categories', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(31, 'browse_posts', 'posts', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(32, 'read_posts', 'posts', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(33, 'edit_posts', 'posts', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(34, 'add_posts', 'posts', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(35, 'delete_posts', 'posts', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(36, 'browse_pages', 'pages', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(37, 'read_pages', 'pages', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(38, 'edit_pages', 'pages', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(39, 'add_pages', 'pages', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(40, 'delete_pages', 'pages', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(41, 'browse_institutions', 'institutions', '2021-08-31 18:25:06', '2021-08-31 18:25:06'),
(42, 'read_institutions', 'institutions', '2021-08-31 18:25:06', '2021-08-31 18:25:06'),
(43, 'edit_institutions', 'institutions', '2021-08-31 18:25:06', '2021-08-31 18:25:06'),
(44, 'add_institutions', 'institutions', '2021-08-31 18:25:06', '2021-08-31 18:25:06'),
(45, 'delete_institutions', 'institutions', '2021-08-31 18:25:06', '2021-08-31 18:25:06'),
(46, 'browse_professions', 'professions', '2021-08-31 18:25:42', '2021-08-31 18:25:42'),
(47, 'read_professions', 'professions', '2021-08-31 18:25:42', '2021-08-31 18:25:42'),
(48, 'edit_professions', 'professions', '2021-08-31 18:25:42', '2021-08-31 18:25:42'),
(49, 'add_professions', 'professions', '2021-08-31 18:25:42', '2021-08-31 18:25:42'),
(50, 'delete_professions', 'professions', '2021-08-31 18:25:42', '2021-08-31 18:25:42'),
(51, 'browse_skills', 'skills', '2021-08-31 18:26:37', '2021-08-31 18:26:37'),
(52, 'read_skills', 'skills', '2021-08-31 18:26:37', '2021-08-31 18:26:37'),
(53, 'edit_skills', 'skills', '2021-08-31 18:26:37', '2021-08-31 18:26:37'),
(54, 'add_skills', 'skills', '2021-08-31 18:26:37', '2021-08-31 18:26:37'),
(55, 'delete_skills', 'skills', '2021-08-31 18:26:37', '2021-08-31 18:26:37');

-- --------------------------------------------------------

--
-- Структура таблиці `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(45, 'App\\Models\\User', 1, 'auth_token', '7b2eadd69cb10d8edf6afc05fb18d8ea9ccf604946ca81f1cdf6ab459413000d', '[\"*\"]', NULL, '2021-08-31 20:31:44', '2021-08-31 20:31:44'),
(46, 'App\\Models\\User', 1, 'auth_token', '87dddec795e3c47b9b06e26d52b23645b31aa6fbd7d3d6c81f7ac1a72b5fe591', '[\"*\"]', '2021-08-31 20:40:48', '2021-08-31 20:32:52', '2021-08-31 20:40:48'),
(47, 'App\\Models\\User', 1, 'auth_token', '0c3a0f02e839dfefaefa32c35de8c84f1101429c786fc0376edcc32b31138507', '[\"*\"]', NULL, '2021-08-31 20:39:22', '2021-08-31 20:39:22'),
(48, 'App\\Models\\User', 1, 'auth_token', 'f8c9ba6e7652a8ca763834a8657a25e9abc0d6ed022f4e220021070f524b6523', '[\"*\"]', '2021-08-31 20:42:46', '2021-08-31 20:42:31', '2021-08-31 20:42:46'),
(49, 'App\\Models\\User', 1, 'auth_token', 'a1496db34a4c1703fa359d2963b532fcda4d02cb09500b1606a47335a1f3f2ab', '[\"*\"]', NULL, '2021-08-31 20:43:34', '2021-08-31 20:43:34'),
(50, 'App\\Models\\User', 1, 'auth_token', '3c636fbc4e21a5fa05d45c586deeac0f9eed7d6decc5fa1da96c3003a0911988', '[\"*\"]', NULL, '2021-08-31 20:46:14', '2021-08-31 20:46:14'),
(51, 'App\\Models\\User', 1, 'auth_token', 'e22dbf4e536e3611b31b7d06eee01e495b294f98b27dcaa5f2d3d674e1277a2a', '[\"*\"]', NULL, '2021-08-31 20:46:22', '2021-08-31 20:46:22'),
(52, 'App\\Models\\User', 1, 'auth_token', '52905903b442368ec0d812b4391acacbae2f2726a2980edd3e2098aee6c7b29d', '[\"*\"]', NULL, '2021-08-31 20:46:28', '2021-08-31 20:46:28');

-- --------------------------------------------------------

--
-- Структура таблиці `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-08-31 18:13:14', '2021-08-31 18:13:14');

-- --------------------------------------------------------

--
-- Структура таблиці `professions`
--

CREATE TABLE `professions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `professions`
--

INSERT INTO `professions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'hayk9', 'profession  JKkKhMAFfC', NULL, NULL),
(2, 'uuAu1', 'profession  73jblPqgMr', NULL, NULL),
(3, 'FtEtW', 'profession  w6m0MzijkX', NULL, NULL),
(4, 'jO5nP', 'profession  Xj4UijFRDK', NULL, NULL),
(5, 'opUQM', 'profession  pRmbhKMuF4', NULL, NULL),
(6, 'lsRnd', 'profession  NZcfSw4v7h', NULL, NULL),
(7, 'utEfZ', 'profession  0jktARTUCh', NULL, NULL),
(8, '9GHiJ', 'profession  CuZ1IOugKH', NULL, NULL),
(9, 'fIEjq', 'profession  0uK4YEJ7g6', NULL, NULL),
(10, 'HHOHN', 'profession  RKk3qUN0nX', NULL, NULL),
(11, 'Zpnxb', 'profession  xqnOufS9N5', NULL, NULL),
(12, '6ldbr', 'profession  4fENCANsFK', NULL, NULL),
(13, 'OjRFt', 'profession  gctVzT6j6X', NULL, NULL),
(14, '7fFrp', 'profession  lOfM0XtYjl', NULL, NULL),
(15, 'aYxuK', 'profession  9tFTTjKDtE', NULL, NULL),
(16, 'PUg2d', 'profession  gFw4mnnZJf', NULL, NULL),
(17, 'CB4yr', 'profession  JSZia2hmKW', NULL, NULL),
(18, 'mzOIX', 'profession  mRYyljivPH', NULL, NULL),
(19, 'mgY57', 'profession  R0YWbG8187', NULL, NULL),
(20, 'tCJ43', 'profession  hOypaST0Du', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-08-31 18:13:13', '2021-08-31 18:13:13'),
(2, 'user', 'Normal User', '2021-08-31 18:13:13', '2021-08-31 18:13:13');

-- --------------------------------------------------------

--
-- Структура таблиці `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблиці `skills`
--

CREATE TABLE `skills` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profession_id` bigint UNSIGNED NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `skills`
--

INSERT INTO `skills` (`id`, `name`, `profession_id`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'LJ50k', 1, 'skill   k2jyJzl9GG', NULL, NULL),
(2, 'bvfKe', 1, 'skill   rfV8DHprs3', NULL, NULL),
(3, 'Mgv1j', 4, 'skill   U7AJsRYmxC', NULL, NULL),
(4, 'gCYSO', 4, 'skill   15Lh1gFNxb', NULL, NULL),
(5, 'xcAqH', 4, 'skill   uATNMssy0G', NULL, NULL),
(6, 'lzsqE', 7, 'skill   cdxk6kEUy2', NULL, NULL),
(7, 'ey3Jg', 7, 'skill   qUPfQX9Hoa', NULL, NULL),
(8, 'otNrL', 7, 'skill   PPK9O2ZNaH', NULL, NULL),
(9, '6NIXZ', 7, 'skill   SQ7ITzH0fn', NULL, NULL),
(10, 'Ex2Ng', 7, 'skill   74sChanqas', NULL, NULL),
(11, 'GLVtQ', 2, 'skill   kZ30UyBXyQ', NULL, NULL),
(12, 'THKT6', 2, 'skill   z7WmDr8B3M', NULL, NULL),
(13, '9c3J6', 2, 'skill   PwQJi1uMEo', NULL, NULL),
(14, 'x53rv', 2, 'skill   8vTn7h7vpk', NULL, NULL),
(15, 'wvxc0', 12, 'skill   feeMadvktw', NULL, NULL),
(16, 'aq8Sg', 12, 'skill   6im28MYPel', NULL, NULL),
(17, 'uU4Iu', 12, 'skill   Jq84qATVyr', NULL, NULL),
(18, 'crr47', 12, 'skill   w3MgKQvm6U', NULL, NULL),
(19, 'TDhmk', 12, 'skill   Q00nc60ndZ', NULL, NULL),
(20, '79dZv', 12, 'skill   G9ZsLGTT00', NULL, NULL),
(21, 'uuyVy', 12, 'skill   FZqrghgXHX', NULL, NULL),
(22, '1uUSt', 12, 'skill   2arxM739vd', NULL, NULL),
(23, 'kfCji', 12, 'skill   bNMFd7G75V', NULL, NULL),
(24, '8h262', 12, 'skill   A4vUY6FhUl', NULL, NULL),
(25, 'y2Yi0', 12, 'skill   tl2F8Q2ROj', NULL, NULL),
(26, 'KdqVM', 12, 'skill   OYaVgI3Dcf', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-08-31 18:13:14', '2021-08-31 18:13:14'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-08-31 18:13:14', '2021-08-31 18:13:14');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$sferCO52BBwRCbqn8uysiOyyr3/ppebuMSkGso/DRaYhNBHJE4UcS', 'Gidp3Zzx8KjvYlTMTEjTQL3F9Rgcj3ABaUmm9Y0ROGhsIq5qJXjPUGhyeR8N', '{\"locale\":\"ru\"}', '2021-08-31 18:13:14', '2021-08-31 20:53:28');

-- --------------------------------------------------------

--
-- Структура таблиці `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Індекси таблиці `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Індекси таблиці `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Індекси таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Індекси таблиці `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institutions_profession_id_foreign` (`profession_id`);

--
-- Індекси таблиці `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Індекси таблиці `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Індекси таблиці `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Індекси таблиці `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Індекси таблиці `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Індекси таблиці `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Індекси таблиці `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Індекси таблиці `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Індекси таблиці `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Індекси таблиці `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Індекси таблиці `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skills_profession_id_foreign` (`profession_id`);

--
-- Індекси таблиці `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Індекси таблиці `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT для таблиці `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблиці `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблиці `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблиці `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблиці `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблиці `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблиці `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблиці `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `institutions`
--
ALTER TABLE `institutions`
  ADD CONSTRAINT `institutions_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
