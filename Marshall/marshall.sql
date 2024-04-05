-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 05, 2024 lúc 09:13 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `marshall`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `user_id`, `quantity`) VALUES
(2, 6, NULL, NULL),
(3, 6, 6, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'speakers'),
(2, 'headphones'),
(3, 'accessories'),
(4, 'travel');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `title_name` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `title_name`, `note`) VALUES
(1, 'unhi', 'Nguyen', 'unhi@gmail.com', '0123651123', 'Marshall Headphones', 'it\'t too expensive');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date_at` datetime NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `user_id`, `name`, `mobile`, `address`, `date_at`, `total`, `status`) VALUES
(1, 4, 'nhi', 12345678, '234/Binh Thanh', '2019-01-01 00:00:00', 4000000, NULL),
(2, 5, 'nhi', 923125457, '234/Binh Thanh', '2019-01-01 04:00:00', 4700000, 'Processed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `orderid_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `product_id`, `orderid_id`, `quantity`) VALUES
(1, 5, 1, 1),
(2, 6, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `position`
--

INSERT INTO `position` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Staff'),
(3, 'Customer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `introduce` varchar(400) DEFAULT NULL,
  `body` varchar(1000) DEFAULT NULL,
  `end` varchar(400) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `price`, `description`, `image`) VALUES
(1, 1, 'Best Marshall Speakers', 6000000, 'Mua Marshall Major IV On-Ear Bluetooth Headphones, Brown trên Amazon', '1-6602a49480d8f.webp'),
(2, 1, 'MIDDLETON BLACK AND BRASS', 5000000, 'Carry the loudest Bluetooth speaker for home', '2-6602a4d60d980.jpg'),
(3, 1, 'Marshall Stanmore II', 4500000, 'Discover the new Marshall Stanmore II Wireless Bluetooth Speaker', '3-6602a511e8615.webp'),
(4, 1, 'Marshall Kilburn II Grey', 700000, 'Marshall\'s Kilburn II Bluetooth Speaker now up to', '4-6602a54fe8c61.jpg'),
(5, 2, 'Marshall Major IV', 4000000, 'Marshall - Major III - Brown - Headphones - Iconic Classic Premium', '5-6602a59c928dc.jpg'),
(6, 2, 'Marshall Major II Normal', 4700000, 'Buy MARSHALL Major IV Wireless Bluetooth Headphones', '6-6602a5e4a5200.jpg'),
(7, 2, 'Marshall Minor 3', 3450000, 'True Wireless Bluetooth Headphones Marshall Minor 3 MARSHALL', '7-6602a611e2dcb.webp'),
(8, 2, 'Marshall Minor III wireless', 3200000, 'Marshall Minor III wireless headphones the Best', '8-6602a65478549.jpg'),
(9, 2, 'Marshall Major III Wired', 4800000, 'Marshall Major III Wired On-Ear Headphones, White (1001823), 6.3 x 6.3 x 3.4 inches : Amazon.ca:', '14-6602a684b8f37.jpg'),
(10, 3, 'Travel Case Storage', 500000, 'Hard Carrying Case for Marshall Willen Portable Bluetooth Speaker, Protective Travel Case Storage', '11-6602a6dfdc085.webp'),
(11, 3, 'Marshall Other Music Accessories', 680000, 'Loa Marshall Stanmore II - Accessories Store Marshall Willen Bluetooth Portable Speaker Cream | Bermor Techzone  Bermor Techzone Marshall Willen Bluetooth Portable Speaker Cream | Bermor Techzone Marshall Other Music Accessories - Muziker  Muziker Marsha', '10-6602a7233ac94.jpg'),
(12, 4, 'Bag Collections', 580000, 'Marshall Travel Vietnam - Bag Collections & Accessories', '12-6602a77bd2fe9.webp'),
(13, 4, 'Marshall Underground', 900000, 'Marshall Underground Duffel Bag - Ceny i opinie', '13-6602a7c22d120.jpg'),
(14, 2, 'New Product', 4200000, 'This is a new product', '15_-6605ad2d66b78.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `position_id` int(11) DEFAULT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `position_id`, `email`, `roles`, `password`) VALUES
(2, 1, 'nhinhi123@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$/iYrq1OalYarKnRaoiU/5OB6giYL6a7wwOVrIWy0QtYL8V916EWFu'),
(4, 2, 'nhi@gmail.com', '[\"ROLE_ADMIN1\"]', '$2y$13$1QXxq9txa8dF8QPxbLhwC.xfAAK7fdGz23LZT8US4PH8A7aP4crnW'),
(5, 3, 'user@gmail.com', '[]', '$2y$13$zIK/vn8GMRekOerV4FChL.tVcOFgM6EZyh0YH0e5N1OhxnQQqxxkO'),
(6, 3, 'nhine12@gmail.com', '[]', '$2y$13$dnvbnA49d.Oaw8qwA/S0ou6P1.4eW2Se.9aXbcYrIRFaPwlvFumni');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BA388B74584665A` (`product_id`),
  ADD KEY `IDX_BA388B7A76ED395` (`user_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ED896F464584665A` (`product_id`),
  ADD KEY `IDX_ED896F466F90D45B` (`orderid_id`);

--
-- Chỉ mục cho bảng `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD KEY `IDX_8D93D649DD842E46` (`position_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_BA388B74584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_BA388B7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_ED896F464584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_ED896F466F90D45B` FOREIGN KEY (`orderid_id`) REFERENCES `order` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649DD842E46` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
