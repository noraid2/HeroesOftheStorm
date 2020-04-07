/*
[1���� ����]
1. ����Ŭ ����Ʈ���� �ٿ�ε�
Oracle Database Express Edition 11g Release 2
https://www.oracle.com/database/technologies/xe-prior-releases.html

������
https://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (���ἳġ)

3. Oracle ��ġ(SYS, SYSTEM ������ ���� ��ȣ : 1004)

4.Sqlplus ���α׷� ����(CMD) : GUI ȯ�� �Ϲݰ����� ��� ����

5.������ Tool ��ġ ����(SqlDeveloper)  ,
         https://dbeaver.io/download/
                 ����,����(��� , ������ , SqlGate) ������Ʈ�� ��ġ Ȱ�� ^^

6. SqlDeveloper ���� ���ؼ� Oracle Server ���� ....
   >> HR ���� : ��ȣ 1004 , Unlock 2���� ��밡�� .... (������� �ǽ� ���̺�)
   >> ���ο� ���� : bit

-- USER SQL
CREATE USER bit IDENTIFIED BY 1004
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bit QUOTA UNLIMITED ON USERS;

-- ROLES
GRANT "CONNECT" TO bit WITH ADMIN OPTION;
GRANT "RESOURCE" TO bit WITH ADMIN OPTION;

�ǽ� ȯ�� �����ϱ�

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
--1.��� ���̺��� ��� �����͸� ����ϼ���
SELECT * FROM emp; --���� ���ڴ� ��ҹ��� ���� ���ؿ�
--select * from emp;

--2. Ư�� �÷� ������ ����ϱ�
SELECT empno , ename , sal FROM emp;

SELECT ename FROM emp;

--3. �÷��� ����Ī(��Ī)(alias) �ο��ϱ�
SELECT empno ��� , ename �̸�
FROM emp;

SELECT empno "��    ��" , ename "��    ��"
FROM emp;

--����(ǥ��) (ansi ����)
SELECT empno as "��    ��" , ename as "��    ��"
FROM emp;

--Oracle ������ ���� (���ڿ� : ��ҹ��� ����)
--���ڿ� ǥ�� ('���ڿ�')
--�ҹ��� 'a'   �빮�� 'A' �ٸ� ���ڿ��̴�
SELECT empno , ename 
FROM emp 
WHERE ename = 'king';

SELECT empno , ename 
FROM emp 
WHERE ename = 'KING';

--Oracle SQL ��� : ������ (���� ������ (||) , ���������(+)) ����
--java + (���� + ���� >> ����)
--java + (���ڿ� + ���ڿ� >> ����)
--TIP) ms-sql(+ ���� ,����)

SELECT '����� �̸��� ' || ename || ' �Դϴ�' AS "�������"
FROM emp;

--empno , ename >> �÷�  >> Ÿ�� 
--Ÿ��(�ڷ���) : ���� , ����(���ڿ�) , ��¥ ...
DESC emp;
/*
���̺��� �⺻ ���� (�÷��� , null ���� , Ÿ��)
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER       
HIREDATE          DATE         
SAL               NUMBER       
COMM              NUMBER       
DEPTNO            NUMBER  
*/

SELECT empno || ename  --����  ||  ���ڿ�  (���������� ���� -> ���ڿ�)
FROM emp;

SELECT empno + ename  --ORA-01722: invalid number (��� ����)
FROM emp;

--����� ..�츮 ȸ�翡 ������ ��� �ֳ�
SELECT job FROM emp;
--distinct : �ߺ� ������ ����
--distinct : grouping �� ������ ó��
SELECT DISTINCT job FROM emp;

SELECT DISTINCT job , deptno FROM emp ORDER BY job;

SELECT DISTINCT deptno , job FROM emp ORDER BY deptno;

