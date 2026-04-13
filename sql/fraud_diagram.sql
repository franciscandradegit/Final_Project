CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` INTEGER NOT NULL,
	`housing_status_id` INTEGER NOT NULL,
	`employment_status_id` INTEGER NOT NULL,
	`customer_age` INTEGER NOT NULL,
	`income` FLOAT NOT NULL,
	`has_other_cards` INTEGER NOT NULL,
	`prev_address_months_count` INTEGER NOT NULL,
	`current_address_months_count` INTEGER NOT NULL,
	PRIMARY KEY(`customer_id`)
);


CREATE TABLE IF NOT EXISTS `housing_status` (
	`housing_status_id` INTEGER NOT NULL,
	`housing_status` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`housing_status_id`)
);


CREATE TABLE IF NOT EXISTS `employment_status` (
	`employment_status_id` INTEGER NOT NULL,
	`employment_status` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`employment_status_id`)
);


CREATE TABLE IF NOT EXISTS `transaction` (
	`transaction_id` INTEGER NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`session_id` INTEGER NOT NULL,
	`payment_type_id` INTEGER NOT NULL,
	`fraud_bool` INTEGER NOT NULL,
	`intended_balcon_amount` FLOAT NOT NULL,
	`proposed_credit_limit` FLOAT NOT NULL,
	`credit_risk_score` INTEGER NOT NULL,
	`foreign_request` INTEGER NOT NULL,
	`bank_branch_count_8w` INTEGER NOT NULL,
	PRIMARY KEY(`transaction_id`)
);


CREATE TABLE IF NOT EXISTS `payment_type` (
	`payment_type_id` INTEGER NOT NULL,
	`payment_type` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`payment_type_id`)
);


CREATE TABLE IF NOT EXISTS `session` (
	`session_id` INTEGER NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`device_email_flag_id` INTEGER NOT NULL,
	`device_os_id` INTEGER NOT NULL,
	`keep_alive_session` INTEGER NOT NULL,
	`session_length_in_minutes` FLOAT NOT NULL,
	PRIMARY KEY(`session_id`)
);


CREATE TABLE IF NOT EXISTS `device_email_flag` (
	`device_email_flag_id` INTEGER NOT NULL,
	`device_email_flag` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`device_email_flag_id`)
);


CREATE TABLE IF NOT EXISTS `device_os` (
	`device_os_id` INTEGER NOT NULL,
	`device_os` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`device_os_id`)
);


CREATE TABLE IF NOT EXISTS `identity` (
	`identity_id` INTEGER NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`date_of_birth_distinct_emails_4w` INTEGER NOT NULL,
	`phone_mobile_valid` INTEGER NOT NULL,
	`phone_home_valid` INTEGER NOT NULL,
	`email_is_free` INTEGER NOT NULL,
	`name_email_similarity` FLOAT NOT NULL,
	PRIMARY KEY(`identity_id`)
);


ALTER TABLE `customer`
ADD FOREIGN KEY(`housing_status_id`) REFERENCES `housing_status`(`housing_status_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `customer`
ADD FOREIGN KEY(`employment_status_id`) REFERENCES `employment_status`(`employment_status_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `identity`
ADD FOREIGN KEY(`customer_id`) REFERENCES `customer`(`customer_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `transaction`
ADD FOREIGN KEY(`payment_type_id`) REFERENCES `payment_type`(`payment_type_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `session`
ADD FOREIGN KEY(`device_email_flag_id`) REFERENCES `device_email_flag`(`device_email_flag_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `session`
ADD FOREIGN KEY(`device_os_id`) REFERENCES `device_os`(`device_os_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `session`
ADD FOREIGN KEY(`customer_id`) REFERENCES `customer`(`customer_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `transaction`
ADD FOREIGN KEY(`customer_id`) REFERENCES `customer`(`customer_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `transaction`
ADD FOREIGN KEY(`session_id`) REFERENCES `session`(`session_id`)
ON UPDATE CASCADE ON DELETE CASCADE;