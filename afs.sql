CREATE SCHEMA `je`;

CREATE TABLE `je`.`scentity` (
  `id` int PRIMARY KEY,
  `merchant_name` varchar(30),
  `mobile` varchar(15),
  `email` varchar(50),
  `address` varchar(40),
  `created at` timestamp,
  `status` int,
  `due_ammount` float,
  `gst` varchar(255),
  `created_by` varchar(10)
);

CREATE TABLE `je`.`sdentity` (
  `id` int PRIMARY KEY,
  `merchant_name` varchar(30),
  `mobile` varchar(15),
  `email` varchar(50),
  `address` varchar(40),
  `created at` timestamp,
  `status` int,
  `due_ammount` float,
  `gst` varchar(17),
  `created_by` varchar(10)
);

CREATE TABLE `je`.`product_main` (
  `id` int PRIMARY KEY,
  `name` varchar(50),
  `created at` timestamp,
  `unit` varchar(255),
  `current_stock` float,
  `status` int
);

CREATE TABLE `je`.`product_sub` (
  `id` int PRIMARY KEY,
  `main_prod` varchar(5),
  `name` varchar(50),
  `created at` timestamp,
  `current_stock` float,
  `status` int
);

CREATE TABLE `je`.`product_entry_main` (
  `id` int PRIMARY KEY,
  `chalan_no` varchar(255),
  `from` varchar(20),
  `recived_date` date,
  `delivary_mode` varchar(10),
  `created at` timestamp,
  `total_amount` float,
  `remarks` varchar(100),
  `created_by` varchar(10)
);

CREATE TABLE `je`.`product_entry_history` (
  `id` int,
  `entry_id` int,
  `created at` timestamp,
  `product` varchar(20),
  `qty` float,
  `amount` float,
  `remarks` varchar(100),
  PRIMARY KEY (`id`, `entry_id`)
);

CREATE TABLE `je`.`secuence` (
  `id` int PRIMARY KEY,
  `type` varchar(20),
  `head` varchar(20),
  `sno` varchar(20),
  `remarks` varchar(40),
  `status` bool,
  `created at` timestamp
);

CREATE TABLE `je`.`appinfo` (
  `id` int,
  `name` varchar(50),
  `logo` varchar(100),
  `address` varchar(100),
  `gstno` varchar(17)
);

CREATE TABLE `je`.`appuser` (
  `id` int,
  `name` varchar(50),
  `mobile` varchar(15),
  `email` varchar(50),
  `password` varchar(255),
  `role` varchar(2),
  `sign` varchar(100),
  `status` varchar(1),
  `is_logedin` varchar(1),
  `lastlogin_time` timestamp,
  `lastlogin_from` varchar(30)
);

CREATE TABLE `je`.`product_delivary_main` (
  `id` int PRIMARY KEY,
  `chalan_no` varchar(50),
  `to` varchar(20),
  `delivary_date` date,
  `delivary_mode` varchar(10),
  `created_at` timestamp,
  `total_amount` float,
  `remarks` varchar(100),
  `created_by` varchar(10)
);

CREATE TABLE `je`.`product_delivery_history` (
  `id` int,
  `entry_id` int,
  `created_at` timestamp,
  `product` varchar(10),
  `qty` float,
  `amount` float,
  `remarks` varchar(100),
  PRIMARY KEY (`id`, `entry_id`)
);

CREATE TABLE `je`.`sc_payment_entry` (
  `id` int PRIMARY KEY,
  `scid` int,
  `created_at` timestamp,
  `amount` float,
  `mode` varchar(10),
  `hisamount` float,
  `curamount` float,
  `remarks` varchar(100),
  `created_by` varchar(10)
);

CREATE TABLE `je`.`sd_payment_entry` (
  `id` int PRIMARY KEY,
  `sdid` int,
  `created_at` timestamp,
  `amount` float,
  `mode` varchar(10),
  `hisamount` float,
  `curamount` float,
  `remarks` varchar(100),
  `created_by` varchar(10)
);

CREATE TABLE `je`.`invoice_gst_main` (
  `id` int PRIMARY KEY,
  `invoice_no` varchar(30),
  `to` varchar(20),
  `gst` varbinary,
  `inovice_date` date,
  `gross_amount` float,
  `cgst_amount` float,
  `ssgst_amount` float,
  `total_amount` float,
  `remarks` varchar(100),
  `created_at` timestamp,
  `created_by` varchar(10),
  `paid` bool
);

