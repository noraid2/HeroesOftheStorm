
/*
[1일차 수업]
1. 오라클 소프트웨어 다운로드
Oracle Database Express Edition 11g Release 2
https://www.oracle.com/database/technologies/xe-prior-releases.html

개발툴
https://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (무료설치)

3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4.Sqlplus 프로그램 제공(CMD) : GUI 환경 일반개발자 사용 불편

5.별도의 Tool 설치 무료(SqlDeveloper)  ,
                 유료,무료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : bit
실습 환경 구성
-- USER SQL
CREATE USER bit IDENTIFIED BY 1004
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bit QUOTA UNLIMITED ON USERS;

-- ROLES
GRANT "CONNECT" TO bit WITH ADMIN OPTION;
GRANT "RESOURCE" TO bit WITH ADMIN OPTION;


-- SYSTEM PRIVILEGES
CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );



INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;

CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/


SELECT * FROM emp;

SELECT * FROM dept;

SELECT * FROM salgrade;
/*
SELECT [DISTINCT]  {*, column [alias], . . .}  중괄호는 반드시 넣어야함
FROM  table_name   [WHERE  condition]   대괄호는 생략 가능
[ORDER BY {column, expression} [ASC | DESC]]; 
*/
--1.사원 테이블에서 모든 데이터를 출력하세요
SELECT * FROM EMP; --QUERY 문장은 대소문자 구별 안함(질의어)
--2. 특정 컬럼 데이터 출력하기
SELECT EMPNO, ENAME, SAL  FROM EMP;
SELECT ENAME FROM EMP;
--3. 컬럼에 가명칭(별칭)(ALIAS) 부여하기
SELECT EMPNO 사번, ENAME 이름
FROM EMP;

SELECT EMPNO "사    번", ENAME "이    름"
FROM EMP;
--기본적으로 가명칭에는 STRING처럼 ""를 붙인다
--정식(표준)(ANSI 문법)
SELECT EMPNO AS"사  번", ENAME AS "이  름"
FROM EMP;

--ORACLE 데이터 관리(문자열 : 대소문자 엄격하게 구분)
--문자열 표기('문자열')
--소문자 'a'와 대문자 'A'는 다르다.
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME = 'KING';

--ORACLE SQL언어 : 연산자 있음(결합연산자(||), 산술연산자(+)) 구분
--JAVA의 + (숫자 + 숫자 >> 연산)
--JAVA + (문자열 + 문자열 >> 결합)
--TIP) MS-SQL(+연산, 결합 둘다함(자바처럼))

SELECT '사원의 이름은 ' || ENAME || ' 입니다' AS "사원정보"
FROM EMP;

--EMPNO, ENAME = 컬럼 >> 타입 갖고있음(자바의 변수)
--타입(자료형) : 숫자, 문자(문자열), 날짜....
DESC EMP;
/*
테이블의 기본 정보(컬럼명, NULL 허용 여부, 타입)

이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER       
HIREDATE          DATE         
SAL               NUMBER       
COMM              NUMBER       
DEPTNO            NUMBER       

*/
SELECT EMPNO || ENAME--숫자 || 문자열(내부적으로 숫자 -> 문자열로 형변환)
FROM EMP;

SELECT EMPNO+ENAME --ORA-01722: invalid number (타입에 대한 산술 오류)
FROM EMP;

--사장님..우리회사에 직종이 몇개있는가
SELECT JOB FROM EMP;
--DISTINCT : 중복 데이터 제거하고 출력
--DISTINCT : GROUPING 논리로 데이터 처리
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT JOB, DEPTNO FROM EMP ORDER BY JOB;
SELECT DISTINCT JOB, DEPTNO FROM EMP ORDER BY DEPTNO;

--ORACLE, JAVA 언어
--연산자들 거의 동일(+,*,-...)
--% 자바에선 나머지 구하기, % 오라클에서는 연산자(검색 패턴)
--오라클에선 연산자 다 같은데(+,-,*,/) 나머지 구하기만 함수로 구현됨 >> MOD()
--사원테이블에서 사원의 급여를 100딸라 인상안 결과를 출력
--DESC EMP;
SELECT EMPNO, SAL, SAL + 100 AS"인상급여" FROM EMP;

--DUAL 임시 테이블
SELECT 100+100 FROM DUAL;
SELECT 100||100 FROM DUAL;--내부적으로 형변환 후 결합
SELECT '100'+100 FROM DUAL;--+연산자로 산술이 가능하면 형변환 후 연산
SELECT '100A' + 100 FROM DUAL;--ORA-01722: invalid number

--비교연산자
-- > < <= >=
--JAVA 같아(==) 할당(=)
--ORACLE 같다(=) 같지 않다(!=)

--논리연산자 
--AND, OR, NOT

--조건절(원하는 ROW(줄)만 가져오겠다)
SELECT *
FROM emp
WHERE SAL >= 3000;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 3000;

--이상, 이하 =포함
--초과, 미만 = 없음

