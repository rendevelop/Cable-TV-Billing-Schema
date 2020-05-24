/* TEST DATA FOR CABLE TV BILLING SCHEMA */

/* Inserts Services available */

INSERT INTO Service VALUES('S001', 'Special Cable 12 Months', 'Special', 'Special Cable service for 12 month term', 20.00, 12);
INSERT INTO Service VALUES('S002', 'Special Cable 24 Months', 'Special', 'Special Cable service for 24 month term', 25.00, 24);
INSERT INTO Service VALUES('S003', 'Standard Cable 36 Months', 'Standard', 'Standard Cable service for 36 month term', 35.00, 36);
INSERT INTO Service VALUES('S004', 'Internet/TV Cable Bundle 12 Months', 'Special', 'Cable service for 12 month term', 30.00, 12);
INSERT INTO Service VALUES('S005', 'Internet/TV Cable Bundle 24 Months', 'Special', 'Cable service for 24 month term', 35.00, 24);
INSERT INTO Service VALUES('S006', 'Standard Internet/TV Cable Bundle 36 Months', 'Standard', 'Cable service for 36 month term', 50.00, 36);

/* Inserts Fees available */

INSERT INTO Fee VALUES('F001', 'Standard Equipment Repair Fee', 'RepairFee', 'Standard fee for various equipment repair', 25, NULL);
INSERT INTO Fee VALUES('F002', 'Standard Equipment Installation Fee', 'InstallationFee', 'Standard fee for installation', 10, NULL);
INSERT INTO Fee VALUES('F003', 'Standard Late Fee', 'LateFee', 'Standard fee for late payments', 5, NULL);
INSERT INTO Fee VALUES('F004', 'Standard Equipment Rental Fee', 'HardwareRentalFee', 'Standard fee for various equipment rental', 20, NULL);
INSERT INTO Fee VALUES('F005', 'Standard PayPerView Fee', 'PayPerView', 'Standard fee for PayPerView', 1.99, NULL);
INSERT INTO Fee VALUES('F006', 'Internet and TV Installation Fee (Special Fee 12 Month Term)', 'InstallationFee', 'Fee for installation of Internet and TV for a special 12 month term', 5, 'S004');
INSERT INTO Fee VALUES('F007', 'Internet and TV Installation Fee (Special Fee 24 Month Term)', 'InstallationFee', 'Fee for installation of Internet and TV for a special 24 month term', 0, 'S005');

