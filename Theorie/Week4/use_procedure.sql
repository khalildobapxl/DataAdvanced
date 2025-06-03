SET SERVEROUTPUT ON;

DECLARE
  v_new_sal EMPLOYEES.SALARY%TYPE;
BEGIN
  give_simple_raise(
    p_emp_id     => 105,
    p_pct        => 10,    -- Give that dear soul a 10% raise
    p_new_salary => v_new_sal
  );
  DBMS_OUTPUT.PUT_LINE('Returned new salary is ' || v_new_sal);
END;
/
