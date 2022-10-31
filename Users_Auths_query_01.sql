-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);

INSERT INTO auth_names (AUTH_NAME, UNIQUE_ID)
VALUES ('GUEST', 'B1');
INSERT INTO auth_names (AUTH_NAME, UNIQUE_ID)
VALUES ('ADMIN', 'B2');
INSERT INTO auth_names (AUTH_NAME, UNIQUE_ID)
VALUES ('MANAGER', 'B3');

-- DELETE FROM table_name WHERE condition;
DELETE FROM auth_names
WHERE UNIQUE_ID = 'B1';

DELETE FROM auth_names
WHERE AUTH_NAME = 'MANAGER';

DELETE FROM auth_names
WHERE UNIQUE_ID IN ('B2');

-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition;
UPDATE auth_names
SET AUTH_NAME = 'GUEST_01';
#WHERE condition;

UPDATE auth_names
SET AUTH_NAME = 'GUEST'
WHERE UNIQUE_ID = 'B1';

UPDATE auth_names
SET AUTH_NAME = 'ADMIN'
WHERE UNIQUE_ID = 'B2';

SELECT *
FROM auth_names;