--사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력
--관리자, 개발자, 튜닝, 설계
--실행순서 : 
SELECT  EMPNO, ENAME, JOB , hiredate--3번째 실행 여기서 2차로 필요한것만 뽑아옴
FROM EMP                            --1번째 실행 여기서 데이터를 전부 메모리에 올림
WHERE EMPNO = 7788;                 --2번째 실행 여기서 1차로 거름

--사원의 이름이 KING인 사원의 사번, 이름, 급여 정보를 출력
SELECT EMPNO, ENAME, SAL
FROM emp
WHERE ENAME = 'KING';

--논리(AND, OR)
--급여가 2000이상이면서 직종이 MANAGER인 사원의 모든 정보를 출력
--두가지 조건을 모두 만족하는 데이터(둘다 참)
SELECT *
FROM EMP
WHERE SAL > 2000 AND JOB = 'MANAGER';

--급여가 2000이상이거나 직종이 MANAGER인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE SAL > 2000 OR JOB = 'MANAGER';

--오라클 날짜(DB서버의 날짜)
--오라클 날짜 함수(SYSDATE)
SELECT SYSDATE FROM DUAL;
--20/03/31

--현재 접속한 사용자가 날짜 형식을 'YYYY-MM-DD HH24:MI:SS' 로 보도록 수정하겠다.
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
SELECT * FROM SYS.nls_session_parameters;--시스템 설정을 가지고 있는 환경 테이블
--NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
--NLS_DATE_LANGUAGE	KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF
SELECT SYSDATE FROM DUAL;

SELECT HIREDATE FROM EMP;
--입사일이 1980-12-17인 사원의 모든 정보를 출력
SELECT * FROM EMP WHERE HIREDATE = '1980-12-17';

SELECT * FROM EMP WHERE HIREDATE = '80-12-17';
--형식 : RR-MM-DD >> YYYY-MM-DD

--사원의 급여가 2000 이상이면서 4000 이하인 모든 사원의 정보를 출력
SELECT *
FROM EMP
WHERE SAL >= 2000 AND SAL <= 4000;
--연산자 BETWEEN A AND B (= 포함)-> 미만, 초과는 사용못함
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 4000;
--사원의 급여가 2000 초과이고 4000 미만인 모든 사원의 정보를 출력
SELECT *
FROM EMP
WHERE SAL > 2000 AND SAL < 4000;

--부서번호가 10 또는 20 또는 30번인 사원의 사번, 이름 , 급여, 부서번호를 출력
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO =10 OR deptno = 20 OR deptno = 30;
-- IN 연산자
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(10,20,30);
--IN 연산자를 풀어쓸줄 알아야한다 : WHERE DEPTNO =10 OR deptno = 20 OR deptno = 30;

--부서번호가 10 또는 20이 아닌 사원의 사번, 사원의 이름, 급여, 부서번호를 출력하세요
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO NOT IN(10,20);
--IN의 부정은 NOT IN(값 AND 값 AND...)

--POINT : ORACLE 값 표현(데이터가 없다) >> NULL
--NULL 때문에 고생 존나함
CREATE TABLE MEMBER (
    USERID VARCHAR2(20) NOT NULL, --필수입력
    NAME VARCHAR2(20) NOT NULL,--필수입력
    HOBBY VARCHAR2(50)--아무것도 안쓰면 DEFAULT로 NULL을 넣음(NULL 값을 허용 = 데이터 안받아도됨)
    
);
SELECT * FROM MEMBER;
INSERT INTO MEMBER(USERID,HOBBY) VALUES('HONG', '농사');
--cannot insert NULL into ("BIT"."MEMBER"."NAME")
INSERT INTO MEMBER(USERID,NAME) VALUES('HONG', '홍길동');
--HOBBY 칼럼의 데이터는 NULL 로 자동으로 설정됨
INSERT INTO MEMBER(USERID,NAME,HOBBY) VALUES('KIM', '김씨','게임');
COMMIT;

SELECT * FROM MEMBER;

--수당을 받지 않는 모든 사원의 정보를 출력하세여
--0도 데이터 취급(받는 조건에 포함)
--COMM컬럼에 데이터가 NULL인 것만
SELECT *
FROM EMP
WHERE COMM =NULL;--틀림

--null의 비교는
SELECT * FROM EMP WHERE COMM IS NULL;
--이렇게 함(IS NULL, IS NOT NULL)

--수당을 받는 모든 사원의 정보를 출력
SELECT * FROM EMP WHERE COMM IS NOT NULL;

--사원 테이블에서 사번, 이름, 급여, 수당, 총급여를 출력
--총급여 : 급여+수당
SELECT EMPNO, ENAME, SAL, COMM, SAL+NVL(COMM,0) AS "TOTAL INCOME"
FROM EMP;

--POINT >> NULL
--1. NULL과의 모든 연산은 그 결과가 NULL이다.
--2. 위 문제 해결 : NVL(), NVL2() -> NULL 값을 다른 값으로 바꿈(REPLACE)
--TIP MS-SQL -> CONVERT()
--    MY-SQL -> IFNULL()

