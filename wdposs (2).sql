-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2019 at 11:37 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wdposs`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_approver_list`
--

CREATE TABLE `sma_approver_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `approver_id` int(11) NOT NULL,
  `approver_seq` tinyint(3) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `approver_next_seq` int(11) NOT NULL,
  `approver_seq_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_approver_list`
--

INSERT INTO `sma_approver_list` (`id`, `approver_id`, `approver_seq`, `category_id`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`, `approver_next_seq`, `approver_seq_name`) VALUES
(2445, 2, 2, 3, 0, 4, '2019-10-26 06:10:52', 4, '2019-10-27 06:14:30', 3, 'Color'),
(2446, 4, 3, 3, 0, 4, '2019-10-26 06:11:15', 4, '2019-10-27 06:14:42', 0, 'Inspect'),
(2447, 5, 1, 3, 0, 4, '2019-10-27 06:19:32', NULL, NULL, 2, 'Barcode');

-- --------------------------------------------------------

--
-- Table structure for table `sma_approve_details`
--

CREATE TABLE `sma_approve_details` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `approve_status` int(3) NOT NULL,
  `aprrover_id` int(11) NOT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `approver_seq` tinyint(4) NOT NULL,
  `application_id` int(11) NOT NULL,
  `approver_seq_name` varchar(20) DEFAULT NULL,
  `next_approve_seq` int(11) NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_approve_details`
--

INSERT INTO `sma_approve_details` (`id`, `status`, `type`, `approve_status`, `aprrover_id`, `created_by`, `updated_by`, `updated_date`, `created_date`, `approver_seq`, `application_id`, `approver_seq_name`, `next_approve_seq`, `comments`, `category_id`) VALUES
(420, 'Approved', 'Sales', 1, 5, 4, 5, '2019-10-27 05:58:22', '2019-10-27 03:47:23', 1, 31, 'Recommended By ', 2, NULL, 3),
(421, 'Approved', 'Sales', 1, 2, 4, 2, '2019-10-27 06:08:21', '2019-10-27 03:47:23', 2, 31, 'Verified By', 3, NULL, 3),
(422, 'Waiting For Approved By(owner owner)', 'Sales', 0, 4, 4, NULL, NULL, '2019-10-27 03:47:23', 3, 31, 'Approved By', 0, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`, `description`) VALUES
(1, NULL, 'Test', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES
(1, 'C01', 'General', NULL, 0, 'general', 'General');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  `customer_credit_limit` float(11,2) DEFAULT '0.00',
  `credit_enjoy_days` int(8) DEFAULT NULL,
  `expire_date_proof` date DEFAULT NULL,
  `prefix_proof` varchar(10) DEFAULT NULL,
  `sequence_proof` int(9) DEFAULT NULL,
  `sequence_limit_proof` int(9) DEFAULT NULL,
  `authorization_number_proof` varchar(25) DEFAULT NULL,
  `prefix_fc` varchar(10) DEFAULT NULL,
  `authorization_number_fc` varchar(25) DEFAULT NULL,
  `expire_date_fc` date DEFAULT NULL,
  `sequence_fc` int(9) DEFAULT NULL,
  `sequence_limit_fc` int(9) DEFAULT NULL,
  `prefix_cf` varchar(10) DEFAULT NULL,
  `authorization_number_cf` varchar(25) DEFAULT NULL,
  `expire_date_cf` date DEFAULT NULL,
  `sequence_cf` int(9) DEFAULT NULL,
  `sequence_limit_cf` int(9) DEFAULT NULL,
  `prefix_cn` varchar(10) DEFAULT NULL,
  `authorization_number_cn` varchar(25) DEFAULT NULL,
  `expire_date_cn` date DEFAULT NULL,
  `sequence_cn` int(9) DEFAULT NULL,
  `sequence_limit_cn` int(9) DEFAULT NULL,
  `prefix_sr` varchar(10) DEFAULT NULL,
  `authorization_number_sr` varchar(25) DEFAULT NULL,
  `expire_date_sr` date DEFAULT NULL,
  `sequence_sr` int(9) DEFAULT NULL,
  `sequence_limit_sr` int(9) DEFAULT NULL,
  `prefix_gov` varchar(10) DEFAULT NULL,
  `authorization_number_gov` varchar(25) DEFAULT NULL,
  `expire_date_gov` date DEFAULT NULL,
  `sequence_gov` int(9) DEFAULT NULL,
  `sequence_limit_gov` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`, `customer_credit_limit`, `credit_enjoy_days`, `expire_date_proof`, `prefix_proof`, `sequence_proof`, `sequence_limit_proof`, `authorization_number_proof`, `prefix_fc`, `authorization_number_fc`, `expire_date_fc`, `sequence_fc`, `sequence_limit_fc`, `prefix_cf`, `authorization_number_cf`, `expire_date_cf`, `sequence_cf`, `sequence_limit_cf`, `prefix_cn`, `authorization_number_cn`, `expire_date_cn`, `sequence_cn`, `sequence_limit_cn`, `prefix_sr`, `authorization_number_sr`, `expire_date_sr`, `sequence_sr`, `sequence_limit_sr`, `prefix_gov`, `authorization_number_gov`, `expire_date_gov`, `sequence_gov`, `sequence_limit_gov`) VALUES
(1, 3, 'customer', 1, 'General', 'Cliente Contado', 'Cliente Contado', '----------', 'Direccion', 'Ciudad', '', '', '', '00000000', 'clientes@grupowebdo.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, '', 70000.00, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Suplidor General', 'Suplidor General', '', 'Direccion', 'Moca', 'Espaillat', '56000', 'República Dominicana', '8095781102', 'suplidor@grupowebdo.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Grupo WebDo', 'Grupo WebDo', '5555', 'Calle Duarte KM 1', 'Moca', '', '', '', '8297538303', 'info@grupowebdo.com', '', '', '', '', '', '', ' Gracias por preferirnos...', 0, 'logo5.png', 0, NULL, NULL, NULL, '', NULL, NULL, '2019-03-31', 'FAC-', 19, 4, '124578966', 'B02', '369852147', '2019-04-30', 1, 1, 'B01', '123789456', '2018-12-31', 1, 250, 'CN001', '147852369', '2019-01-31', 1, 370, 'SR001', '14597823', '2019-02-28', 1, 450, 'GV001', '123965478', '2019-02-28', 1, 560),
(7, 3, 'customer', 1, 'General', 'elvi jose', 'independiente', '05401322960', 'el pino la vega', 'la vega', '', '12345', 'republica dominicana', '829-786-1902', 'ej.landetar@gmail.com', NULL, NULL, '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Predeterminado', '', 25000.00, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 4, 'supplier', NULL, NULL, 'NO SE', 'NO SE', '00000000', '555555', 'VEGA', '', '', '', '555555', 'NO@NOSE.COM', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, '000', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(41, '2019-01-08', 11, 41, 14, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4999.0000', 1, 0, NULL),
(42, '2019-01-08', 11, 42, 15, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4998.0000', 1, 0, NULL),
(43, '2019-01-08', 11, 43, 16, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4997.0000', 1, 0, NULL),
(44, '2019-01-09', 11, 44, 17, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4996.0000', 1, 0, NULL),
(45, '2019-01-09', 11, 45, 18, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4995.0000', 1, 0, NULL),
(46, '2019-01-09', 11, 46, 19, 23, '1.0000', '0.8333', '0.8333', '150.0000', '150.0000', '4994.0000', 1, 0, NULL),
(47, '2019-01-09', 11, 47, 20, 23, '1.0000', '0.8333', '0.8333', '100.0000', '100.0000', '4993.0000', 1, 0, NULL),
(48, '2019-01-09', 11, 48, 21, 23, '1.0000', '0.8333', '0.8333', '150.0000', '150.0000', '4992.0000', 1, 0, NULL),
(49, '2019-01-09', 11, 49, 22, 23, '2.0000', '0.8333', '0.8333', '250.0000', '250.0000', '4990.0000', 1, 0, NULL),
(50, '2019-01-10', 11, 50, 23, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4989.0000', 1, 0, NULL),
(51, '2019-01-10', 11, 51, 23, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4989.0000', 1, 0, NULL),
(52, '2019-01-10', 11, 52, 24, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4987.0000', 1, 0, NULL),
(53, '2019-01-10', 11, 53, 25, 23, '5.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4982.0000', 1, 0, NULL),
(54, '2019-01-10', 11, 54, 25, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4986.0000', 1, 0, NULL),
(55, '2019-03-19', 11, 55, 26, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4980.0000', 1, 0, NULL),
(56, '2019-04-25', 11, 56, 27, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4979.0000', 1, 0, NULL),
(57, '2019-04-25', 11, 57, 28, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4978.0000', 1, 0, NULL),
(58, '2019-10-27', 11, 58, 29, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4977.0000', 1, 0, NULL),
(59, '2019-10-27', 11, 59, 30, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4977.0000', 1, 0, NULL),
(60, '2019-10-27', 11, 60, 31, 23, '1.0000', '0.8333', '0.8333', '160.0000', '160.0000', '4977.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'Dolar', '50.0000', 0, 'US$'),
(2, 'RD', 'PESOS', '1.0000', 0, 'RD$');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Revendedor', -5),
(3, 'Distribuidor', -15),
(4, 'Nuevo (+10)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_expenses`
--

INSERT INTO `sma_expenses` (`id`, `date`, `reference`, `amount`, `note`, `created_by`, `attachment`, `category_id`, `warehouse_id`) VALUES
(1, '2019-01-09 14:42:00', 'GASTO2019/0001', '50.0000', '', '4', NULL, 0, 0),
(2, '2019-01-09 17:09:00', 'GASTO2019/0002', '50.0000', '', '4', NULL, 0, 0),
(3, '2019-01-11 19:33:00', 'motoconcho primo', '50.0000', '', '4', NULL, 0, 0),
(4, '2019-01-11 19:34:00', 'gasolina', '300.0000', '', '4', NULL, 0, 0),
(5, '2019-01-11 19:35:00', 'caca', '50.0000', '', '4', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'vendedores', 'Venta en POS');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 14, 1, 3, 1, 97, 1, 68, 2, 1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_types`
--

CREATE TABLE `sma_order_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_types`
--

INSERT INTO `sma_order_types` (`id`, `name`, `description`) VALUES
(3, 'Starting With Proofing', 'Starting With Proofing'),
(4, 'Start With Quote', 'Start With Quote'),
(6, 'Direct Order', 'Direct Order');

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) DEFAULT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`, `payment_method`) VALUES
(17, '2019-01-08 16:33:13', 14, NULL, NULL, 'PAGO2019/0059', NULL, 'cash', '', '', '', '', '', '', '160.0000', NULL, 4, NULL, 'received', '', '160.0000', '0.0000', NULL, NULL),
(18, '2019-01-08 16:34:00', 15, NULL, NULL, 'PAGO2019/0060', NULL, 'cash', '', '', '', '', '', 'Visa', '100.0000', NULL, 4, NULL, 'received', '', '100.0000', '0.0000', NULL, 'credit'),
(19, '2019-01-08 23:05:49', 16, NULL, NULL, 'PAGO2019/0060', NULL, 'cash', '', '', '', '', '', '', '210.0000', NULL, 4, NULL, 'received', '', '210.0000', '0.0000', NULL, NULL),
(20, '2019-01-09 14:24:30', 17, NULL, NULL, 'PAGO2019/0061', NULL, 'cash', '', '', '', '', '', '', '160.0000', NULL, 4, NULL, 'received', '', '160.0000', '0.0000', NULL, NULL),
(21, '2019-01-09 14:35:00', 18, NULL, NULL, 'PAGO2019/0062', NULL, 'cash', '', '', '', '', '', 'Visa', '100.0000', NULL, 4, NULL, 'received', '', '100.0000', '0.0000', NULL, 'credit'),
(22, '2019-01-09 14:44:07', 19, NULL, NULL, 'PAGO2019/0062', NULL, 'Cheque', '', '', '', '', '', '', '150.0000', NULL, 4, NULL, 'received', '', '150.0000', '0.0000', NULL, NULL),
(23, '2019-01-09 14:47:07', 20, NULL, NULL, 'PAGO2019/0063', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 4, NULL, 'received', '', '100.0000', '0.0000', NULL, NULL),
(24, '2019-01-09 16:53:29', 21, NULL, NULL, 'PAGO2019/0064', NULL, 'cash', '', '', '', '', '', '', '150.0000', NULL, 4, NULL, 'received', '', '150.0000', '0.0000', NULL, NULL),
(25, '2019-01-09 17:02:00', 22, NULL, NULL, 'PAGO2019/0065', NULL, 'cash', '', '', '', '', '', 'Visa', '200.0000', NULL, 4, NULL, 'received', '', '200.0000', '0.0000', NULL, 'credit'),
(26, '2019-01-09 17:08:00', 15, NULL, NULL, 'PAGO2019/0065', NULL, 'cash', '', '', '', '', '', 'Visa', '25.4000', NULL, 4, NULL, 'received', '', '25.4000', '0.0000', NULL, 'credit'),
(27, '2019-01-10 15:24:16', 23, NULL, NULL, 'PAGO2019/0065', NULL, 'cash', '', '', '', '', '', '', '320.0000', NULL, 4, NULL, 'received', '', '320.0000', '0.0000', NULL, NULL),
(28, '2019-01-10 16:25:00', 25, NULL, NULL, 'PAGO2019/0066', NULL, 'cash', '', '', '', '', '', 'Visa', '400.0000', NULL, 4, NULL, 'received', '', '400.0000', '0.0000', NULL, 'credit'),
(29, '2019-03-18 22:23:15', 26, NULL, NULL, 'PAGO2019/0066', NULL, 'cash', '', '', '', '', '', '', '160.0000', NULL, 4, NULL, 'received', '', '160.0000', '0.0000', NULL, NULL),
(30, '2019-04-24 21:29:21', 28, NULL, NULL, 'PAGO2019/0067', NULL, 'cash', '', '', '', '', '', '', '160.0000', NULL, 4, NULL, 'received', '', '160.0000', '0.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `returns-index` tinyint(1) DEFAULT '0',
  `returns-add` tinyint(1) DEFAULT '0',
  `returns-edit` tinyint(1) DEFAULT '0',
  `returns-delete` tinyint(1) DEFAULT '0',
  `returns-email` tinyint(1) DEFAULT '0',
  `returns-pdf` tinyint(1) DEFAULT '0',
  `reports-tax` tinyint(1) DEFAULT '0',
  `reports-sales-margin` tinyint(1) DEFAULT NULL,
  `products-details_search` tinyint(1) DEFAULT NULL,
  `document-file_manager` tinyint(1) DEFAULT '0',
  `document-folder_download` tinyint(1) DEFAULT '0',
  `document-upload` tinyint(1) DEFAULT '0',
  `document-file_delete` tinyint(1) DEFAULT '0',
  `document-folder_create` tinyint(1) DEFAULT '0',
  `approval_sales_status_approve` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`, `reports-sales-margin`, `products-details_search`, `document-file_manager`, `document-folder_download`, `document-upload`, `document-file_delete`, `document-folder_create`, `approval_sales_status_approve`) VALUES
(1, 5, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 0),
(2, 4, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 1, NULL, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 0, NULL, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, 1),
(3, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, NULL, 0, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `total_credit_sale` decimal(25,2) DEFAULT NULL,
  `total_credit_amount` decimal(25,2) DEFAULT NULL,
  `total_cheque` int(9) DEFAULT '0',
  `total_credit_card_slip` int(9) DEFAULT '0',
  `grand_total` decimal(11,2) DEFAULT '0.00',
  `current_cash_in_hand` decimal(11,2) DEFAULT '0.00',
  `total_sales` decimal(11,2) DEFAULT '0.00',
  `return_amount` decimal(11,2) DEFAULT '0.00',
  `expense` decimal(11,2) DEFAULT '0.00',
  `refund` decimal(11,2) DEFAULT '0.00',
  `gift_payment` decimal(11,2) DEFAULT '0.00',
  `cheque_payment` decimal(11,2) DEFAULT '0.00',
  `credit_card_payment` decimal(11,2) DEFAULT '0.00',
  `credit_payment` decimal(11,2) DEFAULT '0.00',
  `cash_payment` decimal(11,2) DEFAULT '0.00',
  `r_2000_c` decimal(11,2) DEFAULT '0.00',
  `r_1000_c` decimal(11,2) DEFAULT '0.00',
  `r_500_c` decimal(11,2) DEFAULT '0.00',
  `r_200_c` decimal(11,2) DEFAULT '0.00',
  `r_100_c` decimal(11,2) DEFAULT '0.00',
  `r_50_c` decimal(11,2) DEFAULT '0.00',
  `r_25_c` decimal(11,2) DEFAULT '0.00',
  `r_20_c` decimal(11,2) DEFAULT '0.00',
  `r_10_c` decimal(11,2) DEFAULT '0.00',
  `r_5_c` decimal(11,2) DEFAULT '0.00',
  `r_1_c` decimal(11,2) DEFAULT '0.00',
  `total_amount` decimal(11,2) DEFAULT '0.00',
  `total_sales_credit` decimal(11,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `total_credit_sale`, `total_credit_amount`, `total_cheque`, `total_credit_card_slip`, `grand_total`, `current_cash_in_hand`, `total_sales`, `return_amount`, `expense`, `refund`, `gift_payment`, `cheque_payment`, `credit_card_payment`, `credit_payment`, `cash_payment`, `r_2000_c`, `r_1000_c`, `r_500_c`, `r_200_c`, `r_100_c`, `r_50_c`, `r_25_c`, `r_20_c`, `r_10_c`, `r_5_c`, `r_1_c`, `total_amount`, `total_sales_credit`) VALUES
(17, '2019-01-09 16:40:21', 4, '500.00', 'close', NULL, NULL, NULL, NULL, NULL, NULL, '', '2019-01-09 16:41:52', NULL, 4, NULL, NULL, 1, 1, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00'),
(18, '2019-01-09 16:43:07', 4, '500.00', 'close', NULL, NULL, NULL, NULL, NULL, NULL, '', '2019-01-10 15:23:17', NULL, 4, NULL, NULL, 0, 0, '0.00', '3205.00', '650.00', '0.00', '50.00', '0.00', '0.00', '0.00', '0.00', '225.40', '150.00', '1.00', '0.00', '2.00', '0.00', '2.00', '0.00', '0.00', '0.00', '0.00', '1.00', '0.00', '825.40', '500.00'),
(19, '2019-01-10 15:23:51', 4, '550.00', 'close', NULL, NULL, NULL, NULL, NULL, NULL, '', '2019-01-10 15:31:15', NULL, 4, NULL, NULL, 0, 0, '0.00', '2270.00', '1440.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '400.00', '320.00', '0.00', '1.00', '1.00', '1.00', '5.00', '1.00', '0.00', '1.00', '0.00', '0.00', '0.00', '1270.00', '1120.00'),
(20, '2019-01-11 15:51:25', 4, '0.00', 'close', NULL, NULL, NULL, NULL, NULL, NULL, '', '2019-01-11 19:33:25', NULL, 4, NULL, NULL, 0, 0, '0.00', '2000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00'),
(21, '2019-01-11 19:33:43', 4, '500.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.7',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', '', '', '', '', NULL, 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 0, NULL, 0, 'default', 0, 0, 0, 0, 42, '1234', 'purchase_code', 'envato_username', '3.4.7', 0, 0, 0, '', 1, NULL, 'null', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Predeterminado');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `second_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`) VALUES
(11, 'A011', 'MOUSE USB, MYO WIRED', 1, '1.0000', '160.0000', '0.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '4978.0000', NULL, 1, NULL, NULL, '', NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, 0, 0, ''),
(12, 'PR-12', 'Product 12', 1, '90.0000', '100.0000', '20.0000', 'no_image.png', 1, NULL, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', '0.0000', NULL, 1, NULL, NULL, 'code129', NULL, NULL, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 'Pro 12');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_variants`
--

INSERT INTO `sma_product_variants` (`id`, `product_id`, `name`, `cost`, `price`, `quantity`) VALUES
(1, 12, 'Red', NULL, NULL, NULL),
(2, 12, 'Blue', NULL, NULL, NULL),
(3, 12, 'Black', NULL, NULL, NULL),
(4, 12, 'White', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`) VALUES
(3, 'COMPRA2018/0002', '2018-12-31 07:51:00', 2, 'Suplidor General', 1, '', '5000.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '5000.0000', '0.0000', 'received', 'pending', 4, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(3, NULL, NULL, 1, 'test', 'Test-1', NULL, '20.0000', '-6.0000', 1, '0.0000', NULL, '0', NULL, NULL, NULL, '-120.0000', '0.0000', '2018-12-29', 'received', '20.0000', '20.0000', '-6.0000', NULL, NULL, 1, 'U001', '-6.0000', NULL, NULL, NULL, NULL),
(4, NULL, NULL, 31, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(5, NULL, NULL, 306, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(6, NULL, NULL, 33, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(7, NULL, NULL, 215, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(8, NULL, NULL, 387, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(9, NULL, NULL, 48, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(10, NULL, NULL, 296, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(11, NULL, NULL, 377, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(12, NULL, NULL, 46, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(13, NULL, NULL, 157, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(14, NULL, NULL, 150, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(15, NULL, NULL, 65, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(16, NULL, NULL, 241, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(17, NULL, NULL, 24, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(18, NULL, NULL, 23, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(19, NULL, NULL, 59, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '1.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(20, NULL, NULL, 140, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(21, NULL, NULL, 304, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(22, NULL, NULL, 409, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(23, 3, NULL, 11, 'A011', 'MOUSE USB, MYO WIRED', NULL, '1.0000', '5000.0000', 1, '0.0000', 0, '', '0', '0.0000', NULL, '5000.0000', '4978.0000', '2018-12-31', 'received', '1.0000', '1.0000', '5000.0000', NULL, NULL, 1, 'U001', '5000.0000', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_returns`
--

INSERT INTO `sma_returns` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `created_by`, `updated_by`, `updated_at`, `total_items`, `paid`, `surcharge`, `attachment`, `hash`, `cgst`, `sgst`, `igst`) VALUES
(1, '0000-00-00 00:00:00', 'DEV2018/0001', 1, 'Cliente Contado', 3, 'AndresPC Soft', 1, '', '', '65.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '65.0000', 3, NULL, NULL, 1, '0.0000', '0.0000', NULL, 'db26014702bc7034eaf57320ef0a98269b2a4db336923c8abc43288514d4ca07', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_return_items`
--

INSERT INTO `sma_return_items` (`id`, `return_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, 1, 4294967295, 'A033', 'ADAPTADOR DE IDE A SATA, GENERICO', 'manual', 0, '65.0000', '65.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '65.0000', '', '65.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL,
  `tax_seq` int(7) DEFAULT NULL,
  `tax_type` varchar(20) DEFAULT NULL,
  `tax_prefix` varchar(20) DEFAULT NULL,
  `tax_sl` varchar(50) DEFAULT NULL,
  `tax_security` varchar(100) DEFAULT NULL,
  `tax_seq_limit` int(7) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `order_type` varchar(100) NOT NULL,
  `hierarchy_status` varchar(150) NOT NULL,
  `order_type_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0mt7r4o8eo2jk88eg0v7ljep235niofs', '::1', 1572171084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323137303930383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313730343136223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1lmtvqjus4u2df9c4tsumgpcgskb9v2h', '::1', 1572170066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136393836323b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313635393135223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('1mma8o0f3nj13o88a4o58ho8jsjsh0jq', '::1', 1572162451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136323231313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313534373935223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1rg8ibi9305f7gm6v89u9ti2e357hlai', '::1', 1572161124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136303930383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313534373935223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('36kjfltdsrn5d0srodbmoef93t4rvhhk', '::1', 1572170635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323137303633353b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('4i4re1toadidp93a1k257f9tn646uag1', '::1', 1572159060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135383736343b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('66281evq4p4iilv0sl5bok9c5ljcnioe', '::1', 1572161519, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136313232353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313534373935223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6cs45g59q9grdtrktkgk11iufkma0ep0', '::1', 1572157676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135373431303b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('6e0pt94304lm9obpb0ufb936pctt0i5p', '::1', 1572167105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136363834373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313635383531223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6gg3kasq5lgfotpmkc97esr7jsgs7bvt', '::1', 1572160293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136303232373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313534373935223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6jsa3ltajrkn7pgup0mhofgfj4ig0dq9', '::1', 1572171585, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323137313532383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313730343136223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('742tnccpgla3mqiq77nv74em11j7kc19', '::1', 1572167678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136373438333b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313635393135223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('7if1pg3cnul6phg4ocnq5ted80aclr9k', '::1', 1572161691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136313533353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313534373935223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8lg225okfogq4n0mggtvr78futdq83o0', '::1', 1572170635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323137303633353b),
('8msm3a3dubk82023oq140bs94u6iqb2i', '::1', 1572170548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323137303434383b6964656e746974797c733a353a22776562646f223b757365726e616d657c733a353a22776562646f223b656d61696c7c733a32373a226d696775656c5f636170656c6c616e40686f746d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353436313336343633223b6c6173745f69707c733a31353a223134382e3235352e3133382e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('944ir3rtf8mskg0hfh24crjmsb9ek27a', '::1', 1572163171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136323936313b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313632373035223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b7761726e696e677c4e3b),
('bvrdkq6foujjgurkfapkvtk8an3tfm36', '::1', 1572159415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135393431353b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b656c46696e6465724361636865737c613a323a7b733a383a225f6f7074734d4435223b733a33323a223166646431396461373965326535346235646436386237313730393839366138223b733a333a226c315f223b613a313a7b733a383a22726f6f7473746174223b613a313a7b733a33323a226134373333363262393762626232313362363333323332303037393637346131223b613a303a7b7d7d7d7d656c46696e6465724e6574566f6c756d65737c613a303a7b7d),
('c4h4aetm0ekremhmjq2ocrel7mec97ld', '::1', 1572166783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136363439363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313635383531223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cqtp5dmh09mvqhfjfbb1koloob1mbc1l', '::1', 1572156732, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135363435343b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('eb41208caqq9cmj7r9v2id3jbgsj3mp9', '::1', 1572162182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136313838313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313534373935223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fef14t3oae2nioo81qs4obkt7a8hj76b', '::1', 1572157065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135363736363b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('fl9gun9mbvbe2rrl2128u0rjrmib9sqt', '::1', 1572158734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135383434353b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('gbjjrll0ad318r7uo3p46ub804k3abi4', '::1', 1572165221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136353232313b),
('h1eqfbkts8rto581g3fgsfeeo4jdpdoj', '::1', 1572163741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136333732313b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313632393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('h79ov6nkmaf1beo215p876qnjorbfu9e', '::1', 1572165303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136353330333b),
('iqmgr6brbgqj6s9p77lrvdq3jih3c30c', '::1', 1572157347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135373036383b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('jbmr31aaborrpk6075c4q31kq0b45qqm', '::1', 1572163720, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136333431393b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313632393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('khc9lqhja4r7dq7heqclmg07asjr0ajo', '::1', 1572160901, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136303630313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313534373935223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('m224l53c8b6sl1lho2mlm123869v8j8d', '::1', 1572158031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135373735363b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('n2pviuo5bg3l5dlmnv8tlguqqtrrms4b', '::1', 1572170335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323137303333353b),
('n5tj8rf29hlnusb2hvsp2ji5sac3c4vs', '::1', 1572165364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136353334393b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313633343237223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('of4ahfg5ptuv3ml2o43k38eg4eid6mlf', '::1', 1572168418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136383231323b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313635393135223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('phhfrpsd3u2g306nlhvq8lov5s9m0o35', '::1', 1572165956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136353837383b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313635333539223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('pp18ckl37hdpgvtsqaske7p3mo5nv2ra', '::1', 1572159413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135393131333b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b656c46696e6465724361636865737c613a323a7b733a383a225f6f7074734d4435223b733a33323a223166646431396461373965326535346235646436386237313730393839366138223b733a333a226c315f223b613a313a7b733a383a22726f6f7473746174223b613a313a7b733a33323a226134373333363262393762626232313362363333323332303037393637346131223b613a303a7b7d7d7d7d656c46696e6465724e6574566f6c756d65737c613a303a7b7d),
('rp43den4dqt86rcq2ajgu4p62tru3uhl', '::1', 1572167857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136373835313b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313635393135223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('t9ulbu4ht4ue5mhh8l4ohvbmnbkc2ctr', '::1', 1572167446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323136373136333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313635383531223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('tsfr30c7c03p75unafqoaic9f7vifn8s', '::1', 1572171320, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323137313232303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313730343136223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('v58f95qmtlhlh1j1sj70iceqfvib1hgc', '::1', 1572158390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537323135383039353b6964656e746974797c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365726e616d657c733a31313a22636f64656c6f7665723133223b656d61696c7c733a32313a22636f64656c6f766572313340676d61696c2e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353732313535303934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c733a313a2238223b73686f775f636f73747c4e3b73686f775f70726963657c4e3b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`) VALUES
(1, '260_x_801.jpg', '260_x_801.jpg', 'PG', 'english', 1, 2, 'RD', 1, 10, '3.4.7', 1, 5, 'VENTA', 'COT', 'COMPRA', 'TR', 'DO', 'PAGO', 'DEV', 'Ret', 'GASTO', 0, 'default', 1, 1, 1, 1, 1, 1, 1, 1, 0, 'America/Santo_Domingo', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', '12345678', '25', NULL, NULL, 1, 'info@grupowebdo.com', 0, 4, 1, 0, 1, 1, 1, 0, 2, 2, '.', ',', 0, 3, 'mike1989', '02923204-110b-4702-b8d4-7e1e610de168', 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 'codelover138@gmail.com', 0, '-', 0, 1, 1, 'POP', 90, '', 0, 0, 'AN', 'mpdf');

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'Sin Impuesto', 'SI', '0.0000', '2'),
(3, 'ITB @18%', 'ITEBIS', '18.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'pc', 'pc', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(2, 0x3a3a31, 0x3134382e3235352e3133382e313632, 'webdo', '2bac549b8161f07af2ffa4d67f5ef43e1c102f6e', NULL, 'miguel_capellan@hotmail.com', NULL, NULL, NULL, NULL, 1546058811, 1572170458, 1, 'Miguel', 'Capellan', 'WebDo', '8297538303', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0),
(4, 0x3a3a31, 0x3134382e3235352e3133382e313632, 'owner', '36911a652dc8dcd6d1fc08fda7e049b0adc0a0a8', NULL, 'owner@tecdiary.com', NULL, NULL, NULL, NULL, 1546136801, 1572170931, 1, 'owner', 'owner', 'WebDo', '0000000', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0),
(5, 0x3a3a31, 0x3a3a31, 'codelover13', '7d4a9f71622dbecec2a3dc033c0f92b12cf8c53d', NULL, 'codelover13@gmail.com', NULL, NULL, NULL, NULL, 1571898781, 1572170110, 1, 'Test', '01', 'NO SE', '1111111111', NULL, 'male', 4, NULL, NULL, 8, NULL, NULL, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3130332e39352e39392e313835, 'owner@tecdiary.com', '2018-09-28 13:38:12'),
(2, 1, NULL, 0x3138362e312e3132312e323034, 'owner@tecdiary.com', '2018-09-28 13:40:56'),
(3, 1, NULL, 0x32372e3134372e3133332e313035, 'owner@tecdiary.com', '2018-09-29 04:28:36'),
(4, 1, NULL, 0x32372e3134372e3133332e313035, 'owner@tecdiary.com', '2018-09-29 07:00:25'),
(5, 1, NULL, 0x3130332e39352e39392e313835, 'owner@tecdiary.com', '2018-09-29 13:19:23'),
(6, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-10-01 06:10:06'),
(7, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-10-31 04:47:07'),
(8, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-11-13 11:07:53'),
(9, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-11-24 03:39:57'),
(10, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-11-25 02:53:02'),
(11, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-11-27 03:05:33'),
(12, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-11-27 10:39:56'),
(13, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-11-29 02:55:44'),
(14, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-01 03:22:49'),
(15, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-01 07:53:25'),
(16, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-03 03:09:06'),
(17, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-04 03:50:53'),
(18, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-06 03:20:31'),
(19, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-08 03:51:23'),
(20, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-10 03:59:21'),
(21, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-11 04:31:38'),
(22, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-11 07:01:14'),
(23, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-12 03:38:23'),
(24, 1, NULL, 0x3134382e3235352e3133382e313632, 'owner', '2018-12-29 03:43:30'),
(25, 1, NULL, 0x3134382e3235352e3133382e313632, 'owner', '2018-12-29 03:56:32'),
(26, 2, NULL, 0x3134382e3235352e3133382e313632, 'miguel_capellan@hotmail.com', '2018-12-29 04:47:10'),
(27, 2, NULL, 0x3134382e3235352e3133382e313632, 'miguel_capellan@hotmail.com', '2018-12-29 05:22:45'),
(28, 3, NULL, 0x3137392e35322e3131332e3539, 'andres', '2018-12-29 13:54:12'),
(29, 3, NULL, 0x3139302e3130332e3138302e323531, 'Andres', '2018-12-29 14:19:01'),
(30, 3, NULL, 0x3139302e3130332e3138302e323531, 'andres', '2018-12-29 14:20:35'),
(31, 3, NULL, 0x3139302e3130332e3138302e323531, 'Andres', '2018-12-29 14:37:42'),
(32, 3, NULL, 0x3139302e3130332e3138302e323531, 'Andres', '2018-12-29 17:45:07'),
(33, 3, NULL, 0x3139302e3130332e3138302e323531, 'andres', '2018-12-29 17:51:16'),
(34, 2, NULL, 0x3134382e3235352e3133382e313632, 'miguel_capellan@hotmail.com', '2018-12-30 00:20:16'),
(35, 2, NULL, 0x3134382e3235352e3133382e313632, 'miguel_capellan@hotmail.com', '2018-12-30 02:21:03'),
(36, 4, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-12-31 07:43:41'),
(37, 4, NULL, 0x3230322e38362e3231382e313534, 'owner@tecdiary.com', '2018-12-31 11:06:24'),
(38, 4, NULL, 0x3134382e3235352e3135312e3131, 'owner', '2018-12-31 12:44:34'),
(39, 4, NULL, 0x3230322e38362e3231382e313534, 'owner@tecdiary.com', '2019-01-01 10:02:08'),
(40, 4, NULL, 0x3137392e35322e3131332e3535, 'owner', '2019-01-01 13:46:02'),
(41, 4, NULL, 0x3130332e3139372e3230362e36, 'owner@tecdiary.com', '2019-01-01 14:03:00'),
(42, 4, NULL, 0x3130332e3139372e3230362e36, 'owner@tecdiary.com', '2019-01-01 14:08:47'),
(43, 4, NULL, 0x3230322e38362e3231382e313534, 'owner@tecdiary.com', '2019-01-02 11:18:29'),
(44, 4, NULL, 0x3134382e3235352e39342e323436, 'owner', '2019-01-02 15:32:39'),
(45, 4, NULL, 0x3230322e38362e3231382e313534, 'owner@tecdiary.com', '2019-01-03 11:06:27'),
(46, 4, NULL, 0x3134382e3235352e3131322e313238, 'owner', '2019-01-06 17:37:13'),
(47, 4, NULL, 0x3134382e3235352e3131322e313238, 'owner', '2019-01-07 00:23:01'),
(48, 4, NULL, 0x3139302e39342e31382e313132, 'owner', '2019-01-07 16:13:10'),
(49, 4, NULL, 0x3230322e38362e3231382e313534, 'owner@tecdiary.com', '2019-01-08 09:00:06'),
(50, 4, NULL, 0x3134382e3235352e3130302e3136, 'owner', '2019-01-08 15:32:39'),
(51, 4, NULL, 0x3137392e35322e38372e313939, 'owner', '2019-01-08 21:03:55'),
(52, 4, NULL, 0x3134382e3235352e3131322e313238, 'owner', '2019-01-09 04:10:38'),
(53, 4, NULL, 0x3230322e38362e3231382e313534, 'owner@tecdiary.com', '2019-01-09 04:14:14'),
(54, 4, NULL, 0x3134382e3235352e3131322e313238, 'owner', '2019-01-09 13:22:07'),
(55, 4, NULL, 0x3130332e3139372e3230362e36, 'owner@tecdiary.com', '2019-01-09 13:48:37'),
(56, 4, NULL, 0x3137392e35322e38372e313939, 'owner', '2019-01-09 18:49:04'),
(57, 4, NULL, 0x3230322e38362e3231382e313534, 'owner@tecdiary.com', '2019-01-10 04:01:10'),
(58, 4, NULL, 0x3230322e38362e3231382e313534, 'owner@tecdiary.com', '2019-01-10 04:14:09'),
(59, 4, NULL, 0x3134382e3235352e3131322e313238, 'owner', '2019-01-10 04:23:56'),
(60, 4, NULL, 0x37372e3131312e3234352e3335, 'owner@tecdiary.com', '2019-01-10 04:24:49'),
(61, 4, NULL, 0x32372e3134372e3134352e3330, 'owner@tecdiary.com', '2019-01-10 04:27:34'),
(62, 4, NULL, 0x32372e3134372e3134352e3330, 'owner@tecdiary.com', '2019-01-10 04:34:10'),
(63, 4, NULL, 0x3230322e38362e3231382e313534, 'owner@tecdiary.com', '2019-01-10 11:46:14'),
(64, 4, NULL, 0x3134382e3235352e3131322e313238, 'owner', '2019-01-10 13:20:10'),
(65, 4, NULL, 0x3137392e35322e38372e313939, 'owner', '2019-01-10 14:21:44'),
(66, 4, NULL, 0x3137392e35322e38372e313939, 'owner', '2019-01-10 14:29:10'),
(67, 4, NULL, 0x3137392e35322e38372e313939, 'owner', '2019-01-10 14:44:48'),
(68, 4, NULL, 0x3137392e35322e38372e313939, 'owner', '2019-01-11 14:51:10'),
(69, 4, NULL, 0x3137392e35322e38372e313939, 'owner', '2019-01-11 18:31:30'),
(70, 4, NULL, 0x3134382e3235352e3133382e323231, 'owner', '2019-01-12 13:42:36'),
(71, 4, NULL, 0x3137392e35322e38372e313939, 'owner', '2019-01-12 18:17:08'),
(72, 4, NULL, 0x3137392e35322e38372e313939, 'owner', '2019-01-13 13:54:25'),
(73, 4, NULL, 0x3134382e3235352e3133382e323231, 'owner', '2019-01-14 01:51:24'),
(74, 4, NULL, 0x3a3a31, 'owner', '2019-03-06 05:40:50'),
(75, 4, NULL, 0x3a3a31, 'owner', '2019-03-19 08:22:47'),
(76, 4, NULL, 0x3a3a31, 'owner', '2019-03-19 08:33:43'),
(77, 4, NULL, 0x3a3a31, 'owner', '2019-04-25 03:35:43'),
(78, 4, NULL, 0x3a3a31, 'owner', '2019-04-25 07:27:42'),
(79, 4, NULL, 0x3a3a31, 'owner', '2019-04-28 07:22:18'),
(80, 4, NULL, 0x3a3a31, 'owner', '2019-10-24 06:30:51'),
(81, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-24 06:33:49'),
(82, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-24 06:35:26'),
(83, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-24 07:02:17'),
(84, 4, NULL, 0x3a3a31, 'owner', '2019-10-24 07:06:54'),
(85, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-24 07:09:34'),
(86, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-24 07:14:10'),
(87, 5, NULL, 0x3a3a31, 'codelover13', '2019-10-24 07:16:39'),
(88, 4, NULL, 0x3a3a31, 'owner', '2019-10-24 07:28:59'),
(89, 5, NULL, 0x3a3a31, 'codelover13', '2019-10-24 07:33:12'),
(90, 5, NULL, 0x3a3a31, 'codelover13', '2019-10-24 07:34:09'),
(91, 5, NULL, 0x3a3a31, 'codelover13', '2019-10-24 07:37:47'),
(92, 4, NULL, 0x3a3a31, 'owner', '2019-10-24 07:38:36'),
(93, 5, NULL, 0x3a3a31, 'codelover13', '2019-10-24 07:56:50'),
(94, 4, NULL, 0x3a3a31, 'owner', '2019-10-24 07:57:31'),
(95, 5, NULL, 0x3a3a31, 'codelover13', '2019-10-24 09:06:28'),
(96, 5, NULL, 0x3a3a31, 'codelover13', '2019-10-24 09:07:02'),
(97, 5, NULL, 0x3a3a31, 'codelover13', '2019-10-24 09:08:06'),
(98, 4, NULL, 0x3a3a31, 'owner', '2019-10-24 09:08:19'),
(99, 4, NULL, 0x3a3a31, 'owner', '2019-10-26 06:22:43'),
(100, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 04:20:47'),
(101, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 05:38:37'),
(102, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 05:39:55'),
(103, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 05:43:58'),
(104, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 05:44:54'),
(105, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 05:46:12'),
(106, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 07:10:34'),
(107, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 07:51:45'),
(108, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 07:54:04'),
(109, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 07:56:10'),
(110, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 08:03:47'),
(111, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 08:33:31'),
(112, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 08:35:59'),
(113, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 08:44:12'),
(114, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 08:45:15'),
(115, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 08:55:03'),
(116, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 09:11:36'),
(117, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 09:54:12'),
(118, 5, NULL, 0x3a3a31, 'codelover13@gmail.com', '2019-10-27 09:55:10'),
(119, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 09:58:58'),
(120, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 10:00:17'),
(121, 2, NULL, 0x3a3a31, 'webdo', '2019-10-27 10:00:59'),
(122, 4, NULL, 0x3a3a31, 'owner', '2019-10-27 10:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'AL001', 'Almacen Principal', '<p>Direccion</p>', NULL, '012345678', 'almacen@grupowebdo.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 11, 1, '4978.0000', NULL, '0.8333');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_approver_list`
--
ALTER TABLE `sma_approver_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `approver_seq` (`approver_seq`,`category_id`,`approver_next_seq`,`approver_seq_name`);

--
-- Indexes for table `sma_approve_details`
--
ALTER TABLE `sma_approve_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_order_types`
--
ALTER TABLE `sma_order_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_approver_list`
--
ALTER TABLE `sma_approver_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2448;
--
-- AUTO_INCREMENT for table `sma_approve_details`
--
ALTER TABLE `sma_approve_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;
--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_order_types`
--
ALTER TABLE `sma_order_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
