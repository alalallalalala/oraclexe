/*
���ϸ�: ex05-funtion.sql

�Լ�
    �Ű�����(����)�� �޾� Ư�� ���(���)�� �����ϰ� ����� ��ȯ�ϴ� ������ �Ǿ��ִ�.
    
�Լ� ����
    ������ �Լ� - ������ �Ű������� �޾� ��� �� ��ȯ
    ������(�׷�) �Լ� - ������ �Ű������� �޾� ��� �� ��ȯ
    
*/

-- ������ �Լ�

-- ��ҹ��� ��ȯ �Լ�
-- LOWER() - ���ڿ�->�ҹ���
SELECT employee_id, last_name, department_id
FROM employees
WHERE lower(last_name) = 'higgins';

select * from employees;
--last name�� ��� �빮�ڷ� ������ ��ȸ�� ������ ������ lower�Լ� ���

-- upper() �Լ� - ���ڿ�->�빮��

SELECT upper('higgins')
FROM dual; -- �ӽ� ���̺� �ܼ� ����� ���� ���� �� ����

select 12*3
from dual;

-- initcap() - ���ڿ��� ù ���ڸ� �빮�ڷ� ��ȯ

select employee_id , last_name, department_id
from employees
where last_name = initcap('higgins');--�Լ��� = �����ʿ� ���°� �� �ҽ��� �۰� ����

-- ���� ���� �Լ�
-- concat() - �� ���� �Ķ���� ���� ����
select 'Hello'||'World'
from dual;

select concat('hello','world') from dual;

-- substr() - ������ ������ ���ڿ� ����
select substr('helloworld',1,5) from dual;--1~5������ ��ȸ

-- length - ���ڿ��� ���̸� ���� ������ ǥ��
select length('helloworld') from dual;

--instr() - ���ڿ����� ������ ������ ��ġ�� ã���ϴ�.
select instr('helloworld','w') from dual; 

-- lpad() - ���ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ
select lpad('salary', 10, '*') from dual;

-- rpad() - �����ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ
select rpad('salary', 10, '*') from dual;

--replace() - ���ڿ����� ������ ���ڸ� ġȯ
select replace('jack and jue','j','bl') from dual; --j -> bl

-- trim() - ���ڿ����� ���� �Ǵ� ���� ���ڸ� �ڸ�
select trim('h' from 'helloworld') from dual; -- ���� �����ϱ� ����

-- ���� �Լ� 
-- round() - ������ �Ҽ��� �ڸ����� �ݿø�
select round(45.926, 2) from dual;

-- trunc() - ������ �Ҽ��� �ڸ����� ���� ����
select trunc(45.926, 2) from dual;

-- mod() - ���� �������� ��ȯ
select mod (1600, 300) from dual;

-- ceil() - �־��� ���ڸ� �ݿø��� ������ ��ȯ
select ceil(45.923) from dual;

-- ��¥ �Լ� 

-- sysdate - ���� ��¥�� �ð��� ���� �� �ִ�  pseudo-column
select sysdate from dual;

/*
��¥ ����
    ��¥�� ���ڸ� ���ϰų� ���� ��� ��¥ ���� ����
    �� ��¥ ������ �ϼ��� �˾Ƴ��� ���� ���� ������ ��
*/

select last_name, (sysdate - hire_date) / 7 as weeks
from employees
where department_id = 90;

/*
��¥ ���� �Լ�
    months_between(date1,date2) : �� ��¥�� �� ���̼��� �˷���
    add_months(date, n) : ��¥�� n������ �߰�
    next_day(date, day_of_week) : ������ ��¥�� �������� �־����� ������ ������ ��¥�� ���
    (1 �Ͽ��� ~ 7 �����)
    last_day(date) : �־��� ���� ������ ��¥�� ��ȯ
    round(date, format) : ��¥�� ������ �������� �ݿø�
    trunc(date, format) : ��¥�� ������ �������� ����
    */

select months_between(to_date('2016-12-22','yyyy-mm-dd'),to_date('2017-05-22','yyyy-mm-dd'))
from dual;

select add_months(to_date('2022-12-16','yyyy-mm-dd'),1) from dual;
select next_day(to_date('2023-08-05','yyyy-mm-dd'),7) from dual;
select last_day(to_date('2023-08-05','yyyy-mm-dd')) from dual;    
select round(to_date('2023-08-22','yyyy-mm-dd'),'month') from dual;
select trunc(sysdate,'month') from dual;

