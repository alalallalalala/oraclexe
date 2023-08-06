/*
파일명: ex08-select-subquery.sql
 
subquery 구문
    select 문에 포함되는 select문
*/

-- 단일 행 subquery 실행
select last_name, salary
from employees
where salary > (select salary from employees where last_name='Abel');

-- subquery에서 그룹 함수 사용
select last_name, job_id, salary
from employees
where salary = (select min(salary) from employees);

/*
여러 행 subquery 
    in
        리스트의 임의 멤버와 같음
    any
        =,<>,>,<,<=,>= 연산자가 앞에 있어야함
        < any 최대값보다 작
        > any 최소값보다 큼
        = any in과 같음
    all
        < all 최소값보다 작음
        > all 최대값보다 큼
*/

select employee_id, last_name, job_id, salary
from employees
where salary < any(select salary from employees where job_id='IT_PROG')--최대값보다 작음
AND job_id <> 'IT_PROG';-- 같은 직업군은 제외

select employee_id, last_name, job_id, salary
from employees
where salary > all(select salary from employees where job_id='IT_PROG')
AND job_id <> 'IT_PROG';

/*
exisys 연산자
    subquery에서 최소한 한개의 행을 반환하면 true로 평가
*/
select * from departments
where not exists--not으로인해 t->f f->t
    (select * from employees
    where employees.department_id = departments.department_id);
    --where에 있는 조건이 만족하면 true but not으로인해 fail이됨 따라서 직원이 없는 행만 조회?
    
/* 
subquery의 null 값
    반환된 값 중 하나가 null 값이면 전체 쿼리가 행을 반환하지 않음
    null 값을 비교하는 모든 조건은 결과가 null이기 때문
*/

select emp.last_name
from employees emp 
where emp.employee_id not in 
                        (select mgr.manager_id
                        from employees mgr);
