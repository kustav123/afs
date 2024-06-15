
CREATE TABLE `afs`.`scentity` (
  `id` varchar(20) PRIMARY KEY,
  `merchant_name` varchar(30),
  `mobile` varchar(15),
  `email` varchar(50),
  `address` varchar(40),
  `created_at` timestamp DEFAULT (now()),
  `status` int,
  `due_ammount` float,
  `gst` varchar(255),
  `uid` varchar(10)
);

CREATE TABLE `afs`.`sdentity` (
  `id` varchar(20) PRIMARY KEY,
  `merchant_name` varchar(30),
  `mobile` varchar(15),
  `email` varchar(50),
  `address` varchar(40),
  `created_at` timestamp DEFAULT (now()),
  `status` int,
  `due_ammount` float,
  `gst` varchar(17),
  `uid` varchar(10)
);

CREATE TABLE `afs`.`product_main` (
  `id` varchar(20) PRIMARY KEY,
  `name` varchar(50),
  `created_at` timestamp DEFAULT (now()),
  `unit` varchar(255),
  `current_stock` float,
  `status` int
);

CREATE TABLE `afs`.`product_sub` (
  `id` varchar(20) PRIMARY KEY,
  `main_prod` varchar(20),
  `name` varchar(50),
  `created_at` timestamp DEFAULT (now()),
  `current_stock` float,
  `status` int
);

CREATE TABLE `afs`.`product_entry_main` (
  `id` varchar(20) PRIMARY KEY,
  `chalan_no` varchar(255),
  `from` varchar(20),
  `recived_date` date,
  `delivary_mode` varchar(10),
  `created_at` timestamp DEFAULT (now()),
  `total_amount` float,
  `remarks` varchar(100),
  `uid` varchar(10)
);

CREATE TABLE `afs`.`product_entry_history` (
  `id` varchar(20),
  `entry_id` varchar(20),
  `created_at` timestamp DEFAULT (now()),
  `product` varchar(20),
  `qty` float,
  `amount` float,
  `remarks` varchar(100),
  PRIMARY KEY (`id`, `entry_id`)
);

