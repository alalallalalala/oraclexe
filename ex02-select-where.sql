/*
파일명: ex02-select-where.sql

선택을 사용해 행 제한
    where 절을 사용해 반환되는 행을 제한

where 
    조건을 충족하는 행으로 query를 제한
    
    세가지 요소
    - 열이름
    - 비교 조건
    - 열 이름, 상수 또는 값 리스트
*/

--where 절 사용
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90; --90인 행만 나타냄 필터 역할

/*
문자열 및 날짜
    문자열 및 날짜 값은 작은 따옴표로 묶음
    문자 값은 대소문자를 구분하고 날짜 값은 형식을 구분    
    
    기본 날짜 표시형식은 일월년
    여긴 RR/MM/DD 년월일

*/

SELECT last_name,job_id,department_id
FROM employees
WHERE last_name = 'Whalen'; --성이 월렌인 사원을 조회

SELECT last_name, hire_date
FROM employees
WHERE hire_date = '03/06/17';--년월일

/*
비교 연산자
    특정 표현식을 다른 값이나 표현식과 비교하는 조건에서 사용 됨
    = 같음
    > 큼
    >= 크거나 같음
    < 작음
    <= 작거나 같음
    <> 같지 않음
    BETWEEN ... AND ... 두 값 사이(경계값 포함)
    IN(set)             값 리스트 중 일치하는 값 검색
    LIKE                일치하는 문자 패턴 검색
    IS NULL             NULL 값인지 여부
*/
-- 비교 연산자 사용
SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

--BETWEEN 연산자를 사용하는 범위 조건(두 값 사이경계값 포함)
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;--2500,3500포함

SELECT last_name, salary
FROM employees
WHERE salary >= 2500 AND salary <= 3500;--and는 두 조건을 참인 것

-- IN 연산자를 사용하는 멤버조건(값 리스트 중 일치하는 값 검색)

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);

SELECT EMPLOYEE_ID,LAST_NAME,SALARY,MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID =100
OR MANAGER_ID =101
OR MANAGER_ID = 201; --OR 조건 중 하나만 만족해도 가져옴

/*
LIKE 연산자를 사용하여 패턴 일치
    LIKE 연산자를 사용하여 유효한 검색 문자열 값의 대체 문자 검색을 수행
    검색 조건에는 리터럴 문자나 숫자가 포함될 수 있음
        - % : 0개 이상의 문자를 나타냄 위치상관 x
        - _ : 한 문자를 나타냄 위치상관 0
    
*/

SELECT first_name
FROM employees
WHERE first_name LIKE 'A%';
-- = 과 비슷하지만 패턴을 붙일 수 있음 A로 시작하는 성을 가진 직원을 조회

-- 대체 문자 결합
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';--_은 한 글자를 차지 예제는 2번째 글자에 o이 오는것을 조회






