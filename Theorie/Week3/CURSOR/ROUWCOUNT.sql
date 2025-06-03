DECLARE
    v_rows_deleted VARCHAR2(50);  -- Changed from NUMBER to VARCHAR2
    v_emp_no employees.employee_id%TYPE DEFAULT 176;
BEGIN
    DELETE FROM EMPLOYEES
    WHERE employee_id = v_emp_no;
    v_rows_deleted := (SQL%ROWCOUNT || ' rows deleted');
    DBMS_OUTPUT.PUT_LINE (v_rows_deleted);
END;
/