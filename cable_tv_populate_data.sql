/* TEST DATA FOR CABLE TV BILLING SCHEMA */

/* Customer 1 (ServiceAccount's and AccountBill's) */
INSERT INTO Customer VALUES('C001', 'James', 'Allen', 'Smith', '3124 Oakmound Road', 'Chicago', 'IL', 'USA', '60607','7732539433');
INSERT INTO PaymentInfo VALUES('C001', 'CREDIT', 'VISA', 'James', 'Allen', 'Smith', '3124 Oakmound Road', 'Chicago', 'IL', 'USA', '60607','XXXXXXXXXXXXXXXX', '000', DATE'2023-08-01');
/* 2 Service Accounts (Special Internet/Cable TV 12 month term followed by Special Cable TV 12 month term) */
INSERT INTO ServiceAccount VALUES('A001', 'C001', 'CREDIT', 'S004', DATE'2018-10-08', DATE'2018-10-08');
INSERT INTO ServiceAccount VALUES('A002', 'C001', 'CREDIT', 'S001', DATE'2019-10-09', NULL);
INSERT INTO Credit VALUES('CR001', 10.00, DATE'2019-01-10', 'Promotion', 'Redeemed Promotion', 'Positive Experience', 'A001');
/* Account Statements and Fees for Account 1 */
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B001', DEFAULT, DATE'2018-10-08', DATE'2018-11-08', 'C001', 'A001', 35.00, 35.00);
INSERT INTO AccountFee VALUES('AF001', DATE'2018-10-08', 'F006', 'B001');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B002', DEFAULT, DATE'2018-11-08', DATE'2018-12-08', 'C001', 'A001', 30.00, 30.00);
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B003', DEFAULT, DATE'2018-12-08', DATE'2019-01-08', 'C001', 'A001', 30.00, 30.00);
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B004', DEFAULT, DATE'2019-01-08', DATE'2018-02-08', 'C001', 'A001', 55.00, 55.00);
INSERT INTO AccountFee VALUES('AF002', DATE'2019-01-14', 'F001', 'B004');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B005', DEFAULT, DATE'2019-02-08', DATE'2019-03-08', 'C001', 'A001', 30.00, 30.00);
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B006', DEFAULT, DATE'2019-03-08', DATE'2019-04-08', 'C001', 'A001', 33.98, 33.98);
INSERT INTO AccountFee VALUES('AF003', DATE'2019-03-14', 'F005', 'B004');
INSERT INTO AccountFee VALUES('AF004', DATE'2019-03-15', 'F005', 'B004');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B007', DEFAULT, DATE'2019-04-08', DATE'2019-05-08', 'C001', 'A001', 30.00, 30.00);
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B008', DEFAULT, DATE'2019-05-08', DATE'2019-06-08', 'C001', 'A001', 30.00, 30.00);
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B009', DEFAULT, DATE'2019-06-08', DATE'2019-07-08', 'C001', 'A001', 30.00, 30.00);
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B010', DEFAULT, DATE'2019-07-08', DATE'2019-08-08', 'C001', 'A001', 30.00, 30.00);
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B011', DEFAULT, DATE'2019-08-08', DATE'2019-09-08', 'C001', 'A001', 30.00, 30.00);
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B012', DEFAULT, DATE'2019-09-08', DATE'2019-10-08', 'C001', 'A001', 30.00, 30.00);
/* Account Statements and Fees for Account 2*/
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B013', 1, DATE'2019-10-08', DATE'2019-11-08', 'C001', 'A002', 20.00, 15.00);
INSERT INTO Payment VALUES('B013', DATE'2019-10-20', 'CREDIT', 15.00, 'C001');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B014', 1, DATE'2019-11-08', DATE'2019-12-08', 'C001', 'A002', 20.00, 0.00);

