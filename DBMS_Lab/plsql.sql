
							-- PL/SQL --
						-------------------------

-- a) To find sum of two numbers --

DECLARE
  num1 NUMBER;
  num2 NUMBER;
  sum_result NUMBER;
BEGIN
  num1 := &num1;
  num2 := &num2;
  sum_result := num1 + num2;
  DBMS_OUTPUT.PUT_LINE('Sum = ' || sum_result);
END;
/

-- b) To print even numbers up to a limit --

DECLARE
  n NUMBER;
  i NUMBER;
BEGIN
  n := &n;
  i := 0;
  WHILE (i < n)
  LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    i := i + 2;
  END LOOP;
END;
/

-- c) To find factorial of a number --

DECLARE
  num NUMBER;
  fact NUMBER;
  i NUMBER;
BEGIN
  num := &num;
  fact := 1;
  i := 1;
  FOR i IN 1..num
  LOOP
    fact := fact * i;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' = ' || fact);
END;
/

-- d) To display reverse of a number --

DECLARE
  num NUMBER;
  rev NUMBER;
  temp NUMBER;
BEGIN
  num := &num;
  rev := 0;
  temp := num;
  WHILE temp > 0 LOOP
    rev := rev * 10 + MOD(temp, 10);
    temp := FLOOR(temp / 10);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Reverse of ' || num || ' = ' || rev);
END;
/

-- e) To find sum of digits of a number --

DECLARE
  num NUMBER;
  sum_digits NUMBER;
  temp NUMBER;
BEGIN
  num := &num;
  sum_digits := 0;
  temp := num;
  WHILE temp > 0 LOOP
    sum_digits := sum_digits + MOD(temp, 10);
    temp := FLOOR(temp / 10);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Sum of digits of ' || num || ' = ' || sum_digits);
END;
/

-- f) To find area & perimeter of a circle --

DECLARE
  radius NUMBER;
  area NUMBER;
  perimeter NUMBER;
BEGIN
  radius := &radius;
  area := 3.14159 * radius * radius;
  perimeter := 2 * 3.14159 * radius;
  DBMS_OUTPUT.PUT_LINE('Area = ' || area);
  DBMS_OUTPUT.PUT_LINE('Perimeter = ' || perimeter);
END;
/
