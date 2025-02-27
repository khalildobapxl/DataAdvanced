ACCEPT departments_number PROMPT 'Geef het departementnummer in: '

DECLARE
    v_deptno departments.department_id%TYPE;
    v_deptname departments.department_name%TYPE;
    v_emp_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Geef het departementnummer in:');
    v_deptno := &departments_number;

    SELECT d.department_name, COUNT(e.employee_id)
    INTO v_deptname, v_emp_count
    FROM departments d
    JOIN employees e ON d.department_id = e.department_id
    WHERE d.department_id = v_deptno
    GROUP BY d.department_name;

    DBMS_OUTPUT.PUT_LINE(v_emp_count || ' werknemers werken in departement ' || v_deptname);
END;
/