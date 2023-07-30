/*
���ϸ�: ex02-select-where.sql

������ ����� �� ����
    where ���� ����� ��ȯ�Ǵ� ���� ����

where 
    ������ �����ϴ� ������ query�� ����
    
    ������ ���
    - ���̸�
    - �� ����
    - �� �̸�, ��� �Ǵ� �� ����Ʈ
*/

--where �� ���
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90; --90�� �ุ ��Ÿ�� ���� ����

/*
���ڿ� �� ��¥
    ���ڿ� �� ��¥ ���� ���� ����ǥ�� ����
    ���� ���� ��ҹ��ڸ� �����ϰ� ��¥ ���� ������ ����    
    
    �⺻ ��¥ ǥ�������� �Ͽ���
    ���� RR/MM/DD �����

*/

SELECT last_name,job_id,department_id
FROM employees
WHERE last_name = 'Whalen'; --���� ������ ����� ��ȸ

SELECT last_name, hire_date
FROM employees
WHERE hire_date = '03/06/17';--�����

/*
�� ������
    Ư�� ǥ������ �ٸ� ���̳� ǥ���İ� ���ϴ� ���ǿ��� ��� ��
    = ����
    > ŭ
    >= ũ�ų� ����
    < ����
    <= �۰ų� ����
    <> ���� ����
    BETWEEN ... AND ... �� �� ����(��谪 ����)
    IN(set)             �� ����Ʈ �� ��ġ�ϴ� �� �˻�
    LIKE                ��ġ�ϴ� ���� ���� �˻�
    IS NULL             NULL ������ ����
*/
-- �� ������ ���
SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

--BETWEEN �����ڸ� ����ϴ� ���� ����(�� �� ���̰�谪 ����)
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;--2500,3500����

SELECT last_name, salary
FROM employees
WHERE salary >= 2500 AND salary <= 3500;--and�� �� ������ ���� ��

-- IN �����ڸ� ����ϴ� �������(�� ����Ʈ �� ��ġ�ϴ� �� �˻�)

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

SELECT EMPLOYEE_ID,LAST_NAME,SALARY,MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID =100
OR MANAGER_ID =101
OR MANAGER_ID = 201; --OR ���� �� �ϳ��� �����ص� ������

/*
LIKE �����ڸ� ����Ͽ� ���� ��ġ
    LIKE �����ڸ� ����Ͽ� ��ȿ�� �˻� ���ڿ� ���� ��ü ���� �˻��� ����
    �˻� ���ǿ��� ���ͷ� ���ڳ� ���ڰ� ���Ե� �� ����
        - % : 0�� �̻��� ���ڸ� ��Ÿ�� ��ġ��� x
        - _ : �� ���ڸ� ��Ÿ�� ��ġ��� 0
    
*/

SELECT first_name
FROM employees
WHERE first_name LIKE 'A%';
-- = �� ��������� ������ ���� �� ���� A�� �����ϴ� ���� ���� ������ ��ȸ

-- ��ü ���� ����
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';--_�� �� ���ڸ� ���� ������ 2��° ���ڿ� o�� ���°��� ��ȸ