--Oracle ���
--Java ���
--Oracle �����ڰ� Java ���� ���� (+ , * , - ...)
-- % �ڹ�(������) , % ����Ŭ���� ������ (�˻� ����)
--����Ŭ (+ , - , * , / ) ������  �Լ� >> Mod()
--������̺��� ����� �޿��� 100�޷� �λ��� ����� ����ϼ���
--desc emp;
SELECT empno , sal , sal + 100 AS "�λ�޿�" FROM emp;

--dual �ӽ� ���̺�
SELECT 100 + 100 FROM dual;
SELECT 100 || 100 FROM dual; --���������� ����ȯ ... 100100
SELECT '100' + 100 FROM dual; -- + ������ ��� .. ����ȯ
SELECT '100A' + 100 FROM dual; -- ORA-01722: invalid number

--�񱳿�����
-- > < <=
--java ���� (==) �Ҵ�(=)
--Oracle ����(=) ���� �ʴ�(!=)

--��������
--AND , OR  , NOT

--������ (���ϴ� row ������ ���ڴ�)
SELECT *
FROM emp
WHERE sal >= 3000;

SELECT empno, ename, sal
FROM emp
WHERE sal > 3000;

--�̻� , ����  (=)
--�ʰ� , �̸� 

--����� 7788���� ����� ���, �̸�, ����, �Ի����� ����ϼ���
--������ , ������ , Ʃ�� , ���� 
--������� : 
SELECT empno, ename, job , hiredate     --3  
FROM emp                                --1 
WHERE empno = 7788;                     --2 

--����� �̸��� king �� �����  ��� , �̸� , �޿� ������ ����ϼ���
SELECT empno , ename , sal
FROM emp 
WHERE ename = 'KING';

--�� (AND , OR)
--�޿��� 2000�޷� �̻��̸鼭 ������ manager �� ����� ��� ������ ����ϼ���
--�ΰ��� ������ ��� �����ϴ� ������ (�Ѵ� ����)
SELECT *
FROM emp 
WHERE sal >= 2000 AND job='MANAGER';

--�޿��� 2000�޷� �̻��̰ų� ������ manager �� ����� ��� ������ ����ϼ���
SELECT *
FROM emp 
WHERE sal >= 2000 OR job='MANAGER';

--����Ŭ ��¥(DB������ ��¥)
--����Ŭ ��¥ (sysdate)

SELECT sysdate FROM dual; --2020-03-31 14:28:36
select * from SYS.nls_session_parameters;

SELECT sysdate FROM dual;
--20/03/31

--���� ������ ����ڰ� ��¥ ������  YYYY-MM-DD HH24:MI:SS ������ �����ϰڴ�

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select * from SYS.nls_session_parameters;  --�ý��� ������ ������ �ִ� ȯ�����̺�
--NLS_DATE_FORMAT	RR/MM/DD
--NLS_DATE_LANGUAGE	   KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF

select sysdate  from dual;  --2020-03-31 14:35:29

SELECT hiredate FROM emp;

--�Ի��� 1980-12-17 �� ����� ��� ������ ����ϼ���
SELECT *
FROM emp 
WHERE hiredate = '1980-12-17';

SELECT *
FROM emp 
WHERE hiredate = '1980/12/17';

SELECT *
FROM emp 
WHERE hiredate = '80-12-17';
--���� : RR-MM-DD  >> YYYY-MM-DD 

--����� �޿��� 2000�̻��̰� 4000������ ��� ����� ������ ����ϼ���
 SELECT *
 FROM emp 
 WHERE sal >= 2000 AND sal <= 4000;
--������ : between A and B (= ����)
--�̸� �ʰ� ������ ������ (= �������� �ʾƿ�)
SELECT *
FROM emp 
WHERE sal BETWEEN 2000 AND 4000;

--����� �޿��� 2000�ʰ��̰� 4000�̸��� ��� ����� ������ ����ϼ���
 SELECT *
 FROM emp 
 WHERE sal > 2000 AND sal < 4000;

