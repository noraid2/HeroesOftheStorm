
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
                 ����,����(��� , ������ , SqlGate) ������Ʈ�� ��ġ Ȱ�� ^^

6. SqlDeveloper ���� ���ؼ� Oracle Server ���� ....
   >> HR ���� : ��ȣ 1004 , Unlock 2���� ��밡�� .... (������� �ǽ� ���̺�)
   >> ���ο� ���� : bit
�ǽ� ȯ�� ����
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
SELECT [DISTINCT]  {*, column [alias], . . .}  �߰�ȣ�� �ݵ�� �־����
FROM  table_name   [WHERE  condition]   ���ȣ�� ���� ����
[ORDER BY {column, expression} [ASC | DESC]]; 
*/
--1.��� ���̺��� ��� �����͸� ����ϼ���
SELECT * FROM EMP; --QUERY ������ ��ҹ��� ���� ����(���Ǿ�)
--2. Ư�� �÷� ������ ����ϱ�
SELECT EMPNO, ENAME, SAL  FROM EMP;
SELECT ENAME FROM EMP;
--3. �÷��� ����Ī(��Ī)(ALIAS) �ο��ϱ�
SELECT EMPNO ���, ENAME �̸�
FROM EMP;

SELECT EMPNO "��    ��", ENAME "��    ��"
FROM EMP;
--�⺻������ ����Ī���� STRINGó�� ""�� ���δ�
--����(ǥ��)(ANSI ����)
SELECT EMPNO AS"��  ��", ENAME AS "��  ��"
FROM EMP;

--ORACLE ������ ����(���ڿ� : ��ҹ��� �����ϰ� ����)
--���ڿ� ǥ��('���ڿ�')
--�ҹ��� 'a'�� �빮�� 'A'�� �ٸ���.
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME = 'KING';

--ORACLE SQL��� : ������ ����(���տ�����(||), ���������(+)) ����
--JAVA�� + (���� + ���� >> ����)
--JAVA + (���ڿ� + ���ڿ� >> ����)
--TIP) MS-SQL(+����, ���� �Ѵ���(�ڹ�ó��))

SELECT '����� �̸��� ' || ENAME || ' �Դϴ�' AS "�������"
FROM EMP;

