CREATE OR REPLACE PROCEDURE give_simple_raise (
  p_emp_id    IN  EMPLOYEES.EMPLOYEE_ID%TYPE,
  p_pct       IN  NUMBER,
  p_new_salary OUT EMPLOYEES.SALARY%TYPE
) IS
  v_current_salary EMPLOYEES.SALARY%TYPE;
  e_no_employee    EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_no_employee, -20010);  -- Custom error for “no such employee”
BEGIN
  -- 1. Fetch the current salary for the given employee
  BEGIN
    SELECT salary
      INTO v_current_salary
      FROM EMPLOYEES
     WHERE employee_id = p_emp_id;
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN
      RAISE e_no_employee;
  END;

  -- 2. Calculate and update the salary
  p_new_salary := v_current_salary * (1 + p_pct/100);

  UPDATE EMPLOYEES
     SET salary = p_new_salary
   WHERE employee_id = p_emp_id;

  -- 3. Commit the change so it actually sticks
  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Employee ' || p_emp_id || 
                       ' new salary: ' || p_new_salary);

EXCEPTION
  WHEN e_no_employee THEN
    ROLLBACK;  -- Undo any partial work (though there isn’t any here yet)
    DBMS_OUTPUT.PUT_LINE('Error: Employee ' || p_emp_id || ' does not exist.');
  WHEN OTHERS THEN
    ROLLBACK;
    -- Re‐raise the exception so higher‐level code (or you) can see what went wrong
    RAISE;
END give_simple_raise;
/