-- ��ȯ �Լ�
/*
to_char() - ��¥ �Ǵ� ���ڸ� ���ڿ��� ��ȯ
    
    yyyy - ��ü ������ ���ڷ� ��Ÿ��
    year - ���� ö�ڷ� ǥ��� ������ ��ȯ
    mm - ���� 2�ڸ� ���� ���� ��ȯ
    month - ��ü �� �̸��� ��ȯ
    mon - ���� 3�ڸ� �� ��ȯ
    dy - 3�ڸ� ���� �� ��ȯ
    day - ������ ��ü �̸��� ��ȯ
    dd - ���� ��(1-31)�� ���� �������� ��ȯ
    hh, hh12, hh24 - 1�ϵ��� �ð� �Ǵ� ���� �ð�(1-12) �Ǵ� ���� �ð�(0-23)�� ��ȯ 
    mi - ��(0-59)�� ��ȯ
    ss - ��(0-59)�� ��ȯ
    ff - �и�������(0-999)�� ��ȯ
    am �Ǵ� pm - ����/���ĸ� ��Ÿ���� �ڿ��� ǥ�� ��ȯ
    a.m. �Ǵ� p.m. -����/���ĸ� ��Ÿ���� ��ħǥ�� �ִ� �ڿ��� ǥ�ø� ��ȯ
*/

select last_name, to_char(hire_date,'yyyy/mm/dd hh24:mi:ss') htredate-- ��¥�� ���ϴ� �������� ��ȯ
from employees;

-- timestamp - ��¥ ���� + �и������� 
select to_char(systimestamp,'yyyy--mm--dd hh24:mi:ss.ff2') from dual;

/* 
to_char() �Լ��� ���ڿ� ����� ��
    9 - ���ڷ� ��Ÿ���ϴ�
    0 - 0�� ǥ�õǵ��� ������ ����
    $ - �ε� �޷� ��ȣ�� ��ġ
    l - �ε� ���� ��ȭ ��ȣ�� ���
    . - �Ҽ����� ���
    , - õ���� ǥ���ڷ� ��ǥ�� ���
*/

select to_char(salary,'l99,999.00') salary--�ε� ����X5 0X2�� ,�� õ����ǥ��
from employees
where last_name = 'Ernst';

-- to_date() �Լ� - ���ڿ��� date Ÿ������ ��ȯ
select last_name, to_char(hire_date,'yyyy-mm-dd')
from employees
where hire_date < to_date('2005-01-01','yyyy-mm-dd');-- 2005�� ������ �Ի��� �����

/*
�Լ� ��ø
    ���� �� �Լ��� ��� �����ε� ��ø�� �� �ֽ��ϴ�
    ��ø�� �Լ��� ���� ���� �������� ���� ���� ������ �򰡵�
*/
select last_name, upper(concat(substr(last_name,1,5),'_us'))
from employees
where department_id = 60;

-- nvl() - null�� ������ ������ ��ȯ (null�� ������ �� �� �� ���, null�� 0�� �ٸ�)
select last_name, salary, nvl(commission_pct, 0),(salary*12)+(salary*12*nvl(commission_pct,0)) as a
from employees;

--nvl2() �Լ� - ù��° ���� null�� �ƴϸ� �ι�° ���� ��ȯ ù��° ���� null�̸� �� ��° ���� ��ȯ
select last_name, salary, commission_pct,nvl2(commission_pct,'sal+comm','sal') as income
from employees
where department_id in (50,80);

-- nullif() �Լ� 
-- �� ǥ������ ���� ������ null�� ��ȯ�ϰ� �ٸ��� exprl�� ��ȯ
-- �׷��� exprl�� ���� ���ͷ� null�� ������ �� ����

select first_name, length(first_name) as e1,
    last_name, length(last_name) as e2,
    nullif(length(first_name),length(last_name)) as result
from employees;

-- coaledsce() �Լ�
-- ����Ʈ���� null�� �ƴ� ù��° ���� ��ȯ -- 1�� ���̸� 2�� 2�� ���̸� 3�� ��ȯ

select last_name, employee_id, coalesce(to_char(commission_pct),to_char(manager_id),'no commission and no manager')
from employees;

/*
���Ǻ� ǥ����

case �� 
    if-then-else �� �۾��� ������ ���Ǻ� ��ȸ�� ���ϰ� �����ϵ��� ��
*/

select last_name, job_id, salary,
        case job_id--if ���� ���
            when 'IT-PROG' then 1.10 * salary
            when 'ST_CLERK' then 1.15 * salary
            when 'SA_REP' then 1.20 * salary
            else salary
        end as revised_salary
from employees;

-- DECODE() �Լ� - CASE �İ� ����
select last_name, job_id, salary,
    decode(job_id,'IT_PROG',1.10 * salary,
                    'ST_CLERK', 1.15 * salary,
                    'SA_REP', 1.20 * salary,
                    salary ) as revised_salary
from employees;                   



