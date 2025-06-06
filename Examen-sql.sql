-- -- Opgave 1

-- BEGIN
--     FOR emp_record IN (SELECT last_name FROM employees WHERE department_id = 50) LOOP
--         DBMS_OUTPUT.PUT_LINE(emp_record.last_name);
--     END LOOP;
-- END;
-- /

-- -- Opgave 2

-- CREATE OR REPLACE PROCEDURE show_emp
-- [ p_depart_id IN employees_department_id%TYPE]

-- Opgave 3

/*
Nee, er ontstaat géén fout als we een department_id meegeven
waarvoor geen rijen in EMPLOYEES bestaan. 
Een cursor‐FOR‐LOOP voert simpelweg 0 iteraties uit 
en stopt vervolgens zonder fout.
*/

-- Opgave 4

-- CREATE OR REPLACE TRIGGER bur_depid_not_null
-- BEFORE UPDATE OF department_id
--   ON employees
-- FOR EACH ROW
-- BEGIN
--   IF :OLD.department_id IS NOT NULL
--      AND :NEW.department_id IS NULL
--   THEN
--     RAISE_APPLICATION_ERROR(
--       -20010,
--       'Je mag geen afdeling weghalen van een werknemer die er reeds een had.'
--     );
--   END IF;
-- END trg_no_null_dept;
-- /

-- Opgave 5

/*
Het land dat werd toegevoegd is: Spain
Het land Portugal kon niet toegevoegd worden
Het land dat werd toegevoegd is: Norway
*/

-- Opgave 6

-- CREATE OR REPLACE PROCEDURE toon_laatste_emp IS
--   v_empid    employees.employee_id%TYPE;
--   v_naam     employees.last_name%TYPE;
--   v_hiredate employees.hire_date%TYPE;
-- BEGIN
--   SELECT employee_id, last_name, hire_date
--     INTO v_empid, v_naam, v_hiredate
--     FROM employees
--    WHERE hire_date = (
--      SELECT MAX(hire_date) FROM employees
--    );

--   DBMS_OUTPUT.PUT_LINE(
--     'Laatst aangeworven werknemer is: ' ||
--     v_empid || ' ' || v_naam || ' ' || TO_CHAR(v_hiredate, 'DD-MON-YYYY')
--   );

-- EXCEPTION
--   WHEN NO_DATA_FOUND THEN
--     DBMS_OUTPUT.PUT_LINE('Fout: Geen werknemers gevonden in de tabel.');
--   WHEN TOO_MANY_ROWS THEN
--     DBMS_OUTPUT.PUT_LINE(
--       'Fout: Meerdere werknemers delen dezelfde laatste aanwervingsdatum.'
--     );
--   WHEN OTHERS THEN
--     DBMS_OUTPUT.PUT_LINE(
--       'Onverwachte fout: ' || SQLCODE || ' - ' || SQLERRM
--     );
-- END toon_laatste_emp;
-- /

-- Opgave 7

-- CREATE OR REPLACE FUNCTION aantal_wn (
--   p_dept_name IN departments.department_name%TYPE
-- ) RETURN NUMBER IS
--   v_count NUMBER;
-- BEGIN
--   SELECT COUNT(*)
--     INTO v_count
--     FROM employees e
--     JOIN departments d
--       ON e.department_id = d.department_id
--    WHERE LOWER(d.department_name) = LOWER(p_dept_name);
--   RETURN v_count;
-- END aantal_wn;
-- /

-- Opgave 8

-- CREATE OR REPLACE PROCEDURE volledige_naam(
--     p_id employees.employees_id%TYPE,
--     p_naam OUT employees.first_name%TYPE
-- )
-- IS
-- BEGIN
--     ....;
-- END;

-- Opgave 9

-- Before row trigger

-- Opgave 10

-- BEGIN
--   FOR rec IN (
--     SELECT last_name, first_name, salary
--       FROM employees
--      ORDER BY last_name
--   ) LOOP
--     DBMS_OUTPUT.PUT_LINE(rec.first_name || ' ' || rec.last_name || ' betaalt ' || belasting(rec.salary*12) || ' per jaar');
--   END LOOP;
-- END;
-- /
