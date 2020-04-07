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
         https://dbeaver.io/download/
                 유료,무료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : bit

-- USER SQL
CREATE USER bit IDENTIFIED BY 1004
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bit QUOTA UNLIMITED ON USERS;

-- ROLES
GRANT "CONNECT" TO bit WITH ADMIN OPTION;
GRANT "RESOURCE" TO bit WITH ADMIN OPTION;

실습 환경 구성하기

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

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
select * from emp;
SELECT * FROM dept;
SELECT * FROM SALGRADE;

/*
SELECT [DISTINCT]  {*, column [alias], . . .}   
FROM  table_name   
[WHERE  condition]   
[ORDER BY {column, expression} [ASC | DESC]]; 

*/
--1.사원 테이블에서 모든 테이터를 출력하세요
SELECT * FROM emp; --쿼리 문자는 대소문자 구별 안해요
--select * from emp;

--2. 특정 컬럼 데이터 출력하기
SELECT empno , ename , sal FROM emp;

SELECT ename FROM emp;

--3. 컬럼에 가명칭(별칭)(alias) 부여하기
SELECT empno 사번 , ename 이름
FROM emp;

SELECT empno "사    번" , ename "이    름"
FROM emp;

--정식(표준) (ansi 문법)
SELECT empno as "사    번" , ename as "이    름"
FROM emp;

--Oracle 데이터 관리 (문자열 : 대소문자 구분)
--문자열 표기 ('문자열')
--소문자 'a'   대문자 'A' 다른 문자열이다
SELECT empno , ename 
FROM emp 
WHERE ename = 'king';

SELECT empno , ename 
FROM emp 
WHERE ename = 'KING';

--Oracle SQL 언어 : 연산자 (결합 연산자 (||) , 산술연산자(+)) 구분
--java + (숫자 + 숫자 >> 연산)
--java + (문자열 + 문자열 >> 결합)
--TIP) ms-sql(+ 연산 ,결합)

SELECT '사원의 이름은 ' || ename || ' 입니다' AS "사원정보"
FROM emp;

--empno , ename >> 컬럼  >> 타입 
--타입(자료형) : 숫자 , 문자(문자열) , 날짜 ...
DESC emp;
/*
테이블의 기본 정보 (컬럼명 , null 여부 , 타입)
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER       
HIREDATE          DATE         
SAL               NUMBER       
COMM              NUMBER       
DEPTNO            NUMBER  
*/

SELECT empno || ename  --숫자  ||  문자열  (내부적으로 숫자 -> 문자열)
FROM emp;

SELECT empno + ename  --ORA-01722: invalid number (산술 오류)
FROM emp;

--사장님 ..우리 회사에 직종이 몇개나 있나
SELECT job FROM emp;
--distinct : 중복 데이터 제거
--distinct : grouping 논리 데이터 처리
SELECT DISTINCT job FROM emp;

SELECT DISTINCT job , deptno FROM emp ORDER BY job;

SELECT DISTINCT deptno , job FROM emp ORDER BY deptno;

--Oracle 언어
--Java 언어
--Oracle 연산자가 Java 거의 동일 (+ , * , - ...)
-- % 자바(나머지) , % 오라클에서 연산자 (검색 패턴)
--오라클 (+ , - , * , / ) 나머지  함수 >> Mod()
--사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하세요
--desc emp;
SELECT empno , sal , sal + 100 AS "인상급여" FROM emp;

--dual 임시 테이블
SELECT 100 + 100 FROM dual;
SELECT 100 || 100 FROM dual; --내부적으로 형변환 ... 100100
SELECT '100' + 100 FROM dual; -- + 연산자 산술 .. 형변환
SELECT '100A' + 100 FROM dual; -- ORA-01722: invalid number

--비교연산자
-- > < <=
--java 같다 (==) 할당(=)
--Oracle 같다(=) 같지 않다(!=)

--논리연산자
--AND , OR  , NOT

--조건절 (원하는 row 가지고 오겠다)
SELECT *
FROM emp
WHERE sal >= 3000;

SELECT empno, ename, sal
FROM emp
WHERE sal > 3000;

--이상 , 이하  (=)
--초과 , 미만 

--사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출려하세요
--관리자 , 개발자 , 튜닝 , 설계 
--실행순서 : 
SELECT empno, ename, job , hiredate     --3  
FROM emp                                --1 
WHERE empno = 7788;                     --2 

