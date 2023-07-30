/*
���ϸ�: ex01-select.sql

SQL (Structured Query Language) - ������ ���� ���
    ������ ������ ���̽� �ý��ۿ��� �ڷḦ ���� �� ó���ϱ� ���� ����� ���
SELECT ��
    �����ͺ��̽����� ���� �˻� ��ɾ�
*/
--��� �� ���� *
SELECT *-- ���� ������ de��
FROM departments;
-- Ư�� �� ����(�����ü� projection)
SELECT department_id, location_id--de���� id�� ������
FROM departments;

/*
����� 
��������ڸ� ����Ͽ� ����/��¥ ������ ǥ���� �ۼ�
+���ϱ�
-����
*���ϱ�
/������
*/

--��� ������
SELECT LAST_NAME, SALARY,SALARY / 300
FROM employees;

/*
������ �켱����
    ���ϱ�, ������� ���ϱ� ���⺸�� ���� ����
*/

SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)--��ȣ 
FROM employees;

/*
������� Null ��
    null ���� �����ϴ� ������� null�� ���
*/
SELECT last_name, 12*salary*commission_pct, salary, commission_pct
FROM employees;

/*
�� alias ����
    �� �Ӹ����� �̸��� 
    �̸� �ٷ� �ڿ� ���� (�� �̸��� alias ���̿� ���� ������ as Ű���尡 �� �� ����.)
    �����̳� Ư�� ���ڸ� �����ϰų� ��ҹ��ڸ� �����ϴ� ��� ū ����ǥ�� �ʿ�
*/
SELECT last_name as name, commission_pct comm, salary * 10 as �޿�10��--as ������ ����
FROM employees;

SELECT last_name "Name", salary*12 "Annual Salary"--�Ѵ� as ����, �����ҷ��� ""�ʿ�
FROM employees;

/*
���Ῥ����
    ���̳� ���ڿ��� �ٸ����� ����
    ||���� ��Ÿ��
    ��� ���� ���� ǥ������ �ۼ�
*/

SELECT last_name||job_id AS "Employees", last_name, job_id--���� id�� em���� ������
FROM employees;

/*
���ͷ� ���ڿ�
    ���ͷ��� SELECT ���� ���Ե� ����, ���� �Ǵ� ��¥
    ��¥ �� ���� ���ͷ� ���� ���� �ٿ�ǥ�� ����� ��
    �� ���ڿ��� ��ȯ�Ǵ� �� �࿡ �� �� ��� ��
*/
SELECT last_name || ' is a ' || job_id AS "Employee Details"
FROM employees;
/* 
��ü �ο� q ������
    �ڽ��� ����ǥ �����ڸ� ����
    �����ڸ� ���Ƿ� ����
    ������ �� ��뼺�� ������
*/
--'�� �̹� ���� �ȿ� �־� q'[]'�� �����
SELECT department_name || q'[ Department's Manager Id: ]' || manager_id
AS "Department and Manager"
FROM departments;

/*
�ߺ��� 
    �⺻������ Query ������� �ߺ� ���� ������ ��� ���� ǥ�õ�
    
DISTINCT 
    ������� �ߺ��� ����
*/

SELECT department_id
FROM employees;

--�ߺ�����
SELECT DISTINCT department_id
FROM employees;

/*
���̺� ����ǥ��
    DESCRIBE ����� ����� ���̺� ������ ǥ��
*/
DESCRIBE employees;
DESC employees;

