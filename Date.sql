-- =========================
-- TO_CHAR and TO_DATE EXAMPLES WITH HR SCHEMA
-- =========================

-- 1. Basic TO_CHAR Examples
-- Standard date formatting
SELECT employee_id,
       first_name,
       hire_date,
       TO_CHAR(hire_date, 'DD-MM-YYYY') AS dd_mm_yyyy,
       TO_CHAR(hire_date, 'MM/DD/YYYY') AS mm_dd_yyyy,
       TO_CHAR(hire_date, 'YYYY-MM-DD') AS iso_format
FROM employees
WHERE department_id = 90;

-- 2. TO_CHAR with different day/month formats
SELECT employee_id,
       first_name,
       hire_date,
       TO_CHAR(hire_date, 'Day') AS full_day,
       TO_CHAR(hire_date, 'Dy') AS short_day,
       TO_CHAR(hire_date, 'D') AS day_number,
       TO_CHAR(hire_date, 'Month') AS full_month,
       TO_CHAR(hire_date, 'Mon') AS short_month,
       TO_CHAR(hire_date, 'MM') AS month_number
FROM employees
WHERE ROWNUM <= 5;

-- 3. TO_CHAR with Fill Mode (FM) - removes leading zeros and trailing spaces
SELECT employee_id,
       first_name,
       hire_date,
       TO_CHAR(hire_date, 'DD') AS with_leading_zero,
       TO_CHAR(hire_date, 'FMDD') AS without_leading_zero,
       TO_CHAR(hire_date, 'Month') AS month_with_spaces,
       TO_CHAR(hire_date, 'FMMonth') AS month_no_spaces,
       TO_CHAR(hire_date, 'FMDD-MM-YYYY') AS fm_date
FROM employees
WHERE ROWNUM <= 5;

-- 4. TO_CHAR with different year formats
SELECT employee_id,
       first_name,
       hire_date,
       TO_CHAR(hire_date, 'YYYY') AS four_digit_year,
       TO_CHAR(hire_date, 'YY') AS two_digit_year,
       TO_CHAR(hire_date, 'YEAR') AS year_spelled_out,
       TO_CHAR(hire_date, 'Y,YYY') AS year_with_comma,
       TO_CHAR(hire_date, 'RRRR') AS rounded_year
FROM employees
WHERE department_id = 60;

-- 5. TO_CHAR with time components
SELECT employee_id,
       first_name,
       SYSDATE AS current_datetime,
       TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') AS full_datetime,
       TO_CHAR(SYSDATE, 'HH24:MI:SS') AS time_24hr,
       TO_CHAR(SYSDATE, 'HH:MI:SS AM') AS time_12hr,
       TO_CHAR(SYSDATE, 'HH12:MI:SS PM') AS time_12hr_pm
FROM employees
WHERE ROWNUM <= 3;

-- 6. TO_CHAR with ordinal numbers and suffixes
SELECT employee_id,
       first_name,
       hire_date,
       TO_CHAR(hire_date, 'DDth') AS day_with_suffix,
       TO_CHAR(hire_date, 'DDTH') AS day_with_suffix_caps,
       TO_CHAR(hire_date, 'DDspth') AS day_spelled_with_suffix,
       TO_CHAR(hire_date, 'DDSPTH') AS day_spelled_caps
FROM employees
WHERE ROWNUM <= 5;

-- 7. TO_CHAR with week and quarter information
SELECT employee_id,
       first_name,
       hire_date,
       TO_CHAR(hire_date, 'W') AS week_of_month,
       TO_CHAR(hire_date, 'WW') AS week_of_year,
       TO_CHAR(hire_date, 'IW') AS iso_week,
       TO_CHAR(hire_date, 'Q') AS quarter,
       TO_CHAR(hire_date, 'DDD') AS day_of_year
FROM employees
WHERE department_id = 50
AND ROWNUM <= 5;

-- 8. TO_CHAR with Julian dates and era
SELECT employee_id,
       first_name,
       hire_date,
       TO_CHAR(hire_date, 'J') AS julian_date,
       TO_CHAR(hire_date, 'BC') AS era,
       TO_CHAR(hire_date, 'AD') AS era_ad
FROM employees
WHERE ROWNUM <= 3;

-- 9. Complex TO_CHAR formatting
SELECT employee_id,
       first_name,
       hire_date,
       TO_CHAR(hire_date, 'FMDay, FMDDth "of" FMMonth, YYYY') AS full_format,
       TO_CHAR(hire_date, '"Hired on" FMDay "the" DDth "of" FMMonth, YYYY') AS with_text,
       TO_CHAR(hire_date, 'FMDay FMMonth DDTH, YYYY "at" HH12:MI AM') AS american_style
FROM employees
WHERE department_id = 90;

