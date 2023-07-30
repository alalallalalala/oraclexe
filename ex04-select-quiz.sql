/*
ex04-select-quiz.sql
*/

-- Q1. "employees" ���̺��� ��� �������� ��last_name, �̸�first_name �� �޿�salary�� ��ȸ

-- Q2. "jobs" ���̺��� ��� �������� ���� IDjob_id�� ������,job_title�� ��ȸ

-- Q3. 'departments' ���̺��� ��� �μ����� �μ� IDdepartment_id�� �μ���, department_name�� ��ȸ�ϼ���

-- Q4. "locations" ���̺��� ��� �������� ���� IDlocation_id�� ����city�� ��ȸ�ϼ���

-- Q5. "employees" ���̺��� �޿�salary�� 5000 �̻��� �������� �̸�,first_name�� �޿�salary�� ��ȸ

-- Q6. "employees" ���̺��� �ٹ� �������� 2005�� ������ �������� �̸��� �ٹ� �������� ��ȸ�ϼ���

--1
SELECT last_name,first_name,salary
FROM employees;
--2
SELECT job_id,job_title
FROM jobs;
--3 
SELECT department_id, department_name
FROM departments;
--4
SELECT location_id,city
FROM locations;
--5
SELECT salary,first_name,salary
FROM employees
WHERE salary>=5000;

SELECT hire_date,first_name
FROM employees
WHERE hire_date >= '05/01/01';

SELECT hire_date,first_name
FROM employees
WHERE hire_date > to_date('2005-01-01','yyyy-mm-dd')