--사원의 이름이 king 인 사원의  사번 , 이름 , 급여 정보를 출력하세요
SELECT empno , ename , sal
FROM emp 
WHERE ename = 'KING';

--논리 (AND , OR)
--급여가 2000달러 이상이면서 직종이 manager 인 사원의 모든 정보를 출력하세요
--두가지 조건을 모두 만족하는 데이터 (둘다 참인)
SELECT *
FROM emp 
WHERE sal >= 2000 AND job='MANAGER';

--급여가 2000달러 이상이거나 직종이 manager 인 사원의 모든 정보를 출력하세요
SELECT *
FROM emp 
WHERE sal >= 2000 OR job='MANAGER';

--오라클 날짜(DB서버의 날짜)
--오라클 날짜 (sysdate)

SELECT sysdate FROM dual; --2020-03-31 14:28:36
select * from SYS.nls_session_parameters;

SELECT sysdate FROM dual;
--20/03/31

--현재 접속한 사용자가 날짜 형식을  YYYY-MM-DD HH24:MI:SS 보도록 수정하겠다

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select * from SYS.nls_session_parameters;  --시스템 설정을 가지고 있는 환경테이블
--NLS_DATE_FORMAT	RR/MM/DD
--NLS_DATE_LANGUAGE	   KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF

select sysdate  from dual;  --2020-03-31 14:35:29

SELECT hiredate FROM emp;

--입사일 1980-12-17 인 사원의 모든 정보를 출력하세요
SELECT *
FROM emp 
WHERE hiredate = '1980-12-17';

SELECT *
FROM emp 
WHERE hiredate = '1980/12/17';

SELECT *
FROM emp 
WHERE hiredate = '80-12-17';
--형식 : RR-MM-DD  >> YYYY-MM-DD 

--사원의 급여가 2000이상이고 4000이하인 모든 사원의 정보를 출력하세요
 SELECT *
 FROM emp 
 WHERE sal >= 2000 AND sal <= 4000;
--연산자 : between A and B (= 포함)
--미만 초과 에서는 사용금지 (= 포함하지 않아요)
SELECT *
FROM emp 
WHERE sal BETWEEN 2000 AND 4000;

--사원의 급여가 2000초과이고 4000미만인 모든 사원의 정보를 출력하세요
 SELECT *
 FROM emp 
 WHERE sal > 2000 AND sal < 4000;

--부서번호가 10 또는 20번 또는 30번인 
--사원의 사번 , 이름, 급여 , 부서번호 출력하세요
SELECT empno , ename , sal , deptno
FROM  emp 
WHERE deptno =10 OR deptno=20 OR deptno=30;
--IN 연산자

SELECT empno , ename , sal , deptno
FROM emp 
WHERE deptno in(10,20,30);
--in 연사자를 풀어서 : WHERE deptno =10 OR deptno=20 OR deptno=30;

--부서번호가 10또는 20이 아닌 사원의 사번 , 이름, 급여 , 부서번호를 출력하세요
SELECT *
FROM emp 
WHERE deptno != 10 AND deptno!=20;

--IN 의 부정은 ,,,,,, NOT IN
SELECT *
FROM emp 
WHERE deptno NOT IN (10,20); -- deptno != 10 AND deptno!=20;
--부정값 and 부정값 and .......
--NOT IN 부정의 AND >>deptno != 10 AND deptno!=20;

--POINT : Oracle 값 표현 (데이터 없다) >> null
--null 필요악

CREATE TABLE MEMBER (
  userid varchar2(20) NOT NULL , -- 필수입력
  name varchar2(20) NOT NULL, --필수입력 
  hobby varchar2(50) -- default null (null 값을 허락) 데이터 안받아도 되
);

SELECT * FROM MEMBER;
--INSERT INTO MEMBER(userid,hobby) values('hong','농구');
--cannot insert NULL into ("BIT"."MEMBER"."NAME")
INSERT INTO MEMBER(userid,name) values('hong','홍길동');
--hobby 컬럼의 데이터는 null 자동 ...
INSERT INTO MEMBER(userid,name,hobby) 
values('kim','김씨','게임');
--실반영
COMMIT;

SELECT * FROM MEMBER;

--수당(comm)을 받지 않는 모든 사원의 정보를 출력하세요
--0도 데이터 취급 (받는 조건에 포함)
--comm 컬럼에 데이터가 null 인 것만
SELECT * FROM emp;
--SELECT * FROM emp WHERE comm = NULL; (x)