SELECT NULL+100 FROM DUAL;
SELECT 100+NVL(NULL,0) FROM DUAL;

SELECT COMM, NVL(COMM,111)FROM EMP;

--사원의 급여가 1000 이상이고 수당을 받지 않는 사원의 사번, 이름, 직종, 급여, 수당을 출력
SELECT EMPNO, ENAME, JOB, SAL, COMM
FROM EMP
WHERE SAL >= 1000 AND COMM IS NULL;
------------------------------------------------------------------
--DQL(DATA QUERY LANGUAGE) : SELECT(60%)
--DDL : CREATE, ALTER, DROP(객체(테이블) 생성, 수정, 삭제)(30%)
--DML : INSERT, UPDATE, DELETE(데이터 조작)(10%)

--JAVA : class Board{private boardno int}
--oracle : create table Board (boardno number not null)

CREATE TABLE BOARD(
    BOARDID NUMBER NOT NULL,--숫자 필수 입력
    TITLE VARCHAR2(20) NOT NULL, --한글 10자, 영문 특수문자 공백은 20자 , 필수입력
    CONTENT VARCHAR(2000)NOT NULL,--필수입력
    HP VARCHAR2(20) --DEFAULT NULL 허용(필수입력 아님)
);

DESC BOARD;

--DML(데이터 조작어) 실 반영 여부를 결정해야함
--INSERT
--UPDATE
--DELETE
--반드시 그 결과를 반영할지 취소할지 결정해야함
--COMMIT(실제 반영함)
--ROLLBACK(실제 반영을 취소)--마지막 COMMIT 시점으로 돌아간다

INSERT INTO BOARD(BOARDID, TITLE, CONTENT)
VALUES(100, 'ORACLE', 'SIBAL');
COMMIT;

SELECT * FROM BOARD;

INSERT INTO BOARD(BOARDID, TITLE, CONTENT)
VALUES(200, 'JAVA', '그립긴 개뿔');
SELECT * FROM BOARD;
ROLLBACK;

