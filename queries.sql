--1) --works
SELECT numprocessosocorro FROM aciona 
	Group BY numprocessosocorro HAVING COUNT(nummeio) >= ALL(SELECT COUNT(nummeio) 
		FROM aciona GROUP BY numprocessosocorro); 

--2 -- works
SELECT nomeentidade FROM eventoemergencia NATURAL JOIN aciona
  WHERE instantechamada <= '2018-09-23 23:59:59' AND instantechamada >= '2018-06-21 00:00:00'
  GROUP BY nomeentidade HAVING COUNT(numprocessosocorro) >= ALL
  (SELECT COUNT(numprocessosocorro) FROM eventoemergencia NATURAL JOIN aciona
  	WHERE instantechamada <= '2018-09-23 23:59:59' AND instantechamada >= '2018-06-21 00:00:00'
  	GROUP BY nomeentidade);

--3) -- doesnt work
SELECT numprocessosocorro FROM eventoemergencia NATURAL JOIN audita NATURAL JOIN aciona WHERE moradalocal = 'Oliveira do Hospital' AND instantechamada >= '2018-01-01 00:00:00' AND instantechamada <= '2018-12-31 23:59:00';

--4) --works
SELECT COUNT(numsegmento) FROM segmentovideo NATURAL JOIN video NATURAL JOIN vigia WHERE duracao > 60 AND moradalocal = 'Monchique' AND datahorafim <= '2018-08-31 23:59' AND datahorainicio >= '2018-08-01 00:00';

--5) --works somewhat but needs fix
SELECT * FROM meiocombate WHERE nummeio NOT IN (SELECT nummeio FROM meioapoio NATURAL JOIN aciona);

--6) --works
SELECT nomeentidade FROM aciona NATURAL JOIN meiocombate GROUP BY nomeentidade HAVING SUM(numprocessosocorro) >= (SELECT SUM(numprocessosocorro) FROM processosocorro);