--EMPNO, ENAME = �÷� >> Ÿ�� ��������(�ڹ��� ����)
--Ÿ��(�ڷ���) : ����, ����(���ڿ�), ��¥....
DESC EMP;
/*
���̺��� �⺻ ����(�÷���, NULL ��� ����, Ÿ��)

�̸�       ��?       ����           
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
SELECT EMPNO || ENAME--���� || ���ڿ�(���������� ���� -> ���ڿ��� ����ȯ)
FROM EMP;

SELECT EMPNO+ENAME --ORA-01722: invalid number (Ÿ�Կ� ���� ��� ����)
FROM EMP;

--�����..�츮ȸ�翡 ������ ��ִ°�
SELECT JOB FROM EMP;
--DISTINCT : �ߺ� ������ �����ϰ� ���
--DISTINCT : GROUPING ���� ������ ó��
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT JOB, DEPTNO FROM EMP ORDER BY JOB;
SELECT DISTINCT JOB, DEPTNO FROM EMP ORDER BY DEPTNO;

--ORACLE, JAVA ���
--�����ڵ� ���� ����(+,*,-...)
--% �ڹٿ��� ������ ���ϱ�, % ����Ŭ������ ������(�˻� ����)
--����Ŭ���� ������ �� ������(+,-,*,/) ������ ���ϱ⸸ �Լ��� ������ >> MOD()
--������̺��� ����� �޿��� 100���� �λ�� ����� ���
--DESC EMP;
SELECT EMPNO, SAL, SAL + 100 AS"�λ�޿�" FROM EMP;

--DUAL �ӽ� ���̺�
SELECT 100+100 FROM DUAL;
SELECT 100||100 FROM DUAL;--���������� ����ȯ �� ����
SELECT '100'+100 FROM DUAL;--+�����ڷ� ����� �����ϸ� ����ȯ �� ����
SELECT '100A' + 100 FROM DUAL;--ORA-01722: invalid number

--�񱳿�����
-- > < <= >=
--JAVA ����(==) �Ҵ�(=)
--ORACLE ����(=) ���� �ʴ�(!=)

--�������� 
--AND, OR, NOT

--������(���ϴ� ROW(��)�� �������ڴ�)
SELECT *
FROM emp
WHERE SAL >= 3000;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 3000;

--�̻�, ���� =����
--�ʰ�, �̸� = ����

--����� 7788���� ����� ���, �̸�, ����, �Ի����� ���
--������, ������, Ʃ��, ����
--������� : 
SELECT  EMPNO, ENAME, JOB , hiredate--3��° ���� ���⼭ 2���� �ʿ��Ѱ͸� �̾ƿ�
FROM EMP                            --1��° ���� ���⼭ �����͸� ���� �޸𸮿� �ø�
WHERE EMPNO = 7788;                 --2��° ���� ���⼭ 1���� �Ÿ�

--����� �̸��� KING�� ����� ���, �̸�, �޿� ������ ���
SELECT EMPNO, ENAME, SAL
FROM emp
WHERE ENAME = 'KING';

--��(AND, OR)
--�޿��� 2000�̻��̸鼭 ������ MANAGER�� ����� ��� ������ ���
--�ΰ��� ������ ��� �����ϴ� ������(�Ѵ� ��)
SELECT *
FROM EMP
WHERE SAL > 2000 AND JOB = 'MANAGER';

--�޿��� 2000�̻��̰ų� ������ MANAGER�� ����� ��� ������ ���
SELECT *
FROM EMP
WHERE SAL > 2000 OR JOB = 'MANAGER';

--����Ŭ ��¥(DB������ ��¥)
--����Ŭ ��¥ �Լ�(SYSDATE)
SELECT SYSDATE FROM DUAL;
--20/03/31

--���� ������ ����ڰ� ��¥ ������ 'YYYY-MM-DD HH24:MI:SS' �� ������ �����ϰڴ�.
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
SELECT * FROM SYS.nls_session_parameters;--�ý��� ������ ������ �ִ� ȯ�� ���̺�
--NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
--NLS_DATE_LANGUAGE	KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF
SELECT SYSDATE FROM DUAL;

SELECT HIREDATE FROM EMP;
--�Ի����� 1980-12-17�� ����� ��� ������ ���
SELECT * FROM EMP WHERE HIREDATE = '1980-12-17';

SELECT * FROM EMP WHERE HIREDATE = '80-12-17';
--���� : RR-MM-DD >> YYYY-MM-DD

--����� �޿��� 2000 �̻��̸鼭 4000 ������ ��� ����� ������ ���
SELECT *
FROM EMP
WHERE SAL >= 2000 AND SAL <= 4000;
--������ BETWEEN A AND B (= ����)-> �̸�, �ʰ��� ������
SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 4000;
--����� �޿��� 2000 �ʰ��̰� 4000 �̸��� ��� ����� ������ ���
SELECT *
FROM EMP
WHERE SAL > 2000 AND SAL < 4000;

--�μ���ȣ�� 10 �Ǵ� 20 �Ǵ� 30���� ����� ���, �̸� , �޿�, �μ���ȣ�� ���
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO =10 OR deptno = 20 OR deptno = 30;
-- IN ������
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(10,20,30);
--IN �����ڸ� Ǯ��� �˾ƾ��Ѵ� : WHERE DEPTNO =10 OR deptno = 20 OR deptno = 30;

--�μ���ȣ�� 10 �Ǵ� 20�� �ƴ� ����� ���, ����� �̸�, �޿�, �μ���ȣ�� ����ϼ���
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO NOT IN(10,20);
--IN�� ������ NOT IN(�� AND �� AND...)

--POINT : ORACLE �� ǥ��(�����Ͱ� ����) >> NULL
--NULL ������ ��� ������
CREATE TABLE MEMBER (
    USERID VARCHAR2(20) NOT NULL, --�ʼ��Է�
    NAME VARCHAR2(20) NOT NULL,--�ʼ��Է�
    HOBBY VARCHAR2(50)--�ƹ��͵� �Ⱦ��� DEFAULT�� NULL�� ����(NULL ���� ��� = ������ �ȹ޾Ƶ���)
    
);
SELECT * FROM MEMBER;
INSERT INTO MEMBER(USERID,HOBBY) VALUES('HONG', '���');
--cannot insert NULL into ("BIT"."MEMBER"."NAME")
INSERT INTO MEMBER(USERID,NAME) VALUES('HONG', 'ȫ�浿');
--HOBBY Į���� �����ʹ� NULL �� �ڵ����� ������
INSERT INTO MEMBER(USERID,NAME,HOBBY) VALUES('KIM', '�达','����');
COMMIT;

SELECT * FROM MEMBER;

--������ ���� �ʴ� ��� ����� ������ ����ϼ���
--0�� ������ ���(�޴� ���ǿ� ����)
--COMM�÷��� �����Ͱ� NULL�� �͸�
SELECT *
FROM EMP
WHERE COMM =NULL;--Ʋ��

--null�� �񱳴�
SELECT * FROM EMP WHERE COMM IS NULL;
--�̷��� ��(IS NULL, IS NOT NULL)

--������ �޴� ��� ����� ������ ���
SELECT * FROM EMP WHERE COMM IS NOT NULL;

--��� ���̺��� ���, �̸�, �޿�, ����, �ѱ޿��� ���
--�ѱ޿� : �޿�+����
SELECT EMPNO, ENAME, SAL, COMM, SAL+NVL(COMM,0) AS "TOTAL INCOME"
FROM EMP;

--POINT >> NULL
--1. NULL���� ��� ������ �� ����� NULL�̴�.
--2. �� ���� �ذ� : NVL(), NVL2() -> NULL ���� �ٸ� ������ �ٲ�(REPLACE)
--TIP MS-SQL -> CONVERT()
--    MY-SQL -> IFNULL()

SELECT NULL+100 FROM DUAL;
SELECT 100+NVL(NULL,0) FROM DUAL;

SELECT COMM, NVL(COMM,111)FROM EMP;

--����� �޿��� 1000 �̻��̰� ������ ���� �ʴ� ����� ���, �̸�, ����, �޿�, ������ ���
SELECT EMPNO, ENAME, JOB, SAL, COMM
FROM EMP
WHERE SAL >= 1000 AND COMM IS NULL;
------------------------------------------------------------------
--DQL(DATA QUERY LANGUAGE) : SELECT(60%)
--DDL : CREATE, ALTER, DROP(��ü(���̺�) ����, ����, ����)(30%)
--DML : INSERT, UPDATE, DELETE(������ ����)(10%)

--JAVA : class Board{private boardno int}
--oracle : create table Board (boardno number not null)

CREATE TABLE BOARD(
    BOARDID NUMBER NOT NULL,--���� �ʼ� �Է�
    TITLE VARCHAR2(20) NOT NULL, --�ѱ� 10��, ���� Ư������ ������ 20�� , �ʼ��Է�
    CONTENT VARCHAR(2000)NOT NULL,--�ʼ��Է�
    HP VARCHAR2(20) --DEFAULT NULL ���(�ʼ��Է� �ƴ�)
);

DESC BOARD;

--DML(������ ���۾�) �� �ݿ� ���θ� �����ؾ���
--INSERT
--UPDATE
--DELETE
--�ݵ�� �� ����� �ݿ����� ������� �����ؾ���
--COMMIT(���� �ݿ���)
--ROLLBACK(���� �ݿ��� ���)--������ COMMIT �������� ���ư���

INSERT INTO BOARD(BOARDID, TITLE, CONTENT)
VALUES(100, 'ORACLE', 'SIBAL');
COMMIT;

SELECT * FROM BOARD;

INSERT INTO BOARD(BOARDID, TITLE, CONTENT)
VALUES(200, 'JAVA', '�׸��� ����');
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
VALUES('�ر�','236RP', 15, 36, 99, -17, 'MIDDLE', '54 DMG WHEN CLEAN HIT');

INSERT INTO PAULFRAMEDATA2(NAME, COMMAND ,STARTFRAME, DAMAGE, HITFRAME, GUARDFRAME, HITLEVEL, OTHERS)
VALUES('������','2RKRPAP(JUST)', 15, 58, 99, -31, 'LOW, MIDDLE, MIDDLE', 'NEED JUST');

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
VALUES(100,'ORACLE','�Ҹ���');
COMMIT;

INSERT INTO BOARD(BOARDID, TITLE, CONTENT)
VALUES(200,'JAVA','�׸���');

COMMIT;
ROLLBACK;
SELECT BOARDID, NVL(HP,'EMPTY')AS"HP"FROM BOARD;

--���ڿ� �˻�
--�ּ� �˻� : [��] �Է� >> ���ﵿ, ����...(LIKE ���� �˻�)
--���ٿ� ���� �˻� ������ : LIKE
--LIKE ������ ����(���ϵ� ī�� ����(% : ��� ��, _ : �� ����) ����)

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%A%';--ENAME �÷��� ������ �߿��� A��� ���ڰ� ����ִ� ��� ����� ã�´�.

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%a%';--��ҹ��� �����ϰ� ������

SELECT ENAME FROM EMP WHERE ENAME LIKE '%S';--�̸��� ������ ���ڰ� S�� ���

SELECT ENAME FROM EMP WHERE ENAME LIKE '%LL%';--LL �پ��־����

SELECT ENAME FROM EMP WHERE ENAME LIKE'%L%L%';--L�� 2�� ������ ��

SELECT ENAME FROM EMP WHERE ENAME LIKE '%A%A%';--ADAMS

SELECT ENAME FROM EMP WHERE ENAME LIKE '_A%';--ù ���ڴ� ����� �͵� �������, �ι�° ���ڴ� �ݵ�� A�� �Ͷ�.(�ι�° ���ڰ� A�� �����ϴ� ��� ��
--WARD
--MARTIN
--JAMES

--����ǥ����
--REGEXP_LIKE
SELECT * FROM EMP WHERE REGEXP_LIKE(ENAME, '[A-C]');
--����ǥ�� ���� 5�� ����� (���Ŀ� ī�信 ���� �ø�)
----------------------------------------------------------------
--������ �����ϱ�
--ORDER BY �÷��� : ���ڿ�, ����, ��¥
--��������(ASC) : ������(����Ʈ����)
--��������(DESC) : ������

SELECT *
FROM EMP
ORDER BY SAL;

SELECT *
FROM EMP
ORDER BY SAL ASC;

--�޿��� ���� �޴� ������ �����ؼ� ���

SELECT *
FROM EMP
ORDER BY SAL;

--�Ի����� ���� ���� ������ �����ؼ� ��� �̸� �޿� �Ի��� ������ ���
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;
/*
SELECT      3
FROM        1
WHERE       2
ORDER BY    4(SELECT ����� ����) >> DB���� ���� ���� �۾�
*/

