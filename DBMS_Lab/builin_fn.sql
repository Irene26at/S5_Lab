				-- BUILT IN FUNCTIONS --

-- 1. Display the name of employees in upper case --

SELECT UPPER(ENAME) FROM EMPLOYEE_CSB30;

-- 2. Display the name of employees in lower case --

SELECT LOWER(ENAME) FROM EMPLOYEE_CSB30;

-- 3. Display the name of employees in proper case --

SELECT INITCAP(ENAME) FROM EMPLOYEE_CSB30;

-- 4. Display the length of each employee name --

SELECT ENAME, LENGTH(ENAME) AS ENAME_Length FROM EMPLOYEE_CSB30;

-- 5. Display the name of employees and concatenate it with employee no --

SELECT ENAME || ' ' || ENO AS Employee_Info FROM EMPLOYEE_CSB30;

-- 6. Extract 3 characters starting from 2nd character from string ‘Oracle' --

SELECT SUBSTR('Oracle', 2, 3) FROM DUAL;

-- 7. Find the first occurrence of character ‘a’ in the string ‘COMPUTER MAINTENANCE’ --

SELECT INSTR('COMPUTER MAINTENANCE', 'A') FROM DUAL;

-- 8. Replace every occurrence of alphabet ‘a’ with ‘b’ in the string ‘MATHEMATICS’ --

SELECT REPLACE('MATHEMATICS', 'A', 'B') FROM DUAL;

-- 9. Display the first 3 characters of all the city in EMPLOYEE table --

SELECT CITY, SUBSTR(CITY, 1, 3) AS CITY_ABBR FROM EMPLOYEE_CSB30;

-- 10. Display your age in days (Employees )--

SELECT ENAME, AGE, AGE * 365 AS AGE_IN_DAYS FROM EMPLOYEE_CSB30;


-- 11. Display your age in months (Employees) --

SELECT ENAME, AGE, AGE * 12 AS AGE_IN_MONTHS FROM EMPLOYEE_CSB30;

-- 12. Display the current date and time --

SELECT SYSDATE FROM DUAL;

-- 13. Display the date 3 months before the current date --

SELECT ADD_MONTHS(SYSDATE, -3) FROM DUAL;

-- 14. Display the current date in the format ‘DATE-MONTH-YEAR’ --

SELECT TO_CHAR(SYSDATE, 'DD-MM-YY') AS formatted_date FROM DUAL;

-- 15. Mr/Ms ------ who is ----------- years old is residing in ---------- Display the details of employees in the given format. (Fill blanks with ENAME, AGE, CITY respectively) --

SELECT CASE WHEN SEX = 'M' THEN 'Mr' ELSE 'Ms' END || ' ' || ENAME || ' who is ' || TO_CHAR(AGE) || ' years old is residing in ' || CITY AS DETAIL FROM EMPLOYEE_CSB30;
