-- Load raw CSV into a staging table
-- Considering 3 medallion Architecture, this table acts as a bronze layer to get our raw data in the database.


CREATE TABLE staging_transactions (
    transaction_id VARCHAR(10),
    account_id VARCHAR(10),
    transaction_amount DECIMAL(15,2),
    transaction_date DATETIME,
    transaction_type VARCHAR(10),
    location VARCHAR(100),
    device_id VARCHAR(10),
    ip_address VARCHAR(45),
    merchant_id VARCHAR(10),
    channel VARCHAR(10),
    customer_age SMALLINT,
    customer_occupation VARCHAR(50),
    transaction_duration INT,
    login_attempts SMALLINT,
    account_balance DECIMAL(15,2),
    previous_transaction_date DATETIME
);


-- Load with LOAD DATA INFILE 


LOAD DATA LOCAL INFILE '/Users/nirmitkhurana/Desktop/Nirmit Docs/Projects/AML-Transaction-Intelligence-System/dataset/bank_transactions_data_2.csv'
INTO TABLE staging_transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- checking full data import
select 
	COUNT(*) as number_of_rows 
from staging_transactions st 
