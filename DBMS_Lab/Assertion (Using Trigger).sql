---------------------------------------------------------
# Assertion not supported by oracle, use trigger instead!
---------------------------------------------------------

CREATE OR REPLACE TRIGGER limit_employee_count
BEFORE INSERT ON EMPLOYEE
DECLARE
    emp_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO emp_count FROM EMPLOYEE;
    IF emp_count >= 100 THEN
        DBMS_OUTPUT.PUT_LINE('Employee count cannot exceed 100.');
    END IF;
END;

---------------------------------------------------
# Delete the trigger after use
---------------------------------------------------

DROP TRIGGER limit_employee_count;