-- 10. TO_DATE Examples - Converting strings to dates
-- Basic TO_DATE conversions
SELECT TO_DATE('15-06-2023', 'DD-MM-YYYY') AS date1,
       TO_DATE('06/15/2023', 'MM/DD/YYYY') AS date2,
       TO_DATE('2023-06-15', 'YYYY-MM-DD') AS date3,
       TO_DATE('15-JUN-23', 'DD-MON-YY') AS date4
FROM dual;

-- 11. TO_DATE with different input formats
SELECT TO_DATE('June 15, 2023', 'Month DD, YYYY') AS month_name,
       TO_DATE('15th June 2023', 'DDth Month YYYY') AS with_suffix,
       TO_DATE('Thu Jun 15 2023', 'Dy Mon DD YYYY') AS with_day,
       TO_DATE('Thursday, June 15, 2023', 'Day, Month DD, YYYY') AS full_format
FROM dual;

-- 12. TO_DATE with time components
SELECT TO_DATE('15-06-2023 14:30:45', 'DD-MM-YYYY HH24:MI:SS') AS datetime1,
       TO_DATE('06/15/2023 2:30:45 PM', 'MM/DD/YYYY HH:MI:SS PM') AS datetime2,
       TO_DATE('2023-06-15T14:30:45', 'YYYY-MM-DD"T"HH24:MI:SS') AS iso_datetime
FROM dual;

-- 13. TO_DATE with Fill Mode (FM)
SELECT TO_DATE('15-6-2023', 'DD-MM-YYYY') AS standard_parse,
       TO_DATE('15-6-2023', 'FMDD-MM-YYYY') AS fm_parse,
       TO_DATE('5-Jun-2023', 'FMDD-Mon-YYYY') AS fm_month_parse
FROM dual;

-- 14. Practical example: Updating employee hire dates from strings
-- (Example only - don't actually run this update)
/*
UPDATE employees 
SET hire_date = TO_DATE('01-January-2024', 'DD-Month-YYYY')
WHERE employee_id = 999;
*/

-- Show how different string formats would be converted
SELECT 'Input String' AS input_type,
       'Converted Date' AS converted_date,
       'Format Mask Used' AS format_mask
FROM dual
WHERE 1=0  -- This makes it show only headers

UNION ALL

SELECT '15-06-2023' AS input_string,
       TO_CHAR(TO_DATE('15-06-2023', 'DD-MM-YYYY'), 'DD-MON-YYYY') AS converted,
       'DD-MM-YYYY' AS format_mask
FROM dual

UNION ALL

SELECT 'June 15, 2023',
       TO_CHAR(TO_DATE('June 15, 2023', 'Month DD, YYYY'), 'DD-MON-YYYY'),
       'Month DD, YYYY'
FROM dual

UNION ALL

SELECT '2023-166' AS input_string,
       TO_CHAR(TO_DATE('2023-166', 'YYYY-DDD'), 'DD-MON-YYYY') AS converted,
       'YYYY-DDD (Day of Year)' AS format_mask
FROM dual;

-- 15. TO_CHAR with number formatting (bonus)
SELECT employee_id,
       first_name,
       salary,
       TO_CHAR(salary, '999,999.00') AS formatted_salary,
       TO_CHAR(salary, 'FM999,999.00') AS fm_salary,
       TO_CHAR(salary, '$999,999') AS currency_format,
       TO_CHAR(salary, '000,000.00') AS with_leading_zeros
FROM employees
WHERE department_id = 90;

-- 16. Error handling with TO_DATE
BEGIN
    DECLARE
        v_date DATE;
        v_invalid_date_string VARCHAR2(20) := '32-13-2023';  -- Invalid date
    BEGIN
        -- This will cause an error
        v_date := TO_DATE(v_invalid_date_string, 'DD-MM-YYYY');
        DBMS_OUTPUT.PUT_LINE('Date converted successfully');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error converting date: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Invalid date string: ' || v_invalid_date_string);
    END;
END;
/

-- 17. Real-world example: Converting different date formats from user input
WITH sample_date_inputs AS (
    SELECT '15/06/2023' AS date_string, 'DD/MM/YYYY' AS format_mask FROM dual UNION ALL
    SELECT '06-15-2023', 'MM-DD-YYYY' FROM dual UNION ALL
    SELECT 'June 15, 2023', 'Month DD, YYYY' FROM dual UNION ALL
    SELECT '2023-06-15', 'YYYY-MM-DD' FROM dual UNION ALL
    SELECT '15-JUN-23', 'DD-MON-YY' FROM dual
)
SELECT date_string,
       format_mask,
       TO_DATE(date_string, format_mask) AS converted_date,
       TO_CHAR(TO_DATE(date_string, format_mask), 'FMDay, FMMonth DDth, YYYY') AS formatted_output
FROM sample_date_inputs;