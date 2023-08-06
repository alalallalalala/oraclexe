/*
���ϸ�: ex06-function-group.sql
*/
/*
������(�׷�) �Լ�
avg()  ���
max() , min() �ִ� �ּ�
sum() ��
*/

select avg(salary) avg, max(salary) max, min(salary) min, sum(salary) sum
from employees
where job_id LIKE '%REP%';

-- COUNT() �Լ� - NULL ���� �ƴ� ��� ���� ������ ��ȯ
select count(*) 
from employees
where department_id =50;

select count(commission_pct)
from employees
where department_id = 80;

--count(distinct expr)�� Ư�� ǥ������ �������� �ߺ��� ������ ���� ���� ��ȯ
select count(distinct department_id)as de
from employees;

-- nvl �Լ��� Ȱ���Ͽ� null ���� �ٸ� ��(0)���� ��ü�� �� avg() �Լ� ���
select avg(nvl(commission_pct,0)) as avg
from employees;
--nvl ��� x�� null ������ ��� �Ұ�

/*
group by 
    ���� ���� ������ �÷� �������� �׷�ȭ�� ���� �Լ��� �����ϱ� ���� ����
    
having 
    group by �� �Բ� ���Ǹ�, �׷�ȭ�� ����� ������ ������ �� ���
    
    where �������� ����
    having �׷����� ����
*/

-- �μ��� ��� �޿� ���ϱ�
select department_id, avg(salary) as avg_salary
from employees
group by department_id;-- �� �μ����� �޿��� ��հ��� ������

-- group by���� ���� ���� �������� �׷�ȭ

select department_id, job_id, sum(salary) �޿���
from employees
where department_id >40--������ ����
group by department_id, job_id--�׷�ȭ���
order by department_id;--���� asc

-- having �� ���

-- �μ��� �ִ� �޿��� 10000���� ū �μ��� ã��

select department_id, max(salary) as �ִ�޿�
from employees
group by department_id
having max(salary)>10000;

-- ������ �� �޿��� 13000���� ū ������ ã���ϴ�
select job_id, sum(salary) as �޿���
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by �޿���;

-- �׷��Լ� ��ø�Լ� ����

select  max(avg(salary)) as ����ū�޿�
from employees
group by department_id;
-- de�� �׷�ȭ > �� �׷��� ��� > ���� ���� ū �� ��ȸ
