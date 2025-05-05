-- Week 5 Worksheet
--#1
SELECT count(s_num) FROM supplier
--#2
SELECT count(p_num) FROM part
--#3
SELECT count(DISTINCT s_num) FROM sp WHERE p_num IS NOT NULL
--#4
SELECT s_num, count(DISTINCT p_num) FROM sp GROUP BY s_num;
--#5
SELECT sum(qty) AS 'Total quantity supplied' FROM sp 
--#6
SELECT MIN(qty) FROM sp 
--#7
SELECT MAX(qty) FROM sp 
--#8
SELECT MAX(qty), MIN(qty), AVG(qty) FROM sp;
--#9
SELECT s_num, AVG(qty) FROM sp GROUP BY s_num;
--#10
SELECT s_num, p_num, qty FROM sp ORDER BY qty;
--#11
SELECT s_num, p_num, qty FROM sp ORDER BY s_num, qty DESC;
--#12
SELECT s_num FROM sp GROUP BY s_num HAVING COUNT(distinct p_num) >= 3;
--#13
SELECT p_num FROM sp GROUP BY p_num HAVING COUNT(DISTINCT s_num) >= 2;
--#14
SELECT count(p_num) FROM sp WHERE qty IS NULL;
--#15
SELECT s_num, sum(qty) FROM sp GROUP BY s_num;
