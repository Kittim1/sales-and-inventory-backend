-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2025 at 10:06 PM
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
-- Database: `harrah_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) DEFAULT NULL,
  `cat_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`cat_id`, `cat_name`, `cat_description`) VALUES
(1, 'Electronics', 'Electronic devices and gadgets'),
(2, 'Groceries', 'Daily household groceries'),
(3, 'Clothing', 'Fashion and apparel');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `cus_id` int(11) NOT NULL,
  `cus_fname` varchar(50) DEFAULT NULL,
  `cus_lastname` varchar(50) DEFAULT NULL,
  `cus_phonenumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`cus_id`, `cus_fname`, `cus_lastname`, `cus_phonenumber`) VALUES
(1, 'John', 'Doe', '09123456789'),
(2, 'Jane', 'Smith', '09234567890'),
(3, 'Alice', 'Johnson', '09345678901');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployee`
--

CREATE TABLE `tblemployee` (
  `emp_id` int(11) NOT NULL,
  `emp_fname` varchar(50) DEFAULT NULL,
  `emp_lname` varchar(50) DEFAULT NULL,
  `emp_gender` varchar(50) DEFAULT NULL,
  `emp_email` varchar(50) DEFAULT NULL,
  `emp_phonenumber` varchar(50) DEFAULT NULL,
  `emp_job_id` int(11) DEFAULT NULL,
  `emp_hired_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `emp_location_id` int(11) DEFAULT NULL,
  `emp_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblemployee`
--

INSERT INTO `tblemployee` (`emp_id`, `emp_fname`, `emp_lname`, `emp_gender`, `emp_email`, `emp_phonenumber`, `emp_job_id`, `emp_hired_date`, `emp_location_id`, `emp_role`) VALUES
(1, 'kittim', 'ignalig', 'male', 'kita.ignalig.coc@phinmaed.com', '09912954239', 1, '2025-02-16 05:57:32', 1, 1),
(2, 'Jane', 'Smith', 'Female', 'jane.smith@example.com', '09234567890', 2, '2025-02-17 00:26:00', 1, 2),
(3, 'Alice', 'Johnson', 'Female', 'alice.johnson@example.com', '09345678901', 3, '2025-02-17 00:26:00', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tblinventory`
--

CREATE TABLE `tblinventory` (
  `inv_id` int(11) NOT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `stock_in` int(11) DEFAULT 0,
  `stock_out` int(11) DEFAULT 0,
  `current_stock` int(11) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinventory`
--

INSERT INTO `tblinventory` (`inv_id`, `prod_id`, `stock_in`, `stock_out`, `current_stock`, `last_updated`) VALUES
(1, 1, 100, 10, 90, '2025-02-17 00:26:00'),
(2, 2, 200, 20, 180, '2025-02-17 00:26:00'),
(3, 3, 150, 15, 135, '2025-02-17 00:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbljob`
--

CREATE TABLE `tbljob` (
  `job_id` int(11) NOT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `job_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbljob`
--

INSERT INTO `tbljob` (`job_id`, `job_title`, `job_description`) VALUES
(1, 'Manager', 'Ga manage kay manager man sya'),
(2, 'Cashier', 'Cashier sya'),
(3, 'Staff', 'Staff sya'),
(4, 'Gardener', 'Gardener Sya'),
(5, 'Farm Maintenance', 'Farm Maintenance sya');

-- --------------------------------------------------------

--
-- Table structure for table `tbllocation`
--

CREATE TABLE `tbllocation` (
  `loc_id` int(11) NOT NULL,
  `loc_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbllocation`
--

INSERT INTO `tbllocation` (`loc_id`, `loc_name`) VALUES
(1, 'Lumbia,CDO'),
(2, 'Downtown, CDO'),
(3, 'Uptown, CDO');

-- --------------------------------------------------------

--
-- Table structure for table `tblmanager`
--

CREATE TABLE `tblmanager` (
  `mng_id` int(11) NOT NULL,
  `mng_fname` varchar(50) DEFAULT NULL,
  `mng_lname` varchar(50) DEFAULT NULL,
  `mng_location_id` int(11) DEFAULT NULL,
  `mng_email` varchar(50) DEFAULT NULL,
  `mng_phonenumber` varchar(50) DEFAULT NULL,
  `mng_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblproducts`
--

CREATE TABLE `tblproducts` (
  `prod_id` int(11) NOT NULL,
  `prod_code` int(11) DEFAULT NULL,
  `prod_name` varchar(50) DEFAULT NULL,
  `prod_description` varchar(50) DEFAULT NULL,
  `prod_qty_stock` int(11) DEFAULT NULL,
  `prod_onhand` int(11) DEFAULT NULL,
  `prod_price` int(11) DEFAULT NULL,
  `prod_category_id` int(11) DEFAULT NULL,
  `prod_supplier_id` int(11) DEFAULT NULL,
  `prod_date_stockin` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblproducts`
--

INSERT INTO `tblproducts` (`prod_id`, `prod_code`, `prod_name`, `prod_description`, `prod_qty_stock`, `prod_onhand`, `prod_price`, `prod_category_id`, `prod_supplier_id`, `prod_date_stockin`) VALUES
(1, 101, 'Smartphone', 'Latest model smartphone', 100, 90, 20000, 1, 1, '2025-02-17 00:26:00'),
(2, 102, 'Rice', 'Premium quality rice', 200, 180, 50, 2, 2, '2025-02-17 00:26:00'),
(3, 103, 'T-Shirt', 'Cotton t-shirt', 150, 135, 300, 3, 3, '2025-02-17 00:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct_pricing`
--

CREATE TABLE `tblproduct_pricing` (
  `price_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `old_price` decimal(10,2) NOT NULL,
  `new_price` decimal(10,2) NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblproduct_pricing`
--

INSERT INTO `tblproduct_pricing` (`price_id`, `prod_id`, `old_price`, `new_price`, `change_date`) VALUES
(1, 1, 19000.00, 20000.00, '2025-02-17 00:26:00'),
(2, 2, 45.00, 50.00, '2025-02-17 00:26:00'),
(3, 3, 250.00, 300.00, '2025-02-17 00:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblroles`
--

CREATE TABLE `tblroles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `role_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblroles`
--

INSERT INTO `tblroles` (`role_id`, `role_name`, `role_description`) VALUES
(1, 'Admin', 'Has full access to the system'),
(2, 'Manager', 'Manages employees and transactions'),
(3, 'Cashier', 'Handles sales and transactions'),
(4, 'Staff', 'General employee role');

-- --------------------------------------------------------

--
-- Table structure for table `tblsales`
--

CREATE TABLE `tblsales` (
  `sales_id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `sales_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsales`
--

INSERT INTO `tblsales` (`sales_id`, `trans_id`, `total_amount`, `sales_date`) VALUES
(1, 1, 20000.00, '2025-02-17 00:26:00'),
(2, 2, 100.00, '2025-02-17 00:26:00'),
(3, 3, 600.00, '2025-02-17 00:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblsupplier`
--

CREATE TABLE `tblsupplier` (
  `supp_id` int(11) NOT NULL,
  `supp_name` varchar(50) DEFAULT NULL,
  `supp_location_id` int(11) DEFAULT NULL,
  `supp_phonenumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsupplier`
--

INSERT INTO `tblsupplier` (`supp_id`, `supp_name`, `supp_location_id`, `supp_phonenumber`) VALUES
(1, 'Tech Supplies Inc.', 1, '09876543210'),
(2, 'Fresh Grocers Ltd.', 2, '09765432109'),
(3, 'Fashion Trends Co.', 3, '09654321098');

-- --------------------------------------------------------

--
-- Table structure for table `tbltransaction`
--

CREATE TABLE `tbltransaction` (
  `trans_id` int(11) NOT NULL,
  `trans_cus_id` int(11) DEFAULT NULL,
  `trans_name` varchar(50) DEFAULT NULL,
  `trans_num_of_items` int(11) DEFAULT NULL,
  `trans_total_quantity` int(11) DEFAULT NULL,
  `trans_subtotal` int(11) DEFAULT NULL,
  `trans_grandtotal` int(11) DEFAULT NULL,
  `trans_cash` int(11) DEFAULT NULL,
  `trans_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbltransaction`
--

INSERT INTO `tbltransaction` (`trans_id`, `trans_cus_id`, `trans_name`, `trans_num_of_items`, `trans_total_quantity`, `trans_subtotal`, `trans_grandtotal`, `trans_cash`, `trans_date`) VALUES
(1, 1, 'John Doe', 2, 2, 20000, 20000, 20000, '2025-02-17 00:26:00'),
(2, 2, 'Jane Smith', 3, 3, 150, 150, 150, '2025-02-17 00:26:00'),
(3, 3, 'Alice Johnson', 1, 1, 300, 300, 300, '2025-02-17 00:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbltransaction_details`
--

CREATE TABLE `tbltransaction_details` (
  `trans_det_id` int(11) NOT NULL,
  `trans_det_products` int(11) DEFAULT NULL,
  `trans_det_total_quantity` int(11) DEFAULT NULL,
  `trans_det_price` int(11) DEFAULT NULL,
  `trans_det_employee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbltransaction_details`
--

INSERT INTO `tbltransaction_details` (`trans_det_id`, `trans_det_products`, `trans_det_total_quantity`, `trans_det_price`, `trans_det_employee`) VALUES
(1, 1, 1, 20000, 1),
(2, 2, 2, 50, 2),
(3, 3, 1, 300, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `user_id` int(11) NOT NULL,
  `user_emp_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`user_id`, `user_emp_id`, `user_name`, `user_password`, `user_role`) VALUES
(1, 1, 'kittim1', '12345', 1),
(4, NULL, 'kittim2', '$2y$10$VYPRTku.f6b0Cmy9XC15y.NhmY6sngSmZe5gmO40K65dplNSzU0JS', 1),
(5, NULL, 'tims', '$2y$10$d4AMeLODbItpLehF6DiSn.f4dKTsg96QZKba1l/vt2yz0i6xg7KuS', 2),
(6, NULL, 'admin', '$2y$10$L.hibyP3y5fTj1EoCZHmWOsq5M0xrutH.5ja0VELFGnThUaEc6SDG', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `emp_job_id` (`emp_job_id`),
  ADD KEY `emp_location_id` (`emp_location_id`),
  ADD KEY `emp_role` (`emp_role`);

--
-- Indexes for table `tblinventory`
--
ALTER TABLE `tblinventory`
  ADD PRIMARY KEY (`inv_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `tbljob`
--
ALTER TABLE `tbljob`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `tbllocation`
--
ALTER TABLE `tbllocation`
  ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `tblmanager`
--
ALTER TABLE `tblmanager`
  ADD PRIMARY KEY (`mng_id`),
  ADD KEY `mng_location_id` (`mng_location_id`),
  ADD KEY `mng_role` (`mng_role`);

--
-- Indexes for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `prod_category_id` (`prod_category_id`),
  ADD KEY `prod_supplier_id` (`prod_supplier_id`);

--
-- Indexes for table `tblproduct_pricing`
--
ALTER TABLE `tblproduct_pricing`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `tblroles`
--
ALTER TABLE `tblroles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tblsales`
--
ALTER TABLE `tblsales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `trans_id` (`trans_id`);

--
-- Indexes for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD PRIMARY KEY (`supp_id`),
  ADD KEY `supp_location_id` (`supp_location_id`);

--
-- Indexes for table `tbltransaction`
--
ALTER TABLE `tbltransaction`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_cus_id` (`trans_cus_id`);

--
-- Indexes for table `tbltransaction_details`
--
ALTER TABLE `tbltransaction_details`
  ADD PRIMARY KEY (`trans_det_id`),
  ADD KEY `trans_det_products` (`trans_det_products`),
  ADD KEY `trans_det_total_quantity` (`trans_det_total_quantity`),
  ADD KEY `trans_det_price` (`trans_det_price`),
  ADD KEY `trans_det_employee` (`trans_det_employee`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_emp_id` (`user_emp_id`),
  ADD KEY `user_role` (`user_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblemployee`
--
ALTER TABLE `tblemployee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblinventory`
--
ALTER TABLE `tblinventory`
  MODIFY `inv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbljob`
--
ALTER TABLE `tbljob`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbllocation`
--
ALTER TABLE `tbllocation`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblmanager`
--
ALTER TABLE `tblmanager`
  MODIFY `mng_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblproduct_pricing`
--
ALTER TABLE `tblproduct_pricing`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblroles`
--
ALTER TABLE `tblroles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblsales`
--
ALTER TABLE `tblsales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  MODIFY `supp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbltransaction`
--
ALTER TABLE `tbltransaction`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbltransaction_details`
--
ALTER TABLE `tbltransaction_details`
  MODIFY `trans_det_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD CONSTRAINT `tblemployee_ibfk_1` FOREIGN KEY (`emp_job_id`) REFERENCES `tbljob` (`job_id`),
  ADD CONSTRAINT `tblemployee_ibfk_2` FOREIGN KEY (`emp_location_id`) REFERENCES `tbllocation` (`loc_id`),
  ADD CONSTRAINT `tblemployee_ibfk_3` FOREIGN KEY (`emp_role`) REFERENCES `tblroles` (`role_id`);

--
-- Constraints for table `tblinventory`
--
ALTER TABLE `tblinventory`
  ADD CONSTRAINT `tblinventory_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `tblproducts` (`prod_id`);

--
-- Constraints for table `tblmanager`
--
ALTER TABLE `tblmanager`
  ADD CONSTRAINT `tblmanager_ibfk_1` FOREIGN KEY (`mng_location_id`) REFERENCES `tbllocation` (`loc_id`),
  ADD CONSTRAINT `tblmanager_ibfk_2` FOREIGN KEY (`mng_role`) REFERENCES `tblroles` (`role_id`);

--
-- Constraints for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD CONSTRAINT `tblproducts_ibfk_1` FOREIGN KEY (`prod_category_id`) REFERENCES `tblcategory` (`cat_id`),
  ADD CONSTRAINT `tblproducts_ibfk_2` FOREIGN KEY (`prod_supplier_id`) REFERENCES `tblsupplier` (`supp_id`);

--
-- Constraints for table `tblproduct_pricing`
--
ALTER TABLE `tblproduct_pricing`
  ADD CONSTRAINT `tblproduct_pricing_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `tblproducts` (`prod_id`) ON DELETE CASCADE;

--
-- Constraints for table `tblsales`
--
ALTER TABLE `tblsales`
  ADD CONSTRAINT `tblsales_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `tbltransaction` (`trans_id`) ON DELETE CASCADE;

--
-- Constraints for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD CONSTRAINT `tblsupplier_ibfk_1` FOREIGN KEY (`supp_location_id`) REFERENCES `tbllocation` (`loc_id`);

--
-- Constraints for table `tbltransaction`
--
ALTER TABLE `tbltransaction`
  ADD CONSTRAINT `tbltransaction_ibfk_1` FOREIGN KEY (`trans_cus_id`) REFERENCES `tblcustomer` (`cus_id`);

--
-- Constraints for table `tbltransaction_details`
--
ALTER TABLE `tbltransaction_details`
  ADD CONSTRAINT `tbltransaction_details_ibfk_1` FOREIGN KEY (`trans_det_products`) REFERENCES `tblproducts` (`prod_id`),
  ADD CONSTRAINT `tbltransaction_details_ibfk_2` FOREIGN KEY (`trans_det_total_quantity`) REFERENCES `tbltransaction` (`trans_id`),
  ADD CONSTRAINT `tbltransaction_details_ibfk_4` FOREIGN KEY (`trans_det_employee`) REFERENCES `tblemployee` (`emp_id`);

--
-- Constraints for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD CONSTRAINT `tblusers_ibfk_1` FOREIGN KEY (`user_emp_id`) REFERENCES `tblemployee` (`emp_id`),
  ADD CONSTRAINT `tblusers_ibfk_2` FOREIGN KEY (`user_role`) REFERENCES `tblroles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