--�μ���ȣ�� 10 �Ǵ� 20�� �Ǵ� 30���� 
--����� ��� , �̸�, �޿� , �μ���ȣ ����ϼ���
SELECT empno , ename , sal , deptno
FROM  emp 
WHERE deptno =10 OR deptno=20 OR deptno=30;
--IN ������

SELECT empno , ename , sal , deptno
FROM emp 
WHERE deptno in(10,20,30);
--in �����ڸ� Ǯ� : WHERE deptno =10 OR deptno=20 OR deptno=30;

--�μ���ȣ�� 10�Ǵ� 20�� �ƴ� ����� ��� , �̸�, �޿� , �μ���ȣ�� ����ϼ���
SELECT *
FROM emp 
WHERE deptno != 10 AND deptno!=20;

--IN �� ������ ,,,,,, NOT IN
SELECT *
FROM emp 
WHERE deptno NOT IN (10,20); -- deptno != 10 AND deptno!=20;
--������ and ������ and .......
--NOT IN ������ AND >>deptno != 10 AND deptno!=20;

--POINT : Oracle �� ǥ�� (������ ����) >> null
--null �ʿ��

CREATE TABLE MEMBER (
  userid varchar2(20) NOT NULL , -- �ʼ��Է�
  name varchar2(20) NOT NULL, --�ʼ��Է� 
  hobby varchar2(50) -- default null (null ���� ���) ������ �ȹ޾Ƶ� ��
);

SELECT * FROM MEMBER;
--INSERT INTO MEMBER(userid,hobby) values('hong','��');
--cannot insert NULL into ("BIT"."MEMBER"."NAME")
INSERT INTO MEMBER(userid,name) values('hong','ȫ�浿');
--hobby �÷��� �����ʹ� null �ڵ� ...
INSERT INTO MEMBER(userid,name,hobby) 
values('kim','�达','����');
--�ǹݿ�
COMMIT;

SELECT * FROM MEMBER;

--����(comm)�� ���� �ʴ� ��� ����� ������ ����ϼ���
--0�� ������ ��� (�޴� ���ǿ� ����)
--comm �÷��� �����Ͱ� null �� �͸�
SELECT * FROM emp;
--SELECT * FROM emp WHERE comm = NULL; (x)

--null �� �񱳴�  (IS NULL , IS NOT NULL)
SELECT * FROM emp WHERE comm IS NULL;

--����(comm) �� �޴� ��� ����� ������ ����ϼ���
SELECT * FROM emp WHERE comm IS NOT NULL;

--��� ���̺��� ���, �̸� , �޿� , ���� , �ѱ޿��� ����ϼ���
--�ѱ޿�(�޿� + ����)
SELECT empno , ename, sal , comm , sal + comm 
FROM emp;

SELECT empno , ename, sal , comm , sal + nvl(comm,0) AS "�ѱ޿�"
FROM emp;

--POINT  >> null
--1. null ���� ��� ������  �� ����� >> null
--2. �� ���� �ذ� : nvl() , nvl2() >> null ����  replace ġȯ ...
--Tip) ms-sql : convert()
--     my-sql : IFNULL()

SELECT NULL + 100 FROM dual;
SELECT 100 + nvl(NULL,0) FROM dual;
SELECT comm , nvl(comm,1111) FROM emp;

--����� �޿��� 1000�̻��̰� ������ ���� �ʴ� ����� ���, �̸�, ���� , �޿�
-- ,������ ����ϼ���
SELECT empno , ename , job , sal , comm 
FROM emp WHERE sal >= 1000 AND comm IS NULL;
-----------------------------------------------------------
--DQL(data query language) : SELECT  (60%)
--DDL : create , alter , drop (��ü (���̺�) ���� , ���� , ����)
--DML : insert , update , delete (������ ����) (10%)

--java  : class Board  { private boardno int }
--Oracle: create table Board (boardno number not null) 

