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

select count(commission_pct) as non_null
from employees
where department_id = 80;