CREATE TABLE `je`.`invoice_gst_history` (
  `id` int,
  `entry_id` int,
  `created at` timestamp,
  `product` varchar(255),
  `qty` float,
  `HSN` varchar(8),
  `cgst` varchar(10),
  `sgst` varchar(10),
  `gross_amount` float,
  `total_ammount` float,
  `remarks` varchar(100),
  PRIMARY KEY (`id`, `entry_id`)
);

CREATE TABLE `je`.`leadger_sc` (
  `id` int PRIMARY KEY,
  `name` varchar(50),
  `date` date,
  `type` varchar(20),
  `current_amomount` float,
  `truns_ammount` float,
  `mode` varchar(10),
  `remarks` varchar(50),
  `refno` varchar(50),
  `created at` timestamp,
  `created by` varchar(20)
);

CREATE TABLE `je`.`leadger_sd` (
  `id` int PRIMARY KEY,
  `name` varchar(50),
  `date` date,
  `type` varchar(20),
  `current_amomount` float,
  `truns_ammount` float,
  `mode` varchar(10),
  `remarks` varchar(50),
  `refno` varchar(50),
  `created at` timestamp,
  `created by` varchar(20)
);

ALTER TABLE `je`.`product_main` ADD FOREIGN KEY (`id`) REFERENCES `je`.`product_sub` (`main_prod`);

ALTER TABLE `je`.`product_entry_history` ADD FOREIGN KEY (`product`) REFERENCES `je`.`product_sub` (`id`);

ALTER TABLE `je`.`product_entry_main` ADD FOREIGN KEY (`id`) REFERENCES `je`.`product_entry_history` (`entry_id`);

ALTER TABLE `je`.`product_entry_main` ADD FOREIGN KEY (`from`) REFERENCES `je`.`scentity` (`id`);

ALTER TABLE `je`.`product_entry_main` ADD FOREIGN KEY (`created_by`) REFERENCES `je`.`appuser` (`id`);

ALTER TABLE `je`.`product_delivary_main` ADD FOREIGN KEY (`to`) REFERENCES `je`.`sdentity` (`id`);

ALTER TABLE `je`.`product_delivery_history` ADD FOREIGN KEY (`entry_id`) REFERENCES `je`.`product_delivary_main` (`id`);

ALTER TABLE `je`.`scentity` ADD FOREIGN KEY (`id`) REFERENCES `je`.`sc_payment_entry` (`scid`);

ALTER TABLE `je`.`sdentity` ADD FOREIGN KEY (`id`) REFERENCES `je`.`sd_payment_entry` (`id`);

ALTER TABLE `je`.`appuser` ADD FOREIGN KEY (`id`) REFERENCES `je`.`sd_payment_entry` (`created_by`);

ALTER TABLE `je`.`appuser` ADD FOREIGN KEY (`id`) REFERENCES `je`.`sc_payment_entry` (`created_by`);

ALTER TABLE `je`.`appuser` ADD FOREIGN KEY (`id`) REFERENCES `je`.`scentity` (`created_by`);

ALTER TABLE `je`.`appuser` ADD FOREIGN KEY (`id`) REFERENCES `je`.`sdentity` (`created_by`);

ALTER TABLE `je`.`invoice_gst_history` ADD FOREIGN KEY (`entry_id`) REFERENCES `je`.`invoice_gst_main` (`id`);

ALTER TABLE `je`.`appuser` ADD FOREIGN KEY (`id`) REFERENCES `je`.`invoice_gst_main` (`created_by`);

ALTER TABLE `je`.`sd_payment_entry` ADD FOREIGN KEY (`id`) REFERENCES `je`.`invoice_gst_main` (`to`);

ALTER TABLE `je`.`product_sub` ADD FOREIGN KEY (`id`) REFERENCES `je`.`invoice_gst_history` (`product`);

ALTER TABLE `je`.`sc_payment_entry` ADD FOREIGN KEY (`id`) REFERENCES `je`.`leadger_sc` (`name`);

ALTER TABLE `je`.`sd_payment_entry` ADD FOREIGN KEY (`id`) REFERENCES `je`.`leadger_sd` (`name`);

ALTER TABLE `je`.`appuser` ADD FOREIGN KEY (`id`) REFERENCES `je`.`leadger_sd` (`created by`);

ALTER TABLE `je`.`appuser` ADD FOREIGN KEY (`id`) REFERENCES `je`.`leadger_sc` (`created by`);
