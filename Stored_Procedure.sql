use loyalty2;

DELIMITER //
create  procedure PRINT_ALL_CUSTOMERS as 

T_CUST_NAME customer.CUSTOMER_NAME%TYPE;
T_CUST_TYPE customer.CUSTOMER_TYPE%TYPE;

CURSOR CUST_CURSOR IS
  SELECT CUSTOMER_NAME, CUSTOMER_TYPE
  FROM customer;

BEGIN

OPEN CUST_CURSOR; 

LOOP
    FETCH CUST_CURSOR INTO T_CUST_NAME, T_CUST_TYPE;

  EXIT WHEN CUST_CURSOR%NOTFOUND;

DBMS_OUTPUT.PUT_LINE('NAME: ' || T_CUST_NAME || ', ' || T_CUST_TYPE);

T_TOT_CUST := T_TOT_CUST + 1;

END LOOP;

CLOSE CUST_CURSOR;

DBMS.OUTPUT.PRINT_LINE('');
DBMS.OUTPUT.PRINT_LINE('NUMBER OF CUSTOMERS: ' || T_TOT_CUST);
END;
/

BEGIN
PRINT_ALL_CUSTOMERS;
END;
DELIMETER; 