/* Customer 2 (Payment queries)*/
INSERT INTO Customer VALUES('C002', 'Erica', '', 'Perez', '2404 Sarah Drive', 'Lafayette', 'LA', 'USA', '70506','3375771046');
INSERT INTO PaymentInfo VALUES('C002', 'CREDIT', 'VISA', 'Erica', '', 'Perez', '2404 Sarah Drive', 'Lafayette', 'LA', 'USA', '70506','XXXXXXXXXXXXXXXX', '000', DATE'2023-08-01');
/* 1 Service Account (Special Internet/Cable TV 12 month term) */
INSERT INTO ServiceAccount VALUES('A003', 'C002', 'CREDIT', 'S006', DATE'2019-01-01', NULL);
INSERT INTO Credit VALUES('CR002', 10.00, DATE'2019-01-10', 'Promotion', 'Redeemed Promotion', 'Positive Experience', 'A003');
/* Account Statements and Fees for Account 1 */
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B015', DEFAULT, DATE'2019-01-01', DATE'2019-02-01', 'C002', 'A003', 35.00, 35.00);
INSERT INTO AccountFee VALUES('AF005', DATE'2019-01-01', 'F002', 'B015');
INSERT INTO Payment VALUES('B015', DATE'2019-02-01', 'CREDIT', 35.00, 'C002');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B016', DEFAULT, DATE'2019-02-01', DATE'2019-03-01', 'C002', 'A003', 30.00, 30.00);
INSERT INTO Payment VALUES('B016', DATE'2019-03-01', 'CREDIT', 15.00, 'C002');
INSERT INTO Payment VALUES('B016', DATE'2019-03-05', 'CREDIT', 15.00, 'C002');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B017', DEFAULT, DATE'2019-03-01', DATE'2019-04-01', 'C002', 'A003', 30.00, 30.00);
INSERT INTO Payment VALUES('B017', DATE'2019-04-01', 'CREDIT', 35.00, 'C002');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B018', DEFAULT, DATE'2019-04-01', DATE'2018-05-01', 'C002', 'A003', 30.00, 30.00);
INSERT INTO Payment VALUES('B018', DATE'2019-05-01', 'CREDIT', 15.00, 'C002');
INSERT INTO Payment VALUES('B018', DATE'2019-05-07', 'CREDIT', 15.00, 'C002');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B019', DEFAULT, DATE'2019-05-01', DATE'2019-06-01', 'C002', 'A003', 30.00, 30.00);
INSERT INTO Payment VALUES('B019', DATE'2019-06-01', 'CREDIT', 15.00, 'C002');
INSERT INTO Payment VALUES('B019', DATE'2019-06-07', 'CREDIT', 15.00, 'C002');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B020', DEFAULT, DATE'2019-06-01', DATE'2019-07-01', 'C002', 'A003', 30.00, 30.00);
INSERT INTO Payment VALUES('B020', DATE'2019-06-01', 'CREDIT', 35.00, 'C002');

