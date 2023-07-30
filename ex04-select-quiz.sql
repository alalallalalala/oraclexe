/*
ex04-select-quiz.sql
*/

-- Q1. "employees" 테이블에서 모든 직원들의 성last_name, 이름first_name 및 급여salary를 조회

-- Q2. "jobs" 테이블에서 모든 직무들의 직무 IDjob_id와 직무명,job_title을 조회

-- Q3. 'departments' 테이블에서 모든 부서들의 부서 IDdepartment_id와 부서명, department_name을 조회하세요

-- Q4. "locations" 테이블에서 모든 지역들의 지역 IDlocation_id와 도시city를 조회하세요

-- Q5. "employees" 테이블에서 급여salary가 5000 이상인 직원들의 이름,first_name과 급여salary를 조회

-- Q6. "employees" 테이블에서 근무 시작일이 2005년 이후인 직원들의 이름과 근무 시작일을 조회하세요

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