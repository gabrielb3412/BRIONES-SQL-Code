-- Create dept table
CREATE TABLE dept (
    dept_num INT(2) NOT NULL,
    dept_name VARCHAR(14) NOT NULL,
    dept_location VARCHAR(13),
    CONSTRAINT dept_pk PRIMARY KEY (dept_num)
);

/* Create emp table with 4 digit employee number, employee name, job title, manager, hiredate, 
salary, commission, and associated department number */
CREATE TABLE emp(
	emp_num INT(4) NOT NULL,
	emp_name VARCHAR(14) NOT NULL,
	job VARCHAR(9),
	mgr INT(4),
	hiredate DATE,
	salary DECIMAL(9,2),
	commission DECIMAL(9,2),
	dept_num INT(2) NOT NULL
);

-- Create supplier table
CREATE TABLE supplier (
    s_num CHAR(2),
    sname VARCHAR(20) NOT NULL,
    status BOOLEAN,
    city VARCHAR(20),
    CONSTRAINT supplier_pk PRIMARY KEY (s_num)
);

-- Create part table
CREATE TABLE part (
    p_num CHAR(2),
    pname VARCHAR(20) NOT NULL,
    color VARCHAR(20),
    weight DOUBLE,
    city VARCHAR(20),
    CONSTRAINT part_pk PRIMARY KEY (p_num)
);

-- Create supplier_part (sp) table
CREATE TABLE sp (
    s_num CHAR(2),
    p_num CHAR(2),
    qty INT,
    CONSTRAINT sp_pk PRIMARY KEY (s_num, p_num),
    CONSTRAINT sp_supplier_fk FOREIGN KEY (s_num) REFERENCES supplier(s_num),
    CONSTRAINT sp_part_fk FOREIGN KEY (p_num) REFERENCES part(p_num)
);

-- Worksheet 4

/* Populate dept table with data */  
INSERT INTO dept (dept_num, dept_name, dept_location) VALUES (10,'Accounting','New York');
INSERT INTO dept (dept_num, dept_name, dept_location) VALUES (20,'Research','Dallas');
INSERT INTO dept (dept_num, dept_name, dept_location) VALUES 
(30,'Sales','Chicago'),
(40,'Operations','Boston');

/* Populate employee table with data */
INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7839,'KING','PRESIDENT',NULL,'2005-02-14-',5000,NULL,10);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7566,'JONES','MANAGER',7839,'2011-04-02',3075,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7902,'FORD','ANALYST',7566,'2011-03-12',3100,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7369,'SMITH','CLERK',7902,'2019-12-17',900,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7698,'BLAKE','MANAGER',7839,'2011-01-05',2950,NULL,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7499,'ALLEN','SALESMAN',7698,'2011-02-20',1700,300,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7521,'WARD','SALESMAN',7698,'2011-02-22',1350,500,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7654,'MARTIN','SALESMAN',7698,'2018-09-28',1350,1400,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7782,'CLARK','MANAGER',7839,'2011-09-06',2550,NULL,10);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7788,'SCOTT','ANALYST',7566,'2017-07-13',3100,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7844,'TURNER','SALESMAN',7698,'2011-09-08',1600,0,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7876,'ADAMS','CLERK',7788,'2007-07-13',1200,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7900,'JAMES','CLERK',7698,'2011-12-03',1050,NULL,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7934,'MILLER','CLERK',7782,'2012-01-23',1400,NULL,10);

/* If you turn foreign key checks off, you must turn it back on 
BUT, be careful it will only ensure referencial integrity - i.e., make sure all 
employees that have managers actually link to an employee already in the employee table 
from this point forward. It will not check the records you inserted above. */
-- SET FOREIGN_KEY_CHECKS = 1;


-- ADDING DATA FOR supplier TABLE
INSERT INTO supplier (s_num, sname, status, city) 
VALUES ('s1','Smith',1,'Portland');

INSERT INTO supplier (s_num, sname, status, city) 
VALUES ('s2','Jones',1,'New York');

