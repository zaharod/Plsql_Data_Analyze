--02. ��� ������ ���̺� ���� �� ������ �Է�
CREATE TABLE TB_TEMPER_DATA
(
  STD_DE CHAR(10)
, AREA_CD CHAR(3)
, AVG_TEMPER NUMBER(3, 1)
, MIN_TEMPER NUMBER(3, 1)
, MAX_TEMPER NUMBER(3, 1)
);


SELECT COUNT(*) FROM TB_TEMPER_DATA; 


CREATE TABLE TB_TEMPER
(
  STD_DE CHAR(8)
, AREA_CD CHAR(3)
, AVG_TEMPER NUMBER(3, 1)
, MIN_TEMPER NUMBER(3, 1)
, MAX_TEMPER NUMBER(3, 1)
, CONSTRAINT TB_TEMPER_PK PRIMARY KEY (STD_DE, AREA_CD)
);

INSERT INTO TB_TEMPER
SELECT
   REPLACE(STD_DE, '-', '') AS STD_DE
 , AREA_CD
 , AVG_TEMPER
 , MIN_TEMPER
 , MAX_TEMPER
  FROM TB_TEMPER_DATA;

COMMIT; 

--03. ������� �ְ�/���� �µ� �� �ش� ���� ���ϱ�

--������� ����� ���� �� �ְ� �µ��� ���Ѵ�.
SELECT
       A.AREA_CD
     , MIN(A.MIN_TEMPER) AS MIN_TEMPER
     , MAX(A.MAX_TEMPER) AS MAX_TEMPER
  FROM TB_TEMPER A
 WHERE A.AREA_CD = '108' --�����ڵ� : ����Ư����
 GROUP BY A.AREA_CD 
; 


--������� ����� ���� �� �ְ� �µ��� ���ϰ� �ش� ���ڸ� ���Ѵ�.
SELECT
   B.AREA_CD
 , B.STD_DE
 , B.MIN_TEMPER
 , B.MAX_TEMPER
  FROM 
     ( 
       SELECT
              A.AREA_CD
            , MIN(A.MIN_TEMPER) AS MIN_TEMPER
            , MAX(A.MAX_TEMPER) AS MAX_TEMPER
         FROM TB_TEMPER A
        WHERE A.AREA_CD = '108' --�����ڵ� : ����Ư����
        GROUP BY A.AREA_CD
     ) A 
     , TB_TEMPER B 
 WHERE (B.AREA_CD = A.AREA_CD  AND B.MIN_TEMPER  = A.MIN_TEMPER) 
    OR (B.AREA_CD = A.AREA_CD  AND B.MAX_TEMPER  = A.MAX_TEMPER); 

--04. �� ���� ���� �ְ�/���� �µ� �� ���� ���ϱ�

--�� ����(MMDD)�� �������� ����� ������� �ְ� ��°� ���� ��� �� �̿� �ش��ϴ� ���ڸ� ���Ѵ�.
SELECT
       B.AREA_CD
     , B.STD_DE
     , B.MIN_TEMPER
     , B.MAX_TEMPER
  FROM 
     (
       SELECT SUBSTR(A.STD_DE, 5, 4) AS MMDD 
            , MIN(A.MIN_TEMPER) AS MIN_TEMPER 
            , MAX(A.MAX_TEMPER) AS MAX_TEMPER 
         FROM TB_TEMPER A 
        WHERE A.AREA_CD = '108' --�����ڵ� : ����Ư���� 
          AND A.STD_DE LIKE '____0612'
        GROUP BY SUBSTR(A.STD_DE, 5, 4)
     ) A 
     , TB_TEMPER B 
WHERE (SUBSTR(B.STD_DE, 5, 4) = A.MMDD AND B.MIN_TEMPER = A.MIN_TEMPER) 
   OR (SUBSTR(B.STD_DE, 5, 4) = A.MMDD AND B.MAX_TEMPER = A.MAX_TEMPER);


--05. 1���� ��� �ϱ����� ���� ū�� ���ϱ�
SELECT A.MM
     , A.DAILY_CROSS
FROM 
(
   SELECT
          SUBSTR(A.STD_DE, 5, 2) AS MM
        , ROUND(AVG(MAX_TEMPER-MIN_TEMPER), 2) AS DAILY_CROSS
     FROM TB_TEMPER A
    WHERE A.AREA_CD = '108' --�����ڵ� : ����Ư����
    GROUP BY SUBSTR(A.STD_DE, 5, 2)
    ORDER BY DAILY_CROSS DESC
) A
WHERE ROWNUM <= 1;