--null 의 비교는  (IS NULL , IS NOT NULL)
SELECT * FROM emp WHERE comm IS NULL;

--수당(comm) 을 받는 모든 사원의 정보를 출력하세요
SELECT * FROM emp WHERE comm IS NOT NULL;

--사원 테이블에서 사번, 이름 , 급여 , 수당 , 총급여를 출력하세요
--총급여(급여 + 수당)
SELECT empno , ename, sal , comm , sal + comm 
FROM emp;

SELECT empno , ename, sal , comm , sal + nvl(comm,0) AS "총급여"
FROM emp;

--POINT  >> null
--1. null 과의 모든 연산은  그 결과가 >> null
--2. 위 문제 해결 : nvl() , nvl2() >> null 값을  replace 치환 ...
--Tip) ms-sql : convert()
--     my-sql : IFNULL()

SELECT NULL + 100 FROM dual;
SELECT 100 + nvl(NULL,0) FROM dual;
SELECT comm , nvl(comm,1111) FROM emp;

--사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름, 직종 , 급여
-- ,수당을 출력하세요
SELECT empno , ename , job , sal , comm 
FROM emp WHERE sal >= 1000 AND comm IS NULL;
-----------------------------------------------------------
--DQL(data query language) : SELECT  (60%)
--DDL : create , alter , drop (객체 (테이블) 생성 , 수정 , 삭제)
--DML : insert , update , delete (데이터 조작) (10%)

--java  : class Board  { private boardno int }
--Oracle: create table Board (boardno number not null) 

CREATE TABLE board (
  boardid NUMBER NOT NULL , --숫자 , 필수 입력
  title varchar2(20) NOT NULL , --한글10자 , 영문자,특수,공백 20자 필수입력
  content varchar2(2000) NOT NULL, --필수 입력
  hp varchar2(20) --default null 허용 (필수 입력이 아니다)
 );

SELECT * FROM board;
--desc board;

--DML(데이터 조작어) 실 반영 여부를 결정 
--insert
--update
--delete
--반드시 그 결과를 반영 할지 , 취소 할지 의사 결정
--commit(실제반영)
--rollback(실제반영 취소) 

INSERT INTO board(boardid, title, content)
values(100,'오라클','오 할만한데');

COMMIT;
SELECT * FROM board;

INSERT INTO board(boardid, title, content)
values(200,'자바','그립다');

SELECT * FROM board;
COMMIT;

INSERT INTO board(boardid, title, content,hp)
values(300,'오늘','수업중','010-000-0000');

SELECT * FROM board;
COMMIT;

SELECT boardid, nvl(hp,'EMPTY') AS "hp" FROM board;

