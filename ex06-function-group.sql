/*
파일명: ex06-function-group.sql
*/
/*
여러행(그룹) 함수
avg()  평균
max() , min() 최대 최소
sum() 합
*/

select avg(salary) avg, max(salary) max, min(salary) min, sum(salary) sum
from employees
where job_id LIKE '%REP%';

-- COUNT() 함수 - NULL 값이 아닌 모든 행의 개수를 반환
select count(*) 
from employees
where department_id =50;

select count(commission_pct) as non_null
from employees
where department_id = 80;
