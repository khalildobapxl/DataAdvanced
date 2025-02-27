DECLARE
    v_first_name employees.first_name%TYPE;
    v_salary employees.salary%TYPE;
BEGIN
    SELECT first_name, salary INTO v_first_name, v_salary FROM employees WHERE first_name = 'Oliver';
    DBMS_OUTPUT.PUT_LINE('Hello: ' || v_first_name);
    DBMS_OUTPUT.PUT_LINE('Je salary is: ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Je bijdrage is: ' || v_salary * 0.12);
END;