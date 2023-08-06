/*
���ϸ�: ex07-select-join.sql

join
    �ΰ� �̻��� ���̺��� ���� ����� �����ϱ� ���� ����

Natural join
     �� ���̺��� ������ ������ �̸��� ���� ���� ������� �ڵ�����
     ���̺��� ���� �� �� �ִ�
*/
select department_id, department_name, location_id, city--city���� join �����ν� ���� �� ����
from departments
natural join locations;

select * from departments;--�� ���̺� ��� location_id�� �־� join���� lo �ܷ���ȣ
select * from locations;--lo�� ������ȣ��

/*
using ���� ����
    ��������� ������ �����ϰ����ϴ� ���� ������
    
*/

select employee_id, last_name, location_id, department_id
from employees join departments
using (department_id);--de_id�� ���ؼ� join�Ϸ��� ���� ���

/*
on ���� ����
    on���� join ������ ����- ���� ����
*/
select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d--��Ī
on e.department_id = d.department_id;

select e.employee_id, e.last_name,
    e.department_id, d.location_id
from employees e, departments d
where e.department_id = d.department_id;



-- on ���� ����� 3-way ����
select e.employee_id, l.city, d.department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

select * from employees e;--ed�� de_id�� �ߺ� dl�� lo_id�� �ߺ��̹Ƿ� �ι� on�� �̿��� Ǯ��!
select * from departments d;
select * from locations l;

-- ���ο� �߰� ���� ����
select e.employee_id, e.last_name, e.department_id, e.manager_id,
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
and e.manager_id = 149;--�߰� ����

/* 
���̺� ��ü ����
    on ���� ����ϴ� self join 
*/
select worker.last_name e, manager.last_name m
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

select * from employees;

/* 
nonequijoin
    ��ȣ ������ ���� �ٸ� �����ڸ� �����ϴ� ���� ����
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
inner join�� outer join
    
    inner join
        ��ġ���� �ʴ� ���� ��¿� ǥ�õ��� ����(������ �ش� �� ���)
    
    outer join
        �� ���̺��� ���� ������� �ٸ� ���̺���� ������ ���� ����� ������ ��ȯ �����յ� ����
        
left outer join(������ ����)
    department  ���̺� �����Ǵ� ���� ��� null���־
    ���� ���̺��� employees ���̺��� ��� ���� �˻�
*/
select e.last_name, e.department_id, d.department_name
from employees e left outer join department d--��ġ�� �ʴ� �͵� ��ȸ
on e.department_id = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e , department d--��ġ�� �ʴ� �͵� ��ȸ
where e.department_id = d.department_id(+);--left�� �����ʿ� (+)--�̰� �ʿ�x

/*
right outer join(������ ������)
    employees ���̺� �����Ǵ� ���� ��� null�̾
    ������ ���̺��� departments ���̺��� ��� ���� �˻��մϴ�.
*/
select e.last_name, e.department_id, d.department_name
from employees e right outer join department d
on e.department_id = d.department_id;

/*
full outer join
    department, employees �����Ǵ� ���� ���
    ���̺��� ������� �˻� (����)
*/
select e.last_name, e.department_id, d.department_name
from employees e full outer join department d
on e.department_id = d.department_id;

/*
cartesian product
    ���� ������ �߸��ǰų� ������ ������ ��� ����� ��� ���� ������ ǥ�õǴ� 
    cartesian product�� ��Ÿ��(��� ��찡 �� ����)


cross join 
    �� ���̺��� ���� ���� �����մϴ�.
*/
select last_name, department_name
from employees
cross join departments;