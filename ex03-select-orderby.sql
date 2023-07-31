/*
파일명: ex03-select-orderby.sql

ORDER BY 절
    ORDER BY 행을 정렬
        ASC 오름차순, 기본값
        DESC 내림차순
    SELECT 문의 마지막에 옴

[select 문 기본형식]    
select (distinct 중복제거) 컬럼명1, 컬럼명2 ...  .5
from 테이블명                                                   .1
where 조건절                                                    .2
group by 컬럼명                                                 .3
having 조건절 그룹에 대한 조건                                    .4
--order by 컬럼명 [asc|desc(오름|내림)] 정렬                        .6(인식 순서?)
*/

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;--정렬 기본값 오름차순(asc)

-- 내림차순 정렬
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC; --내림차순

-- 열 ALIAS(별명)를 기준으로 정렬 가능!
SELECT employee_id, last_name, salary*12 annsal--as 생략
FROM employees
ORDER BY annsal;--ORDER BY annsal desc;는 내림차순 정렬

-- 숫자로 정렬 
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3; --3번째 컬럼을 기준으로 정렬

-- 여러 열을 기준으로 정렬
SELECT last_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC ;--1번째 컬럼으로 정렬후(기본값 asc) 같은 값내에서 내림차순 정렬


