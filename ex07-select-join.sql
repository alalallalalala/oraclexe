/*
파일명: ex07-select-join.sql

join
    두개 이상의 테이블에서 관련 행들을 결합하기 위한 연산

Natural join
     두 테이블에서 데이터 유형과 이름이 같은 열을 기반으로 자동으로
     테이블을 조인 할 수 있다
*/
select department_id, department_name, location_id, city--city값을 join 함으로써 얻을 수 있음
from departments
natural join locations;

select * from departments;--두 테이블 모두 location_id가 있어 join가능 lo 외래번호
select * from locations;--lo가 고유번호임

/*
using 절로 조인
    명시적으로 결합을 수행하고자하는 열을 정해줌
    
*/

select employee_id, last_name, location_id, department_id
from employees join departments
using (department_id);--de_id를 통해서 join하려는 열을 명시

/*
on 절로 조인
    on으로 join 조건을 지정- 제일 유용
*/
select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d--별칭
on e.department_id = d.department_id;

select e.employee_id, e.last_name,
    e.department_id, d.location_id
from employees e, departments d
where e.department_id = d.department_id;



-- on 절을 사용해 3-way 조인
select e.employee_id, l.city, d.department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

select * from employees e;--ed는 de_id가 중복 dl은 lo_id가 중복이므로 두번 on을 이용해 풀기!
select * from departments d;
select * from locations l;

-- 조인에 추가 조건 적용
select e.employee_id, e.last_name, e.department_id, e.manager_id,
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
and e.manager_id = 149;--추가 조건

/* 
테이블 자체 조인
    on 절을 사용하는 self join 
*/
select worker.last_name e, manager.last_name m
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

select * from employees;

/* 
nonequijoin
    등호 연산자 외의 다른 연산자를 포함하는 조인 조건
*/

DROP TABLE job_grades;
CREATE TABLE job_grades (
  grade_level CHAR(1),
  lowest_sal NUMBER(8, 2) NOT NULL,
  highest_sal NUMBER(8, 2) NOT NULL
);

ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade_level);


COMMIT;

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

COMMIT;

select*from job_grades;

select e.last_name, e.salary, j.grade_level
from employees e join job_grades j
on e.salary between j.lowest_sal and j.highest_sal;

/*
inner join과 outer join
    
    inner join
        일치하지 않는 행은 출력에 표시되지 않음(교집합 해당 행 출력)
    
    outer join
        한 테이블의 행을 기반으로 다른 테이블과의 연결이 없는 행까지 포함해 반환 여집합도 포함
        
left outer join(기준이 왼쪽)
    department  테이블에 대응되는 행이 없어도 null이있어도
    왼쪽 테이블인 employees 테이블의 모든 행을 검색
*/
select e.last_name, e.department_id, d.department_name
from employees e left outer join department d--겹치지 않는 것도 조회
on e.department_id = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e , department d--겹치지 않는 것도 조회
where e.department_id = d.department_id(+);--left면 오른쪽에 (+)--이건 필요x

/*
right outer join(기준이 오른쪽)
    employees 테이블에 대응되는 행이 없어도 null이어도
    오른쪽 테이블인 departments 테이블의 모든 행을 검색합니다.
*/
select e.last_name, e.department_id, d.department_name
from employees e right outer join department d
on e.department_id = d.department_id;

/*
full outer join
    department, employees 대응되는 행이 없어도
    테이블의 모든행을 검색 (양쪽)
*/
select e.last_name, e.department_id, d.department_name
from employees e full outer join department d
on e.department_id = d.department_id;

/*
cartesian product
    조인 조건이 잘못되거나 완전히 생략된 경우 결과가 모든 행의 조합이 표시되는 
    cartesian product로 나타냄(모든 경우가 다 나옴)


cross join 
    두 테이블의 교차 곱을 생성합니다.
*/
select last_name, department_name
from employees
cross join departments;