/* Customer 3 (Account Fees) */
INSERT INTO Customer VALUES('C003', 'Robert', 'Dean', 'Wilcon', '4812 Pearlman Avenue', 'Billerica', 'MA', 'USA', '01821','9782623871');
INSERT INTO PaymentInfo VALUES('C003', 'CREDIT', 'VISA', 'Erica', '', 'Perez', '2404 Sarah Drive', 'Lafayette', 'LA', 'USA', '70506','XXXXXXXXXXXXXXXX', '000', DATE'2023-08-01');
/* 2 Service Accounts (Special Internet/Cable TV 12 month term)*/
INSERT INTO ServiceAccount VALUES('A004', 'C003', 'CREDIT', 'S006', DATE'2019-01-01', NULL);
INSERT INTO Credit VALUES('CR003', 10.00, DATE'2019-01-10', 'Promotion', 'Redeemed Promotion', 'Positive Experience', 'A004');
/* Account Statements and Fees for Account 1 */
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B021', DEFAULT, DATE'2019-01-01', DATE'2019-02-01', 'C003', 'A004', 35.00, 35.00);
INSERT INTO AccountFee VALUES('AF006', DATE'2019-01-01', 'F002', 'B021');
INSERT INTO Payment VALUES('B021', DATE'2019-02-01', 'CREDIT', 35.00, 'C003');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B022', DEFAULT, DATE'2019-02-01', DATE'2019-03-01', 'C003', 'A004', 30.00, 30.00);
INSERT INTO Payment VALUES('B022', DATE'2019-03-01', 'CREDIT', 15.00, 'C003');
INSERT INTO Payment VALUES('B022', DATE'2019-03-05', 'CREDIT', 15.00, 'C003');
INSERT INTO AccountFee VALUES('AF007', DATE'2019-03-02', 'F003', 'B022');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B023', DEFAULT, DATE'2019-03-01', DATE'2019-04-01', 'C003', 'A004', 30.00, 30.00);
INSERT INTO Payment VALUES('B023', DATE'2019-04-01', 'CREDIT', 35.00, 'C003');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B024', DEFAULT, DATE'2019-04-01', DATE'2018-05-01', 'C003', 'A004', 30.00, 30.00);
INSERT INTO Payment VALUES('B024', DATE'2019-05-01', 'CREDIT', 15.00, 'C003');
INSERT INTO Payment VALUES('B024', DATE'2019-05-07', 'CREDIT', 15.00, 'C003');
INSERT INTO AccountFee VALUES('AF008', DATE'2019-05-02', 'F003', 'B024');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B025', DEFAULT, DATE'2019-05-01', DATE'2019-06-01', 'C003', 'A004', 30.00, 30.00);
INSERT INTO Payment VALUES('B025', DATE'2019-06-01', 'CREDIT', 15.00, 'C003');
INSERT INTO Payment VALUES('B025', DATE'2019-06-07', 'CREDIT', 15.00, 'C003');
INSERT INTO AccountFee VALUES('AF009', DATE'2019-06-02', 'F003', 'B025');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B026', DEFAULT, DATE'2019-06-01', DATE'2019-07-01', 'C003', 'A004', 30.00, 30.00);
INSERT INTO Payment VALUES('B026', DATE'2019-06-01', 'CREDIT', 35.00, 'C003');