SELECT EMPNO, ENAME, SAL, JOB, HIREDATE
FROM EMP
WHERE JOB = 'MANAGER'
ORDER BY HIREDATE DESC;
--�ؼ� : EMP ���̺��� ��å�� MANAGER�� ����� ���, �̸�, ����, ��å, �Ի����� �Ի��Ͽ� ���� ������������ ����ض�.

--ORDER BY �÷��� DESC, �÷��� ASC, �÷��� DESC
SELECT JOB, DEPTNO
FROM EMP
ORDER BY JOB ASC, DEPTNO DESC;--GROUPING ����

SELECT JOB, DEPTNO
FROM EMP
ORDER BY DEPTNO DESC, JOB ASC;

---------------------------------------------------
--������
--������(UNION) : ���̺�� ���̺��� �����͸� ��ġ�� ��(�⺻������ �ߺ��� ������)
--UNION ALL : �ߺ��� �����

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
--1. �����Ǵ� [�÷��� Ÿ��]�� �����ؾ� ��.
SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DNAME, DEPTNO FROM DEPT;
--expression must have same datatype as corresponding expression

SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DEPTNO, DNAME FROM DEPT;

--2. �����Ǵ� �÷��� ������ ����(NULL�� ���⼱ ������)
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC FROM DEPT;
--query block has incorrect number of result columns
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC, NULL FROM DEPT;

