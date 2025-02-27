DECLARE
    v_emp_name employees.first_name%TYPE;
    v_dept_name departments.department_name%TYPE;
    v_salary employees.salary%TYPE;
BEGIN
    SELECT e.last_name, d.department_name, e.salary
    INTO v_emp_name, v_dept_name, v_salary
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    WHERE e.salary = (SELECT MAX(salary) FROM employees);

    DBMS_OUTPUT.PUT_LINE(v_emp_name || ' werkt in het departement ' || v_dept_name || ' en verdient een maandelijks salaris van ' || v_salary);
END;
/