/* Customer 4 (Testing Credits) */
INSERT INTO Customer VALUES('C004', 'Brenda', 'Kacey', 'Garcia', '3455 Stuart Street', 'Alquippa', 'PA', 'USA', '15001','7243787316');
INSERT INTO PaymentInfo VALUES('C004', 'CREDIT', 'VISA', 'Erica', '', 'Perez', '2404 Sarah Drive', 'Lafayette', 'LA', 'USA', '70506','XXXXXXXXXXXXXXXX', '000', DATE'2023-08-01');
/* 1 Service Account */
INSERT INTO ServiceAccount VALUES('A005', 'C004', 'CREDIT', 'S006', DATE'2019-01-01', NULL);
INSERT INTO Credit VALUES('CR004', 10.00, DATE'2019-01-10', 'Promotion', 'Redeemed Promotion', 'Positive Experience', 'A005');
INSERT INTO Credit VALUES('CR005', 5.00, DATE'2019-02-11', 'Promotion', 'Redeemed Promotion', 'Positive Experience', 'A005');
INSERT INTO Credit VALUES('CR006', 15.00, DATE'2019-03-08', 'ServiceInterruption', 'Compensated for Interruption', 'Positive Experience', 'A005');
INSERT INTO Credit VALUES('CR007', 10.00, DATE'2019-04-16', 'Promotion', 'Redeemed Promotion', 'Positive Experience', 'A005');
INSERT INTO Credit VALUES('CR008', 10.00, DATE'2019-05-12', 'Promotion', 'Redeemed Promotion', 'Positive Experience', 'A005');
INSERT INTO Credit VALUES('CR009', 10.00, DATE'2019-06-03', 'Promotion', 'Redeemed Promotion', 'Positive Experience', 'A005');
/* Account Statements and Fees for Account 1 */
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B027', DEFAULT, DATE'2019-01-01', DATE'2019-02-01', 'C004', 'A005', 35.00, 35.00);
INSERT INTO AccountFee VALUES('AF010', DATE'2019-01-01', 'F002', 'B027');
INSERT INTO Payment VALUES('B027', DATE'2019-02-01', 'CREDIT', 35.00, 'C004');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B028', DEFAULT, DATE'2019-02-01', DATE'2019-03-01', 'C004', 'A005', 30.00, 30.00);
INSERT INTO Payment VALUES('B028', DATE'2019-03-01', 'CREDIT', 15.00, 'C004');
INSERT INTO Payment VALUES('B028', DATE'2019-03-05', 'CREDIT', 15.00, 'C004');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B029', DEFAULT, DATE'2019-03-01', DATE'2019-04-01', 'C004', 'A005', 30.00, 30.00);
INSERT INTO Payment VALUES('B029', DATE'2019-04-01', 'CREDIT', 35.00, 'C004');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B030', DEFAULT, DATE'2019-04-01', DATE'2018-05-01', 'C004', 'A005', 30.00, 30.00);
INSERT INTO Payment VALUES('B030', DATE'2019-05-01', 'CREDIT', 15.00, 'C004');
INSERT INTO Payment VALUES('B030', DATE'2019-05-07', 'CREDIT', 15.00, 'C004');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B031', DEFAULT, DATE'2019-05-01', DATE'2019-06-01', 'C004', 'A005', 30.00, 30.00);
INSERT INTO Payment VALUES('B031', DATE'2019-06-01', 'CREDIT', 15.00, 'C004');
INSERT INTO Payment VALUES('B031', DATE'2019-06-07', 'CREDIT', 15.00, 'C004');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B032', DEFAULT, DATE'2019-06-01', DATE'2019-07-01', 'C004', 'A005', 30.00, 30.00);
INSERT INTO Payment VALUES('B032', DATE'2019-06-01', 'CREDIT', 35.00, 'C004');

/* Customer 5 (Multiple Service Accounts) */
INSERT INTO Customer VALUES('C005', 'Abel', '', 'Rocha', '917 Public Works Drive', 'Sweetwater', 'TN', 'USA', '37874','4233511659');
INSERT INTO PaymentInfo VALUES('C005', 'CREDIT', 'VISA', 'Erica', '', 'Perez', '2404 Sarah Drive', 'Lafayette', 'LA', 'USA', '70506','XXXXXXXXXXXXXXXX', '000', DATE'2023-08-01');
/* 1 Service Account */
INSERT INTO ServiceAccount VALUES('A006', 'C005', 'CREDIT', 'S006', DATE'2019-01-01', NULL);
INSERT INTO ServiceAccount VALUES('A007', 'C005', 'CREDIT', 'S001', DATE'2019-02-01', NULL);
INSERT INTO ServiceAccount VALUES('A008', 'C005', 'CREDIT', 'S002', DATE'2019-03-01', NULL);
INSERT INTO ServiceAccount VALUES('A009', 'C005', 'CREDIT', 'S003', DATE'2019-04-01', NULL);
INSERT INTO ServiceAccount VALUES('A010', 'C005', 'CREDIT', 'S004', DATE'2019-05-01', NULL);
/* Account Statements and Fees for Account 1 */
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B033', DEFAULT, DATE'2019-01-01', DATE'2019-02-01', 'C005', 'A006', 35.00, 35.00);
INSERT INTO AccountFee VALUES('AF011', DATE'2019-01-01', 'F002', 'B033');
INSERT INTO Payment VALUES('B033', DATE'2019-02-01', 'CREDIT', 35.00, 'C005');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B034', DEFAULT, DATE'2019-02-01', DATE'2019-03-01', 'C005', 'A006', 30.00, 30.00);
INSERT INTO Payment VALUES('B034', DATE'2019-03-01', 'CREDIT', 15.00, 'C005');
INSERT INTO Payment VALUES('B034', DATE'2019-03-05', 'CREDIT', 15.00, 'C005');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B035', DEFAULT, DATE'2019-03-01', DATE'2019-04-01', 'C005', 'A006', 30.00, 30.00);
INSERT INTO Payment VALUES('B035', DATE'2019-04-01', 'CREDIT', 35.00, 'C005');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B036', DEFAULT, DATE'2019-04-01', DATE'2018-05-01', 'C005', 'A006', 30.00, 30.00);
INSERT INTO Payment VALUES('B036', DATE'2019-05-01', 'CREDIT', 15.00, 'C005');
INSERT INTO Payment VALUES('B036', DATE'2019-05-07', 'CREDIT', 15.00, 'C005');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B037', DEFAULT, DATE'2019-05-01', DATE'2019-06-01', 'C005', 'A006', 30.00, 30.00);
INSERT INTO Payment VALUES('B037', DATE'2019-06-01', 'CREDIT', 15.00, 'C005');
INSERT INTO Payment VALUES('B037', DATE'2019-06-07', 'CREDIT', 15.00, 'C005');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B038', DEFAULT, DATE'2019-06-01', DATE'2019-07-01', 'C005', 'A006', 30.00, 30.00);
INSERT INTO Payment VALUES('B038', DATE'2019-06-01', 'CREDIT', 35.00, 'C005');

