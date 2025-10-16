
					-- TCL COMMANDS --
				-------------------------------------

-- 1. Create a table CLASS with attributes id (integer type) and name (text type)

CREATE TABLE CLASS (
    id INT,
    name VARCHAR(30)
);

-- 2. Insert 2 values to CLASS and save the entered values using commit operation.

INSERT INTO CLASS VALUES (1, 'Anandhu');
INSERT INTO CLASS VALUES (2, 'Bhavana');
COMMIT;

-- 3. Create two save points named A and B on insertion or updation of table CLASS

INSERT INTO CLASS VALUES (3, 'Chandru');
SAVEPOINT A;

INSERT INTO CLASS VALUES (4, 'Devika');
SAVEPOINT B;

-- 4. Display the contents of table CLASS before and after apply of rollback of save point B.

-- Before rollback to B
SELECT * FROM CLASS;

-- After rollback to B
ROLLBACK TO B;
SELECT * FROM CLASS;

-- 5. Display the contents of table CLASS after the rollback of save point A.

-- After rollback to A
ROLLBACK TO A;
SELECT * FROM CLASS;
