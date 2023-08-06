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

select count(commission_pct)
from employees
where department_id = 80;

--count(distinct expr)은 특정 표현식을 기준으로 중복을 제거한 행의 개수 반환
select count(distinct department_id)as de
from employees;

-- nvl 함수를 활용하여 null 값을 다른 값(0)으로 대체한 후 avg() 함수 사용
select avg(nvl(commission_pct,0)) as avg
from employees;
--nvl 사용 x면 null 때문에 계산 불가

/*
group by 
    여러 행을 지정된 컬럼 기준으로 그룹화해 집계 함수를 적용하기 위한 구문
    
having 
    group by 와 함께 사용되며, 그룹화된 결과에 조건을 적용할 떄 사용
    
    where 개별행의 조건
    having 그룹행의 조건
*/

-- 부서별 평균 급여 구하기
select department_id, avg(salary) as avg_salary
from employees
group by department_id;-- 각 부서마다 급여의 평균값을 가져옴

-- group by에서 여러 열을 기준으로 그룹화

select department_id, job_id, sum(salary) 급여합
from employees
where department_id >40--개별행 조건
group by department_id, job_id--그룹화방법
order by department_id;--정렬 asc

-- having 절 사용

-- 부서별 최대 급여가 10000보다 큰 부서를 찾음

select department_id, max(salary) as 최대급여
from employees
group by department_id
having max(salary)>10000;

-- 직무별 총 급여가 13000보다 큰 직무를 찾습니다
select job_id, sum(salary) as 급여합
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by 급여합;

-- 그룹함수 중첩함수 가능

select  max(avg(salary)) as 가장큰급여
from employees
group by department_id;
-- de로 그룹화 > 각 그룹의 평균 > 그중 가장 큰 것 조회
