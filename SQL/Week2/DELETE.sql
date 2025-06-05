DECLARE
    c_dep_delete employees.department_id%TYPE := 10;
BEGIN
    DELETE FROM EMPLOYEES
    WHERE department_id = c_dep_delete;
END; -- Won't work because of DEPT_MGR_FK constraint