--문자열 검색
--주소검색 : [역] 입력  >> 역삼동 , 역동 , .... (Like 패턴 검색)
--문자열 패턴 검색 연산자 : like
--like 연산자 도움 (와일드 카드 문자 (% : 모든 것 ,  _ : 한문자) 결합

SELECT ename 
FROM emp WHERE ename LIKE '%A%'; --ename 컬럼의 데이터 중에서 A가 들어있는 이름

SELECT ename 
FROM emp WHERE ename LIKE '%a%'; --문자열 데이터 대소문자 구별 (엄격)

SELECT ename
FROM emp WHERE ename LIKE 'A%'; --이름의 첫 글자가 A인 사람

SELECT ename
FROM emp WHERE ename LIKE '%S'; --이름의 마지막 글자가 S인 사람

--SELECT * FROM MEMBER WHERE name LIKE '%수한무%'

SELECT ename 
FROM emp WHERE ename LIKE '%LL%'; --LL 붙어 있어야

SELECT ename 
FROM emp WHERE ename LIKE '%L%L%'; -- L 2개 있으면

SELECT ename 
FROM emp WHERE ename LIKE '%A%A%'; --ADAMS

SELECT ename 
FROM emp WHERE ename LIKE '_A%'; --첫글자는 어떤것이 와도 상관없고 두번째 글자는 A
--WARD
--MARTIN
--JAMES

--정규 표현식 (java - DB - script)
--regexp_like
SELECT * FROM emp WHERE REGEXP_LIKE(ename,'[A-C]'); 
--정규 표현 예제 5개 만들기 (추후 카페 )
----------------------------------------------------------
--데이터 정렬하기
--order by 컬럼명 : 문자열 , 숫자 , 날짜
--오름차순 : asc : 낮은순  (default)
--내림차순 : desc: 높은순

SELECT *
FROM EMP
ORDER BY sal;

SELECT *
FROM EMP
ORDER BY sal asc;

--급여를 많이 받는 순으로 정렬해서 출력하세요
SELECT * FROM emp ORDER BY sal DESC;

--입사일이 가장 늦은 순으로 정렬해서 사번 , 이름 , 급여 , 입사일 데이터를 출력하세요
--(가장 최근에 입사한 순으로)
SELECT empno, ename, sal , hiredate 
FROM emp 
ORDER BY hiredate DESC;
/*
SELECT              3    
FROM                1   
WHERE               2    
ORDER BY            4  ( select 결과를 정렬) >> DB 가장 힘든 작업  
*/

--해석 
SELECT empno , ename , sal , job , hiredate
FROM emp 
WHERE job = 'MANAGER'
ORDER BY hiredate DESC;

--order by 컬럼명 desc , 컬럼명 asc , 컬럼명 desc
SELECT job , deptno
FROM emp 
ORDER BY job ASC , deptno DESC; -- grouping 원리

-----------------------------------------------------
--연산자
--합집합(union) : 테이블과 테이블의 데이터를 합치는 것(기본 : 중복값 배제)
--합집합(union all) : 테이블과 테이블의 데이터를 합치는 것(중복값  허용)

CREATE TABLE uta (name varchar2(20));

INSERT INTO uta(name) values('AAA');
INSERT INTO uta(name) values('BBB');
INSERT INTO uta(name) values('CCC');
INSERT INTO uta(name) values('DDD');
COMMIT;

SELECT * FROM uta;

CREATE TABLE ut (name varchar2(20));

INSERT INTO ut(name) values('AAA');
INSERT INTO ut(name) values('BBB');
INSERT INTO ut(name) values('CCC');
COMMIT;

SELECT * FROM ut;

--union
SELECT * FROM ut
UNION
SELECT * FROM uta;

--union all
SELECT * FROM ut
UNION ALL 
SELECT * FROM uta;

--unioin 
--1. 대응대는 [컬럼의 타입]이 동일
SELECT empno , ename FROM emp
UNION
SELECT dname , deptno FROM dept;
--expression must have same datatype as corresponding expression
SELECT empno , ename FROM emp
UNION
SELECT deptno , dname FROM dept;

--2. 대응대는 컬럼의 개수가 동일 ( null 착한일)
SELECT empno  , ename, job , sal FROM emp
UNION
SELECT deptno , dname, loc , null  FROM dept;
--query block has incorrect number of result columns

--실무 >> subquery (in line view)
SELECT empno , ename
FROM  (
		SELECT empno , ename FROM emp
		UNION
		SELECT deptno , dname FROM dept
	  ) ORDER BY empno DESC;

--여기까지 초보 걸음마 ..... 의무적으로 ... 테이블 한개 ...(단일테이블)
-----------------------------------------------------------
--오라클 함수 (보조 교재(pdf) : 50 page)
/*	 
단일 행 함수의 종류 
1)문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다. 
2)숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다. 
3)날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 제외하고 모두 날짜 데이터형의 값을 RETURN 한다. 
4)변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다. (to_char() , to_number(), to_date())
5)일반적인 함수 : NVL, DECODE 	 
	 
*/	 
/ 
/*
한글 문제 .... 인지 ... 추후변경 가능
select * from SYS.nls_database_parameters;
--NLS_CHARACTERSET	AL32UTF8  한글 3byte 인식
--KO16KSC5601 2Byte (현재 변환하면 한글 다깨짐)
select * from SYS.nls_database_parameters where parameter like '%CHAR%';	 
*/

--문자열 함수
SELECT INITCAP('the super man') FROM dual;  --The Super Man

SELECT lower('AAA') , upper('aaa') FROM dual;

SELECT ename , lower(ename) AS "ename" FROM emp;

SELECT * FROM emp WHERE lower(ename) = 'king';

--문자열 개수
SELECT LENGTH('abcd') FROM dual; --4개

SELECT LENGTH('홍길동') FROM dual; --3개

SELECT LENGTH(' 홍 a길 동') FROM dual; --7개

--결합 연산자 ||
--concat()

SELECT 'a' || 'b' || 'c' AS "data"  FROM dual; --abc
SELECT CONCAT('a','b')  FROM dual; --ab

SELECT concat(ename,job) AS "concat" FROM emp; --SMITHCLERK
SELECT ename || '    ' ||job AS "concat" FROM emp; --SMITH    CLERK

--부분 문자열 추출
--java(substring)
--oracle(substr)

SELECT substr('ABCDE',2,3) FROM dual; --BCD
SELECT substr('ABCDE',1,1) FROM dual; --자기자신 A
SELECT substr('ABCDE',3,1) FROM dual; --C

SELECT substr('ABCDE',3) FROM dual; --CDE

SELECT substr('ABCDE',-2,1) FROM dual; --D
SELECT substr('ABCDE',-2,2) FROM dual; --DE

/*
사원테이블에서 ename 컬럼 데이터에 대해서  첫글자는 소문자로 나머지 문자는 대문자로 
출력하세요
단) 위 결과를 하나의 컬럼으로 
(컬럼의 이름은 fullname)
(첫글자와 나머지 문자 사이에 공백하나 넣어서 출력)
SMITH -> [s MITH]

*/
SELECT lower(substr(ename,1,1)) FROM emp;

SELECT upper(substr(ename,2)) FROM emp;

SELECT lower(substr(ename,1,1)) || ' ' || upper(substr(ename,2)) AS "fullname"
FROM emp; 
--s MITH

--lpad , rpad (채우기)
SELECT lpad('ABC',10,'*') FROM dual; --*******ABC
SELECT rpad('ABC',10,'^') FROM dual; --ABC^^^^^^^ 

--Quiz
--사용자 비번: hong1006
--화면 : ho****** 출력하고 싶어요 (비번 : 1004 > 10**)
SELECT rpad(substr('hong1006',1,2),LENGTH('hong1006'),'*') 
FROM dual; --ho******

SELECT rpad(substr('1004',1,2),LENGTH('1004'),'*') 
FROM dual; --10**

--emp 테이블에서 ename 컬럼의 데이터를 출력하는데 첫글자만 출력하고 나머지 * 로 표시하세요
SELECT rpad(substr(ename,1,1),LENGTH(ename),'*') AS "ename"
FROM emp;

CREATE TABLE member2(
	id NUMBER,
	jumin varchar2(14)
);

INSERT INTO member2(id, jumin) values(100,'123456-1234567');
INSERT INTO member2(id, jumin) values(200,'234567-1234567');
COMMIT;
SELECT * FROM member2;
--하나의 컬럼으로 결과값을 출력
--100 : 123456-*******
--200 : 234567-*******
--컬럼명은 "juminnumber"
SELECT id || ' : ' || rpad(substr(jumin,1,7),LENGTH(jumin),'*') AS "jumin"
FROM member2;
--100 : 123456-*******
--200 : 234567-*******

--rtrim 함수
--[오른쪽 문자를 지워라]
SELECT rtrim('MILLER','ER') FROM dual; --MILL
SELECT ltrim('MILLLLLLLLLER','MIL') FROM dual; --ER

SELECT '>' || rtrim('MILLER      ',' ') || '<' FROM dual;
-->MILLER<

--치환함수 (replace)
SELECT ename , replace(ename,'A','와우^^') FROM emp;
--SMITH	SMITH
--ALLEN	와우^^LLEN
----------문자열 함수 (END)------------------------------------
--[숫자 함수]
--round(반올림 함수)
--trunc(절삭함수)
--mod() 나머지 구하는 함수
--                  .
--   ...-3  -2  -1  0  1   2   3 ...  
SELECT round(12.345,0) AS  "r" FROM dual; -- 정수부만 남겨라  12
SELECT round(12.567,0) AS  "r" FROM dual; -- 13
SELECT round(12.345,1) AS  "r" FROM dual; -- 12.3
SELECT round(12.567,1) AS  "r" FROM dual; -- 12.6 

SELECT round(12.345,-1) AS  "r" FROM dual; --10
SELECT round(15.345,-1) AS  "r" FROM dual; --20
SELECT round(15.345,-2) AS  "r" FROM dual; --0



--trunc(절삭함수)
SELECT trunc(12.345,0) AS  "r" FROM dual; -- 정수부만 남겨라  12
SELECT trunc(12.567,0) AS  "r" FROM dual; -- 12
SELECT trunc(12.345,1) AS  "r" FROM dual; -- 12.3
SELECT trunc(12.567,1) AS  "r" FROM dual; -- 12.5 

SELECT trunc(12.345,-1) AS  "r" FROM dual; --10
SELECT trunc(15.345,-1) AS  "r" FROM dual; --10
SELECT trunc(15.345,-2) AS  "r" FROM dual; --0

--나머지
SELECT 12/10 FROM dual; --1.2
SELECT mod(12,10) FROM dual; --2 나머지 (함수)

SELECT mod(0,0) FROM dual; --0

----------------------[숫자 함수 END]-------------------------
--[ 날짜 함수 ]
SELECT sysdate FROM dual;  --2020-04-01 12:16:14
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--날짜 연산 (POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date   >> Number (일수)

SELECT hiredate FROM emp; --1981-02-20 00:00:00

SELECT MONTHS_BETWEEN('2018-01-01','2010-01-01') FROM dual; --96개월
 

SELECT round(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) FROM dual;
--122.565016427718040621266427718040621266
--122.6
SELECT trunc(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) FROM dual;
--122.5

--POINT
--날짜 형식의 문자열을 날짜로 바꾸는 함수 (to_date())
SELECT to_date('2020-04-01') + 100 FROM dual; --2020-07-10 00:00:00
SELECT to_date('2020-04-01') - 100 FROM dual; --2019-12-23 00:00:00
SELECT sysdate + 1000 FROM dual; --2022-12-27 12:26:30

--Quiz
--1. 사원 테이블에서 사원들의 입사일에서 현재날짜까지 근속월수를 구하세요
--단 근속월수는 정수부분만 출력하세요 (반올림 하지 마세요) MONTHS_BETWEEN
SELECT  ename ,
        hiredate , 
        trunc(months_between(sysdate,hiredate),0) as "근속월수" 
FROM  emp;
--2. 한달이 31 일 이라는 기준에서 근속월수를 구하세요 (반올림 하지 마세요) 
--함수 사용하지 말고 >> (날짜 - 날짜 >> 150일 )
SELECT ename , hiredate , trunc((SYSDATE - hiredate) / 31,0) AS "근속월수"
FROM emp;
--------------[날짜 함수 END]-------------------------------
--문자
--숫자
--날짜 함수 및 연산 
---------------------------------------------------------
--[변환함수] : TODAY POINT
--오라클 : 문자 , 숫자 , 날짜 
--to_char() : 숫자 -> 문자 (1000 -> $1000) ,
--            날짜 -> 문자 (2020-01-01 -> 2020년01월01일) format

--to_date() : 문자 -> 날짜 >> select '2020-12-12' + 100 
--                         select to_date('2020-12-12') + 100

--to_number() : 문자 -> 숫자 (내부 자동 형변환)
SELECT '100' + 100 FROM dual;
SELECT to_number('100') + 100 FROM dual;

--to_number  (문자 -> 숫자) 자동 형변환
SELECT '1' + 100 FROM dual; -- 
SELECT to_number('1') + 100 FROM dual;

--to_char() : format >> 숫자 , 날짜  (형식문자)
SELECT to_char(sysdate) || '일' FROM dual; --2020-04-01 12:55:23일
--pdf 69page (형식문자 표)
SELECT sysdate , 
to_char(sysdate,'YYYY') || '년' AS "YYYY",
to_char(sysdate,'YEAR'),
to_char(sysdate,'MM'),
to_char(sysdate,'DD'),
to_char(sysdate,'DY')
FROM dual;
--2020-04-01 12:57:16	2020년	TWENTY TWENTY	04	01	수

--입사월이 12월인 사원들의 사번 , 이름 , 입사일, 입사년도 , 입사월을 출력하세요
SELECT empno,ename,hiredate ,
TO_CHAR(hiredate,'YYYY')  AS "YYYY",
TO_CHAR(hiredate,'MM') AS "MM"
FROM emp
WHERE TO_CHAR(hiredate,'MM') = '12';

SELECT to_char(hiredate,'YYYY MM DD')  FROM emp;
--1980 12 17
SELECT to_char(hiredate,'YYYY"년" MM"월" DD"일"')  FROM emp;
--1980년 12월 17일

--to_char() 숫자 -> 문자로 (형식문자)
--pdf 파일 71page 표
--100000 >> 출력 >> $1,000,000 (문자)

SELECT '>' || to_char(12345,'999999999999') || '<' FROM dual; 
-->        12345<
SELECT '>' || to_char(12345,'099999999999') || '<' FROM dual;
--> 000000012345<

SELECT '>' || to_char(12345,'$9,999,999,999') || '<' FROM dual;
-->        $12,345<

SELECT sal , to_char(sal,'$999,999') FROM emp;
--800	     $800
--1600	   $1,600
--HR 계정으로 전환 ------------------------------
--HR 계정 전환 작업
select * from employees;
desc employees;



/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
select * from employees;
/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서
fullname 별칭 부여해서 출력하고 
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 
연봉의 10%(연봉 * 1.1)인상한 값을 출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
select     employee_id,
           first_name || last_name as "fullname",
           to_char(hire_date,'YYYY-MM-DD') as "hire_date",
           salary,
           salary * 12 as "연봉",
           to_char((salary * 12)*1.1,'$9,999,999,999') as "인상분",
           hire_date
from employees
where to_char(hire_date,'YYYY') >= '2005'
order by "연봉" desc;  -- order by 절에 별칭이 올수 있다 (order by 마지막 실행)

--bit 계정으로 
-------------변환함수 (to_char() , to_date() , to_number())----------

--[ 일반함수(프로그래밍적인 성격) ]
--nvl() , nvl2() >> null 처리 담당
--decode() 함수 >> java if문 (switch)
--case() 함수 >>java if문 (switch)

SELECT comm, nvl(comm,0) FROM emp;

CREATE TABLE t_emp (
   id number(6),
   job varchar2(20)
);
INSERT INTO t_emp(id,job) values(100,'IT');
INSERT INTO t_emp(id,job) values(200,'SALES');
INSERT INTO t_emp(id,job) values(300,'MGR');
INSERT INTO t_emp(id) values(400);
INSERT INTO t_emp(id,job) values(500,'MGR');

SELECT * FROM t_emp;
COMMIT;
SELECT  id, decode(id,100,'인사부',
                      200,'관리부',
                      300,'회계부',
                      '기타부서') AS "부서"
FROM t_emp;


SELECT deptno, decode(deptno,10,'인사부',
                             20,'관리부',
                             30,'회계부',
                             '기타부서') AS "부서"
FROM emp;

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

/*
t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin컬럼의 앞자리가 1이면
'남성' 출력  2이면 '여성' 3이면 '중성' 그 외는 '기타' 라고 출력하세요
*/
SELECT id, decode(substr(jumin,1,1), 1 , '남성',
                                     2 , '여성',
                                     3 , '중성',
                                     '기타') AS "gender"
FROM t_emp2;                                     
--1	남성
--2	여성
--3	중성
--4	기타
--5	기타
/*
2분 커피 (2명)
if 문안에 if 문 (중첩 ) >> decode
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO 문자 출력하고
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD 문자 출력하고
부서번호가 20번인 사원이 아니라면 ETC 라는 문자를 출력하세요
*/
select empno,ename, decode(deptno,20 ,
						   decode(ename,'SMITH','HELLO','WORLD') , 
						  'ETC')
from emp;

--CASE 문
--java switch
/*
  CASE 조건식 WHEN 결과1 THEN 출력1
            WHEN 결과2 THEN 출력2
            WHEN 결과3 THEN 출력3
            ELSE 출력4
  END "컬럼명"

*/
CREATE TABLE t_zip(
   zipcode number(10)
);

INSERT INTO t_zip(zipcode) values(2);
INSERT INTO t_zip(zipcode) values(31);
INSERT INTO t_zip(zipcode) values(32);
INSERT INTO t_zip(zipcode) values(33);
INSERT INTO t_zip(zipcode) values(41);
COMMIT;

SELECT * FROM t_zip;

SELECT '0' || TO_CHAR(zipcode) , 
       CASE zipcode WHEN 2 THEN '서울' 
                    WHEN 31 THEN '경기' 
                    WHEN 32 THEN '강원' 
                    WHEN 41 THEN '제주'
                    ELSE '기타지역'
       END "regionname"   
FROM t_zip;       

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
select case when sal <= 1000 then '4급'
                 when sal between 1001 and 2000 then '3급'
                 when sal between 2001 and 3000 then '2급'
                 when sal between 3001 and 4000 then '1급'
                 else '특급'
        end "급여등급"
from emp;



