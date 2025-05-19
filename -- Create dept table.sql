--Worksheet 7

--Q.1
SELECT dept_name
FROM dept
WHERE dept_num NOT IN (SELECT DISTINCT dept_num FROM emp);

--Q.2
SELECT sname
FROM supplier 
WHERE s_num NOT IN (
	SELECT DISTINCT s_num 
	FROM sp);

--Q.3
SELECT sname
FROM supplier
WHERE s_num IN (
    SELECT s_num
    FROM sp
    WHERE p_num IN ('p1', 'p6'));

--Q.4
SELECT sname
FROM supplier
WHERE s_num IN (
    SELECT s_num
    FROM sp
    WHERE p_num IN (
        SELECT p_num
        FROM part
        WHERE pname = 'ladder'));

--Q.5
SELECT DISTINCT p_num
FROM sp
WHERE s_num = (
    SELECT s_num
    FROM supplier
    WHERE sname = 'Jones');

--Q.6
SELECT DISTINCT s_num
FROM sp
WHERE qty = (
    SELECT MAX(qty)
    FROM sp);

--Q.7
SELECT *
FROM sp
WHERE qty = (
    SELECT MAX(qty)
    FROM sp);

--Q.8
SELECT sname
FROM supplier
WHERE s_num IN (
    SELECT s_num
    FROM sp
    WHERE qty = (
        SELECT MAX(qty)
        FROM sp));

--Q.9
SELECT sname
FROM supplier
WHERE s_num IN (
    SELECT DISTINCT s_num
    FROM sp
    WHERE qty > (
        SELECT AVG(qty)
        FROM sp));

--Q.10
-- Show avg qty
SELECT AVG(qty) AS avg_qty FROM sp;
-- Show relevant rows
SELECT s_num, p_num, qty
FROM sp
WHERE qty > (
    SELECT AVG(qty)
    FROM sp);
--Find names of suppliers
SELECT sname, s_num
FROM supplier
WHERE s_num IN ('s1', 's4');

--Q.11
SELECT sname
FROM supplier
WHERE sname != 'Jones'
AND s_num IN (
    SELECT DISTINCT s_num
    FROM sp
    WHERE p_num IN (
        SELECT p_num
        FROM sp
        WHERE s_num = (
            SELECT s_num FROM supplier WHERE sname = 'Jones')));

--Q.12
-- What parts does Jones supply?
SELECT p_num
FROM sp
WHERE s_num = (
    SELECT s_num FROM supplier WHERE sname = 'Jones');

-- Who else supplies those parts
SELECT sname 
	FROM supplier
	WHERE s_num IN (
	    SELECT s_num
	    FROM sp WHERE p_num IN ('p2','p4','p5'));

--Q.13
SELECT sname
FROM supplier
WHERE s_num NOT IN (
    SELECT s_num
    FROM sp
    WHERE p_num IN (
        SELECT p_num
        FROM sp
        WHERE s_num = (
            SELECT s_num FROM supplier WHERE sname = 'Jones')));

--Q.14
-- Jones's parts
SELECT p_num
FROM sp
WHERE s_num = (
    SELECT s_num FROM supplier WHERE sname = 'Jones'
);
-- Suppliers of those parts
SELECT DISTINCT s_num
FROM sp
WHERE p_num IN (
    SELECT p_num
    FROM sp
    WHERE s_num = (
        SELECT s_num FROM supplier WHERE sname = 'Jones'));

--Q.15
SELECT p_num, s_num, qty
FROM sp AS sp1
WHERE qty > (
    SELECT AVG(qty)
    FROM sp AS sp2
    WHERE sp1.p_num = sp2.p_num);

--Q.16
SELECT p_num, AVG(qty) AS avg_qty
FROM sp
GROUP BY p_num;

--Q.17
SELECT s_num, p_num, max(qty) FROM sp GROUP BY s_num; 

--Q.18
SELECT s_num, p_num, qty
FROM sp sp1
WHERE qty = (
    SELECT MAX(qty)
    FROM sp sp2
    WHERE sp1.s_num = sp2.s_num);