CREATE TABLE board (
  boardid NUMBER NOT NULL , --���� , �ʼ� �Է�
  title varchar2(20) NOT NULL , --�ѱ�10�� , ������,Ư��,���� 20�� �ʼ��Է�
  content varchar2(2000) NOT NULL, --�ʼ� �Է�
  hp varchar2(20) --default null ��� (�ʼ� �Է��� �ƴϴ�)
 );

SELECT * FROM board;
--desc board;

--DML(������ ���۾�) �� �ݿ� ���θ� ���� 
--insert
--update
--delete
--�ݵ�� �� ����� �ݿ� ���� , ��� ���� �ǻ� ����
--commit(�����ݿ�)
--rollback(�����ݿ� ���) 

INSERT INTO board(boardid, title, content)
values(100,'����Ŭ','�� �Ҹ��ѵ�');

COMMIT;
SELECT * FROM board;

INSERT INTO board(boardid, title, content)
values(200,'�ڹ�','�׸���');

SELECT * FROM board;
COMMIT;

INSERT INTO board(boardid, title, content,hp)
values(300,'����','������','010-000-0000');

SELECT * FROM board;
COMMIT;

SELECT boardid, nvl(hp,'EMPTY') AS "hp" FROM board;

--���ڿ� �˻�
--�ּҰ˻� : [��] �Է�  >> ���ﵿ , ���� , .... (Like ���� �˻�)
--���ڿ� ���� �˻� ������ : like
--like ������ ���� (���ϵ� ī�� ���� (% : ��� �� ,  _ : �ѹ���) ����

SELECT ename 
FROM emp WHERE ename LIKE '%A%'; --ename �÷��� ������ �߿��� A�� ����ִ� �̸�

SELECT ename 
FROM emp WHERE ename LIKE '%a%'; --���ڿ� ������ ��ҹ��� ���� (����)

SELECT ename
FROM emp WHERE ename LIKE 'A%'; --�̸��� ù ���ڰ� A�� ���

SELECT ename
FROM emp WHERE ename LIKE '%S'; --�̸��� ������ ���ڰ� S�� ���

--SELECT * FROM MEMBER WHERE name LIKE '%���ѹ�%'

SELECT ename 
FROM emp WHERE ename LIKE '%LL%'; --LL �پ� �־��

SELECT ename 
FROM emp WHERE ename LIKE '%L%L%'; -- L 2�� ������

SELECT ename 
FROM emp WHERE ename LIKE '%A%A%'; --ADAMS

SELECT ename 
FROM emp WHERE ename LIKE '_A%'; --ù���ڴ� ����� �͵� ������� �ι�° ���ڴ� A
--WARD
--MARTIN
--JAMES

--���� ǥ���� (java - DB - script)
--regexp_like
SELECT * FROM emp WHERE REGEXP_LIKE(ename,'[A-C]'); 
--���� ǥ�� ���� 5�� ����� (���� ī�� )
----------------------------------------------------------
--������ �����ϱ�
--order by �÷��� : ���ڿ� , ���� , ��¥
--�������� : asc : ������  (default)
--�������� : desc: ������

SELECT *
FROM EMP
ORDER BY sal;

SELECT *
FROM EMP
ORDER BY sal asc;

--�޿��� ���� �޴� ������ �����ؼ� ����ϼ���
SELECT * FROM emp ORDER BY sal DESC;

--�Ի����� ���� ���� ������ �����ؼ� ��� , �̸� , �޿� , �Ի��� �����͸� ����ϼ���
--(���� �ֱٿ� �Ի��� ������)
SELECT empno, ename, sal , hiredate 
FROM emp 
ORDER BY hiredate DESC;
/*
SELECT              3    
FROM                1   
WHERE               2    
ORDER BY            4  ( select ����� ����) >> DB ���� ���� �۾�  
*/

--�ؼ� 
SELECT empno , ename , sal , job , hiredate
FROM emp 
WHERE job = 'MANAGER'
ORDER BY hiredate DESC;

--order by �÷��� desc , �÷��� asc , �÷��� desc
SELECT job , deptno
FROM emp 
ORDER BY job ASC , deptno DESC; -- grouping ����

-----------------------------------------------------
--������
--������(union) : ���̺�� ���̺��� �����͸� ��ġ�� ��(�⺻ : �ߺ��� ����)
--������(union all) : ���̺�� ���̺��� �����͸� ��ġ�� ��(�ߺ���  ���)

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
--1. ������� [�÷��� Ÿ��]�� ����
SELECT empno , ename FROM emp
UNION
SELECT dname , deptno FROM dept;
--expression must have same datatype as corresponding expression
SELECT empno , ename FROM emp
UNION
SELECT deptno , dname FROM dept;

--2. ������� �÷��� ������ ���� ( null ������)
SELECT empno  , ename, job , sal FROM emp
UNION
SELECT deptno , dname, loc , null  FROM dept;
--query block has incorrect number of result columns

--�ǹ� >> subquery (in line view)
SELECT empno , ename
FROM  (
		SELECT empno , ename FROM emp
		UNION
		SELECT deptno , dname FROM dept
	  ) ORDER BY empno DESC;

--������� �ʺ� ������ ..... �ǹ������� ... ���̺� �Ѱ� ...(�������̺�)
-----------------------------------------------------------
--����Ŭ �Լ� (���� ����(pdf) : 50 page)
/*	 
���� �� �Լ��� ���� 
1)������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�. 
2)������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�. 
3)��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ��� �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�. 
4)��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�. (to_char() , to_number(), to_date())
5)�Ϲ����� �Լ� : NVL, DECODE 	 
	 
*/	 
/ 
/*
�ѱ� ���� .... ���� ... ���ĺ��� ����
select * from SYS.nls_database_parameters;
--NLS_CHARACTERSET	AL32UTF8  �ѱ� 3byte �ν�
--KO16KSC5601 2Byte (���� ��ȯ�ϸ� �ѱ� �ٱ���)
select * from SYS.nls_database_parameters where parameter like '%CHAR%';	 
*/

--���ڿ� �Լ�
SELECT INITCAP('the super man') FROM dual;  --The Super Man

SELECT lower('AAA') , upper('aaa') FROM dual;

SELECT ename , lower(ename) AS "ename" FROM emp;

SELECT * FROM emp WHERE lower(ename) = 'king';

--���ڿ� ����
SELECT LENGTH('abcd') FROM dual; --4��

SELECT LENGTH('ȫ�浿') FROM dual; --3��

SELECT LENGTH(' ȫ a�� ��') FROM dual; --7��

--���� ������ ||
--concat()

SELECT 'a' || 'b' || 'c' AS "data"  FROM dual; --abc
SELECT CONCAT('a','b')  FROM dual; --ab

SELECT concat(ename,job) AS "concat" FROM emp; --SMITHCLERK
SELECT ename || '    ' ||job AS "concat" FROM emp; --SMITH    CLERK

--�κ� ���ڿ� ����
--java(substring)
--oracle(substr)

SELECT substr('ABCDE',2,3) FROM dual; --BCD
SELECT substr('ABCDE',1,1) FROM dual; --�ڱ��ڽ� A
SELECT substr('ABCDE',3,1) FROM dual; --C

SELECT substr('ABCDE',3) FROM dual; --CDE

SELECT substr('ABCDE',-2,1) FROM dual; --D
SELECT substr('ABCDE',-2,2) FROM dual; --DE

/*
������̺��� ename �÷� �����Ϳ� ���ؼ�  ù���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮�ڷ� 
����ϼ���
��) �� ����� �ϳ��� �÷����� 
(�÷��� �̸��� fullname)
(ù���ڿ� ������ ���� ���̿� �����ϳ� �־ ���)
SMITH -> [s MITH]

*/
SELECT lower(substr(ename,1,1)) FROM emp;

SELECT upper(substr(ename,2)) FROM emp;

SELECT lower(substr(ename,1,1)) || ' ' || upper(substr(ename,2)) AS "fullname"
FROM emp; 
--s MITH

--lpad , rpad (ä���)
SELECT lpad('ABC',10,'*') FROM dual; --*******ABC
SELECT rpad('ABC',10,'^') FROM dual; --ABC^^^^^^^ 

--Quiz
--����� ���: hong1006
--ȭ�� : ho****** ����ϰ� �;�� (��� : 1004 > 10**)
SELECT rpad(substr('hong1006',1,2),LENGTH('hong1006'),'*') 
FROM dual; --ho******

SELECT rpad(substr('1004',1,2),LENGTH('1004'),'*') 
FROM dual; --10**

--emp ���̺��� ename �÷��� �����͸� ����ϴµ� ù���ڸ� ����ϰ� ������ * �� ǥ���ϼ���
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
--�ϳ��� �÷����� ������� ���
--100 : 123456-*******
--200 : 234567-*******
--�÷����� "juminnumber"
SELECT id || ' : ' || rpad(substr(jumin,1,7),LENGTH(jumin),'*') AS "jumin"
FROM member2;
--100 : 123456-*******
--200 : 234567-*******

--rtrim �Լ�
--[������ ���ڸ� ������]
SELECT rtrim('MILLER','ER') FROM dual; --MILL
SELECT ltrim('MILLLLLLLLLER','MIL') FROM dual; --ER

SELECT '>' || rtrim('MILLER      ',' ') || '<' FROM dual;
-->MILLER<

--ġȯ�Լ� (replace)
SELECT ename , replace(ename,'A','�Ϳ�^^') FROM emp;
--SMITH	SMITH
--ALLEN	�Ϳ�^^LLEN
----------���ڿ� �Լ� (END)------------------------------------
--[���� �Լ�]
--round(�ݿø� �Լ�)
--trunc(�����Լ�)
--mod() ������ ���ϴ� �Լ�
--                  .
--   ...-3  -2  -1  0  1   2   3 ...  
SELECT round(12.345,0) AS  "r" FROM dual; -- �����θ� ���ܶ�  12
SELECT round(12.567,0) AS  "r" FROM dual; -- 13
SELECT round(12.345,1) AS  "r" FROM dual; -- 12.3
SELECT round(12.567,1) AS  "r" FROM dual; -- 12.6 

SELECT round(12.345,-1) AS  "r" FROM dual; --10
SELECT round(15.345,-1) AS  "r" FROM dual; --20
SELECT round(15.345,-2) AS  "r" FROM dual; --0



--trunc(�����Լ�)
SELECT trunc(12.345,0) AS  "r" FROM dual; -- �����θ� ���ܶ�  12
SELECT trunc(12.567,0) AS  "r" FROM dual; -- 12
SELECT trunc(12.345,1) AS  "r" FROM dual; -- 12.3
SELECT trunc(12.567,1) AS  "r" FROM dual; -- 12.5 

SELECT trunc(12.345,-1) AS  "r" FROM dual; --10
SELECT trunc(15.345,-1) AS  "r" FROM dual; --10
SELECT trunc(15.345,-2) AS  "r" FROM dual; --0

--������
SELECT 12/10 FROM dual; --1.2
SELECT mod(12,10) FROM dual; --2 ������ (�Լ�)

SELECT mod(0,0) FROM dual; --0

----------------------[���� �Լ� END]-------------------------
--[ ��¥ �Լ� ]
SELECT sysdate FROM dual;  --2020-04-01 12:16:14
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--��¥ ���� (POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date   >> Number (�ϼ�)

SELECT hiredate FROM emp; --1981-02-20 00:00:00

SELECT MONTHS_BETWEEN('2018-01-01','2010-01-01') FROM dual; --96����
 

SELECT round(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) FROM dual;
--122.565016427718040621266427718040621266
--122.6
SELECT trunc(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) FROM dual;
--122.5

--POINT
--��¥ ������ ���ڿ��� ��¥�� �ٲٴ� �Լ� (to_date())
SELECT to_date('2020-04-01') + 100 FROM dual; --2020-07-10 00:00:00
SELECT to_date('2020-04-01') - 100 FROM dual; --2019-12-23 00:00:00
SELECT sysdate + 1000 FROM dual; --2022-12-27 12:26:30

--Quiz
--1. ��� ���̺��� ������� �Ի��Ͽ��� ���糯¥���� �ټӿ����� ���ϼ���
--�� �ټӿ����� �����κи� ����ϼ��� (�ݿø� ���� ������) MONTHS_BETWEEN
SELECT  ename ,
        hiredate , 
        trunc(months_between(sysdate,hiredate),0) as "�ټӿ���" 
FROM  emp;
--2. �Ѵ��� 31 �� �̶�� ���ؿ��� �ټӿ����� ���ϼ��� (�ݿø� ���� ������) 
--�Լ� ������� ���� >> (��¥ - ��¥ >> 150�� )
SELECT ename , hiredate , trunc((SYSDATE - hiredate) / 31,0) AS "�ټӿ���"
FROM emp;
--------------[��¥ �Լ� END]-------------------------------
--����
--����
--��¥ �Լ� �� ���� 
---------------------------------------------------------
--[��ȯ�Լ�] : TODAY POINT
--����Ŭ : ���� , ���� , ��¥ 
--to_char() : ���� -> ���� (1000 -> $1000) ,
--            ��¥ -> ���� (2020-01-01 -> 2020��01��01��) format

--to_date() : ���� -> ��¥ >> select '2020-12-12' + 100 
--                         select to_date('2020-12-12') + 100

--to_number() : ���� -> ���� (���� �ڵ� ����ȯ)
SELECT '100' + 100 FROM dual;
SELECT to_number('100') + 100 FROM dual;

--to_number  (���� -> ����) �ڵ� ����ȯ
SELECT '1' + 100 FROM dual; -- 
SELECT to_number('1') + 100 FROM dual;

--to_char() : format >> ���� , ��¥  (���Ĺ���)
SELECT to_char(sysdate) || '��' FROM dual; --2020-04-01 12:55:23��
--pdf 69page (���Ĺ��� ǥ)
SELECT sysdate , 
to_char(sysdate,'YYYY') || '��' AS "YYYY",
to_char(sysdate,'YEAR'),
to_char(sysdate,'MM'),
to_char(sysdate,'DD'),
to_char(sysdate,'DY')
FROM dual;
--2020-04-01 12:57:16	2020��	TWENTY TWENTY	04	01	��

--�Ի���� 12���� ������� ��� , �̸� , �Ի���, �Ի�⵵ , �Ի���� ����ϼ���
SELECT empno,ename,hiredate ,
TO_CHAR(hiredate,'YYYY')  AS "YYYY",
TO_CHAR(hiredate,'MM') AS "MM"
FROM emp
WHERE TO_CHAR(hiredate,'MM') = '12';

SELECT to_char(hiredate,'YYYY MM DD')  FROM emp;
--1980 12 17
SELECT to_char(hiredate,'YYYY"��" MM"��" DD"��"')  FROM emp;
--1980�� 12�� 17��

--to_char() ���� -> ���ڷ� (���Ĺ���)
--pdf ���� 71page ǥ
--100000 >> ��� >> $1,000,000 (����)

SELECT '>' || to_char(12345,'999999999999') || '<' FROM dual; 
-->        12345<
SELECT '>' || to_char(12345,'099999999999') || '<' FROM dual;
--> 000000012345<

SELECT '>' || to_char(12345,'$9,999,999,999') || '<' FROM dual;
-->        $12,345<

SELECT sal , to_char(sal,'$999,999') FROM emp;
--800	     $800
--1600	   $1,600
--HR �������� ��ȯ ------------------------------
--HR ���� ��ȯ �۾�
select * from employees;
desc employees;



/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ� fullname ��Ī �ο��ؼ� ����ϰ�
�Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� ������ 10%(���� * 1.1)�λ��� ����
����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/
select * from employees;
/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ�
fullname ��Ī �ο��ؼ� ����ϰ� 
�Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� 
������ 10%(���� * 1.1)�λ��� ���� ����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/
select     employee_id,
           first_name || last_name as "fullname",
           to_char(hire_date,'YYYY-MM-DD') as "hire_date",
           salary,
           salary * 12 as "����",
           to_char((salary * 12)*1.1,'$9,999,999,999') as "�λ��",
           hire_date
from employees
where to_char(hire_date,'YYYY') >= '2005'
order by "����" desc;  -- order by ���� ��Ī�� �ü� �ִ� (order by ������ ����)

--bit �������� 
-------------��ȯ�Լ� (to_char() , to_date() , to_number())----------

--[ �Ϲ��Լ�(���α׷������� ����) ]
--nvl() , nvl2() >> null ó�� ���
--decode() �Լ� >> java if�� (switch)
--case() �Լ� >>java if�� (switch)

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
SELECT  id, decode(id,100,'�λ��',
                      200,'������',
                      300,'ȸ���',
                      '��Ÿ�μ�') AS "�μ�"
FROM t_emp;


SELECT deptno, decode(deptno,10,'�λ��',
                             20,'������',
                             30,'ȸ���',
                             '��Ÿ�μ�') AS "�μ�"
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
t_emp2 ���̺��� id, jumin �����͸� ����ϵ� jumin�÷��� ���ڸ��� 1�̸�
'����' ���  2�̸� '����' 3�̸� '�߼�' �� �ܴ� '��Ÿ' ��� ����ϼ���
*/
SELECT id, decode(substr(jumin,1,1), 1 , '����',
                                     2 , '����',
                                     3 , '�߼�',
                                     '��Ÿ') AS "gender"
FROM t_emp2;                                     
--1	����
--2	����
--3	�߼�
--4	��Ÿ
--5	��Ÿ
/*
2�� Ŀ�� (2��)
if ���ȿ� if �� (��ø ) >> decode
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����̶�� HELLO ���� ����ϰ�
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����� �ƴ϶�� WORLD ���� ����ϰ�
�μ���ȣ�� 20���� ����� �ƴ϶�� ETC ��� ���ڸ� ����ϼ���
*/
select empno,ename, decode(deptno,20 ,
						   decode(ename,'SMITH','HELLO','WORLD') , 
						  'ETC')
from emp;

--CASE ��
--java switch
/*
  CASE ���ǽ� WHEN ���1 THEN ���1
            WHEN ���2 THEN ���2
            WHEN ���3 THEN ���3
            ELSE ���4
  END "�÷���"

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
       CASE zipcode WHEN 2 THEN '����' 
                    WHEN 31 THEN '���' 
                    WHEN 32 THEN '����' 
                    WHEN 41 THEN '����'
                    ELSE '��Ÿ����'
       END "regionname"   
FROM t_zip;       

/* emp
������̺��� ����޿��� 1000�޷� ���ϸ� '4��'
1001�޷� 2000�޷� ���ϸ� '3��'
2001�޷� 3000�޷� ���ϸ� '2��'
3001�޷� 4000�޷� ���ϸ� '1��'
4001�޷� �̻��̸� 'Ư��' �̶�� �����͸� ����ϼ���

1. case �÷���  when ���  then ���    (= ����)
2. ������ 
   case when �÷���  ����  �񱳽� then ..
        when �÷���  ����  �񱳽� then ..
        when �÷���  ����  �񱳽� then ..
*/
select case when sal <= 1000 then '4��'
                 when sal between 1001 and 2000 then '3��'
                 when sal between 2001 and 3000 then '2��'
                 when sal between 3001 and 4000 then '1��'
                 else 'Ư��'
        end "�޿����"
from emp;