/* Customer 6 (Overdue Payments) */
INSERT INTO Customer VALUES('C006', 'Luke', '', 'Rodrick', '143 Walt Disney Drive', 'Orlando', 'FL', 'USA', '30492','4078293456');
INSERT INTO PaymentInfo VALUES('C006', 'CREDIT', 'VISA', 'Erica', '', 'Perez', '2404 Sarah Drive', 'Lafayette', 'LA', 'USA', '70506','XXXXXXXXXXXXXXXX', '000', DATE'2023-08-01');
/* 1 Service Account */
INSERT INTO ServiceAccount VALUES('A011', 'C006', 'CREDIT', 'S006', DATE'2019-01-01', NULL);
/* Account Statements and Fees for Account 1 */
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B039', 1, DATE'2019-01-01', DATE'2019-02-01', 'C006', 'A011', 35.00, 35.00);
INSERT INTO AccountFee VALUES('AF012', DATE'2019-01-01', 'F002', 'B039');
INSERT INTO Payment VALUES('B039', DATE'2019-02-01', 'CREDIT', 35.00, 'C006');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B040', 1, DATE'2019-02-01', DATE'2019-03-01', 'C006', 'A011', 30.00, 15.00);
INSERT INTO Payment VALUES('B040', DATE'2019-03-01', 'CREDIT', 15.00, 'C006');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B041', 1, DATE'2019-03-01', DATE'2019-04-01', 'C006', 'A011', 30.00, 15.00);
INSERT INTO Payment VALUES('B041', DATE'2019-04-01', 'CREDIT', 35.00, 'C006');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B042', 1, DATE'2019-04-01', DATE'2018-05-01', 'C006', 'A011', 30.00, 15.00);
INSERT INTO Payment VALUES('B042', DATE'2019-05-01', 'CREDIT', 15.00, 'C006');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B043', 1, DATE'2019-05-01', DATE'2019-06-01', 'C006', 'A011', 30.00, 15.00);
INSERT INTO Payment VALUES('B043', DATE'2019-06-01', 'CREDIT', 15.00, 'C006');
INSERT INTO AccountBill(bill_id, isDueFlag, date_of_billing, date_due, customer_id, account_id, total_amount_due, total_amount_payed) VALUES('B044', 1, DATE'2019-06-01', DATE'2019-07-01', 'C006', 'A011', 30.00, 15.00);
INSERT INTO Payment VALUES('B044', DATE'2019-06-01', 'CREDIT', 35.00, 'C006');