--�ǹ� >> SUBQUERY (IN LINE VIEW)
SELECT *
FROM (
    SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DEPTNO, DNAME FROM DEPT
    )ORDER BY EMPNO DESC;
--������� �ʺ� ����������...�ǹ������� �ؾ���...���̺��Ѱ�(�������̺�)
--------------------------------------------------
--����Ŭ �Լ�

/*
���� �� �Լ��� ����
1.������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���ڰ� ��� �����Ҽ�����
2. ������ �Լ� : ���ڸ� �Է¹ް� ���ڸ� ������
3.��¥�� �Լ� : ��¥���� ���� ������
*/
/*
SELECT * FROM SYS.nls_database_parameters;
--NLS_CHARACTERSET	AL32UTF8 �ѱ� 3����Ʈ �ν�
--K01KSC5601 2����Ʈ(�ٵ� ��ȯ�ϸ� ����)
SELECT * FROM SYS.nls_database_parameters WHERE PARAMETER LIKE '%CHAR%';
*/
--���ڿ� �Լ�
SELECT INITCAP('THE SUPER MAN') FROM DUAL;--ù���� �빮�ڷ� �������

SELECT LOWER('AAA'), UPPER('aaa')FROM DUAL;

SELECT ENAME, LOWER(ENAME) AS "ENAME" FROM EMP;

