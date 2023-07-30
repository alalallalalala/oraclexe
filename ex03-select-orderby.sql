/*
���ϸ�: ex03-select-orderby.sql

ORDER BY ��
    ORDER BY ���� ����Ͽ� �˻��� ���� �����մϴ�.
        ASC : ��������, �⺻��
        DESC : ��������
    SELECT ���Ǹ� �������� ��

[select �� �⺻����]    
select (distict ���� ���� ���� ����,�ߺ�����) �÷���1, �÷���2 ...  .5
from ���̺��                                                   .1
where ������                                                    .2
group by �÷���                                                 .3
having ������ �׷쿡 ���� ����                                    .4
--order by �÷��� [asc|desc(����|����)] ����                        .6(�ν� ����?)
*/

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;--���� �⺻�� ��������(asc)

-- �������� ����
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC; --��������

-- �� ALIAS�� �������� ����
SELECT employee_id, last_name, salary*12 annsal--as ����
FROM employees
ORDER BY annsal;

-- ���ڷ� ����
SELECT last_name, job_id, department_id,hire_date
FROM employees
ORDER BY 3; --3��° �÷��� �������� ����

-- ���� ���� �������� ����
SELECT last_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC ;--1��° �÷����� ������ ���� ������ �������� ����


