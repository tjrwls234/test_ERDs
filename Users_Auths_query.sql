-- users 회원가입
INSERT INTO users(UNIQUE_ID, NAME, EMAIL, JOB)
VALUE ('U1', 'Paul', 'paul01@gmail.com', 'IT Billing')
;
INSERT INTO users(UNIQUE_ID, NAME, EMAIL, JOB)
VALUE ('U2', 'Allen', 'texas@imfblog.org', 'Engineering')
;
INSERT INTO users(UNIQUE_ID, NAME, EMAIL, JOB)
VALUE ('U3', 'Teddy', 'norway@iotm.com', 'IT Billing')
;
INSERT INTO users(UNIQUE_ID, NAME, EMAIL, JOB)
VALUE ('U4', 'Paul', 'paul_p@naver.com', 'Developer')
;

-- auth 접근권한
INSERT auth_names(AUTH_NAME, UNIQUE_ID)
VALUE ('GUEST', 'B1')
;
INSERT auth_names(AUTH_NAME, UNIQUE_ID)
VALUE ('ADMIN', 'B2')
;
INSERT auth_names(AUTH_NAME, UNIQUE_ID)
VALUE ('MANAGER', 'B3')
;

-- 접근권한들
INSERT auths(UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
VALUE ('U1', 'B1')
;
INSERT auths(UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
VALUE ('U1', 'B2')
;
INSERT auths(UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
VALUE ('U2', 'B1')
;
INSERT auths(UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
VALUE ('U2', 'B2')
;
INSERT auths(UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
VALUE ('U2', 'B3')
;
INSERT auths(UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
VALUE ('U3', 'B1')
;
INSERT auths(UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
VALUE ('U4', 'B1')
;
INSERT auths(UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
VALUE ('U4', 'B2')
;

-- 회원 탈퇴
-- DELETE FROM auths
-- WHERE UNIQUE_ID_USERS = 'U2'
-- ;
-- DELETE FROM auths
-- WHERE UNIQUE_ID_USERS = 'U4'
-- ;

-- DELETE FROM users
-- WHERE UNIQUE_ID = 'U2'
-- ;
-- DELETE FROM users
-- WHERE UNIQUE_ID = 'U4'
-- ;

-- ---------------

-- table 확인
SELECT *
FROM users
;

SELECT *
FROM auth_names
;

SELECT *
FROM auths
;


-- Join
-- +1 : users와 auths JOIIN하며,
-- UNIQUE_ID = Paul인 것을 표시 내용은 이름, 이메일, 권한 ID ?
SELECT users.NAME, users.EMAIL, auths.UNIQUE_ID_AUTH_NAMES
FROM users
INNER JOIN auths
ON users.UNIQUE_ID = auths.UNIQUE_ID_USERS
AND NAME = 'Paul'
;

-- INNER JOIN
-- + 4-1: 이름, 이메일, 권한이름 표시 ?
SELECT users.NAME, users.EMAIL, auth_names.AUTH_NAME
FROM (users INNER JOIN auths
ON users.UNIQUE_ID = auths.UNIQUE_ID_USERS
AND users.NAME IN ('Teddy', 'Allen')) INNER JOIN auth_names
 ON auths.UNIQUE_ID_AUTH_NAMES = auth_names.UNIQUE_ID
;