SELECT * FROM EMP WHERE LOWER(ENAME) = 'king';

--���ڿ� ����
SELECT LENGTH('abc')FROM DUAL;--3��

SELECT LENGTH('ȫ�浿')FROM DUAL;--3��
SELECT LENGTH(' ȫ A�� ��')FROM DUAL;--7��

--���� ������ ||
--CONCAT()
SELECT 'A' || 'B' || 'C' AS "DATA" FROM DUAL;

SELECT CONCAT('a', 'b')FROM DUAL;--AB

SELECT CONCAT(ENAME,JOB)AS "CONCAT" FROM EMP;--SMITHCLERK

/*������̺��� ENAMEĮ�� ������ ��� : ù���ڴ� �ҹ��� ���������ڴ� �빮��
))�� ����� �ϳ��� �÷����� ���(�̸��� FULLAME


*/
--LPAD, RPAD(ä���)
SELECT LPAD('ABC',10,'*')FROM DUAL;
SELECT RPAD('ABC',10,'*')FROM DUAL;

--EMP���̺���ENAME �÷��� �����͸� ����ϴµ� ù���ڸ� ����ϰ� ������ *�� ǥ��.
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
--�ϳ��� �÷����� ������� ���
--100 : 123456-*******
--200 : 234567-*******
--����� �÷����� "JUMINNUMBER"
SELECT ID || ' : ' || RPAD(SUBSTR(JUMIN,1,7),LENGTH(JUMIN),'*') AS "JUMINNUMBER"
FROM MEMBER2;

--RTRIM �Լ�
--LTRIM �Լ�
--������/���� ���ڸ� ������

SELECT RTRIM('MILLER', 'ER') FROM DUAL;--MILL
SELECT LTRIM ('MILLLLLLLLER', 'MIL')FROM DUAL;--ER
--�ߺ����� ���� ����

SELECT '>' || RTRIM('MILLER          ',' ')|| '<' FROM DUAL;
-->MILLER<
--ġȯ�Լ�(REPLACE)
SELECT ENAME, REPLACE(ENAME, 'A','�Ϳ�') FROM EMP;
--SMITH	SMITH
--ALLEN	�Ϳ�LLEN
--WARD	W�Ϳ�RD
----------------------------------------------------
--���� �Լ�
--ROUND(�ݿø�)
--TRUNC(�����Լ�)
--MOD()������ ����

--   -3 -2  -1  0   1   2   3...
SELECT ROUND(12.345,0) AS "R" FROM DUAL;--0�� �Ķ���ͷ� ���� �����θ� ���ܶ� --12
SELECT ROUND(12.567,0) AS "R" FROM DUAL;-- 13
SELECT ROUND(12.345,1) AS "R" FROM DUAL;--12.3
SELECT ROUND(12.567,1) AS "R" FROM DUAL;--  �Ҽ��� ���° �ڸ����� ���ܶ�     12.6

SELECT ROUND(12.567,-1) AS "R" FROM DUAL;--10
SELECT ROUND(15.567,-1) AS "R" FROM DUAL;--20


