BEGIN
    INSERT INTO EMPLOYEES
    (employee_id, first_name, last_name, email, hire_date, job_id, salary)
    VALUES (employees_seq.NEXTVAL, 'Ruth', 'Cores', 'RCORES', CURRENT_DATE, 'AD_ASST', 4000);
END;
/