DECLARE
    v_name1 employees.first_name%TYPE := 'John Chen';
    v_name2 employees.first_name%TYPE := 'Lisa Ozer';
    v_salary1 employees.salary%TYPE;
    v_salary2 employees.salary%TYPE;
BEGIN
    SELECT (salary * NVL(COMMISSION_PCT+1, 1)) * 12
    INTO v_salary1
    FROM employees
    WHERE first_name = 'John' AND last_name = 'Chen';

    SELECT (salary * NVL(COMMISSION_PCT+1, 1)) * 12
    INTO v_salary2
    FROM employees
    WHERE first_name = 'Lisa' AND last_name = 'Ozer';

    DBMS_OUTPUT.PUT_LINE(v_name1 || ' verdient jaarlijks ' || v_salary1);
    DBMS_OUTPUT.PUT_LINE(v_name2 || ' verdient jaarlijks ' || v_salary2);
END;
/