INSERT INTO supplier (s_num, sname, status, city) 
VALUES ('s3','Adams',0,'San Fransisco');

INSERT INTO supplier (s_num, sname, status, city) 
VALUES ('s4','Clark',0,'Austin');

INSERT INTO supplier (s_num, sname, status, city) 
VALUES ('s5','Henry',1,'Atlanta');

--ADDING DATA FOR part TABLE
INSERT INTO part (p_num, pname, color, weight, city) 
VALUES ('p1','Hammer','red',2.6,'Portland');

INSERT INTO part (p_num, pname, color, weight, city) 
VALUES ('p2','Pliers','green',3.1,'London');

INSERT INTO part (p_num, pname, color, weight, city) 
VALUES ('p3','Router','blue',5.6,'Austin');

INSERT INTO part (p_num, pname, color, weight, city) 
VALUES ('p4','Stapler','red',3.7,'New York');

INSERT INTO part (p_num, pname, color, weight, city) 
VALUES ('p5','Wrench','green',2.6,'Austin');

INSERT INTO part (p_num, pname, color, weight, city) 
VALUES ('p6','Ladder','blue',10.5,'Richmond');

 --ADDING DATA INTO THE sp TABLE
INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s1','p1',100);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s1','p2',200);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s1','p3',150);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s1','p4',120);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s1','p1',100);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s1','p5',240);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s1','p6',210);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s2','p2',null);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s2','p4',100);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s2','p5',120);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s3','p1',150);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s4','p2',120);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s4','p3',100);

INSERT INTO sp (s_num, p_num, qty) 
VALUES ('s4','p4',250);

--EXAMINING AND MANIPULATING DATA

--q.1 show all columns for supplier tabl
SELECT * FROM supplier;

--q.2 show all columns for part table
SELECT * FROM part;

--q.3 set all supplier's status to 0
UPDATE supplier SET status = 0 

--q.4 show status of suppliers to confirm status change 
SELECT status FROM supplier

--q.5 open all suppliers up (chang status to 1)
UPDATE supplier SET status = 1

--q.6 show supplier name and status 
SELECT sname, status from supplier

--q.7 show names of open(1) suppliers
SELECT sname FROM supplier WHERE status = 1;

--q.8 use AS to rename column label to 'Open Suppliers'
SELECT sname AS 'Open Suppliers' FROM supplier WHERE status = 1;

--q.9 update supplier w/ New York to New York City
UPDATE supplier SET city = 'New York City' where city = 'New York';

--q.10 show if case sensitive or not
SELECT * FROM supplier WHERE city = 'new york city' or 'NEW YORK CITY'

--q.11 show part names for parts that weigh more than 5.0
SELECT pname FROM part WHERE weight > 5.0;

--q.12 show part names and cities that ARE NOT red 
SELECT pname, city FROM part WHERE color != 'red';

--q.13 show part names  that are red AND in New York 
SELECT pname FROM part WHERE color = 'red' AND city = 'New York';

--q14 increase quaniity by 10% for all parts supplied 
UPDATE sp SET qty = qty * 1.10;

--q.15 show al suppliers who's names end in s
SELECT sname FROM supplier WHERE sname LIKE '%s';

--q.16 show all colrs that have an r in their name
SELECT DISTINCT color FROM part WHERE color LIKE '%r%';

--q.17 show supplier nubmer for suppliers that supplied at least one part
--update it so the query doesnt repeat
SELECT s_num FROM sp WHERE qty > 1;

SELECT DISTINCT s_num FROM sp WHERE qty > 1;

--q.18 list part names and weights for parts that weigh btween 3.0 anf 5.0
SELECT pname, weight FROM part WHERE weight BETWEEN 3.0 AND 5.0

--q.19 Deleting s5, querying the change, and inserting s5 back
DELETE FROM supplier WHERE s_num = 's5';
SELECT sname FROM supplier;
INSERT INTO supplier (s_num, sname, status, city) 
VALUES ('s5','Henry',1,'Atlanta');

--q.20 trying to delete s1 to explain foreign key constraint    
DELETE FROM supplier WHERE s_num = 's1';