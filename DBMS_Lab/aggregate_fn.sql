						-- AGGREGATE FUNCTION --
						-------------------------

-- 1. List the maximum salary in EMPLOYEE --

SELECT MAX(SALARY) FROM EMPLOYEE_CSB30;

-- 2. List the minimum salary in EMPLOYEE --

SELECT MIN(SALARY) FROM EMPLOYEE_CSB30;

-- 3. List the total salary of all the employees in the EMPLOYEE table --

SELECT SUM(SALARY) FROM EMPLOYEE_CSB30;

-- 4. List the average salary in EMPLOYEE --

SELECT AVG(SALARY) FROM EMPLOYEE_CSB30;

-- 5. List the total number of employees in EMPLOYEE --

SELECT COUNT(*) FROM EMPLOYEE_CSB30;

-- 6. List the maximum salary paid to a ‘ACCOUNTANT’ --
--    INSERT INTO EMPLOYEE_CSB30 VALUES ('E7','WAYNE','ACCOUNTANT','M',20,80000,NULL,NULL,NULL); --

SELECT MAX(SALARY) FROM EMPLOYEE_CSB30 WHERE DESIGNATION='ACCOUNTANT';

-- 7. List the total salary paid to a ‘Manager’ --
--    INSERT INTO EMPLOYEE_CSB30 VALUES ('E8','MANU','MANAGER','M',20,50000,NULL,NULL,NULL); --

SELECT SUM(SALARY) FROM EMPLOYEE_CSB30 WHERE DESIGNATION = 'MANAGER';

-- 8. List the age of the senior most employee --

SELECT MAX(AGE) FROM EMPLOYEE_CSB30;

-- 9. List the age of the youngest employee --

SELECT MIN(AGE) FROM EMPLOYEE_CSB30;

-- 10. Display the details of employees in ascending order of their name --

SELECT * FROM EMPLOYEE_CSB30 ORDER BY ENAME ASC;

-- 11. Display the details of employees in descending order of salary --

SELECT * FROM EMPLOYEE_CSB30 ORDER BY SALARY DESC;

-- 12. Find the number of employees in each project --

SELECT PNO, COUNT(*) AS NUM_OF_EMPLOYEES FROM EMPLOYEE_CSB30 GROUP BY PNO;

-- 13. Find total, max, min, and average salary of employees joined for the project P1 and having average salary >1000 --

SELECT PNO, SUM(SALARY) AS TOTAL_SALARY, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEE_CSB30 WHERE PNO = 'P1' GROUP BY PNO HAVING AVG(SALARY) > 1000;
 
