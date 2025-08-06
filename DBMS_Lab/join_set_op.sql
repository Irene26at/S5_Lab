				-- JOIN and SET operation  --
				---------------------------

-- 1. Display the result of performing left join between EMPLOYEE & PROJECT --

SELECT * FROM EMPLOYEE_CSB30 E LEFT JOIN PROJECT_CSB30 P ON E.PNO = P.PNO;

-- 2. Display the result of performing right join between EMPLOYEE & PROJECT --

SELECT * FROM EMPLOYEE_CSB30  E RIGHT JOIN PROJECT_CSB30  P ON E.PNO = P.PNO;

-- 3. Display the result of performing full join between EMPLOYEE & PROJECT --

SELECT * FROM EMPLOYEE_CSB30 E FULL OUTER JOIN PROJECT_CSB30  P ON E.PNO = P.PNO;

-- 4. Display the result of performing natural join between EMPLOYEE & PROJECT --

SELECT * FROM EMPLOYEE_CSB30 NATURAL JOIN PROJECT_CSB30;

-- 5. Display salary of employees with ENO as E1 and E3 (use UNION) --

SELECT SALARY FROM EMPLOYEE_CSB30 WHERE ENO = 'E1' UNION SELECT SALARY FROM EMPLOYEE_CSB30 WHERE ENO = 'E3';

-- 6. Display common salary (if any) of employees working in project P1 and P2 (use INTERSECT operator) --

SELECT SALARY FROM EMPLOYEE_CSB30 WHERE PNO = 'P1' INTERSECT SELECT SALARY FROM EMPLOYEE_CSB30 WHERE PNO = 'P2';

-- 7. Display different designations present in project P3 but not in P1 (use MINUS operator) --

SELECT DISTINCT DESIGNATION FROM EMPLOYEE_CSB30 WHERE PNO = 'P3' MINUS SELECT DISTINCT DESIGNATION FROM EMPLOYEE_CSB30 WHERE PNO = 'P1';




