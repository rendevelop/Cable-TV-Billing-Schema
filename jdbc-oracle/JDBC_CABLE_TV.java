import java.sql.*;
import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;
import java.util.Scanner;

class JDBC_CABLE_TV
{
    private static final String USERNAME = "ENTER USERNAME HERE"; 
    private static final String PASSWORD = "ENTER PASSWORD HERE";
    private static final String HOST = "localhost"; // Host
    private static final String PORT = "1521"; // Default port
    private static final String SID = System.getenv("ORACLE_SID"); // Oracle SID

    public static void main (String args[]) throws SQLException
    {
	int choice = -1;
	Scanner scanner = new Scanner(System.in);
        OracleDataSource ods = new OracleDataSource();
        ods.setUser(USERNAME);
        ods.setPassword(PASSWORD);
        ods.setURL("jdbc:oracle:thin:" + "@" + HOST
                                       + ":" + PORT
                                       + ":" + SID);

        Connection conn = ods.getConnection();
	
	System.out.println("Connection Established.\n");
	
	// Statement
		String statement;
        CallableStatement cstmt;
        ResultSet cursor;

	while (true) {
		System.out.println("Choose a Menu Option:");
		System.out.println("(0) Exit.");
		System.out.println("(1) Get the customer details from Name and Phone Number.");
		System.out.println("(2) List the details of the standard services and special services offered by the company.");
		System.out.println("(3) List the details of the customers who have a positive balance currently in the system.");
		System.out.println("(4) List the payment details of a particular customer.");
		System.out.println("(5) List the recurring services chosen by a particular customer account and the date of subscription and termination.");
		System.out.println("(6) Get the total amount of the balance for all the customer accounts in the company.");
		System.out.println("(7) List the details of the credits for a customer account.");
		System.out.println("(8) List the details of the fees for a customer account.");
		System.out.println("(9) List the date of billing, total amount due, current amount due, and date due for account bills for a customer account.");
		System.out.println("(10) List all the customers who have more than one account in the company.");
		System.out.println("(11) Get the total payment received by the company.");
		System.out.print("\nMenu Option(0 - 11): ");
			
		choice = scanner.nextInt();
		
		System.out.println();

		if (choice == 0) break;

		switch (choice) {
			case 1:
				System.out.print("Enter First Name: ");
				String first_name = scanner.next();
				System.out.print("Enter Last Name: ");
				String last_name = scanner.next();
				System.out.print("Enter Phone Number: ");
				String phone_number = scanner.next();
				statement = String.format("SELECT * FROM Customer WHERE first_name = '%s' AND last_name = '%s' AND phone_number='%s';", first_name.trim(), last_name.trim(), phone_number.trim());
				
				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
				cstmt.execute();
				cursor = ((OracleCallableStatement)cstmt).getCursor(1);

				System.out.println("\n\nCustomer Details from Name and Phone Number--");
				System.out.printf("%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s\n", "CUSTOMER_ID", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "STREET", "CITY", "STATE", "COUNTRY", "ZIPCODE", "PHONE_NUMBER"); 
				System.out.printf("%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s\n", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------");
 				while (cursor.next()) {
					System.out.printf("%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s\n", cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4), cursor.getString(5), cursor.getString(6), cursor.getString(7), cursor.getString(8), cursor.getString(9), cursor.getString(10));
				}
				
				System.out.println();
				
				break;

			case 2:
				statement = "SELECT * FROM Service;";

				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        			cstmt.execute();
        			cursor = ((OracleCallableStatement)cstmt).getCursor(1);

        			System.out.println("\n\nDetails of the standard services and special services offered by the company--");
        			System.out.printf("%-10s %-10s %-10s %-10s %-10s %-10s\n", "SERVICE_ID", "SERVICE_NAME", "SERVICE_TYPE", "SERVICE_DETAILS", "PRICE", "TERM_LENGTH(MONTHS)"); 
        			System.out.printf("%-10s %-10s %-10s %-10s %-10s %-10s\n", "----------", "-------------------", "-------------", "-------------------", "--------", "------------");
 				while (cursor.next ()) {
					System.out.printf("%-10s %-10s %-10s %-10s $%-10.2f %-10d\n", cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4), cursor.getDouble(5), cursor.getInt(6));
				}
				
				System.out.println();
	
				break;

			case 3:
				statement = "SELECT * FROM CA_WITH_POSITIVE_BALANCE;";

				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        		cstmt.execute();
        		cursor = ((OracleCallableStatement)cstmt).getCursor(1);

        		System.out.println("\n\nDetails of the customers who have a positive balance currently in the system--");
				System.out.printf("%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s\n", "CUSTOMER_ID", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "STREET", "CITY", "STATE", "COUNTRY", "ZIPCODE", "PHONE_NUMBER", "TOTAL_CUSTOMER_BALANCE"); 
				System.out.printf("%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s\n", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------", "-----------");
 				while (cursor.next()) {
					System.out.printf("%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s $%-10.2f\n", cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4), cursor.getString(5), cursor.getString(6), cursor.getString(7), cursor.getString(8), cursor.getString(9), cursor.getString(10), cursor.getDouble(11));
				}
				
				System.out.println();
	
				break;

			case 4:
				System.out.print("Enter Customer ID: ");
				String customer_id = scanner.next();
				statement = String.format("SELECT * FROM PaymentInfo WHERE customer_id = '%s';", customer_id.trim());
				
				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        		cstmt.execute();
        		cursor = ((OracleCallableStatement)cstmt).getCursor(1);

        		System.out.println("\n\nPayment details of a particular customer--");
        		System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s\n", "CUSTOMER_ID", "METHOD_OF_PAYMENT", "CARD_ISSUER", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "STREET", "CITY", "STATE", "COUNTRY", "ZIPCODE", "CREDIT_CARD_NO", "SECURITY_CODE", "EXPIRATION_DATE"); 
        		System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s\n", "------------", "----------------", "------------", "------------", "------------", "------------", "---------------------", "----------", "-------", "-------", "-----------------", "-------------", "--------------", "--------------");
 				while (cursor.next ()) {
					System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s\n",cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4), cursor.getString(5), cursor.getString(6), cursor.getString(7), cursor.getString(8), cursor.getString(9), cursor.getString(10), cursor.getString(11), cursor.getString(12), cursor.getString(13), cursor.getDate(14).toString());
				}
				
				System.out.println();

				break;

			case 5:
				System.out.print("Enter Customer ID: ");
				customer_id = scanner.next();
				statement = String.format("SELECT * FROM SERVICEACCOUNT WHERE customer_id = '%s';", customer_id.trim());
				
				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        		cstmt.execute();
        		cursor = ((OracleCallableStatement)cstmt).getCursor(1);

        		System.out.println("\n\nThe recurring services chosen by a particular customer account--");
        		System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s\n", "ACCOUNT_ID", "CUSTOMER_ID", "METHOD_OF_PAYMENT", "SERVICE_ID", "DATE_SUBSCRIBED", "DATE_TERMINATED"); 
        		System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s\n", "------------------", "-------------------", "-------------------", "-------------------", "-------------------", "-------------------");
 				while (cursor.next ()) {
					if (cursor.getDate(6) != null) {
						System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s\n",cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4), cursor.getDate(5).toString(), cursor.getDate(6).toString());
					} else {
						System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s\n",cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4), cursor.getDate(5).toString(), "");
					}	
				}
				
				System.out.println();

				break;

			case 6:
				statement = "SELECT SUM(TOTAL_CUSTOMER_BALANCE) AS TOTAL_BALANCE_IN_COMPANY FROM CA_BALANCE;";
				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
				cstmt.execute();
				cursor = ((OracleCallableStatement)cstmt).getCursor(1);

				System.out.println("\n\nThe total amount of the balance for all the customer accounts in the company--");
				System.out.printf("%-20s\n", "TOTAL_BALANCE_IN_COMPANY"); 
				System.out.printf("%-20s\n", "--------------------");
 				while (cursor.next ()) {
					System.out.printf("$%-20.2f\n",cursor.getDouble(1));
				}
				
				System.out.println();

				break;

			case 7:
				System.out.print("Enter Customer ID: ");
				customer_id = scanner.next();
				statement = String.format("SELECT * FROM CREDIT WHERE ACCOUNT_ID IN (SELECT ACCOUNT_ID FROM SERVICEACCOUNT WHERE CUSTOMER_ID = '%s');", customer_id.trim());
				
				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        		cstmt.execute();
        		cursor = ((OracleCallableStatement)cstmt).getCursor(1);

        		System.out.println("\n\nDetails of credits for a customer account--");
        		System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s %-20s\n", "CREDIT_ID", "CREDIT_AMOUNT", "DATE_GRANTED", "CREDIT_TYPE", "REASON_GRANTED", "COMMENT_ON_EXPERIENCE", "ACCOUNT_ID"); 
        		System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s %-20s\n", "------------", "----------------", "------------", "------------", "-----------------------", "------------------------","-------------");
 				while (cursor.next ()) {
					System.out.printf("%-20s $%-20.2f %-20s %-20s %-20s %-20s %-20s\n",cursor.getString(1), cursor.getDouble(2), cursor.getDate(3).toString(), cursor.getString(4), cursor.getString(5), cursor.getString(6), cursor.getString(7));
				}
				
				System.out.println();

				break;

			case 8:
				System.out.print("Enter Customer ID: ");
				customer_id = scanner.next();
				statement = String.format("SELECT * FROM ACCOUNTFEE WHERE BILL_ID IN (SELECT BILL_ID FROM ACCOUNTBILL WHERE CUSTOMER_ID = '%s');", customer_id.trim());
				
				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        		cstmt.execute();
        		cursor = ((OracleCallableStatement)cstmt).getCursor(1);

        		System.out.println("\n\nDetails of the fees for a customer account--");
        		System.out.printf("%-20s %-20s %-20s %-20s\n", "ACCFEE_ID", "DATE_FEE_INCURRED", "FEE_ID", "BILL_ID"); 
        		System.out.printf("%-20s %-20s %-20s %-20s\n", "-------------", "----------------", "------------", "------------");
 				while (cursor.next ()) {
					System.out.printf("%-20s %-20s %-20s %-20s\n",cursor.getString(1), cursor.getDate(2).toString(), cursor.getString(3), cursor.getString(4));
				}
				
				System.out.println();

				break;
			
			case 9:
				System.out.print("Enter Customer ID: ");
				customer_id = scanner.next();
				statement = String.format("SELECT DATE_OF_BILLING, TOTAL_AMOUNT_DUE, OUTSTANDING_BALANCE AS CURRENT_AMOUNT_DUE, DATE_DUE FROM ACCOUNTBILL WHERE CUSTOMER_ID = '%s';", customer_id.trim());
				
				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        		cstmt.execute();
        		cursor = ((OracleCallableStatement)cstmt).getCursor(1);

        		System.out.println("\n\nThe date of billing, total amount due, and date due for account bills for a customer account--");
        		System.out.printf("%-20s %-20s %-20s %-20s\n", "DATE_OF_BILLING", "TOTAL_AMOUNT_DUE", "OUTSTANDING_BALANCE", "DATE_DUE"); 
        		System.out.printf("%-20s %-20s %-20s %-20s\n", "-------------", "----------------", "------------", "------------");
 				while (cursor.next ()) {
					System.out.printf("%-20s $%-20.2f $%-20.2f %-20s\n",cursor.getDate(1).toString(), cursor.getDouble(2), cursor.getDouble(3), cursor.getDate(4).toString());
				}
				
				System.out.println();

				break;

			case 10:
				statement = "SELECT CUSTOMER_ID, COUNT(*) AS NUM_OF_ACCOUNTS FROM SERVICEACCOUNT GROUP BY CUSTOMER_ID HAVING COUNT(*) > 1;";
				
				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        		cstmt.execute();
        		cursor = ((OracleCallableStatement)cstmt).getCursor(1);

        		System.out.println("\n\nAll the customers who have more than one account in the company--");
        		System.out.printf("%-20s %-20s\n", "CUSTOMER_ID", "NUM_OF_ACCOUNTS"); 
        		System.out.printf("%-20s %-20s\n", "-------------", "--------------");
 				while (cursor.next ()) {
					System.out.printf("%-20s %-20d\n",cursor.getString(1), cursor.getInt(2));
				}
				
				System.out.println();

				break;

			case 11:
				statement = "SELECT SUM(AMOUNT_PAYED) AS TOTAL_PAYMENT_RECEIVED_COMPANY FROM PAYMENT;";
				
				cstmt = conn.prepareCall("begin open ? for " + statement + " end;");
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
        		cstmt.execute();
        		cursor = ((OracleCallableStatement)cstmt).getCursor(1);

        		System.out.println("\n\nTotal payment received by the company--");
        		System.out.printf("%-20s\n", "TOTAL_PAYMENT_RECEIVED_COMPANY"); 
        		System.out.printf("%-20s\n", "------------------------------");
 				while (cursor.next ()) {
					System.out.printf("$%-20.2f\n",cursor.getDouble(1));
				}
				
				System.out.println();

				break;
			
			default:
				System.out.println("\n\nSelection of menu choice option not valid! Try again.\n");
				break;
		}
	}		
			
        System.out.println("\nGOOD BYE!"); 
    }
}