--TRUNC(�����Լ�)
SELECT TRUNC(12.345,0) AS "R" FROM DUAL;--0�� �Ķ���ͷ� ���� �����θ� ���ܶ� --12
SELECT TRUNC(12.567,0) AS "R" FROM DUAL;-- 12
SELECT TRUNC(12.345,1) AS "R" FROM DUAL;--12.3
SELECT TRUNC(12.567,1) AS "R" FROM DUAL;--  �Ҽ��� ���° �ڸ����� ���ܶ�     12.5

SELECT TRUNC(12.567,-1) AS "R" FROM DUAL;--10
SELECT TRUNC(15.567,-1) AS "R" FROM DUAL;--10
SELECT TRUNC(15.567,-2) AS "R" FROM DUAL;--0

--������
SELECT 12/10 FROM DUAL;--1.2
SELECT MOD(12,10) FROM DUAL;--2 �������� �����ڰ� �ƴ϶� �Լ��� ����

SELECT MOD(0,0)FROM DUAL;  --0

----------------------------------------------------------
--��¥�Լ�
SELECT SYSDATE FROM DUAL;
--��¥ ����(POINT)
--DATE+NUMBER >> DATE
--DATE-NUMBER >> DATE
--DATE-DATE >> NUMBER(�ϼ�)

SELECT HIREDATE FROM EMP;

SELECT MONTHS_BETWEEN('2018-01-01','2010-01-01')FROM DUAL;--��� ����?//96
SELECT MONTHS_BETWEEN(SYSDATE,'2010-01-01')FROM DUAL;--123

SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'2010-01-15'),1)FROM DUAL;
--122.565020161290322580645161290322580645
--122.6
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,'2010-01-15'),1)FROM DUAL;--122.5

--POINT
--��¥ ������ ���ڿ��� ��¥�� �ٲٴ� �Լ�(TO_DATE())

SELECT TO_DATE('2020-04-01')+100 FROM DUAL;--2020-07-10 00:00:00
SELECT TO_DATE('2020-04-01')-100 FROM DUAL;--2019-12-23 00:00:00

SELECT SYSDATE + 1000 FROM DUAL;--2022-12-27 12:26:46

--QUIZ
--1. ��� ���̺��� ������� �Ի��Ͽ��� ���糯¥���� �ټӿ����� ���ϼ���
--�� �ټӿ����� �����κи� ����ϼ�
SELECT ENAME,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE),0)AS "�ټӿ���" FROM EMP;


--2.�Ѵ��� 31���̶�� ���ؿ��� �ټ��ϼ��� ���ϼ�(�ݿø� ��)
--(��¥ - ��¥ >> 150��)�Լ� ��
SELECT ENAME, TRUNC((SYSDATE - HIREDATE)/31,0)AS "�ټӿ���" FROM EMP;
------------------------------------------------------------------------

--��ȯ�Լ� : TODAY POINT
--ORACLE���� �ٷ�� ������ ���� : ����, ����, ��¥
--TO_CHAR() : ����->����(1000->$1000), ��¥->����(2020-01-01 -> 2020�� 01�� 01��) = FORMATTING

--TO_DATE() : ���� -> ��¥ >> SELECT '2020-12-12'+100 
--                          SELECT TO_DATE('2020-12-12')+100

--TO_NUMBER() : ���� -> ����(���� �ڵ� ����ȯ)
SELECT '100' + 100 FROM DUAL;
SELECT TO_NUMBER('100')+100 FROM DUAL;

--TO_NUMBER (���� -> ����) �ڵ� ������
SELECT '1' + 100 FROM DUAL;
SELECT TO_NUMBER('1')+100 FROM DUAL;

