-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2021 at 06:24 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_house`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE `action` (
  `actionID` int(11) NOT NULL,
  `actionName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `action`
--

INSERT INTO `action` (`actionID`, `actionName`) VALUES
(1, 'add'),
(2, 'sale'),
(3, 'lost'),
(4, 'update');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchID` int(11) NOT NULL,
  `branchName` varchar(50) NOT NULL,
  `latitude` varchar(200) NOT NULL,
  `longitude` varchar(200) NOT NULL,
  `branchStatusID` int(11) NOT NULL,
  `shopID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `branch_status`
--

CREATE TABLE `branch_status` (
  `branchStatusID` int(11) NOT NULL,
  `branchStatusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch_status`
--

INSERT INTO `branch_status` (`branchStatusID`, `branchStatusName`) VALUES
(1, 'main'),
(2, 'branch');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `cus_name` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `cus_Addr` text COLLATE utf8_unicode_ci NOT NULL,
  `cus_tel` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manager_status`
--

CREATE TABLE `manager_status` (
  `managerStatusID` int(11) NOT NULL,
  `managerStatusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager_status`
--

INSERT INTO `manager_status` (`managerStatusID`, `managerStatusName`) VALUES
(1, 'owner'),
(2, 'admin'),
(3, 'staff'),
(4, 'sss');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `userID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ruleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`userID`, `username`, `password`, `fname`, `lname`, `email`, `ruleID`) VALUES
(1, 'admin', '25d55ad283aa400af464c76d713c07ad', 'admin', '', '', 1),
(9, 'komon', '1234', 'Komon', 'Wanje', '', 3),
(10, 'sub', '1234', 'sub', 'ratchada', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `shopID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `orderDate`, `address`, `tel`, `shopID`, `userID`) VALUES
(1, '2021-01-30', '2021-01-30', '990539172', 1, 1),
(2, '2021-01-30', '2021-01-30', '0990539172', 1, 1),
(3, '2021-01-30', '2021-01-30', '0990539172', 1, 1),
(4, '2021-01-30', '2021-01-30', '0990539172', 1, 1),
(5, '2021-01-30', '2021-01-30', '0990539172', 1, 1),
(6, '2021-01-30', '2021-01-30', '0990539172', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `ordersDetailID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`ordersDetailID`, `orderID`, `productID`, `qty`) VALUES
(1, 4, 1, 50),
(2, 4, 2, 10),
(3, 5, 1, 50),
(4, 5, 2, 10),
(5, 6, 1, 50),
(6, 6, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productDetail` text NOT NULL,
  `productPrice` float NOT NULL,
  `productAmount` int(11) NOT NULL,
  `productImage` varchar(200) NOT NULL,
  `branchID` int(11) NOT NULL,
  `productStatusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productDetail`, `productPrice`, `productAmount`, `productImage`, `branchID`, `productStatusID`) VALUES
(1, 'dd', '1', 1, 1, '1', 1, 1),
(3, 'pp', '11', 50, 0, '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_status`
--

CREATE TABLE `product_status` (
  `productStatusID` int(11) NOT NULL,
  `productStatusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_status`
--

INSERT INTO `product_status` (`productStatusID`, `productStatusName`) VALUES
(1, 'active'),
(2, 'sold out'),
(3, 'Recive'),
(4, 'Move');

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE `rule` (
  `ruleID` int(11) NOT NULL,
  `ruleName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`ruleID`, `ruleName`) VALUES
(1, 'admin'),
(2, 'superadmin'),
(3, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `shopID` int(11) NOT NULL,
  `shopName` varchar(50) NOT NULL,
  `shopImange` varchar(255) NOT NULL,
  `memberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`shopID`, `shopName`, `shopImange`, `memberID`) VALUES
(7, '7-11', 'image/seven.jpg', 1),
(8, 'lowson', 'image/lowson.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_manager`
--

CREATE TABLE `shop_manager` (
  `managerID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `branchID` int(11) NOT NULL,
  `managerStatusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock_log`
--

CREATE TABLE `stock_log` (
  `slID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `dateLog` varchar(100) NOT NULL,
  `productAmount` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `brachID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_log`
--

INSERT INTO `stock_log` (`slID`, `productID`, `dateLog`, `productAmount`, `userID`, `brachID`) VALUES
(2, 0, '120356', 500, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock_movement`
--

CREATE TABLE `stock_movement` (
  `moveID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `branchID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `actionID` int(11) NOT NULL,
  `moveDate` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `branchTo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`actionID`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchID`);

--
-- Indexes for table `branch_status`
--
ALTER TABLE `branch_status`
  ADD PRIMARY KEY (`branchStatusID`);

--
-- Indexes for table `manager_status`
--
ALTER TABLE `manager_status`
  ADD PRIMARY KEY (`managerStatusID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`ordersDetailID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `product_status`
--
ALTER TABLE `product_status`
  ADD PRIMARY KEY (`productStatusID`);

--
-- Indexes for table `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`ruleID`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`shopID`);

--
-- Indexes for table `shop_manager`
--
ALTER TABLE `shop_manager`
  ADD PRIMARY KEY (`managerID`);

--
-- Indexes for table `stock_log`
--
ALTER TABLE `stock_log`
  ADD PRIMARY KEY (`slID`);

--
-- Indexes for table `stock_movement`
--
ALTER TABLE `stock_movement`
  ADD PRIMARY KEY (`moveID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action`
--
ALTER TABLE `action`
  MODIFY `actionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branch_status`
--
ALTER TABLE `branch_status`
  MODIFY `branchStatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `manager_status`
--
ALTER TABLE `manager_status`
  MODIFY `managerStatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `ordersDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_status`
--
ALTER TABLE `product_status`
  MODIFY `productStatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rule`
--
ALTER TABLE `rule`
  MODIFY `ruleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `shopID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_manager`
--
ALTER TABLE `shop_manager`
  MODIFY `managerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_log`
--
ALTER TABLE `stock_log`
  MODIFY `slID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_movement`
--
ALTER TABLE `stock_movement`
  MODIFY `moveID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