CREATE TABLE CLAUDIOFRAMEDATA(
    NAME VARCHAR2(40) NOT NULL,
    STARTFRAME NUMBER NOT NULL,
    COMMAND VARCHAR2(40) NOT NULL,
    DAMAGE NUMBER NOT NULL,
    HITFRAME NUMBER NOT NULL,
    GUARDFRAME NUMBER NOT NULL,
    HITLEVEL VARCHAR2 (20) NOT NULL,
    OTHERS VARCHAR2(100) NOT NULL
    
);
INSERT INTO claudioframedata(NAME, STARTFRAME, COMMAND, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('ERA', 17, '666RP', 40, 99, 7, 'HIGH', 'TO STARBUST');
SELECT * FROM claudioframedata;

INSERT INTO claudioframedata(NAME, STARTFRAME, COMMAND, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('SHINING RAY', 17, '4RKRP', 30, 99, -12, 'MIDDLE', 'TO STARBUST');

INSERT INTO claudioframedata(NAME, STARTFRAME, COMMAND, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('RAGE ARTS', 20, 'IN RAGE 3AP', 55, 99, -22, 'MIDDLE','LOWER HP, HIGHER DAMAGE');

INSERT INTO claudioframedata(NAME, STARTFRAME, COMMAND, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('RAGE DRIVE', 17, 'IN RAGE 4RKRP6~', 32, 99, 7, 'MIDDLE', 'TO STARBUST');

INSERT INTO claudioframedata(NAME, STARTFRAME, COMMAND, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('AKEDIA', 24, '1LK', 22, 4, -17, 'LOW', 'DODGES HIGH');

INSERT INTO claudioframedata(NAME, STARTFRAME, COMMAND, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('SKY SLASH NOVA', 15, '9RK', 13, 999, -13, 'MIDDLE', 'DODGES LOW FROM 12F');

INSERT INTO claudioframedata(NAME, STARTFRAME, COMMAND, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('NOVA EXPLOSION', 21, 'IN STARBUST 1AP', 40, 99, 0, 'MIDDLE, CANNOT GUARD', 'CAN USE WITHOUT STARBUST');
SELECT * FROM CLAUDIOFRAMEDATA;


CREATE TABLE PAULFRAMEDATA2(
    NAME VARCHAR2(40) NOT NULL,
    COMMAND VARCHAR2(40) NOT NULL,
    STARTFRAME NUMBER NOT NULL,
    DAMAGE NUMBER NOT NULL,
    HITFRAME NUMBER NOT NULL,
    GUARDFRAME NUMBER NOT NULL,
    HITLEVEL VARCHAR2 (20) NOT NULL,
    OTHERS VARCHAR2(100) NOT NULL
    
);
INSERT INTO PAULFRAMEDATA2(NAME, COMMAND ,STARTFRAME, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('RAGE ARTS','IN RAGE AP', 20, 55, 99, -22, 'MIDDLE', 'CANCEL WITH 4~, LOWER HP, HIGHER DAMAGE');

INSERT INTO PAULFRAMEDATA2(NAME, COMMAND ,STARTFRAME, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('RAGE DRIVE','IN RAGE 236AP', 12, 40, 99, +3, 'MIDDLE', '60 DMG WHEN CLEAN HIT');

INSERT INTO PAULFRAMEDATA2(NAME, COMMAND ,STARTFRAME, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('붕권','236RP', 15, 36, 99, -17, 'MIDDLE', '54 DMG WHEN CLEAN HIT');

INSERT INTO PAULFRAMEDATA2(NAME, COMMAND ,STARTFRAME, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('벽력장','2RKRPAP(JUST)', 15, 58, 99, -31, 'LOW, MIDDLE, MIDDLE', 'NEED JUST');

DELETE CLAUDIOFRAMEDATA;
COMMIT;

CREATE TABLE BOARD(
BOARDID NUMBER NOT NULL,
TITLE VARCHAR2(20) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
HP VARCHAR2(20)
);

SELECT * FROM BOARD;

INSERT INTO BOARD(BOARDID, TITLE, CONTENT)
VALUES(100,'ORACLE','할만함');
COMMIT;

INSERT INTO BOARD(BOARDID, TITLE, CONTENT)
VALUES(200,'JAVA','그립다');

COMMIT;
ROLLBACK;
SELECT BOARDID, NVL(HP,'EMPTY')AS"HP"FROM BOARD;

--문자열 검색
--주소 검색 : [역] 입력 >> 역삼동, 역동...(LIKE 패턴 검색)
--문다열 패턴 검색 연산자 : LIKE
--LIKE 연산자 도움(와일드 카드 문자(% : 모든 것, _ : 한 문자) 결합)

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%A%';--ENAME 컬럼의 데이터 중에서 A라는 글자가 들어있는 모든 사원을 찾는다.

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%a%';--대소문자 엄격하게 구분함

SELECT ENAME FROM EMP WHERE ENAME LIKE '%S';--이름의 마지막 글자가 S인 사람

SELECT ENAME FROM EMP WHERE ENAME LIKE '%LL%';--LL 붙어있어야함

SELECT ENAME FROM EMP WHERE ENAME LIKE'%L%L%';--L이 2개 있으면 됨

SELECT ENAME FROM EMP WHERE ENAME LIKE '%A%A%';--ADAMS

SELECT ENAME FROM EMP WHERE ENAME LIKE '_A%';--첫 글자는 어떤것이 와도 상관없고, 두번째 글자는 반드시 A가 와라.(두번째 글자가 A로 시작하는 모든 것
--WARD
--MARTIN
--JAMES

--정규표현식
--REGEXP_LIKE
SELECT * FROM EMP WHERE REGEXP_LIKE(ENAME, '[A-C]');
--정규표현 예제 5개 만들기 (추후에 카페에 과제 올림)
----------------------------------------------------------------
--데이터 정렬하기
--ORDER BY 컬럼명 : 문자열, 숫자, 날짜
--오름차순(ASC) : 낮은순(디폴트값임)
--내림차순(DESC) : 높은순

SELECT *
FROM EMP
ORDER BY SAL;

SELECT *
FROM EMP
ORDER BY SAL ASC;

--급여를 많이 받는 순으로 정렬해서 출력

SELECT *
FROM EMP
ORDER BY SAL;

--입사일이 가장 늦은 순으로 정렬해서 사번 이름 급여 입사일 데이터 출력
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;
/*
SELECT      3
FROM        1
WHERE       2
ORDER BY    4(SELECT 결과를 정렬) >> DB에서 가장 힘든 작업
*/

SELECT EMPNO, ENAME, SAL, JOB, HIREDATE
FROM EMP
WHERE JOB = 'MANAGER'
ORDER BY HIREDATE DESC;
--해석 : EMP 테이블에서 직책이 MANAGER인 사람의 사번, 이름, 보수, 직책, 입사일을 입사일에 따라 내림차순으로 출력해라.

--ORDER BY 컬럼명 DESC, 컬럼명 ASC, 컬럼명 DESC
SELECT JOB, DEPTNO
FROM EMP
ORDER BY JOB ASC, DEPTNO DESC;--GROUPING 원리

SELECT JOB, DEPTNO
FROM EMP
ORDER BY DEPTNO DESC, JOB ASC;

---------------------------------------------------
--연산자
--합집합(UNION) : 테이블과 테이블의 데이터를 합치는 것(기본적으로 중복값 배제함)
--UNION ALL : 중복값 허용함

CREATE TABLE UTA(NAME VARCHAR2(20));

INSERT INTO UTA(NAME) VALUES('AAA');
INSERT INTO UTA(NAME) VALUES('BBB');
INSERT INTO UTA(NAME) VALUES('CCC');
INSERT INTO UTA(NAME) VALUES('DDD');

COMMIT;

SELECT * FROM UTA;

CREATE TABLE UT(NAME VARCHAR2(20));

INSERT INTO UT(NAME) VALUES('AAA');
INSERT INTO UT(NAME) VALUES('BBB');
INSERT INTO UT(NAME) VALUES('CCC');


COMMIT;
SELECT * FROM UT;
--UNION

SELECT * FROM UT
UNION
SELECT * FROM UTA;

SELECT * FROM UT
UNION ALL
SELECT * FROM UTA;

--UNION
--1. 대응되는 [컬럼의 타입]이 동일해야 함.
SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DNAME, DEPTNO FROM DEPT;
--expression must have same datatype as corresponding expression

SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DEPTNO, DNAME FROM DEPT;

--2. 대응되는 컬럼의 갯수가 동일(NULL이 여기선 쓸만함)
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC FROM DEPT;
--query block has incorrect number of result columns
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC, NULL FROM DEPT;

--실무 >> SUBQUERY (IN LINE VIEW)
SELECT *
FROM (
    SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DEPTNO, DNAME FROM DEPT
    )ORDER BY EMPNO DESC;
--여기까진 초보 걸음마수준...의무적으로 해야함...테이블한개(단일테이블)
--------------------------------------------------
--오라클 함수

/*
딘일 행 함수의 종류
1.문자형 함수 : 문자를 입력 받고 문자와 숫자값 모두 리턴할수있음
2. 숫자형 함수 : 숫자를 입력받고 숫자를 리턴함
3.날짜형 함수 : 날짜형에 대해 수행사고
*/
/*
SELECT * FROM SYS.nls_database_parameters;
--NLS_CHARACTERSET	AL32UTF8 한글 3바이트 인식
--K01KSC5601 2바이트(근데 변환하면 깨짐)
SELECT * FROM SYS.nls_database_parameters WHERE PARAMETER LIKE '%CHAR%';
*/
--문자열 함수
SELECT INITCAP('THE SUPER MAN') FROM DUAL;--첫글자 대문자로 만들어줌

SELECT LOWER('AAA'), UPPER('aaa')FROM DUAL;

SELECT ENAME, LOWER(ENAME) AS "ENAME" FROM EMP;

SELECT * FROM EMP WHERE LOWER(ENAME) = 'king';

--문자열 개수
SELECT LENGTH('abc')FROM DUAL;--3개

SELECT LENGTH('홍길동')FROM DUAL;--3개
SELECT LENGTH(' 홍 A길 동')FROM DUAL;--7개

--결합 연산자 ||
--CONCAT()
SELECT 'A' || 'B' || 'C' AS "DATA" FROM DUAL;

SELECT CONCAT('a', 'b')FROM DUAL;--AB

SELECT CONCAT(ENAME,JOB)AS "CONCAT" FROM EMP;--SMITHCLERK

/*사원테이블에서 ENAME칼럼 데이터 출력 : 첫글자는 소문자 나머지문자는 대문자
))휘 결과를 하나의 컬럼으로 출력(이름은 FULLAME


*/
--LPAD, RPAD(채우기)
SELECT LPAD('ABC',10,'*')FROM DUAL;
SELECT RPAD('ABC',10,'*')FROM DUAL;

--EMP테이블에서ENAME 컬럼의 데이터를 출력하는데 첫글자만 출력하고 나머지 *로 표기.
SELECT RPAD(SUBSTR(ENAME, 1,1),LENGTH(ENAME),'*')AS "ENAME"
FROM EMP;




CREATE TABLE MEMBER2(
    ID NUMBER,
    JUMIN VARCHAR2(14)

);
INSERT INTO MEMBER2(ID,JUMIN) VALUES(100,'123456-1234567');
INSERT INTO MEMBER2(ID,JUMIN) VALUES(200,'234567-1234567');

COMMIT;
SELECT * FROM MEMBER2;
--하나의 컬럼으로 결과값을 출력
--100 : 123456-*******
--200 : 234567-*******
--결과의 컬럼명은 "JUMINNUMBER"
SELECT ID || ' : ' || RPAD(SUBSTR(JUMIN,1,7),LENGTH(JUMIN),'*') AS "JUMINNUMBER"
FROM MEMBER2;

--RTRIM 함수
--LTRIM 함수
--오른쪽/왼쪽 문자를 지워라

SELECT RTRIM('MILLER', 'ER') FROM DUAL;--MILL
SELECT LTRIM ('MILLLLLLLLER', 'MIL')FROM DUAL;--ER
--중복값도 같이 지움

SELECT '>' || RTRIM('MILLER          ',' ')|| '<' FROM DUAL;
-->MILLER<
--치환함수(REPLACE)
SELECT ENAME, REPLACE(ENAME, 'A','와우') FROM EMP;
--SMITH	SMITH
--ALLEN	와우LLEN
--WARD	W와우RD
----------------------------------------------------
--숫자 함수
--ROUND(반올림)
--TRUNC(절삭함수)
--MOD()나머지 구함

--   -3 -2  -1  0   1   2   3...
SELECT ROUND(12.345,0) AS "R" FROM DUAL;--0이 파라미터로 오면 정수부만 남겨라 --12
SELECT ROUND(12.567,0) AS "R" FROM DUAL;-- 13
SELECT ROUND(12.345,1) AS "R" FROM DUAL;--12.3
SELECT ROUND(12.567,1) AS "R" FROM DUAL;--  소수점 몇번째 자리까지 남겨라     12.6

SELECT ROUND(12.567,-1) AS "R" FROM DUAL;--10
SELECT ROUND(15.567,-1) AS "R" FROM DUAL;--20


--TRUNC(절삭함수)
SELECT TRUNC(12.345,0) AS "R" FROM DUAL;--0이 파라미터로 오면 정수부만 남겨라 --12
SELECT TRUNC(12.567,0) AS "R" FROM DUAL;-- 12
SELECT TRUNC(12.345,1) AS "R" FROM DUAL;--12.3
SELECT TRUNC(12.567,1) AS "R" FROM DUAL;--  소수점 몇번째 자리까지 남겨라     12.5

SELECT TRUNC(12.567,-1) AS "R" FROM DUAL;--10
SELECT TRUNC(15.567,-1) AS "R" FROM DUAL;--10
SELECT TRUNC(15.567,-2) AS "R" FROM DUAL;--0

--나머지
SELECT 12/10 FROM DUAL;--1.2
SELECT MOD(12,10) FROM DUAL;--2 나머지는 연산자가 아니라 함수로 구현

SELECT MOD(0,0)FROM DUAL;  --0

----------------------------------------------------------
--날짜함수
SELECT SYSDATE FROM DUAL;
--날짜 연산(POINT)
--DATE+NUMBER >> DATE
--DATE-NUMBER >> DATE
--DATE-DATE >> NUMBER(일수)

SELECT HIREDATE FROM EMP;

SELECT MONTHS_BETWEEN('2018-01-01','2010-01-01')FROM DUAL;--몇개월 차이?//96
SELECT MONTHS_BETWEEN(SYSDATE,'2010-01-01')FROM DUAL;--123

SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'2010-01-15'),1)FROM DUAL;
--122.565020161290322580645161290322580645
--122.6
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,'2010-01-15'),1)FROM DUAL;--122.5

--POINT
--날짜 형식의 문자열을 날짜로 바꾸는 함수(TO_DATE())

SELECT TO_DATE('2020-04-01')+100 FROM DUAL;--2020-07-10 00:00:00
SELECT TO_DATE('2020-04-01')-100 FROM DUAL;--2019-12-23 00:00:00

SELECT SYSDATE + 1000 FROM DUAL;--2022-12-27 12:26:46

--QUIZ
--1. 사원 테이블에서 사원들의 입사일에서 현재날짜까지 근속월수를 구하세요
--단 근속월수는 정수부분만 출력하셈
SELECT ENAME,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE),0)AS "근속월수" FROM EMP;


--2.한달이 31일이라는 기준에서 근속일수를 구하셈(반올림 ㄴ)
--(날짜 - 날짜 >> 150일)함수 ㄴ
SELECT ENAME, TRUNC((SYSDATE - HIREDATE)/31,0)AS "근속월수" FROM EMP;
------------------------------------------------------------------------

--변환함수 : TODAY POINT
--ORACLE에서 다루는 데이터 형식 : 문자, 숫자, 날짜
--TO_CHAR() : 숫자->문자(1000->$1000), 날짜->문자(2020-01-01 -> 2020년 01월 01일) = FORMATTING

--TO_DATE() : 문자 -> 날짜 >> SELECT '2020-12-12'+100 
--                          SELECT TO_DATE('2020-12-12')+100

--TO_NUMBER() : 문자 -> 숫자(내부 자동 형변환)
SELECT '100' + 100 FROM DUAL;
SELECT TO_NUMBER('100')+100 FROM DUAL;

--TO_NUMBER (문자 -> 숫자) 자동 형변한
SELECT '1' + 100 FROM DUAL;
SELECT TO_NUMBER('1')+100 FROM DUAL;

--TO_CHAR() : FORMAT >> 숫자 ,날짜(형식문자
SELECT TO_CHAR(SYSDATE)|| '일' FROM DUAL;--2020-04-01 12:55:27일
--PDF 69p 형식문자표
SELECT SYSDATE , TO_CHAR(SYSDATE, 'YYYY')||'년' AS "YYYY",
                TO_CHAR(SYSDATE, 'YEAR'),
                 TO_CHAR(SYSDATE, 'MM'),
                  TO_CHAR(SYSDATE, 'DD'),
                   TO_CHAR(SYSDATE, 'DY')
                   FROM DUAL;
--2020-04-01 12:57:22	2020년	TWENTY TWENTY	04	01	수

--입사일이 12월인 사원들의 사번, 이름, 입사일, 입사년도, 입사월을 출력
SELECT EMPNO, ENAME, HIREDATE, TO_CHAR(HIREDATE, 'YYYY')||'년' AS "입사년도", TO_CHAR(HIREDATE, 'MM')||'월'AS "입사월"
FROM EMP
WHERE TO_CHAR(HIREDATE, 'MM')= '12';

SELECT TO_CHAR(HIREDATE, 'YYYY MM DD') FROM EMP;
--1980 12 17
SELECT TO_CHAR(HIREDATE, 'YYYY"년" MM"월" DD"일"') FROM EMP;
--1980년 12월 17일

--TO_CHAR() 숫자 -> 문자로(형식문자)
--PDF FILE 71p 표
--100000 > 출력 >> $100,000(문자)

SELECT '>'||TO_CHAR(12345, '9999999999')||'<' FROM DUAL;
-->      12345<
SELECT '>'||TO_CHAR(12345, '09999999999')||'<' FROM DUAL;
--> 00000012345<
SELECT '>'||TO_CHAR(12345, '$9,999,999,999')||'<' FROM DUAL;
>        $12,345<

SELECT SAL, TO_CHAR(SAL, '$999,999')FROM EMP;
--800	     $800
--1600	   $1,600
--1250	   $1,250
COMMIT;
--HR 계정 전환
SELECT *FROM employees;

/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
SELECT FIRST_NAME || ' ' || LAST_NAME AS "FULL NAME", TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')AS "HIREDATE",
TO_CHAR(SALARY*12, '$999,999')AS "YEONBONG", TO_CHAR(TRUNC((SALARY*12)*1.1,0), '$999,999') AS "INSANGYEONBONG"
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY')>=2005
ORDER BY SALARY*12 DESC;--ORDER BY "YEONBONG" 가능
























--bit 계정 전환
------변환함수(TO_CHAR(),TO_DATE(),TO_NUMBER())-----------------
--[일반함수(프로그래밍적인 성격이 강함)]
--NVL(), NVL2() >> NULL 처리 담당
--DECODE() >> JAVA의 IF나 SWITCH 문과 비슷
--CASE() 함수 >> IF, SWITCH 비슷

SELECT COMM, NVL(COMM,0)FROM EMP;
CREATE TABLE T_EMP(
    ID NUMBER(6),--6자리 정수값
    JOB VARCHAR2(20)


);
INSERT INTO T_EMP(ID,JOB)
VALUES (100,'IT');
INSERT INTO T_EMP(ID,JOB)
VALUES (200,'SALES');
INSERT INTO T_EMP(ID,JOB)
VALUES (300,'MGR');
INSERT INTO T_EMP(ID)
VALUES (400);
INSERT INTO T_EMP(ID,JOB)
VALUES (500,'MGR');
SELECT * FROM T_EMP;
COMMIT;

SELECT DEPTNO, DECODE(DEPTNO, 10,'인사부',20,'관리부',30,'회계부','기타부서')AS "부서"
FROM EMP;

SELECT ID, DECODE(ID, 100,'인사부',200,'관리부',300,'회계부','기타부서')AS "부서"
FROM T_EMP;

--Quiz
CREATE TABLE t_emp2(
id NUMBER(2),
jumin CHAR(7)
);
INSERT INTO t_emp2(id, jumin) VALUES(1,'1234567');
INSERT INTO t_emp2(id, jumin) VALUES(2,'2234567');
INSERT INTO t_emp2(id, jumin) VALUES(3,'3234567');
INSERT INTO t_emp2(id, jumin) VALUES(4,'4234567');
INSERT INTO t_emp2(id, jumin) VALUES(5,'5234567');
COMMIT;
SELECT * FROM t_emp2;
--T_EMP2 TABLE에서 ID,JUMIN데이터를 출력하되 주민 컬럼의 앞자리가 1이면 남성 2이면 여성 3이면 여성 그 외는 기타 라고 출력하십시오.
SELECT ID, DECODE(SUBSTR(JUMIN,1,1),1,'MALE',2,'FEMALE',3,'MIDDLE','GOJA')AS "GENDER"
FROM T_EMP2;


SELECT ENAME, DEPTNO,DECODE(DEPTNO, 20, DECODE(ENAME, 'SMITH', 'HELLO', 'WORLD'),'ETC')
FROM EMP;

--CASE 문
--JAVA SWITCH 
/*
CASE 조건식 WHEN 결과1 THEN 출력 1
             WHEN 결과2 THEN 출력 2
              WHEN 결과3 THEN 출력 3
    ELSE 출력 4
    END "컬럼명"

*/
CREATE TABLE T_ZIP(
    ZIPCODE NUMBER(10)
    
);
INSERT INTO T_ZIP(ZIPCODE) VALUES(2);
INSERT INTO T_ZIP(ZIPCODE) VALUES(31);
INSERT INTO T_ZIP(ZIPCODE) VALUES(32);
INSERT INTO T_ZIP(ZIPCODE) VALUES(33);
INSERT INTO T_ZIP(ZIPCODE) VALUES(41);

COMMIT;

SELECT*FROM T_ZIP;

SELECT '0' || TO_CHAR(ZIPCODE), CASE ZIPCODE WHEN 2 THEN '서울'
                                             WHEN 31 THEN '경기'
                                             WHEN 32 THEN '강원'
                                             WHEN 41 THEN '제주'
                                             ELSE '기타 지역'
                                             END "REGION NAME"
FROM T_ZIP;

--CASE 컬럼명 WHEN 결과 THEN 출력 (= 조건)
--비교조건 
/*
CASE WHEN 컬럼명 조건 비교식 THEN 출력
*/

/* emp
사원테이블에서 사원급여가 1000달러 이하면 '4급'
1001달러 2000달러 이하면 '3급'
2001달러 3000달러 이하면 '2급'
3001달러 4000달러 이하면 '1급'
4001달러 이상이면 '특급' 이라는 데이터를 출력하세요

1. case 컬럼명  when 결과  then 출력    (= 조건)
2. 비교조건 
   case when 컬럼명  조건  비교식 then ..
        when 컬럼명  조건  비교식 then ..
        when 컬럼명  조건  비교식 then ..
*/
SELECT  CASE WHEN SAL <= 1000 THEN '4급'
            WHEN 1001<= SAL <= 2000 THEN '3급'
            WHEN 2001<= SAL <= 3000 THEN '2급'
            WHEN 3001<= SAL <=4000 THEN '1급'
            WHEN SAL>4001 THEN '특급'
    END "SIBAL"
    FROM EMP;
--틀림 ㅅㅂ
select case when sal <= 1000 then '4급'
                 when sal between 1001 and 2000 then '3급'
                 when sal between 2001 and 3000 then '2급'
                 when sal between 3001 and 4000 then '1급'
                 else '특급'
        end "급여등급"
from emp;
--이게 맞음
-------------------------------------------
--문자함수
--숫자함수
--날짜함수
--변환함수(TO_CHAR TO_DATE TO_NUMBER)
--일반함수 NVL(), DECODE(), CASE()
--------------------------------------------
--[집계함수] PAGE75
/*
1.COUNT(*) 몇건? > ROW 줄수를 셈(NULL도 포함함), COUNT(컬럼명) >> 데이터 건수(NULL을 포함하지 않음)
2.SUM() 합계
3.AVG()평균
4.MAX()최댓값
5.MIN()최솟값
등등....

집계함수의 특징
1. 집계함수는 GROUP BY 절과 같이 사용한다
2. 모든 집계함수는 NULL값을 무시한다.(NULL을 못 보고 지나침)
3. SELECT 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 GROUP BY절에 명시되어야 한다

*/
SELECT COUNT(*) FROM EMP;--14(특정 컬럼의 줄 수를 셈)
SELECT COUNT(COMM) FROM EMP;--6건(NULL값 무시)
SELECT COUNT(EMPNO) FROM EMP;--14

SELECT COUNT(NVL(COMM,0)) FROM EMP;--NULL이 있으면 NVL을 쓴다.
--급여의 합을 구해라.
SELECT SUM(SAL) AS "급여합" FROM EMP;
--평균
SELECT ROUND(AVG(SAL),0) AS "AVERAGE SAL" FROM EMP;--2073
--회사 총 수당이 얼마나 지급되고 있나(평균은 얼마인가)
SELECT TRUNC(AVG(COMM),0) FROM EMP; --721
SELECT TRUNC(SUM(COMM) / COUNT(COMM)) FROM EMP;--사원수 6명으로 계산(NULL 무시)

SELECT ROUND(AVG(NVL(COMM,0)),0)AS "AVERAGE COMM" FROM EMP;--309
SELECT TRUNC(SUM(COMM) / COUNT(NVL(COMM,0))) FROM EMP;
--회사의 규정이(전체 사원수로 나눈다...309)
--회사의 규정이(받는 사원수로 나눈다...721)

--NULL검증 : 코드
SELECT COUNT(*) FROM EMP WHERE COMM IS NULL;--NULL값이 8건 있다

SELECT COUNT(*) FROM EMP WHERE EMPNO IS NULL;--NULL이 없다

SELECT MAX(SAL) FROM EMP;

SELECT MIN(SAL) FROM EMP;

--POINT 
SELECT EMPNO, COUNT(EMPNO) FROM EMP;--EMPNO 14건, COUNT() 1건
--"not a single-group group function"
SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL), COUNT(SAL), COUNT(*) FROM EMP;

--부서별 평균 급여를 출력
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

--직종별 평균 급여
SELECT JOB ,AVG(SAL)
FROM EMP
GROUP BY JOB;
--직종별 평균 급여, 급여합, 최대급여, 최소급여, 건수를 출력
SELECT JOB, TRUNC(AVG(SAL),0), SUM(SAL), MAX(SAL), MIN(SAL), COUNT(SAL)
FROM EMP
GROUP BY JOB;
/*
GROUPING 원리 

DISTINCT 컬럼명1, 컬럼명2
ORDER BY 컬럼명1, 컬럼명2
GROUP BY 컬럼명1, 컬럼명2...

*/
--부서별, 직종별 급여의 합을 구하셈
SELECT JOB, DEPTNO, SUM(SAL), COUNT(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

/*
SELECT             4
FROM               1
WHERE              2
GROUP BY           3
ORDER BY           5
*/