--TO_CHAR() : FORMAT >> ���� ,��¥(���Ĺ���
SELECT TO_CHAR(SYSDATE)|| '��' FROM DUAL;--2020-04-01 12:55:27��
--PDF 69p ���Ĺ���ǥ
SELECT SYSDATE , TO_CHAR(SYSDATE, 'YYYY')||'��' AS "YYYY",
                TO_CHAR(SYSDATE, 'YEAR'),
                 TO_CHAR(SYSDATE, 'MM'),
                  TO_CHAR(SYSDATE, 'DD'),
                   TO_CHAR(SYSDATE, 'DY')
                   FROM DUAL;
--2020-04-01 12:57:22	2020��	TWENTY TWENTY	04	01	��

--�Ի����� 12���� ������� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ���
SELECT EMPNO, ENAME, HIREDATE, TO_CHAR(HIREDATE, 'YYYY')||'��' AS "�Ի�⵵", TO_CHAR(HIREDATE, 'MM')||'��'AS "�Ի��"
FROM EMP
WHERE TO_CHAR(HIREDATE, 'MM')= '12';

SELECT TO_CHAR(HIREDATE, 'YYYY MM DD') FROM EMP;
--1980 12 17
SELECT TO_CHAR(HIREDATE, 'YYYY"��" MM"��" DD"��"') FROM EMP;
--1980�� 12�� 17��

--TO_CHAR() ���� -> ���ڷ�(���Ĺ���)
--PDF FILE 71p ǥ
--100000 > ��� >> $100,000(����)

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
--HR ���� ��ȯ
SELECT *FROM employees;

/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ� fullname ��Ī �ο��ؼ� ����ϰ�
�Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� ������ 10%(���� * 1.1)�λ��� ����
����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/
SELECT FIRST_NAME || ' ' || LAST_NAME AS "FULL NAME", TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')AS "HIREDATE",
TO_CHAR(SALARY*12, '$999,999')AS "YEONBONG", TO_CHAR(TRUNC((SALARY*12)*1.1,0), '$999,999') AS "INSANGYEONBONG"
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY')>=2005
ORDER BY SALARY*12 DESC;--ORDER BY "YEONBONG" ����
























--bit ���� ��ȯ
------��ȯ�Լ�(TO_CHAR(),TO_DATE(),TO_NUMBER())-----------------
--[�Ϲ��Լ�(���α׷������� ������ ����)]
--NVL(), NVL2() >> NULL ó�� ���
--DECODE() >> JAVA�� IF�� SWITCH ���� ���
--CASE() �Լ� >> IF, SWITCH ���

SELECT COMM, NVL(COMM,0)FROM EMP;
CREATE TABLE T_EMP(
    ID NUMBER(6),--6�ڸ� ������
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

SELECT DEPTNO, DECODE(DEPTNO, 10,'�λ��',20,'������',30,'ȸ���','��Ÿ�μ�')AS "�μ�"
FROM EMP;

SELECT ID, DECODE(ID, 100,'�λ��',200,'������',300,'ȸ���','��Ÿ�μ�')AS "�μ�"
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
--T_EMP2 TABLE���� ID,JUMIN�����͸� ����ϵ� �ֹ� �÷��� ���ڸ��� 1�̸� ���� 2�̸� ���� 3�̸� ���� �� �ܴ� ��Ÿ ��� ����Ͻʽÿ�.
SELECT ID, DECODE(SUBSTR(JUMIN,1,1),1,'MALE',2,'FEMALE',3,'MIDDLE','GOJA')AS "GENDER"
FROM T_EMP2;


SELECT ENAME, DEPTNO,DECODE(DEPTNO, 20, DECODE(ENAME, 'SMITH', 'HELLO', 'WORLD'),'ETC')
FROM EMP;

--CASE ��
--JAVA SWITCH 
/*
CASE ���ǽ� WHEN ���1 THEN ��� 1
             WHEN ���2 THEN ��� 2
              WHEN ���3 THEN ��� 3
    ELSE ��� 4
    END "�÷���"

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

SELECT '0' || TO_CHAR(ZIPCODE), CASE ZIPCODE WHEN 2 THEN '����'
                                             WHEN 31 THEN '���'
                                             WHEN 32 THEN '����'
                                             WHEN 41 THEN '����'
                                             ELSE '��Ÿ ����'
                                             END "REGION NAME"
FROM T_ZIP;

--CASE �÷��� WHEN ��� THEN ��� (= ����)
--������ 
/*
CASE WHEN �÷��� ���� �񱳽� THEN ���
*/

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
SELECT  CASE WHEN SAL <= 1000 THEN '4��'
            WHEN 1001<= SAL <= 2000 THEN '3��'
            WHEN 2001<= SAL <= 3000 THEN '2��'
            WHEN 3001<= SAL <=4000 THEN '1��'
            WHEN SAL>4001 THEN 'Ư��'
    END "SIBAL"
    FROM EMP;
--Ʋ�� ����
select case when sal <= 1000 then '4��'
                 when sal between 1001 and 2000 then '3��'
                 when sal between 2001 and 3000 then '2��'
                 when sal between 3001 and 4000 then '1��'
                 else 'Ư��'
        end "�޿����"
from emp;
--�̰� ����
-------------------------------------------
--�����Լ�
--�����Լ�
--��¥�Լ�
--��ȯ�Լ�(TO_CHAR TO_DATE TO_NUMBER)
--�Ϲ��Լ� NVL(), DECODE(), CASE()
--------------------------------------------
--[�����Լ�] PAGE75
/*
1.COUNT(*) ���? > ROW �ټ��� ��(NULL�� ������), COUNT(�÷���) >> ������ �Ǽ�(NULL�� �������� ����)
2.SUM() �հ�
3.AVG()���
4.MAX()�ִ�
5.MIN()�ּڰ�
���....

�����Լ��� Ư¡
1. �����Լ��� GROUP BY ���� ���� ����Ѵ�
2. ��� �����Լ��� NULL���� �����Ѵ�.(NULL�� �� ���� ����ħ)
3. SELECT ���� �����Լ� �̿ܿ� �ٸ� �÷��� ���� �ݵ�� �� �÷��� GROUP BY���� ��õǾ�� �Ѵ�

*/
SELECT COUNT(*) FROM EMP;--14(Ư�� �÷��� �� ���� ��)
SELECT COUNT(COMM) FROM EMP;--6��(NULL�� ����)
SELECT COUNT(EMPNO) FROM EMP;--14

SELECT COUNT(NVL(COMM,0)) FROM EMP;--NULL�� ������ NVL�� ����.
--�޿��� ���� ���ض�.
SELECT SUM(SAL) AS "�޿���" FROM EMP;
--���
SELECT ROUND(AVG(SAL),0) AS "AVERAGE SAL" FROM EMP;--2073
--ȸ�� �� ������ �󸶳� ���޵ǰ� �ֳ�(����� ���ΰ�)
SELECT TRUNC(AVG(COMM),0) FROM EMP; --721
SELECT TRUNC(SUM(COMM) / COUNT(COMM)) FROM EMP;--����� 6������ ���(NULL ����)

SELECT ROUND(AVG(NVL(COMM,0)),0)AS "AVERAGE COMM" FROM EMP;--309
SELECT TRUNC(SUM(COMM) / COUNT(NVL(COMM,0))) FROM EMP;
--ȸ���� ������(��ü ������� ������...309)
--ȸ���� ������(�޴� ������� ������...721)

--NULL���� : �ڵ�
SELECT COUNT(*) FROM EMP WHERE COMM IS NULL;--NULL���� 8�� �ִ�

SELECT COUNT(*) FROM EMP WHERE EMPNO IS NULL;--NULL�� ����

SELECT MAX(SAL) FROM EMP;

SELECT MIN(SAL) FROM EMP;

--POINT 
SELECT EMPNO, COUNT(EMPNO) FROM EMP;--EMPNO 14��, COUNT() 1��
--"not a single-group group function"
SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL), COUNT(SAL), COUNT(*) FROM EMP;

--�μ��� ��� �޿��� ���
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

--������ ��� �޿�
SELECT JOB ,AVG(SAL)
FROM EMP
GROUP BY JOB;
--������ ��� �޿�, �޿���, �ִ�޿�, �ּұ޿�, �Ǽ��� ���
SELECT JOB, TRUNC(AVG(SAL),0), SUM(SAL), MAX(SAL), MIN(SAL), COUNT(SAL)
FROM EMP
GROUP BY JOB;
/*
GROUPING ���� 

DISTINCT �÷���1, �÷���2
ORDER BY �÷���1, �÷���2
GROUP BY �÷���1, �÷���2...

*/
--�μ���, ������ �޿��� ���� ���ϼ�
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




