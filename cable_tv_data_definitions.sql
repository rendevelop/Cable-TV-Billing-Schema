
/* TABLES */
CREATE TABLE Customer (
  customer_id CHAR(4) NOT NULL,
  CONSTRAINT CUSTOMERIDS
    CHECK (REGEXP_LIKE(customer_id, 'C[0-9][0-9][0-9]')),
  first_name VARCHAR2(35),
  middle_name VARCHAR2(35),
  last_name VARCHAR2(35),
  street VARCHAR2(50),
  city VARCHAR2(35),
  state CHAR(2),
  country VARCHAR2(50),
  zipcode CHAR(5),
  phone_number CHAR(10),
  PRIMARY KEY (customer_id)
);

CREATE TABLE Service (
  service_id CHAR(4) NOT NULL,
  CONSTRAINT SERVICEIDS
    CHECK (REGEXP_LIKE(service_id, 'S[0-9][0-9][0-9]')),
  service_name VARCHAR2(255),
  service_type VARCHAR2(8) NOT NULL,
  CONSTRAINT SERVICETYPES
    CHECK (service_type IN ('Standard', 'Special')),
  service_details VARCHAR2(255),
  price NUMBER(10, 2) DEFAULT 0.00, /* per month */
  term_length NUMBER(4), /* In months */
  PRIMARY KEY(service_id)
);

CREATE TABLE ServiceAccount (
  account_id CHAR(4) NOT NULL,
  CONSTRAINT ACCOUNTIDS
    CHECK (REGEXP_LIKE(account_id, 'A[0-9][0-9][0-9]')),
  customer_id CHAR(4) NOT NULL,
  method_of_payment VARCHAR2(6) NOT NULL,
  CONSTRAINT SA_METHODSOFPAYMENT
    CHECK (method_of_payment IN ('CASH', 'CREDIT', 'DEBIT')),
  service_id CHAR(4) NOT NULL,
  date_subscribed DATE,
  date_terminated DATE DEFAULT NULL,
  PRIMARY KEY (account_id),
  FOREIGN KEY (customer_id) REFERENCES Customer,
  FOREIGN KEY (service_id) REFERENCES Service
);

/* Ideally, if stored at all, would be encrypted. */
CREATE TABLE PaymentInfo (
  customer_id CHAR(4) NOT NULL,
  method_of_payment VARCHAR2(6) NOT NULL,
  CONSTRAINT PI_METHODSOFPAYMENT
    CHECK (method_of_payment IN ('CASH', 'CREDIT', 'DEBIT')),
  card_issuer VARCHAR2(30),
  first_name VARCHAR2(35),
  middle_name VARCHAR2(35),
  last_name VARCHAR2(35),
  street VARCHAR2(50),
  city VARCHAR2(35),
  state CHAR(2),
  country VARCHAR2(50),
  zipcode VARCHAR2(10),
  credit_card_no VARCHAR2(16), /* normally encrypted if stored */
  security_code VARCHAR2(5),
  expiration_date DATE,
  PRIMARY KEY (customer_id, method_of_payment),
  FOREIGN KEY (customer_id) REFERENCES Customer
);

CREATE TABLE AccountBill (
  bill_id CHAR(4) NOT NULL,
  CONSTRAINT BILLIDS
    CHECK (REGEXP_LIKE(bill_id, 'B[0-9][0-9][0-9]')),
  isDueFlag NUMBER(1) DEFAULT 0,
  date_of_billing DATE,
  date_due DATE,
  customer_id CHAR(4) NOT NULL,
  account_id CHAR(4) NOT NULL,
  total_amount_due NUMBER(10, 2) DEFAULT 0.00,
  total_amount_payed NUMBER(10, 2) DEFAULT 0.00,
  outstanding_balance AS (total_amount_due - total_amount_payed),
  PRIMARY KEY (bill_id),
  FOREIGN KEY (customer_id) REFERENCES Customer,
  FOREIGN KEY (account_id) REFERENCES ServiceAccount
);

CREATE TABLE Payment (
  bill_id CHAR(4) NOT NULL,
  date_of_payment DATE NOT NULL,
  method_of_payment VARCHAR2(6) NOT NULL,
  CONSTRAINT P_METHODSOFPAYMENT
    CHECK (method_of_payment IN ('CASH', 'CREDIT', 'DEBIT')),
  amount_payed NUMBER(10, 2),
  customer_id CHAR(4) NOT NULL,
  PRIMARY KEY (bill_id, date_of_payment, method_of_payment),
  FOREIGN KEY (bill_id) REFERENCES AccountBill,
  FOREIGN KEY (customer_id) REFERENCES Customer
);

CREATE TABLE Fee (
  fee_id CHAR(4) NOT NULL,
  CONSTRAINT FEEIDS
    CHECK (REGEXP_LIKE(fee_id, 'F[0-9][0-9][0-9]')),
  fee_name VARCHAR2(255),
  fee_type VARCHAR2(20) NOT NULL,
  CONSTRAINT FEETYPES
    CHECK (fee_type IN ('RepairFee', 'InstallationFee', 'LateFee',
    'HardwareRentalFee', 'PayPerView', 'Other')),
  fee_details VARCHAR2(255),
  fee_amount NUMBER(10, 2),
  service_id CHAR(4),
  PRIMARY KEY (fee_id),
  FOREIGN KEY (service_id) REFERENCES Service
);

CREATE TABLE AccountFee (
  accfee_id CHAR(5) NOT NULL,
  CONSTRAINT ACCFEEIDS
    CHECK (REGEXP_LIKE(accfee_id,'AF[0-9][0-9][0-9]')),
  date_fee_incurred DATE,
  fee_id CHAR(4) NOT NULL,
  bill_id CHAR(4) NOT NULL,
  PRIMARY KEY (accfee_id),
  FOREIGN KEY (fee_id) REFERENCES Fee,
  FOREIGN KEY (bill_id) REFERENCES AccountBill
);

CREATE TABLE Credit (
  credit_id CHAR(5) NOT NULL,
  CONSTRAINT CREDITIDS
    CHECK (REGEXP_LIKE(credit_id, 'CR[0-9][0-9][0-9]')),
  credit_amount NUMBER(10, 2),
  date_granted DATE,
  credit_type VARCHAR2(30) NOT NULL,
  CONSTRAINT CREDITTYPES
    CHECK (credit_type IN ('Promotion', 'ServiceInterruption', 'Other')),
  reason_granted VARCHAR2(255),
  comment_on_experience VARCHAR2(255),
  account_id CHAR(4) NOT NULL,
  PRIMARY KEY (credit_id),
  FOREIGN KEY (account_id) REFERENCES ServiceAccount
);