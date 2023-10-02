
/*
# PL/SQL
- ����Ŭ���� �����ϴ� SQL ���α׷��� ����̴�.
- �Ϲ����� ���α׷��ְ��� ���̰� ������, ����Ŭ ���ο��� ������ ó���� ����
 ������ �� �� �ִ� ���������� �ڵ� �ۼ� ����Դϴ�.
- �������� �������� ��� ������ �ϰ� ó���ϱ� ���� �뵵�� ����մϴ�.
*/

SET SERVEROUTPUT ON; -- ��¹� Ȱ��ȭ

DECLARE -- ������ �����ϴ� ����(�����)

    emp_num NUMBER; -- ���� ����

BEGIN -- �ڵ带 �����ϴ� ���� ����(�����)

    emp_num := 10; -- ���Կ����� :=
    DBMS_OUTPUT.PUT_line('emp_num');
    DBMS_OUTPUT.PUT_line('Hello pl/sql~!~');

END; -- PL/SQL�� ������ ���� (�����)

-- ������
-- �Ϲ� SQL���� ��� �������� ����� �����ϰ�,
-- **�� ������ �ǹ��մϴ�.
DECLARE
    A NUMBER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.put_line('A: ' || TO_CHAR(A));
END;

/*
- DML��
DDL���� ����� �Ұ����ϰ�, �Ϲ������� SQL���� SELECT ���� ����ϴµ�, 
Ư���� ���� SELECT�� �Ʒ��� INTO���� ����ؼ� ������ �Ҵ��� �� �ֽ��ϴ�.
*/
DECLARE
    v_emp_name VARCHAR2(50); -- ����� ���� (���ڿ� ������ �������� �ʿ�)
    V_dep_name VARCHAR2(50); -- �μ��� ����
BEGIN
    SELECT
        e.first_name,
        d.department_name
    INTO
        v_emp_name, v_dep_name -- ��ȸ ����� ������ ����
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 100;
    
     DBMS_OUTPUT.put_line(v_emp_name || '-' || v_dep_name);
    
END;




DECLARE
    v_emp_name employees.first_name%TYPE; 
    V_dep_name departments.department_name%TYPE;
BEGIN
    SELECT
        e.first_name,
        d.department_name
    INTO
        v_emp_name, v_dep_name -- ��ȸ ����� ������ ����
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 100;
    
     DBMS_OUTPUT.put_line(v_emp_name || '-' || v_dep_name);
    
END;













