
-- ����� ���� Ȯ��
SELECT * FROM all_users;

-- ���� ���� ���
CREATE USER user1 IDENTIFIED BY user1;

/*
DCL: GRANT(���� �ο�), REVOKE(���� ȸ��)

CREATE USER -> �����ͺ��̽� ���� ���� ����
CREATE SESSION -> �����ͺ��̽� ���� ����
CREATE TABLE -> ���̺� ���� ����
CREATE VIEW -> �� ���� ����
CREATE SEQUENCE -> ������ ���� ����
ALTER ANY TABLE -> ��� ���̺� ������ �� �ִ� ����
INSERT ANY TABLE -> ��� ���̺��� �����͸� �����ϴ� ����.
SELECT ANY TABLE...

SELECT ON [���̺� �̸�] TO [���� �̸�] -> Ư�� ���̺� ��ȸ�� �� �ִ� ����.
INSERT ON....
UPDATE ON....

- �����ڿ� ���ϴ� ������ �ο��ϴ� ����.
RESOURCE, CONNECT, DBA TO [���� �̸�]
*/

GRANT CREATE SESSION TO user1;

GRANT SELECT ON hr.departments TO user1;
GRANT INSERT ON hr.departments TO user1;

GRANT CREATE TABLE TO user1;

ALTER USER USER1
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users;

GRANT SELECT ANY TABLE TO userl;

GRANT RESOURCE, CONNECT, DBA TO userl;

REVOKE RESOURCE, CONNECT, DBA FROM userl;

-- ����� ���� ����
-- DROP USER [�����̸�] CASCADE;
-- CASCADE ���� �� -> ���̺� or ������ �� ��ü�� �����Ѵٸ� ���� ���� �ȵ�.
DROP USER userl CASCADE;

/*
���̺� �����̽��� �����ͺ��̽� ��ü �� ���� �����Ͱ� ����Ǵ� �����Դϴ�.
���̺� �����̽��� �����ϸ� ������ ��ο� ���� ���Ϸ� ������ �뷮��ŭ��
������ ������ �ǰ�, �����Ͱ� ���������� ����˴ϴ�.
�翬�� ���̺� �����̽��� �뷮�� �ʰ��Ѵٸ� ���α׷��� ������������ �����մϴ�.
*/

SELECT * FROM dba_tablespaces;

CREATE USER test1 IDENTIFIED BY test1;

ALTER USER test1 DEFAULT TABLESPACE user_tablespace
QUOTA UNLIMITED ON user_tablespace;

-- ���̺� �����̽� ���� ��ü�� ��ü ����
DROP TABLESPACE user_tablespace INCLUDING CONTENTS;

--������ ���ϰ��� �ѹ��� �����ϴ¹�
DROP TABLESPACE user_tablespace INCLUDING CONTENTS AND DATAFILES;

