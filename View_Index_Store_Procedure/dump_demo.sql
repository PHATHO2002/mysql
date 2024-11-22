-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2024 at 04:23 AM
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
-- Database: `demo`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addProduct` (IN `code` VARCHAR(50), IN `name` VARCHAR(100), IN `price` VARCHAR(100), IN `amount` INT(11), IN `des` VARCHAR(100), IN `status` VARCHAR(20))   BEGIN
    INSERT INTO products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES (code, name, price, amount,des,status);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteProduct` (IN `deleId` INT(11))   begin
	DELETE FROM products WHERE id=deleId;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllProducts` ()   BEGIN
    SELECT * FROM products;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProductsByName` (IN `product_name` VARCHAR(255))   BEGIN
    SELECT * FROM products WHERE productName = product_name;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProduct` (IN `updateId` INT(11), IN `code` VARCHAR(50), IN `name` VARCHAR(100), IN `price` VARCHAR(100), IN `amount` INT(11), IN `des` VARCHAR(100), IN `status` VARCHAR(20))   BEGIN
 UPDATE products
    SET productCode=code,
        productName = name,
        productPrice = price,
        productAmount = amount,
        productDescription = des,
        productStatus = status
    WHERE id = updateId;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productCode` varchar(50) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` varchar(100) NOT NULL,
  `productAmount` int(11) NOT NULL,
  `productDescription` varchar(100) DEFAULT NULL,
  `productStatus` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`, `id`) VALUES
('pd01', 'addd', '99', 123, 'adasd', 'ok', 1),
('pd02', 'bddd', '7631', 321, NULL, NULL, 4),
('pd03', 'cddd', '6789', 123, NULL, NULL, 5),
('pd04', 'adad', '1234', 12, 'đá', 'not', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productCode` (`productCode`),
  ADD KEY `idx_name_price` (`productName`,`productPrice`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
