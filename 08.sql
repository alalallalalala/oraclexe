/*
���ϸ�: ex08-select-subquery.sql
 
subquery ����
    select ���� ���ԵǴ� select��
*/

-- ���� �� subquery ����
select last_name, salary
from employees
where salary > (select salary from employees where last_name='Abel');

-- subquery���� �׷� �Լ� ���
select last_name, job_id, salary
from employees
where salary = (select min(salary) from employees);

/*
���� �� subquery 
    in
        ����Ʈ�� ���� ����� ����
    any
        =,<>,>,<,<=,>= �����ڰ� �տ� �־����
        < any �ִ밪���� ��
        > any �ּҰ����� ŭ
        = any in�� ����
    all
        < all �ּҰ����� ����
        > all �ִ밪���� ŭ
*/

select employee_id, last_name, job_id, salary
from employees
where salary < any(select salary from employees where job_id='IT_PROG')--�ִ밪���� ����
AND job_id <> 'IT_PROG';-- ���� �������� ����

select employee_id, last_name, job_id, salary
from employees
where salary > all(select salary from employees where job_id='IT_PROG')
AND job_id <> 'IT_PROG';

/*
exisys ������
    subquery���� �ּ��� �Ѱ��� ���� ��ȯ�ϸ� true�� ��
*/
select * from departments
where not exists--not�������� t->f f->t
    (select * from employees
    where employees.department_id = departments.department_id);
    --where�� �ִ� ������ �����ϸ� true but not�������� fail�̵� ���� ������ ���� �ุ ��ȸ?
    
/* 
subquery�� null ��
    ��ȯ�� �� �� �ϳ��� null ���̸� ��ü ������ ���� ��ȯ���� ����
    null ���� ���ϴ� ��� ������ ����� null�̱� ����
*/

select emp.last_name
from employees emp 
where emp.employee_id not in 
                        (select mgr.manager_id
                        from employees mgr);
