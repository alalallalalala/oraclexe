/*
파일명: ex01-select.sql

SQL (Structured Query Language) - 구조적 질의 언어
    관계형 데이터 베이스 시스템에서 자료를 관리 및 처리하기 위해 설계된 언어
SELECT 문
    데이터베이스에서 정보 검색 명령어
*/
--모든 열 선택 *
SELECT *--
FROM departments;--
-- 특정 열 선택(프로택션 projection)
SELECT department_id, location_id--de에서 id를 가져옴
FROM departments;

/*
산술식 
산술연산자를 사용하여 숫자/날짜 데이터 표현식 작성
+더하기
-빼기
*곱하기
/나누기
*/

--산술 연산자
SELECT LAST_NAME, SALARY,SALARY / 300
FROM employees;

/*
연산자 우선순위
    곱하기, 나누기는 더하기 빼기보다 먼저 수행
*/

SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)--괄호 
FROM employees;

/*
산술식의 Null 값
    null 값을 포함하는 산술식은 null로 계산
*/
SELECT last_name, 12*salary*commission_pct, salary, commission_pct
FROM employees;

/*
열 alias 정의
    열 머리글의 이름을 
    이름 바로 뒤에 나옴 (열 이름과 alias 사이에 선택 사항인 as 키워드가 올 수 있음.)
    공백이나 특수 문자를 포함하거나 대소문자를 구분하는 경우 큰 따음표가 필요
*/
SELECT last_name as name, commission_pct comm, salary * 10 as 급여10배--as 생략시 띄어쓰기
FROM employees;

SELECT last_name "Name", salary*12 "Annual Salary"--둘다 as 생략, 띄어쓰기할려면 ""필요
FROM employees;

/*
연결연산자
    열이나 문자열을 다른열에 연결
    ||으로 나타냄
    결과 열로 문자 표현식을 작성
*/

SELECT last_name||job_id AS "Employees", last_name, job_id--성과 id를 em으로 가져옴
FROM employees;

/*
리터럴 문자열
    리터럴은 SELECT 문에 포함된 문자, 숫자 또는 날짜
    날짜 및 문자 리터럴 값은 작은 다옴표로 묶어야 함
    각 문자열은 반환되는 각 행에 한 번 출력 됨
*/
SELECT last_name || ' is a ' || job_id AS "Employee Details"
FROM employees;
/* 
대체 인용 q 연산자
    자신의 따옴표 구분자를 지정
    구분자를 임의로 선택
    가독성 및 사용성이 증가함
*/
--'가 이미 문장 안에 있어 q'[]'를 사용함
SELECT department_name || q'[ Department's Manager Id: ]' || manager_id
AS "Department and Manager"
FROM departments;

/*
중복행 
    기본적으로 Query 결과에는 중복 행을 포함한 모든 행이 표시됨
    
DISTINCT 
    결과에서 중복행 제거
*/

SELECT department_id
FROM employees;

--중복제거
SELECT DISTINCT department_id
FROM employees;

/*
테이블 구조표시
    DESCRIBE 명령을 사용해 테이블 구조를 표시
*/
DESCRIBE employees;
DESC employees;

