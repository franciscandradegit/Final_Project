CREATE TABLE IF NOT EXISTS `transaction` (
	`transaction_id` INTEGER NOT NULL AUTO_INCREMENT,
	`customer_id` INTEGER NOT NULL,
	`identity_id` INTEGER NOT NULL,
	`session_id` INTEGER NOT NULL,
	`fraud_bool` INTEGER NOT NULL,
	`credit_risk_score` INTEGER NOT NULL,
	`proposed_credit_limit` FLOAT NOT NULL,
	`intended_balcon_amount` FLOAT NOT NULL,
	`payment_type` VARCHAR(255) NOT NULL,
	`foreign_request` INTEGER NOT NULL,
	`bank_branch_count_8w` INTEGER NOT NULL,
	PRIMARY KEY(`transaction_id`)
);


CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` INTEGER NOT NULL AUTO_INCREMENT,
	`income` FLOAT NOT NULL,
	`customer_age` INTEGER NOT NULL,
	`prev_address_months_count` INTEGER NOT NULL,
	`current_address_months_count` INTEGER NOT NULL,
	`housing_status` VARCHAR(255) NOT NULL,
	`employment_status` VARCHAR(255) NOT NULL,
	`has_other_cards` INTEGER NOT NULL,
	PRIMARY KEY(`customer_id`)
);


CREATE TABLE IF NOT EXISTS `session` (
	`session_id` INTEGER NOT NULL AUTO_INCREMENT,
	`device_os` VARCHAR(255) NOT NULL,
	`source` VARCHAR(255) NOT NULL,
	`session_length_in_minutes` FLOAT NOT NULL,
	`keep_alive_session` INTEGER NOT NULL,
	`device_email_flag` INTEGER NOT NULL,
	PRIMARY KEY(`session_id`)
);


CREATE TABLE IF NOT EXISTS `identity` (
	`identity_id` INTEGER NOT NULL AUTO_INCREMENT,
	`name_email_similarity` FLOAT NOT NULL,
	`email_is_free` INTEGER NOT NULL,
	`phone_home_valid` INTEGER NOT NULL,
	`phone_mobile_valid` INTEGER NOT NULL,
	`date_of_birth_distinct_emails_4w` INTEGER NOT NULL,
	PRIMARY KEY(`identity_id`)
);


ALTER TABLE `transaction`
ADD FOREIGN KEY(`customer_id`) REFERENCES `customer`(`customer_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `transaction`
ADD FOREIGN KEY(`identity_id`) REFERENCES `identity`(`identity_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `transaction`
ADD FOREIGN KEY(`session_id`) REFERENCES `session`(`session_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;