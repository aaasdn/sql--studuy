SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

SELECT *
FROM employees
WHERE salary >= 15000
AND salary < 20000;

SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE manager_id IN(100, 101, 102);

SELECT first_name, last_name, job_id, hire_date
FROM employees
WHERE hire_date LIKE '03%';

SELECT * FROM employees
WHERE manager_id IS NOT NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'AD_VP')
AND salary >= 8500;

SELECT * FROM employees
ORDER BY manager_id;

SELECT 
    first_name AS ¿Ã∏ß,
    salary*12 AS ø¨∫¿
FROM employees
ORDER BY ø¨∫¿ DESC;

SELECT
    REPLACE('Hello world!', '!', '?')
FROM dual;

SELECT 
    employee_id, first_name, hire_date
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT
    employee_id, first_name, hire_date
FROM employees
WHERE department_id = 20;






