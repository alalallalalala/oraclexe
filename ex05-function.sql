/*
파일명: ex05-funtion.sql

함수
    매개변수(인자)를 받아 특정 계산(방법)을 수행하고 결과를 반환하는 구조로 되어있다.
    
함수 유형
    단일행 함수 - 단일행 매개변수를 받아 결과 값 반환
    여러행(그룹) 함수 - 여러행 매개변수를 받아 결과 값 반환
    
*/

-- 단일행 함수

-- 대소문자 변환 함수
-- LOWER() - 문자열->소문자
SELECT employee_id, last_name, department_id
FROM employees
WHERE lower(last_name) = 'higgins';

select * from employees;
--last name이 모두 대문자로 시작해 조회를 못했음 때문에 lower함수 사용

-- upper() 함수 - 문자열->대문자

SELECT upper('higgins')
FROM dual; -- 임시 테이블 단순 결과만 보고 싶을 때 유용

select 12*3
from dual;

-- initcap() - 문자열의 첫 글자를 대문자로 변환

select employee_id , last_name, department_id
from employees
where last_name = initcap('higgins');--함수는 = 오른쪽에 쓰는게 더 소스를 작게 먹음

-- 문자 조작 함수
-- concat() - 두 개의 파라미터 값을 연결
select 'Hello'||'World'
from dual;

select concat('hello','world') from dual;

-- substr() - 지정된 길이의 문자열 추출
select substr('helloworld',1,5) from dual;--1~5까지만 조회

-- length - 문자열의 길이를 숫자 값으로 표시
select length('helloworld') from dual;

--instr() - 문자열에서 지정된 문자의 위치를 찾습니다.
select instr('helloworld','w') from dual; 

-- lpad() - 왼쪽부터 문자식으로 채운 표현식을 반환
select lpad('salary', 10, '*') from dual;

-- rpad() - 오른쪽부터 문자식으로 채운 표현식을 반환
select rpad('salary', 10, '*') from dual;

--replace() - 문자열에서 지정된 문자를 치환
select replace('jack and jue','j','bl') from dual; --j -> bl

-- trim() - 문자열에서 선행 또는 후행 문자만 자름
select trim('h' from 'helloworld') from dual; -- 공백 제거하기 용이

-- 숫자 함수 
-- round() - 지정된 소수점 자릿수로 반올림
select round(45.926, 2) from dual;

-- trunc() - 지정된 소수점 자릿수로 값을 전달
select trunc(45.926, 2) from dual;

-- mod() - 나눈 나머지를 반환
select mod (1600, 300) from dual;

-- ceil() - 주어진 숫자를 반올림해 정수로 반환
select ceil(45.923) from dual;

-- 날짜 함수 

-- sysdate - 현재 날짜와 시간을 얻을 수 있는  pseudo-column
select sysdate from dual;

/*
날짜 연산
    날짜에 숫자를 더하거나 빼서 결과 날짜 값을 구함
    두 날짜 사이의 일수를 알아내기 위해 빼기 연산을 함
*/

select last_name, (sysdate - hire_date) / 7 as weeks
from employees
where department_id = 90;

/*
날짜 조작 함수
    months_between(date1,date2) : 두 날짜의 월 차이수를 알려줌
    add_months(date, n) : 날짜에 n개월을 추가
    next_day(date, day_of_week) : 지정된 날짜의 다음으로 주어지는 요일이 나오는 날짜를 계산
    (1 일요일 ~ 7 토요일)
    last_day(date) : 주어진 월의 마지막 날짜를 반환
    round(date, format) : 날짜를 지정된 형식으로 반올림
    trunc(date, format) : 날짜를 지정된 형식으로 절삭
    */

select months_between(to_date('2016-12-22','yyyy-mm-dd'),to_date('2017-05-22','yyyy-mm-dd'))
from dual;

select add_months(to_date('2022-12-16','yyyy-mm-dd'),1) from dual;
select next_day(to_date('2023-08-05','yyyy-mm-dd'),7) from dual;
select last_day(to_date('2023-08-05','yyyy-mm-dd')) from dual;    
select round(to_date('2023-08-22','yyyy-mm-dd'),'month') from dual;
select trunc(sysdate,'month') from dual;

