
-- Change According to your Database columns and Questions --



-- 1.List the name of all employees

SELECT ENAME FROM EMPLOYEE_CSB30;

-- 2. List the name of employees who are working as ‘MANAGER’ & ‘ACCOUNTANT’

SELECT ENAME FROM EMPLOYEE_CSB30 WHERE DESIGNATION IN ('MANAGER', 'ACCOUNTANT');

-- 3. List the details of employees who has joined the company before 12th Sept 2016

SELECT * FROM EMPLOYEE_CSB30 WHERE DATEOFJOIN < TO_DATE('12-09-16', 'DD-MM-YY');

-- 4. List the detail of employees who have ENO as E2, E4, E6 & E8 --

SELECT * FROM EMPLOYEE_CSB30 WHERE ENO IN ('E2', 'E4', 'E6', 'E8');

-- 5. List the detail of all employees --

SELECT * FROM EMPLOYEE_CSB30;

-- 6. List the list of employees not working under project P2, P3 & P4 --

SELECT * FROM EMPLOYEE_CSB30 WHERE PNO NOT IN ('P2', 'P3', 'P4');

-- 7. List of employees who have joined the company between 1st July 2016 and 15th august 2018 –-

SELECT * FROM EMPLOYEE_CSB30 WHERE DATEOFJOIN BETWEEN TO_DATE('01-07-16', 'DD-MM-YY') AND TO_DATE('15-08-18', 'DD-MM-YY');

-- 8. List the different designation of employees --

SELECT DESIGNATION FROM EMPLOYEE_CSB30;

-- 9. List the employees who are not assigned to any project --
-- ADDING : INSERT INTO EMPLOYEE_CSB30 VALUES ('E6', 'ASIYA', NULL, 'F', NULL, NULL, NULL, NULL, NULL); --


SELECT * FROM EMPLOYEE_CSB30 WHERE PNO IS NULL;

-- 10. List the name of employees whose name either start or end with ‘S’ --

SELECT ENAME FROM EMPLOYEE_CSB30 WHERE ENAME LIKE 'S%' OR ENAME LIKE '%S';

-- 11. List the employees whose name have ‘A’ as the second character --

SELECT ENAME FROM EMPLOYEE_CSB30 WHERE ENAME LIKE '_A%';

-- 12. List the employee whose name begin & end with ‘A’ & has at least 3 characters --

SELECT ENAME FROM EMPLOYEE_CSB30 WHERE ENAME LIKE 'A%A' AND LENGTH(ENAME) >= 3;

-- 13. List the employee whose salary in the range of (100000 - 255000) --
--     UPDATE EMPLOYEE_CSB30 SET SALARY=250000 WHERE ENAME='ASIYA'; --

SELECT ENAME FROM EMPLOYEE_CSB30 WHERE SALARY BETWEEN 100000 AND 255000;

-- 14. Remove the details of employee whose age is greater than 60 --
--     UPDATING: UPDATE EMPLOYEE_CSB30 SET AGE=65 WHERE ENAME='ASIYA'; --

DELETE FROM EMPLOYEE_CSB30 WHERE AGE > 60;


-- 15. Provide 20% increment in salary for all employees whose salary is in the range of 100000 & 250000 --

UPDATE EMPLOYEE_CSB30 SET SALARY = SALARY * 1.20 WHERE SALARY BETWEEN 100000 AND 250000;

-- 16. List the detail of employee whose name contains ‘H’ as the second character --

SELECT * FROM EMPLOYEE_CSB30 WHERE ENAME LIKE '_H%';