--06. ����� �ϱ����� ���� ū ���� ���ϱ�

--����� ����ø� �������� �ϱ����� ���� ū ���� �ش� ���� �ϱ��� ��, �����µ�, �ְ� �µ��� ���Ѵ�. 
SELECT A.STD_DE 
     , A.DAILY_CROSS 
     , A.MAX_TEMPER 
     , A.MIN_TEMPER
  FROM 
     (
       SELECT A.STD_DE 
        , A.MAX_TEMPER-A.MIN_TEMPER AS DAILY_CROSS
        , A.MAX_TEMPER
        , A.MIN_TEMPER
     FROM TB_TEMPER A 
    WHERE A.AREA_CD = '108' --�����ڵ� : ����Ư����
      AND MAX_TEMPER IS NOT NULL 
      AND MIN_TEMPER IS NOT NULL
    ORDER BY DAILY_CROSS DESC
    ) A
WHERE ROWNUM <= 1; 


--07. ������ ��ձ���� ����� Ȯ���ϱ�
SELECT SUBSTR(A.STD_DE, 1, 4) AS YYYY
     , ROUND(AVG(AVG_TEMPER), 2) AS AVG_TEMPER
  FROM TB_TEMPER A  
 WHERE A.AREA_CD = '108' --�����ڵ� : ����Ư����
 GROUP BY SUBSTR(A.STD_DE, 1, 4)
 ORDER BY SUBSTR(A.STD_DE, 1, 4) 
;


SELECT 
       CASE  
       WHEN YYYY BETWEEN '1900' AND '1909' THEN '1900���' WHEN YYYY BETWEEN '1910' AND '1919' THEN '1910���'
       WHEN YYYY BETWEEN '1920' AND '1929' THEN '1920���' WHEN YYYY BETWEEN '1930' AND '1939' THEN '1930���'
       WHEN YYYY BETWEEN '1940' AND '1949' THEN '1940���' WHEN YYYY BETWEEN '1950' AND '1959' THEN '1950���'
       WHEN YYYY BETWEEN '1960' AND '1969' THEN '1960���' WHEN YYYY BETWEEN '1970' AND '1979' THEN '1970���'
       WHEN YYYY BETWEEN '1980' AND '1989' THEN '1980���' WHEN YYYY BETWEEN '1990' AND '1999' THEN '1990���'
       WHEN YYYY BETWEEN '2000' AND '2009' THEN '2000���' WHEN YYYY BETWEEN '2010' AND '2019' THEN '2010���'
       WHEN YYYY BETWEEN '2020' AND '2029' THEN '2020���' END AS "����"
     , ROUND(AVG(AVG_TEMPER), 2) AS "��ձ��"
  FROM 
     (
       SELECT SUBSTR(A.STD_DE, 1, 4) AS YYYY
            , ROUND(AVG(AVG_TEMPER), 2) AS AVG_TEMPER
         FROM TB_TEMPER A      
        GROUP BY SUBSTR(A.STD_DE, 1, 4)
        ORDER BY SUBSTR(A.STD_DE, 1, 4) 
     ) 
  GROUP BY CASE  
           WHEN YYYY BETWEEN '1900' AND '1909' THEN '1900���' WHEN YYYY BETWEEN '1910' AND '1919' THEN '1910���'
           WHEN YYYY BETWEEN '1920' AND '1929' THEN '1920���' WHEN YYYY BETWEEN '1930' AND '1939' THEN '1930���'
           WHEN YYYY BETWEEN '1940' AND '1949' THEN '1940���' WHEN YYYY BETWEEN '1950' AND '1959' THEN '1950���'
           WHEN YYYY BETWEEN '1960' AND '1969' THEN '1960���' WHEN YYYY BETWEEN '1970' AND '1979' THEN '1970���'
           WHEN YYYY BETWEEN '1980' AND '1989' THEN '1980���' WHEN YYYY BETWEEN '1990' AND '1999' THEN '1990���'
           WHEN YYYY BETWEEN '2000' AND '2009' THEN '2000���' WHEN YYYY BETWEEN '2010' AND '2019' THEN '2010���'
           WHEN YYYY BETWEEN '2020' AND '2029' THEN '2020���' END
ORDER BY "����"
;