CREATE TABLE `afs`.`secuence` (
  `id` varchar(20) PRIMARY KEY,
  `type` varchar(20),
  `head` varchar(20),
  `sno` varchar(20),
  `remarks` varchar(40),
  `status` bool,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `afs`.`appinfo` (
  `id` varchar(20),
  `name` varchar(50),
  `logo` varchar(100),
  `address` varchar(100),
  `gstno` varchar(17)
);

CREATE TABLE `afs`.`appuser` (
  `uid` varchar(20) PRIMARY KEY,
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

CREATE TABLE `afs`.`product_delivary_main` (
  `id` varchar(20) PRIMARY KEY,
  `chalan_no` varchar(50),
  `to` varchar(20),
  `delivary_date` date,
  `delivary_mode` varchar(10),
  `created_at` timestamp DEFAULT (now()),
  `total_amount` float,
  `remarks` varchar(100),
  `uid` varchar(10)
);

CREATE TABLE `afs`.`product_delivery_history` (
  `id` varchar(20),
  `entry_id` varchar(20),
  `created_at` timestamp,
  `product` varchar(10),
  `qty` float,
  `amount` float,
  `remarks` varchar(100),
  PRIMARY KEY (`id`, `entry_id`)
);

CREATE TABLE `afs`.`sc_payment_entry` (
  `id` varchar(20) PRIMARY KEY,
  `scid` varchar(20),
  `created_at` timestamp,
  `amount` float,
  `mode` varchar(10),
  `hisamount` float,
  `curamount` float,
  `remarks` varchar(100),
  `uid` varchar(10)
);

CREATE TABLE `afs`.`sd_payment_entry` (
  `id` varchar(20) PRIMARY KEY,
  `sdid` varchar(20),
  `created_at` timestamp,
  `amount` float,
  `mode` varchar(10),
  `hisamount` float,
  `curamount` float,
  `remarks` varchar(100),
  `uid` varchar(10)
);

CREATE TABLE `afs`.`invoice_gst_main` (
  `id` varchar(20) PRIMARY KEY,
  `invoice_no` varchar(30),
  `to` varchar(20),
  `gst` varchar(20),
  `inovice_date` date,
  `gross_amount` float,
  `cgst_amount` float,
  `ssgst_amount` float,
  `total_amount` float,
  `remarks` varchar(100),
  `created_at` timestamp DEFAULT (now()),
  `uid` varchar(10),
  `paid` bool
);

CREATE TABLE `afs`.`invoice_gst_history` (
  `id` varchar(20),
  `entry_id` varchar(20),
  `created_at` timestamp DEFAULT (now()),
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

CREATE TABLE `afs`.`leadger_sc` (
  `id` varchar(20) PRIMARY KEY,
  `scid` varchar(20),
  `date` date,
  `type` varchar(20),
  `current_amomount` float,
  `truns_ammount` float,
  `mode` varchar(10),
  `remarks` varchar(50),
  `refno` varchar(50),
  `created_at` timestamp DEFAULT (now()),
  `created by` varchar(20)
);

CREATE TABLE `afs`.`leadger_sd` (
  `id` varchar(20) PRIMARY KEY,
  `sdid` varchar(20),
  `date` date,
  `type` varchar(20),
  `current_amomount` float,
  `truns_ammount` float,
  `mode` varchar(10),
  `remarks` varchar(50),
  `refno` varchar(50),
  `created_at` timestamp DEFAULT (now()),
  `created by` varchar(20)
);

ALTER TABLE `afs`.`scentity` ADD FOREIGN KEY (`uid`) REFERENCES `afs`.`appuser` (`uid`);

ALTER TABLE `afs`.`sdentity` ADD FOREIGN KEY (`uid`) REFERENCES `afs`.`appuser` (`uid`);

ALTER TABLE `afs`.`product_entry_main` ADD FOREIGN KEY (`uid`) REFERENCES `afs`.`appuser` (`uid`);

ALTER TABLE `afs`.`sd_payment_entry` ADD FOREIGN KEY (`uid`) REFERENCES `afs`.`appuser` (`uid`);

ALTER TABLE `afs`.`product_delivary_main` ADD FOREIGN KEY (`uid`) REFERENCES `afs`.`appuser` (`uid`);

ALTER TABLE `afs`.`sc_payment_entry` ADD FOREIGN KEY (`uid`) REFERENCES `afs`.`appuser` (`uid`);

ALTER TABLE `afs`.`invoice_gst_main` ADD FOREIGN KEY (`uid`) REFERENCES `afs`.`appuser` (`uid`);

ALTER TABLE `afs`.`leadger_sc` ADD FOREIGN KEY (`created by`) REFERENCES `afs`.`appuser` (`uid`);

ALTER TABLE `afs`.`leadger_sd` ADD FOREIGN KEY (`created by`) REFERENCES `afs`.`appuser` (`uid`);

ALTER TABLE `afs`.`product_entry_main` ADD FOREIGN KEY (`from`) REFERENCES `afs`.`scentity` (`id`);

ALTER TABLE `afs`.`product_entry_history` ADD FOREIGN KEY (`entry_id`) REFERENCES `afs`.`product_entry_main` (`id`);

ALTER TABLE `afs`.`product_delivery_history` ADD FOREIGN KEY (`entry_id`) REFERENCES `afs`.`product_delivary_main` (`id`);

ALTER TABLE `afs`.`product_delivary_main` ADD FOREIGN KEY (`to`) REFERENCES `afs`.`sdentity` (`id`);

ALTER TABLE `afs`.`leadger_sc` ADD FOREIGN KEY (`scid`) REFERENCES `afs`.`scentity` (`id`);

ALTER TABLE `afs`.`leadger_sd` ADD FOREIGN KEY (`sdid`) REFERENCES `afs`.`sdentity` (`id`);

ALTER TABLE `afs`.`sc_payment_entry` ADD FOREIGN KEY (`scid`) REFERENCES `afs`.`scentity` (`id`);

ALTER TABLE `afs`.`sd_payment_entry` ADD FOREIGN KEY (`sdid`) REFERENCES `afs`.`sdentity` (`id`);

ALTER TABLE `afs`.`product_sub` ADD FOREIGN KEY (`main_prod`) REFERENCES `afs`.`product_main` (`id`);

ALTER TABLE `afs`.`product_entry_history` ADD FOREIGN KEY (`product`) REFERENCES `afs`.`product_sub` (`id`);

ALTER TABLE `afs`.`invoice_gst_history` ADD FOREIGN KEY (`entry_id`) REFERENCES `afs`.`invoice_gst_main` (`id`);

ALTER TABLE `afs`.`invoice_gst_history` ADD FOREIGN KEY (`product`) REFERENCES `afs`.`product_sub` (`id`);

ALTER TABLE `afs`.`product_delivery_history` ADD FOREIGN KEY (`product`) REFERENCES `afs`.`product_sub` (`id`);

ALTER TABLE `afs`.`invoice_gst_main` ADD FOREIGN KEY (`to`) REFERENCES `afs`.`sdentity` (`id`);