-- 변환 함수
/*
to_char() - 날짜 또는 숫자를 문자열로 반환
    
    yyyy - 전체 연도를 숫자로 나타냄
    year - 영어 철자로 표기된 연도를 반환
    mm - 월의 2자리 숫자 값을 반환
    month - 전체 월 이름을 반환
    mon - 월의 3자리 약어를 반환
    dy - 3자리 요일 약어를 반환
    day - 요일의 전체 이름을 반환
    dd - 월간 일(1-31)을 숫자 형식으로 반환
    hh, hh12, hh24 - 1일동안 시간 또는 반일 시간(1-12) 또는 전일 시간(0-23)을 반환 
    mi - 분(0-59)을 반환
    ss - 초(0-59)를 반환
    ff - 밀리세컨드(0-999)를 반환
    am 또는 pm - 오전/오후를 나타내는 자오선 표시 반환
    a.m. 또는 p.m. -오전/오후를 나타내는 마침표가 있는 자오선 표시를 반환
*/

select last_name, to_char(hire_date,'yyyy/mm/dd hh24:mi:ss') htredate-- 날짜를 원하는 형식으로 반환
from employees;

-- timestamp - 날짜 정보 + 밀리세컨드 
select to_char(systimestamp,'yyyy--mm--dd hh24:mi:ss.ff2') from dual;

/* 
to_char() 함수를 숫자에 사용할 때
    9 - 숫자로 나타냅니다
    0 - 0이 표시되도록 강제로 적용
    $ - 부동 달러 기호를 배치
    l - 부동 로컬 통화 기호를 사용
    . - 소수점을 출력
    , - 천단위 표시자로 쉼표를 출력
*/

select to_char(salary,'l99,999.00') salary--부동 숫자X5 0X2에 ,로 천단위표시
from employees
where last_name = 'Ernst';

-- to_date() 함수 - 문자열을 date 타입으로 변환
select last_name, to_char(hire_date,'yyyy-mm-dd')
from employees
where hire_date < to_date('2005-01-01','yyyy-mm-dd');-- 2005년 이전에 입사한 사람들

/*
함수 중첩
    단일 행 함수는 어떠한 레벨로도 중첩될 수 있습니다
    중첩된 함수는 가장 깊은 레벨에서 가장 낮은 레벨로 평가됨
*/
select last_name, upper(concat(substr(last_name,1,5),'_us'))
from employees
where department_id = 60;

-- nvl() - null을 지정한 값으로 반환 (null로 연산이 안 될 때 사용, null과 0은 다름)
select last_name, salary, nvl(commission_pct, 0),(salary*12)+(salary*12*nvl(commission_pct,0)) as a
from employees;

--nvl2() 함수 - 첫번째 값이 null이 아니면 두번째 값을 반환 첫번째 값이 null이면 세 번째 값을 반환
select last_name, salary, commission_pct,nvl2(commission_pct,'sal+comm','sal') as income
from employees
where department_id in (50,80);

-- nullif() 함수 
-- 두 표현식을 비교해 같으면 null을 반환하고 다르면 exprl을 반환
-- 그러나 exprl에 대해 리터럴 null을 지정할 수 없음

select first_name, length(first_name) as e1,
    last_name, length(last_name) as e2,
    nullif(length(first_name),length(last_name)) as result
from employees;

-- coaledsce() 함수
-- 리스트에서 null이 아닌 첫번째 값을 반환 -- 1이 널이면 2를 2도 널이면 3을 반환

select last_name, employee_id, coalesce(to_char(commission_pct),to_char(manager_id),'no commission and no manager')
from employees;

/*
조건부 표현식

case 식 
    if-then-else 문 작업을 수행해 조건부 조회를 편리하게 수행하도록 함
*/

select last_name, job_id, salary,
        case job_id--if 문과 비슷
            when 'IT-PROG' then 1.10 * salary
            when 'ST_CLERK' then 1.15 * salary
            when 'SA_REP' then 1.20 * salary
            else salary
        end as revised_salary
from employees;

-- DECODE() 함수 - CASE 식과 유사
select last_name, job_id, salary,
    decode(job_id,'IT_PROG',1.10 * salary,
                    'ST_CLERK', 1.15 * salary,
                    'SA_REP', 1.20 * salary,
                    salary ) as revised_salary
from employees;                   



