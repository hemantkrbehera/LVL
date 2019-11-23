create or replace trigger t1
after delete on emp
for each row
declare
x number(20);
begin
select count(*) into x from emp;
dbms_output.put_line(x);
end;


delete from emp where employee_id=101;










create or replace trigger t1
after delete on emp
declare
x number(20);
begin
select count(*) into x from emp;
dbms_output.put_line(x);
end;

delete from emp where employee_id=111;

























declare
a exception;
begin
if to_Char(sysdate,'dy')='sat' then
raise a;

end if;
exception
when a then
dbms_output.put_line('we cant use it on saturday');
end;








create or replace trigger t1
after delete on emp
for each row
declare
x number(20);
pragma autonomous_transaction;
begin
select count(*) into x from emp where employee_id=100;
dbms_output.put_line(x);
commit;
end;


create or replace function f1(vdeptid in number)return varchar2
is
cursor c1 is select * From employees where department_id=vdeptid;
z varchar2(200);
begin
for i in c1 loop
z:=z||' '||i.first_name;

end loop;
return z;
end;


select f1(100) from dual;








create or replace function f1(vdeptid in number) return varchar2
is
cursor c1 is select * From employees where department_id=vdeptid;
z varchar2(200);
begin
for i in c1 loop
z:=z||' '||i.first_name;
end loop;
return z;
end;

select f1(90) From dual;

declare
x varchar2(200);
begin
x:=f1(90);
dbms_output.put_line(x);
end
create table emp as select * From employees;

create or replace trigger t1
after delete on emp
for each row
declare
x number(20);
pragma autonomous_transaction;
begin
select count(*) into x from emp;
dbms_output.put_line(x);
end;

delete from emp where employee_id=100;


drop trigger t1;


create or replace trigger t1
after create on schema
begin
raise_Application_error (-20134,'we cannot create a object in this schema');
end;


drop trigger t1;

CREATE OR REPLACE TRIGGER T1
BEFORE DROP ON SCHEMA
BEGIN
RAISE_APPLICATION_ERROR(-20134,'I M UNDROPPABLE');
END;


DROP TABLE EMP;

DECLARE
V_eMPNO NUMBER(20);
BEGIN
SELECT EMPLOYEE_ID INTO V_EMPNO FROM EMPLOYEES WHERE EMPLOYEE_ID=100;

IF V_eMPNO=100 THEN
DBMS_OUTPUT.PUT_LINE('ITS HUNDRED');

ELSIF V_EMPNO=101 THEN
DBMS_OUTPUT.PUT_LINE('ITS HUNDRED ONE');

ELSE

DBMS_OUTPUT.PUT_LINE('OTHERS');

END IF;
END;


DECLARE
N NUMBER(5):=1;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE(N);
EXIT WHEN N>=10;
N:=N+1;
END LOOP;
END;

DECLARE
N NUMBER(5):=1;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE(N);
IF (N=10) THEN
EXIT;
END IF;
N:=N+1;
END LOOP;
END;









DECLARE
CURSOR C1 IS SELECT * fROM EMPLOYEES;
I EMPLOYEES%ROWTYPE;
BEGIN
IF NOT C1%ISOPEN THEN
OPEN C1;
END IF;
LOOP
FETCH C1 INTO I;
DBMS_OUTPUT.PUT_LINE(I.FIRST_NAME);
EXIT WHEN C1%NOTFOUND;
END LOOP;
CLOSE C1;
END;


BEGIN
DELETE FROM EMP WHERE EMPLOYEE_ID=99;
IF SQL%FOUND THEN
DBMS_OUTPUT.PUT_LINE('UR RECORD IS DELETED');
ELSIF SQL%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('UR RECORD IS NOT FOUND');
END IF;
END;


SET SERVEROUTPUT ON;

BEGIN
UPDATE EMP SET SALARY=SALARY+100 WHERE DEPARTMENT_ID=100;
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;


SELECT * FROM EMPLOYEES;



->ORACLE HAVE TWO TYPES OF VARIABLE ATTRIBUTES.
THESE ARE:
1>COLUMN LEVEL ATTRIBUTES
2>ROW LEVEL ATTRIBUTES

1>COLUMN LEVEL ATTRIBUTES:-
*IN THIS METHOD WE ARE DEFINING ATTRIBUTES FOR INDIVIDUAL COLUMNS.
*COLUMN LEVEL ATTRIBUTES ARE REPRESENTED BY USING PERCENTAFE (%) TYPE.

DECLARE
VFNAME EMPLOYEES.FIRST_NAME%TYPE;
VSAL EMPLOYEES.SALARY%TYPE;
BEGIN
SELECT FIRST_NAME,SALARY INTO VFNAME,VSAL FROM EMPLOYEES WHERE EMPLOYEE_ID=101;
DBMS_OUTPUT.PUT_LINE(VFNAME||' '||VSAL);
END;



2>ROW LEVEL ATTRIBUTES.
*IN THIS METHOD A SINGLE VARIABLE CAN REPRESENT ALL DIFFERENT DATATYPES IN A ROW WITHIN A TABLE.THIS VARIABLE 
IS ALSO CALLED RECORD TYPE VARIABLE.
*THESE VARIABLES ARE REPRESENTED BY USING %ROWTYPE.

