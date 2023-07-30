/*
파일명: ex03-select-orderby.sql

ORDER BY 절
    ORDER BY 절을 사용하여 검색된 행을 정렬합니다.
        ASC : 오름차순, 기본값
        DESC : 내림차순
    SELECT 문의맨 마지막에 옴

[select 문 기본형식]    
select (distict 있을 수도 없을 수도,중복제거) 컬럼명1, 컬럼명2 ...  .5
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

-- 열 ALIAS를 기준으로 정렬
SELECT employee_id, last_name, salary*12 annsal--as 생략
FROM employees
ORDER BY annsal;

-- 숫자로 정렬
SELECT last_name, job_id, department_id,hire_date
FROM employees
ORDER BY 3; --3번째 컬럼을 기준으로 정렬

-- 여러 열을 기준으로 정렬
SELECT last_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC ;--1번째 컬럼으로 정렬후 같은 값끼리 내림차순 정렬


