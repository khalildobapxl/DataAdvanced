DECLARE
    c_sal_increase employees.salary%TYPE DEFAULT 800;
BEGIN
    UPDATE employees
    SET salary = salary + c_sal_increase
    WHERE job_id = 'ST_CLERK';
END;