DECLARE
I EMPLOYEES%ROWTYPE;
BEGIN
SELECT * INTO I FROM EMPLOYEES WHERE EMPLOYEE_ID=102;
DBMS_OUTPUT.PUT_LINE(I.FIRST_NAME||' '||I.SALARY);
END;

DECLARE
I EMPLOYEES%ROWTYPE;
BEGIN
SELECT FIRST_NAME,SALARY INTO I.FIRST_NAME,I.SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
DBMS_OUTPUT.PUT_LINE(I.FIRST_NAME||' '||I.SALARY);
END;


CREATE TABLE SALES_LIST
(
salesman_id		NUMBER (5), 
sales_city		VARCHAR2(20)
) 
PARTITION BY LIST(sales_city)
( 
PARTITION sales_west VALUES('MUMBAI','PUNE','GOA','NAGPUR','SURAT'), 
PARTITION sales_east 
VALUES('KOLKATA','PATNA','RANCHI','JORHAT','AGARTALA'), 
PARTITION sales_north 
VALUES('DELHI','KANPUR','LUCKNOW','AGRA','MERUT'), 
PARTITION sales_south 
VALUES('CHENNAI','HYDREBAD','COCHIN','BANGALORE','NELLORE') 
);











 create table test(sno number(10), sal number(10)) partition by hash(sal) partition 5; 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 drop table plsql_profiler_data cascade constraints;
drop table plsql_profiler_units cascade constraints;
drop table plsql_profiler_runs cascade constraints;

drop sequence plsql_profiler_runnumber;

create table plsql_profiler_runs
(
  runid           number primary key,  -- unique run identifier,
                                       -- from plsql_profiler_runnumber
  related_run     number,              -- runid of related run (for client/
                                       --     server correlation)
  run_owner       varchar2(32),        -- user who started run
  run_date        date,                -- start time of run
  run_comment     varchar2(2047),      -- user provided comment for this run
  run_total_time  number,              -- elapsed time for this run
  run_system_info varchar2(2047),      -- currently unused
  run_comment1    varchar2(2047),      -- additional comment
  spare1          varchar2(256)        -- unused
);

comment on table plsql_profiler_runs is
        'Run-specific information for the PL/SQL profiler';

create table plsql_profiler_units
(
  runid              number references plsql_profiler_runs,
  unit_number        number,           -- internally generated library unit #
  unit_type          varchar2(32),     -- library unit type
  unit_owner         varchar2(32),     -- library unit owner name
  unit_name          varchar2(32),     -- library unit name
  -- timestamp on library unit, can be used to detect changes to
  -- unit between runs
  unit_timestamp     date,
  total_time         number DEFAULT 0 NOT NULL,
  spare1             number,           -- unused
  spare2             number,           -- unused
  --  
  primary key (runid, unit_number)
);

comment on table plsql_profiler_units is 
        'Information about each library unit in a run';

create table plsql_profiler_data
(
  runid           number,           -- unique (generated) run identifier
  unit_number     number,           -- internally generated library unit #
  line#           number not null,  -- line number in unit
  total_occur     number,           -- number of times line was executed
  total_time      number,           -- total time spent executing line
  min_time        number,           -- minimum execution time for this line
  max_time        number,           -- maximum execution time for this line
  spare1          number,           -- unused
  spare2          number,           -- unused
  spare3          number,           -- unused
  spare4          number,           -- unused
  --
  primary key (runid, unit_number, line#),
  foreign key (runid, unit_number) references plsql_profiler_units
);

comment on table plsql_profiler_data is 
        'Accumulated data from all profiler runs';

create sequence plsql_profiler_runnumber start with 1 nocache;

CREATE OR REPLACE FUNCTION fF1
RETURN NUMBER
IS
V_SAL NUMBER(10);
BEGIN
SELECT MAX(sALARY) INTO V_SAL FROM EMPLOYEES;
RETURN V_SAL;
END;


-- execute test
select ff1 from dual;



exec dbms_profiler.start_profiler ('MY_TEST_PERFORMANCE_RUN1');
select ff1 from dual;
exec dbms_profiler.stop_profiler();
 
 
 SELECT * fROM PLSQL_PROFILER_RUNS;
 
 SELECT * frOM PLSQL_PROFILER_UNITS;
 
 SELECT * fROM PLSQL_PROFILER_DATA;
 
 
 
 
 

 MUTATING ERRORS
 
CREATE OR REPLACE TRIGGER T1
AFTER DELETE ON EMP
FOR EACH ROW
DECLARE
X NUMBER(20);
BEGIN
SELECT COUNT(*) INTO X FROM EMP;
DBMS_OUTPUT.PUT_LINE(X);
END;

 
DELETE FROM EMP WHERE EMPLOYEE_ID=101;







CREATE OR REPLACE TRIGGER T1
AFTER DELETE ON EMP
FOR EACH ROW
DECLARE
X NUMBER(20);
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
SELECT COUNT(*) INTO X FROM EMPLOYEES;
DBMS_OUTPUT.PUT_LINE(X);
COMMIT;
END;

DELETE FROM EMP WHERE EMPLOYEE_ID=110;




















 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

































