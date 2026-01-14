-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th1 14, 2026 lúc 03:48 AM
-- Phiên bản máy phục vụ: 10.6.22-MariaDB-0ubuntu0.22.04.1
-- Phiên bản PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `haisan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(8, 25, 'home', 'thaun18092003@gmail.com', '0325398386', '2025-08-25 13:05:51', '2025-08-25 13:24:18'),
(10, 30, 'chien', 'acv@gmail.com', '0859124399', '2025-08-25 13:38:23', '2025-08-25 13:38:23'),
(11, 31, 'Chin', 'chienpro1909@gmail.com', '0859124399', '2025-10-04 03:14:03', '2025-10-04 03:14:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blacklisted_tokens`
--

CREATE TABLE `blacklisted_tokens` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT '',
  `is_read` tinyint(1) DEFAULT 0,
  `is_sent` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `content`, `gmail`, `title`, `is_read`, `is_sent`, `created_at`, `updated_at`) VALUES
(2, 'thuan   ', 'thuan', 'thuan18092003@gmail.com', 'thuan', 1, 0, '2025-03-10 04:59:49', '2025-03-10 05:01:13'),
(3, 'thuan   ', 'thuan', 'thuan18092003@gmail.com', 'thuan', 1, 0, '2025-03-10 05:16:34', '2025-03-10 07:01:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount_percent` int(11) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `end_time` timestamp NOT NULL DEFAULT '2037-12-31 17:00:00',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discount`
--

INSERT INTO `discount` (`id`, `name`, `code`, `discount_percent`, `start_time`, `quantity`, `status`, `end_time`, `created_at`, `updated_at`) VALUES
(10, 'Giảm giá 20%', 'UAQOTBXA', 20, '2025-04-30 17:00:00', 984, 1, '2025-05-30 17:00:00', '2025-03-18 06:47:50', '2025-05-14 02:02:49'),
(12, 'Giảm giá 10%', 'GROCOBWH', 20, '2025-04-30 17:00:00', 994, 1, '2025-05-30 17:00:00', '2025-03-18 08:56:30', '2025-05-18 15:03:44'),
(13, 'acv', 'YYGZFBFJ', 10, '2025-12-01 17:00:00', 1, 1, '2026-12-01 17:00:00', '2025-08-24 16:58:00', '2025-08-24 16:58:06'),
(14, 'hadknq', 'OSLOAJSP', -10, '2025-12-02 17:00:00', 1, 1, '2025-12-11 17:00:00', '2025-10-04 03:07:59', '2025-10-09 06:18:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_history`
--

CREATE TABLE `discount_history` (
  `id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `order_history_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_history`
--

CREATE TABLE `email_history` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history_orders`
--

CREATE TABLE `history_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `data_product` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data_product`)),
  `discount_code` varchar(50) DEFAULT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `final_total` int(11) DEFAULT NULL,
  `free_of_charge` int(11) DEFAULT NULL,
  `payment_method` enum('cod','bank') DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` enum('completed','canceled') DEFAULT 'completed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `history_orders`
--

INSERT INTO `history_orders` (`id`, `user_id`, `name`, `phone`, `address`, `data_product`, `discount_code`, `discount_percent`, `final_total`, `free_of_charge`, `payment_method`, `note`, `status`, `created_at`, `updated_at`, `reason`) VALUES
(97, 30, 'chien', '0859124399', 'acv@gmail.com', '[{\"product_id\":44,\"quantity\":\"1\"}]', '', 0, 40000, 30000, 'bank', '', 'completed', '2025-08-25 13:40:37', '2025-08-25 13:40:37', NULL),
(98, 25, 'home', '0325398386', 'thaun18092003@gmail.com', '[{\"product_id\":44,\"quantity\":\"1\"}]', '', 0, 40000, 30000, 'bank', '', 'completed', '2025-08-25 13:40:40', '2025-08-25 13:40:40', NULL),
(99, 31, 'Chin', '0859124399', 'chienpro1909@gmail.com', '[{\"product_id\":50,\"quantity\":\"1\"}]', '', 0, 47000, 30000, 'bank', '', 'completed', '2025-10-05 10:19:48', '2025-10-05 10:19:48', NULL),
(100, 31, 'Chin', '0859124399', 'chienpro1909@gmail.com', '[{\"product_id\":44,\"quantity\":\"1\"}]', '', 0, 40000, 30000, 'bank', '', 'completed', '2025-10-09 06:15:57', '2025-10-09 06:15:57', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_ads`
--

CREATE TABLE `layout_ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_url` longtext NOT NULL,
  `mobile_image_url` longtext DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `is_active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_ads`
--

INSERT INTO `layout_ads` (`id`, `image_url`, `mobile_image_url`, `title`, `is_active`, `created_at`, `updated_at`) VALUES
(5, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756050417/a6ntu3fuetnryzejk3xx.jpg', NULL, 'Sale sập sàn mừng lễ Quốc Khánh', 1, '2025-08-24 15:46:58', '2025-08-24 15:46:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_benefit`
--

CREATE TABLE `layout_benefit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_benefit`
--

INSERT INTO `layout_benefit` (`id`, `icon`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ShoppingBag', 'Chất Lượng ', 'Cam kết sản phẩm đúng như mô tả', '2025-03-03 16:48:42', '2025-08-24 07:12:29'),
(2, 'Target', 'Đa Dạng', 'Kho tài khoản đầy đủ thể loại game', '2025-03-03 16:48:42', '2025-08-24 07:13:02'),
(4, 'ThumbsUp', 'Uy Tín', '10 năm kinh nghiệm phục vụ', '2025-03-03 16:48:42', '2025-08-24 07:13:13'),
(10, 'Server', 'Phục Vụ', 'Đội ngũ nhân viên chuyên nghiệp, thân thiện', '2025-03-05 07:09:55', '2025-03-05 07:09:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_commitment`
--

CREATE TABLE `layout_commitment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description_one` text NOT NULL,
  `description_two` text NOT NULL,
  `description_three` text NOT NULL,
  `description_four` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_commitment`
--

INSERT INTO `layout_commitment` (`id`, `title`, `description_one`, `description_two`, `description_three`, `description_four`, `created_at`, `updated_at`) VALUES
(1, 'Cam Kết Của Chúng Tôi ', 'Đảm bảo sản phẩm đúng với mô tả', 'Bàn giao nhanh chóng', 'Đổi trả miễn phí nếu lỗi do phía shop', 'Nhân viên hỗ trợ chuyên nghiệp, thân thiện', '2025-03-03 23:45:43', '2025-08-24 11:47:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_contactsfooter`
--

CREATE TABLE `layout_contactsfooter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_contactsfooter`
--

INSERT INTO `layout_contactsfooter` (`id`, `icon`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Map', '123 Đường ABC, Quận XYZ', '2025-02-22 22:01:47', '2025-03-09 16:02:52'),
(2, 'Phone', '(123) 456-7890', '2025-02-22 22:01:47', '2025-02-22 22:01:47'),
(3, 'Mail', 'info@example.com', '2025-02-22 22:01:47', '2025-02-22 22:01:47'),
(4, 'CalendarCheck2', 'Thứ 2 - Thứ 5: 11:00 - 22:00; Thứ 6 - Chủ Nhật: 11:00 - 23:00', '2025-02-22 22:01:47', '2025-02-22 22:01:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_copyright`
--

CREATE TABLE `layout_copyright` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_copyright`
--

INSERT INTO `layout_copyright` (`id`, `text`, `created_at`, `updated_at`) VALUES
(1, '2025 MINHCHIEN. Bản quyền được bảo lưu . ', '2025-02-23 05:01:47', '2025-08-23 13:16:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_customer_choose_item_section`
--

CREATE TABLE `layout_customer_choose_item_section` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_customer_choose_item_section`
--

INSERT INTO `layout_customer_choose_item_section` (`id`, `icon`, `title`, `description`) VALUES
(2, 'ArrowRightCircle', 'uy tín', 'uy tín là tạo nên thương hiệu'),
(3, 'Check', 'Đa dạng ', 'đa dạng thể loại game'),
(4, 'ThumbsUp', 'Giá cả ổn định, phong cách phục vụ', 'chuyên nghiệp'),
(5, 'Heart', 'chất lượng', 'tương xứng với giá tiền');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_customer_choose_section`
--

CREATE TABLE `layout_customer_choose_section` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_customer_choose_section`
--

INSERT INTO `layout_customer_choose_section` (`id`, `title`, `image_url`) VALUES
(1, 'Đây là lý do khách hàng thường chọn chúng tôi ', 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756099664/sfjkthoi1asyn6hqpeso.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_customer_section`
--

CREATE TABLE `layout_customer_section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` longtext NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_customer_section`
--

INSERT INTO `layout_customer_section` (`id`, `name`, `image_url`, `description`) VALUES
(23, 'hava', 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756050472/yrrtlq3dallvpipwbkh7.jpg', 'Thật tuyệt vời, nhân viên hỗ trợ rất nhiệt tình'),
(24, 'vika', 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756050521/szllhfezpinhvlajnzvt.jpg', 'Tài khoản khá ngon, giá thành lại rẻ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_customer_section_img`
--

CREATE TABLE `layout_customer_section_img` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_url` longtext NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_customer_section_img`
--

INSERT INTO `layout_customer_section_img` (`id`, `image_url`, `title`) VALUES
(1, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1755954729/x6gnr8kto6otzoipuihc.jpg', 'Khách hàng nói về chùng tôi ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_introductionsfooter`
--

CREATE TABLE `layout_introductionsfooter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_introductionsfooter`
--

INSERT INTO `layout_introductionsfooter` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Giới thiệu ', 'Shopacc24h nơi trao đổi mua bán uy tín số 1 việt nam', '2025-02-23 05:01:47', '2025-08-24 07:08:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_introductionssection`
--

CREATE TABLE `layout_introductionssection` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL,
  `image_url` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_introductionssection`
--

INSERT INTO `layout_introductionssection` (`id`, `title`, `description`, `content`, `image_url`) VALUES
(1, 'MINH CHIẾN', 'shopacc24h nới trao đổi mua bán tài khoản game uy tín', 'cam kết lỗi 1 đổi 1', 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756099791/sojuibiy7cxfilw1v8jw.avif');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_navigation_menu`
--

CREATE TABLE `layout_navigation_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order_position` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `is_visible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_navigation_menu`
--

INSERT INTO `layout_navigation_menu` (`id`, `name`, `url`, `parent_id`, `order_position`, `is_active`, `is_visible`) VALUES
(11, 'Trang Chủ', '/', NULL, 1, 0, 1),
(14, 'Sản Phẩm', '/products', NULL, 2, 0, 1),
(15, 'Liên hệ', '/contact', NULL, 4, 0, 1),
(16, 'Giới thiệu', '/about', NULL, 3, 0, 1),
(22, 'Tin Tức', '/news', NULL, 5, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_ordering_online`
--

CREATE TABLE `layout_ordering_online` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description_one` text NOT NULL,
  `description_two` text NOT NULL,
  `description_three` text NOT NULL,
  `description_four` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_ordering_online`
--

INSERT INTO `layout_ordering_online` (`id`, `icon`, `title`, `description_one`, `description_two`, `description_three`, `description_four`, `created_at`, `updated_at`) VALUES
(1, 'Info', 'Bàn giao đầy đủ thông tin', 'Có đi kèm bản hướng dẫn sử dụng tài khoản', 'Hỗ trợ thay thông tin', 'trao đổi thông tin nhanh chóng', '', '2025-03-03 23:42:46', '2025-08-24 07:15:51'),
(2, 'Clock', 'Thời Gian Phục Vụ', 'WEBSITE: 24/24', 'Hỗ trợ khách hàng: 8:00 - 21:00', 'Phục vụ tất cả các ngày trong tuần', '', '2025-03-03 23:42:46', '2025-08-24 07:17:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_ordering_process`
--

CREATE TABLE `layout_ordering_process` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_ordering_process`
--

INSERT INTO `layout_ordering_process` (`id`, `icon`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ShoppingBag', 'Chọn mua tài khoản', 'Dễ dàng đặt mua qua website hoặc liên hệ trực tiếp', '2025-03-03 16:31:02', '2025-08-24 07:18:24'),
(2, 'CreditCard', 'Thanh Toán', 'Đa dạng phương thức thanh toán: chuyển khoản, ví điện tử', '2025-03-03 16:31:02', '2025-08-24 07:17:51'),
(3, 'ArrowRight', 'Bàn giao tài khoản', 'Bàn giao tài khoản nhanh chóng', '2025-03-03 16:31:02', '2025-08-24 07:18:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_slide_header`
--

CREATE TABLE `layout_slide_header` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_slide_header`
--

INSERT INTO `layout_slide_header` (`id`, `image_url`, `title`, `description`) VALUES
(2, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756057826/amus6foexoiavxtzrjsp.jpg', 'MINH CHẾN', 'chào mừng bạn đến với website của chúng tôi'),
(3, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756057841/pynympecthczuhs6q5s7.jpg', 'Minh Chiến', 'Chào mừng bạn đến với website của chúng tôi !');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_social_media_links`
--

CREATE TABLE `layout_social_media_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `platform` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_social_media_links`
--

INSERT INTO `layout_social_media_links` (`id`, `platform`, `url`, `target`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', 'https://facebook.com/minhchien', '_blank', '2025-02-22 15:01:47', '2025-08-23 13:16:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_space`
--

CREATE TABLE `layout_space` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description_one` text NOT NULL,
  `description_two` text NOT NULL,
  `description_three` text NOT NULL,
  `description_four` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_space`
--

INSERT INTO `layout_space` (`id`, `icon`, `title`, `description_one`, `description_two`, `description_three`, `description_four`, `created_at`, `updated_at`) VALUES
(3, 'ArrowRightCircle', 'Đa dạng thể loại game', 'Đẩy đủ thể loại cho các game thủ lựa chọn trải nghiệm', 'Bảo mật tuyệt đối', 'chất lượng tương xứng với giá thành', '', '2025-03-05 11:49:57', '2025-08-24 07:10:15'),
(4, 'ArrowRightCircle', 'Đội ngũ nhân viên', 'Chuyên nghiệp', 'Phục vụ 24/24', 'Chăm sóc tận tình', 'Kiểm soát chất lượng nghiêm ngặt', '2025-03-05 11:49:57', '2025-08-24 07:11:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_story`
--

CREATE TABLE `layout_story` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description_one` longtext NOT NULL,
  `description_two` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_story`
--

INSERT INTO `layout_story` (`id`, `title`, `description_one`, `description_two`, `created_at`, `updated_at`) VALUES
(1, 'Câu Chuyện Của Chúng Tôi', 'Shop Game Minh Chiến được thành lập từ năm 2003, khởi đầu chỉ là một cửa hàng nhỏ chuyên cung cấp tài khoản game cho cộng đồng game thủ. Với hơn 20 năm phát triển, chúng tôi tự hào trở thành một trong những địa chỉ uy tín nhất trong lĩnh vực mua bán tài khoản game online, cam kết mang đến cho khách hàng trải nghiệm an toàn, chất lượng và nhanh chóng.', 'Với sự phát triển của công nghệ, chúng tôi đã mở rộng dịch vụ sang nền tảng trực tuyến, giúp game thủ dễ dàng mua tài khoản game mọi lúc, mọi nơi, nhanh chóng và an toàn.', '2025-03-03 23:09:07', '2025-08-23 13:18:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `layout_website_brand`
--

CREATE TABLE `layout_website_brand` (
  `id` int(11) NOT NULL,
  `logo_url` longtext NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `alt_text` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `layout_website_brand`
--

INSERT INTO `layout_website_brand` (`id`, `logo_url`, `brand_name`, `alt_text`) VALUES
(1, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756019238/rubuvv4kgpz0f4hnl1ip.png', 'shopacc24h', 'online');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image_url` longtext NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `image_url`, `status`, `created_at`, `updated_at`) VALUES
(31, 'Mừng Ngày Quốc tế Phụ nữ 8/3', '<p><strong>Mừng Ngày Quốc tế Phụ nữ 8/3 - Giảm ngay 10% cho tất cả tài khoản game!</strong></p><p>🎉 <strong>Chào mừng Ngày Quốc tế Phụ nữ 8/3</strong> 🎉<br>Shop Game Minh Chiến gửi đến các nữ game thủ và khách hàng thân yêu <strong>chương trình khuyến mãi đặc biệt – giảm ngay 10% cho tất cả các tài khoản game hot nhất hiện nay!</strong> Đây là cơ hội tuyệt vời để bạn trải nghiệm những tựa game yêu thích với mức giá ưu đãi nhất.</p><p><strong>Nhập mã: GROCOBWH</strong></p><p>📅 <strong>Thời gian áp dụng:</strong> Từ 05/03 đến 20/03<br>🎮 <strong>Sản phẩm áp dụng:</strong> Tất cả các tài khoản game, acc VIP, gói nạp ưu đãi<br>🔥 <strong>Hình thức ưu đãi:</strong> Giảm trực tiếp 10% trên tổng giá trị đơn hàng</p><p>💝 <strong>Lời tri ân đến một nửa thế giới</strong> 💝<br>Ngày Quốc tế Phụ nữ là dịp để tôn vinh những người phụ nữ tuyệt vời trong cuộc sống. Nhân dịp này, Shop Minh Thuận mong muốn mang đến <strong>những phút giây giải trí vui vẻ, thoải mái</strong> cho bạn và người thân.</p><p>📌 <strong>Đừng bỏ lỡ cơ hội này!</strong> Hãy đặt hàng ngay hôm nay để sở hữu tài khoản game chất lượng với giá siêu ưu đãi.</p><p>🌐 Website: [https://fontend-shop-acc24h.vercel.app]<br>📞 Hotline: [012345678]</p><p>🔥 <strong>Nhanh tay, ưu đãi chỉ áp dụng trong thời gian có hạn!</strong> 🔥💖</p>', 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1742289198/zcakjrgwfs614thzxkzh.jpg', 1, '2025-03-10 03:07:43', '2025-03-10 03:07:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `data_product` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data_product`)),
  `discount_code` varchar(50) DEFAULT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `final_total` int(11) DEFAULT NULL,
  `free_of_charge` int(11) DEFAULT NULL,
  `payment_method` enum('cod','bank') DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` enum('pending','processing','completed','canceled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `discount_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission`
--

INSERT INTO `permission` (`id`, `name`) VALUES
(2, 'get_user'),
(3, 'post_user'),
(4, 'put_user'),
(5, 'delete_user'),
(7, 'post_new'),
(8, 'put_new'),
(9, 'delete_new'),
(10, 'put_product'),
(11, 'post_product'),
(12, 'delete_product'),
(13, 'put_footer'),
(14, 'post_footer'),
(15, 'delete_footer'),
(16, 'put_about'),
(17, 'post_about'),
(18, 'delete_about'),
(19, 'put_header'),
(20, 'post_header'),
(21, 'delete_header'),
(22, 'post_nav_logo'),
(23, 'put_nav_logo'),
(24, 'delete_nav_logo'),
(25, 'post_role'),
(26, 'put_role'),
(27, 'delete_role'),
(28, 'get_role'),
(29, 'get_contacts'),
(30, 'delete_contacts'),
(31, 'get_discount'),
(32, 'post_discount'),
(33, 'put_discount'),
(34, 'delete_discount'),
(35, 'get_order'),
(36, 'post_order'),
(37, 'put_order'),
(38, 'delete_order'),
(39, 'get_discount'),
(40, 'post_discount'),
(41, 'put_discount'),
(42, 'delete_discount'),
(43, 'get_stats');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `quantity_sold` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 0,
  `star` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `category` varchar(255) NOT NULL DEFAULT 'fish',
  `hot` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity_sold`, `quantity`, `star`, `status`, `category`, `hot`, `created_at`, `updated_at`) VALUES
(44, 'ACC random', '<p>RANDOM 1 acc ngẫu nhiên từ cùi đến vip</p>', 10000, 3, 997, 0, 0, 'strategy', 0, '2025-08-24 06:18:18', '2025-10-09 06:15:57'),
(45, 'MÃ ff 01', '<h3>🔥 <strong>Free Fire – Sinh tồn đỉnh cao, chiến thắng bằng kỹ năng!</strong></h3><p>Free Fire là game bắn súng sinh tồn góc nhìn thứ ba, nơi 50 người cùng nhảy dù xuống một hòn đảo hoang và chiến đấu để trở thành <strong>người sống sót cuối cùng</strong>.<br><br>🎯 Bạn có thể <strong>tự do chọn vị trí hạ cánh</strong>, <strong>thu thập vũ khí</strong>, <strong>lập chiến lược</strong> cùng đồng đội hoặc solo 1 mình để thể hiện bản lĩnh.<br>💣 Với đồ họa mượt, thời gian mỗi trận chỉ <strong>10 phút</strong>, Free Fire mang đến <strong>trải nghiệm kịch tính, nhanh và nảy lửa</strong>.<br>🕹️ Đặc biệt: hệ thống <strong>nhân vật – kỹ năng – pet – skin súng</strong> đa dạng giúp người chơi thể hiện cá tính riêng.<br>Tài khoản sẵn vật phẩm vip như: naruto, skin súng chuyên dame, nhân vật đầy đủ, skin huyền thoại</p>', 1234567, 0, 1, 0, 0, 'action', 0, '2025-08-24 11:29:40', '2025-10-09 13:48:49'),
(46, 'Mã ff 02', '<h3>🎯 <strong>Free Fire – Cuộc chiến sinh tồn nghẹt thở!</strong></h3><p>Nhảy dù, loot đồ, chiến đấu!<br>Free Fire đưa bạn vào <strong>trận chiến sinh tồn 50 người</strong>, nơi <strong>chỉ một người sống sót cuối cùng</strong>.<br>Mỗi trận chỉ <strong>10 phút</strong>, nhưng đầy kịch tính – nơi kỹ năng, chiến lược và phản xạ quyết định chiến thắng.<br><br>Chi tiết tài khoản:<br>- Login gg trắng thông tin</p><p><br>Skin trong tài khoản:</p><p>Đạo chích đỏ , dung nham , naruto , súng tốc bắn , ump nhong nhong ,mp thần bài</p>', 120000, 0, 1, 0, 0, 'action', 0, '2025-08-24 11:30:54', '2025-10-09 13:50:50'),
(47, 'Mã ff 03', '<h3>🔥 <strong>FREE FIRE – CHIẾN TRƯỜNG SINH TỒN KHÔNG DÀNH CHO KẺ YẾU!</strong></h3><p>Bước vào thế giới nơi <strong>mỗi giây đều là sinh tử</strong>.<br>Từ lúc <strong>nhảy dù</strong>, <strong>nhặt súng</strong>, đến <strong>chạm trán đối thủ</strong>, mọi khoảnh khắc đều khiến tim bạn đập nhanh.<br>🎯 50 người – 1 người sống sót. Bạn có đủ bản lĩnh để trở thành <strong>huyền thoại</strong>?<br>💣 Kho vũ khí đa dạng, kỹ năng nhân vật độc quyền, pet siêu ngầu và trang phục cực chất.<br>⚡ Free Fire – nơi <strong>đẳng cấp được chứng minh bằng kỹ năng</strong>, không phải may mắn!<br><br>Chi tiết tài khoản:<br>- Login gg trắng thông tin</p><p></p><p>VIP 8 , 3C7 2C6. Full naruto mới nhất , súng cháy tốc bắn đày kho , hd bơm máu , mp bích vàng ,lãng khách , dung nham<br></p>', 10000, 0, 1, 0, 0, 'action', 0, '2025-08-24 11:31:53', '2025-10-09 13:51:51'),
(48, 'Mã lq 01', '<h3>⚔️ <strong>LIÊN QUÂN MOBILE – CHIẾN ĐẤU LÀ VINH QUANG!</strong></h3><p>Vào trận 5v5, chọn tướng, phối hợp cùng đồng đội và <strong>lật kèo ngoạn mục</strong>!<br>Mỗi pha combat là <strong>một khoảnh khắc thăng hoa</strong>, nơi chiến thuật và phản xạ hòa làm một.<br>🌟 Hơn 100 tướng – hàng trăm skin – hàng nghìn cách chơi, không trận nào giống trận nào.<br>🔥 Từ tân thủ đến cao thủ, ai cũng có thể <strong>tỏa sáng trên bản đồ Liên Quân</strong>.<br>🎮 Game MOBA quốc dân – <strong>nơi tình bạn, kỹ năng và chiến thắng hội tụ!</strong><br><br>Chi tiết tài khoản:<br>Login: garena trắng</p><p>Full skin violet, full tướng<br><br></p>', 12000, 0, 1, 0, 0, 'strategy', 0, '2025-08-24 11:33:31', '2025-10-09 13:52:35'),
(49, 'Mã lq 02', '<h3>⚔️ <strong>Liên Quân Mobile – Đấu trường huyền thoại</strong></h3><p>Chiến trường 5v5 huyền thoại, nơi kỹ năng và chiến thuật lên ngôi!<br>Liên Quân Mobile mang đến <strong>trận chiến MOBA tốc độ cao</strong>, mỗi pha combat là <strong>một khoảnh khắc bùng nổ</strong>.<br>💎 Hơn 100 vị tướng với kỹ năng độc đáo – từ sát thủ, pháp sư đến xạ thủ, tanker.<br>🎮 Thời gian trận đấu trung bình 10–15 phút, dễ chơi – nhưng khó thành thạo!<br>🔥 Cập nhật liên tục skin, map, giải đấu, và sự kiện eSports – <strong>tạo nên cộng đồng hàng triệu game thủ Việt</strong>.<br><br>Chi tiết tài khoản:<br>Login: garena trắng</p><p>Full tướng, nhiều skin bậc ss</p><p></p>', 15000, 0, 1, 0, 0, 'strategy', 0, '2025-08-24 11:34:35', '2025-10-09 13:53:16'),
(50, 'Mã lq 03', '<h3>⚔️ <strong>Liên Quân Mobile – MOBA quốc dân, chiến đấu cùng đồng đội!</strong></h3><p>Liên Quân Mobile là game <strong>MOBA 5v5 thời gian thực</strong>, nơi bạn cùng đồng đội <strong>phối hợp chiến thuật</strong>, <strong>giao tranh đỉnh cao</strong> và <strong>phá nhà chính đối phương</strong> để giành chiến thắng.<br>💥 Hơn <strong>100 tướng</strong> đa dạng: xạ thủ, pháp sư, đấu sĩ, trợ thủ, đỡ đòn... mỗi tướng có kỹ năng riêng biệt.<br>🎮 Trận đấu trung bình chỉ <strong>10–15 phút</strong>, dễ chơi nhưng đòi hỏi <strong>chiến thuật và phản xạ nhanh</strong>.<br>🌟 Game liên tục cập nhật <strong>skin mới, sự kiện, giải đấu eSports tầm quốc tế</strong>, giúp cộng đồng game thủ Việt luôn sôi động.<br><br>Chi tiết tài khoản:<br>Login: garena liên kết sdt</p><p>Skin bậc 3s hayate</p>', 17000, 1, 0, 0, 0, 'strategy', 0, '2025-08-24 11:36:19', '2025-10-09 13:53:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL DEFAULT 'https://picsum.photos/200',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `created_at`) VALUES
(141, 44, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756016297/piczwck8wuolrqv6s90j.jpg', '2025-08-24 06:18:18'),
(142, 45, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756034978/qq6reo29qzwkdilgaj4d.jpg', '2025-08-24 11:29:40'),
(143, 45, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756034978/nljlbzsfglxzotageswm.jpg', '2025-08-24 11:29:40'),
(144, 45, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756034978/f2oya4j8izc2btzmrwiy.jpg', '2025-08-24 11:29:40'),
(145, 45, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756034978/xttjnx8fdyjqcgoz9hwa.jpg', '2025-08-24 11:29:40'),
(146, 45, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756034979/sah36jluxq1dm4ohvxst.jpg', '2025-08-24 11:29:40'),
(147, 46, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035052/uksgyboqdqwbu58hsuad.jpg', '2025-08-24 11:30:54'),
(148, 46, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035052/pe8fs4armuxsizjxtvhf.jpg', '2025-08-24 11:30:54'),
(149, 46, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035052/ubmomgacnlo6pyp0gunc.jpg', '2025-08-24 11:30:54'),
(150, 46, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035052/kbjrbx0vqwsurbpnltcl.jpg', '2025-08-24 11:30:54'),
(151, 46, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035052/f8ml7cjczhntrx0xukhd.jpg', '2025-08-24 11:30:54'),
(152, 47, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035111/w8xcebaugfg5yladt8ly.jpg', '2025-08-24 11:31:53'),
(153, 47, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035111/qsysmhcyenbqqul8axyd.jpg', '2025-08-24 11:31:53'),
(154, 47, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035111/nnm2sl0rm0fecbigyfod.jpg', '2025-08-24 11:31:53'),
(155, 47, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035111/ivxbzojnspaxueiaiuyn.jpg', '2025-08-24 11:31:53'),
(156, 47, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035112/zzg9uyyqoanw0vgo497o.jpg', '2025-08-24 11:31:53'),
(157, 48, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035207/ldqzb5216yrzq6aotqgj.jpg', '2025-08-24 11:33:31'),
(158, 49, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035275/bv477jwwgkj3rhn4ozju.jpg', '2025-08-24 11:34:35'),
(159, 50, 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1756035377/yjxlxna6iqpgxsdhbwsi.jpg', '2025-08-24 11:36:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reset_password_codes`
--

CREATE TABLE `reset_password_codes` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `reset_password_codes`
--

INSERT INTO `reset_password_codes` (`id`, `email`, `code`, `created_at`) VALUES
(14, 'thuan18092003@gmail.com', '359568', '2025-05-18 16:10:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2025-03-09 20:18:21', '2025-03-09 20:18:21'),
(2, 'user', '2025-03-09 20:18:21', '2025-03-09 20:18:21'),
(3, 'super_admin', '2025-03-09 20:18:21', '2025-03-09 20:18:21'),
(28, 'nhan_vien1', '2025-03-09 20:27:31', '2025-03-09 20:27:31'),
(29, 'thu_ngan', '2025-03-09 20:58:39', '2025-03-09 20:58:39'),
(31, 'kythuat', '2025-05-13 00:15:17', '2025-05-13 00:15:17'),
(32, 'super admin', '2025-08-23 10:28:53', '2025-08-23 13:37:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_permission`
--

CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role_permission`
--

INSERT INTO `role_permission` (`role_id`, `permission_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 41),
(3, 42),
(3, 43),
(28, 2),
(28, 3),
(28, 4),
(28, 5),
(28, 7),
(28, 8),
(28, 9),
(28, 10),
(28, 11),
(28, 12),
(28, 13),
(28, 14),
(28, 15),
(28, 16),
(28, 17),
(28, 18),
(28, 19),
(28, 20),
(28, 21),
(28, 22),
(28, 23),
(28, 24),
(28, 25),
(28, 26),
(28, 27),
(28, 28),
(28, 29),
(28, 30),
(28, 35),
(28, 39),
(29, 2),
(29, 35),
(29, 37),
(29, 38),
(29, 39),
(29, 43),
(31, 10),
(31, 11),
(31, 12),
(31, 13),
(31, 14),
(31, 15),
(31, 16),
(31, 17),
(31, 18),
(31, 19),
(31, 20),
(31, 21),
(31, 22),
(31, 23),
(31, 24),
(32, 2),
(32, 3),
(32, 4),
(32, 5),
(32, 7),
(32, 8),
(32, 9),
(32, 10),
(32, 11),
(32, 12),
(32, 13),
(32, 14),
(32, 15),
(32, 16),
(32, 17),
(32, 18),
(32, 19),
(32, 20),
(32, 21),
(32, 22),
(32, 23),
(32, 24),
(32, 25),
(32, 26),
(32, 27),
(32, 28),
(32, 29),
(32, 30),
(32, 35),
(32, 36),
(32, 37),
(32, 38),
(32, 39),
(32, 40),
(32, 41),
(32, 42),
(32, 43);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullName`, `email`, `avatar`, `password`, `role_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Nguyễn Minh Thuận', 'thuan18092003@gmail.com', 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1742001194/mqoodm3nt4m42hhlq49a.jpg', '$2y$10$9AxVFVLEhqcRlXhs/9w88.H4bFr5bJzWF9IrhxPWwcuMXs6zhRp4q', 3, 0, '2025-03-09 16:10:52', '2025-03-15 02:05:00'),
(25, 'A', 'thuan@gmail.com', 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1742015676/c8rpqw6wk8edghzxo4xg.jpg', '$2y$10$e6pjfZN9aIxfF9Taount3u1XJKylv52qHLUj0pn3WeFr9Swfa62yW', 2, 0, '2025-05-14 00:51:42', '2025-08-23 13:34:49'),
(30, 'chien', 'hmc3521@gmail.com', 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1742015676/c8rpqw6wk8edghzxo4xg.jpg', '$2y$10$cbxt1gHbV5mGxK/bsuP5uezruBb1izm2Lx3aaE8zjUpOBrRSDZw9G', 32, 0, '2025-08-25 13:37:15', '2025-08-25 13:42:05'),
(31, 'chien', 'chienpro1909@gmail.com', 'https://res.cloudinary.com/dsoj3y7wu/image/upload/v1742015676/c8rpqw6wk8edghzxo4xg.jpg', '$2y$10$.9za3HH/EIUMu.Wh0f5EKezsHEU8w7J4jIEut/TNfbE4zqSm20N8e', 2, 0, '2025-10-04 03:12:12', '2025-10-04 03:12:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `verification_codes`
--

CREATE TABLE `verification_codes` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(6) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `blacklisted_tokens`
--
ALTER TABLE `blacklisted_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `discount_history`
--
ALTER TABLE `discount_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_history_id` (`order_history_id`);

--
-- Chỉ mục cho bảng `email_history`
--
ALTER TABLE `email_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `history_orders`
--
ALTER TABLE `history_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `layout_ads`
--
ALTER TABLE `layout_ads`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `layout_benefit`
--
ALTER TABLE `layout_benefit`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `layout_contactsfooter`
--
ALTER TABLE `layout_contactsfooter`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `layout_customer_choose_item_section`
--
ALTER TABLE `layout_customer_choose_item_section`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `layout_customer_section`
--
ALTER TABLE `layout_customer_section`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `layout_navigation_menu`
--
ALTER TABLE `layout_navigation_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `layout_ordering_process`
--
ALTER TABLE `layout_ordering_process`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `layout_slide_header`
--
ALTER TABLE `layout_slide_header`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `layout_social_media_links`
--
ALTER TABLE `layout_social_media_links`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `reset_password_codes`
--
ALTER TABLE `reset_password_codes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `fk_role_permission_permission` (`permission_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_user_role` (`role_id`);

--
-- Chỉ mục cho bảng `verification_codes`
--
ALTER TABLE `verification_codes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `blacklisted_tokens`
--
ALTER TABLE `blacklisted_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `discount_history`
--
ALTER TABLE `discount_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `email_history`
--
ALTER TABLE `email_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `history_orders`
--
ALTER TABLE `history_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `layout_ads`
--
ALTER TABLE `layout_ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `layout_benefit`
--
ALTER TABLE `layout_benefit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `layout_contactsfooter`
--
ALTER TABLE `layout_contactsfooter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `layout_customer_choose_item_section`
--
ALTER TABLE `layout_customer_choose_item_section`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `layout_customer_section`
--
ALTER TABLE `layout_customer_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `layout_navigation_menu`
--
ALTER TABLE `layout_navigation_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `layout_ordering_process`
--
ALTER TABLE `layout_ordering_process`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `layout_slide_header`
--
ALTER TABLE `layout_slide_header`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `layout_social_media_links`
--
ALTER TABLE `layout_social_media_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT cho bảng `reset_password_codes`
--
ALTER TABLE `reset_password_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `verification_codes`
--
ALTER TABLE `verification_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `discount_history`
--
ALTER TABLE `discount_history`
  ADD CONSTRAINT `discount_history_ibfk_1` FOREIGN KEY (`order_history_id`) REFERENCES `history_orders` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `fk_role_permission_permission` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_role_permission_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
