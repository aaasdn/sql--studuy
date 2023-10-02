/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� 
(AVG(�÷�) ���)
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
-EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� 
�����͸� ����ϼ���
*/
SELECT
    *
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees);

SELECT 
    COUNT(*)
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT 
    *
FROM employees
WHERE job_id = 'IT_PROG' 
AND salary > (SELECT AVG(salary) FROM employees WHERE job_id = 'IT_PROG');

/*
���� 2.
-DEPARTMENTS���̺��� manager_id�� 100�� �μ��� �����ִ� ������� 
��� ������ �˻��ϼ���.
*/
SELECT
    *
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
WHERE d.manager_id = 100;
/*
���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� 
����ϼ���
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
*/
SELECT
    *
FROM employees e
WHERE e.manager_id > (SELECT manager_id FROM employees WHERE first_name = 'Pat');

SELECT *
FROM employees 
WHERE manager_ID IN ( SELECT employee_ID FROM Employees WHERE first_name ='James');
/*
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� 
�� ��ȣ, �̸��� ����ϼ���
*/
SELECT 
    *
FROM 
    (
    SELECT 
        ROWNUM AS rn,
        first_name
    FROM (SELECT * FROM employees
    ORDER BY first_name DESC)
    )
WHERE rn > 40 AND rn <=51;


/*
���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� 
�� ��ȣ, ���id, �̸�, ��ȭ��ȣ, �Ի����� ����ϼ���.
*/

SELECT 
    *
FROM 
    (
    SELECT 
        ROWNUM AS rn,
    employee_id,
    first_name || last_name AS �̸�,
    phone_number,
    hire_date
    FROM (SELECT * FROM employees
    ORDER BY hire_date DESC)
    )
WHERE rn > 30 AND rn <=40;

/*
���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����
*/
SELECT
    e.employee_id,
    e.first_name || e.last_name AS �̸�,
    d.department_id,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON d.department_id = e.department_id
ORDER BY e.employee_id ASC;
/*
���� 7.
���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT 
    e.employee_id,
    e.first_name || e.last_name AS �̸�,
    (SELECT department_name FROM departments d WHERE d.department_id = e.department_id
    ) AS department_id,
    (SELECT department_name FROM departments d WHERE d.department_id = e.department_id
    ) AS department_name
FROM employees e
ORDER BY e.employee_id ASC;

/*
���� 8.
departments���̺� locations���̺��� left �����ϼ���
����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, 
    ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
����) �μ����̵� ���� �������� ����
*/
SELECT 
    d.department_id,
    d.department_name,
    d.manager_id,
    loc.location_id,
    loc.street_address,
    loc.city
FROM departments d
LEFT JOIN locations loc
ON d.location_id = loc.location_id
ORDER BY d.department_id ASC;

/*
���� 9.
���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT 
    d.department_id,
    d.department_name,
    d.manager_id,
    (SELECT location_id FROM locations loc
    WHERE d.location_id = loc.location_id) AS location_id,
    (SELECT street_address FROM locations loc
    WHERE d.location_id = loc.location_id) AS street_address,
    (SELECT city FROM locations loc
    WHERE d.location_id = loc.location_id) AS city
FROM departments d
ORDER BY d.department_id ASC;
/*
���� 10.
locations���̺� countries ���̺��� left �����ϼ���
����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
����) country_name���� �������� ����
*/
SELECT 
    loc.location_id,
    loc.street_address,
    loc.city,
    con.country_id,
    con.country_name
FROM locations loc
LEFT JOIN countries con
ON loc.country_id = con.country_id
ORDER BY con.country_name ASC;
/*
���� 11.
���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT 
    loc.location_id,
    loc.street_address,
    loc.city,
    (SELECT country_id FROM countries con
    WHERE loc.country_id = con.country_id) AS country_id,
    (SELECT country_name FROM countries con 
    WHERE loc.country_id = con.country_id) AS country_name
FROM locations loc
ORDER BY country_name ASC;

/*
���� 12. 
employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 
1-10��° �����͸� ����մϴ�.
����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, 
�μ����̵�, �μ��̸� �� ����մϴ�.
����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.
*/

SELECT * FROM employees;

SELECT
    ROWNUM AS RN,
    ed.*
FROM (
    SELECT 
        e.employee_id,
        e.first_name||e.last_name AS �̸�,
        e.phone_number,
        e.hire_date,
        d.department_id,
        d.department_name
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    ORDER BY hire_date ASC
) ed
WHERE rownum <= 10; 


/*
���� 13. 
--EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID, 
DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���.
*/
SELECT
    tbl.*, d.department_name
FROM
    (
    SELECT 
        last_name, job_id, department_id     
    FROM employees 
    WHERE job_id = 'SA_MAN'
    ) tbl
JOIN departments d
ON tbl.department_id = d.department_id;


/*
���� 14
-- DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
-- �ο��� ���� �������� �����ϼ���.
-- ����� ���� �μ��� ������� ���� �ʽ��ϴ�.
*/
SELECT
    d.department_id, d.department_name, d.manager_id,
    a.total
FROM departments d
JOIN
    (
    SELECT
        department_id, COUNT(*) AS total
    FROM employees
    GROUP BY department_id
    ) a
ON d.department_id = a.deprtment_id
ORDER BY a.total DESC;

--------------------------------------------------------------------------------

SELECT
    d.department_id, d.department_name, d.manager_id,
    (
        SELECT
            COUNT(*)
        FROM employees e
        WHERE e.department_id = d.department_id
    ) AS total
FROM departments d
ORDER BY total DESC;
            
/*
���� 15
--�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���.
--�μ��� ����� ������ 0���� ����ϼ���.
*/
SELECT
    d.*,
    loc.street_address, loc.postal_code,
    NVL(tbl.result, 0) AS �μ�����ձ޿�
FROM departments d
JOIN locations loc
ON d.location_id = loc.location_id
LEFT JOIN
    (
    SELECT
         department_id,
         TRUNC(AVG(salary), 0) AS result
    FROM employees
    GROUP BY department_id
    ) tbl
ON d.department_id = tbl.department_id;

/*
���� 16
-���� 15 ����� ���� DEPARTMENT_ID�������� �������� �����ؼ� 
ROWNUM�� �ٿ� 1-10 ������ ������ ����ϼ���.
*/

SELECT * FROM
    (
    SELECT ROWNUM AS rn, tbl2.*
        FROM
        (
        SELECT
            d.*,
            loc.street_address, loc.postal_code,
            NVL(tbl.result, 0) AS �μ�����ձ޿�
        FROM departments d
        JOIN locations loc
        ON d.location_id = loc.location_id
        LEFT JOIN
            (
            SELECT
                department_id,
                TRUNC(AVG(salary), 0) AS result
            FROM employees
            GROUP BY department_id
            ) tbl
        ON d.department_id = tbl.department_id
        ORDER BY d.department_id DESC
        ) tbl2
    )
WHERE rn > 0 AND rn <= 10;
   
    
    