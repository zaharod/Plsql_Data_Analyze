--02. �α� ������ ���̺� ���� �� ������ �Է�
CREATE TABLE TB_POPLTN_DATA
(
  ADMINIST_ZONE VARCHAR2(150)          --"��������"
, TOT_POPLTN_CO NUMBER(10)             --"2020��10��_��_���α���"
, AGE_SCTN_POPLTN_CO NUMBER(10)        --"2020��10��_��_���ɱ����α���"
, POPLTN_CO_0_9 NUMBER(10)             --"2020��10��_��_0~9��"
, POPLTN_CO_10_19 NUMBER(10)           --"2020��10��_��_10~19��"
, POPLTN_CO_20_29 NUMBER(10)           --"2020��10��_��_20~29��"
, POPLTN_CO_30_39 NUMBER(10)           --"2020��10��_��_30~39��"
, POPLTN_CO_40_49 NUMBER(10)           --"2020��10��_��_40~49��"
, POPLTN_CO_50_59 NUMBER(10)           --"2020��10��_��_50~59��"
, POPLTN_CO_60_69 NUMBER(10)           --"2020��10��_��_60~69��"
, POPLTN_CO_70_79 NUMBER(10)           --"2020��10��_��_70~79��"
, POPLTN_CO_80_89 NUMBER(10)           --"2020��10��_��_80~89��"
, POPLTN_CO_90_99 NUMBER(10)           --"2020��10��_��_90~99��"
, POPLTN_CO_100 NUMBER(10)             --"2020��10��_��_100�� �̻�"
, MALE_TOT_POPLTN_CO NUMBER(10)        --"2020��10��_��_���α���"
, MALE_AGE_SCTN_POPLTN_CO NUMBER(10)   --"2020��10��_��_���ɱ����α���"
, MALE_POPLTN_CO_0_9 NUMBER(10)        --"2020��10��_��_0~9��"
, MALE_POPLTN_CO_10_19 NUMBER(10)      --"2020��10��_��_10~19��"
, MALE_POPLTN_CO_20_29 NUMBER(10)      --"2020��10��_��_20~29��"
, MALE_POPLTN_CO_30_39 NUMBER(10)      --"2020��10��_��_30~39��"
, MALE_POPLTN_CO_40_49 NUMBER(10)      --"2020��10��_��_40~49��"
, MALE_POPLTN_CO_50_59 NUMBER(10)      --"2020��10��_��_50~59��"
, MALE_POPLTN_CO_60_69 NUMBER(10)      --"2020��10��_��_60~69��"
, MALE_POPLTN_CO_70_79 NUMBER(10)      --"2020��10��_��_70~79��"
, MALE_POPLTN_CO_80_89 NUMBER(10)      --"2020��10��_��_80~89��"
, MALE_POPLTN_CO_90_99 NUMBER(10)      --"2020��10��_��_90~99��"
, MALE_POPLTN_CO_100 NUMBER(10)        --"2020��10��_��_100�� �̻�"
, FEMALE_TOT_POPLTN_CO NUMBER(10)      --"2020��10��_��_Z���α���"
, FEMALE_AGE_SCTN_POPLTN_CO NUMBER(10) --"2020��10��_��_���ɱ����α���"
, FEMALE_POPLTN_CO_0_9 NUMBER(10)      --"2020��10��_��_0~9��"
, FEMALE_POPLTN_CO_10_19 NUMBER(10)    --"2020��10��_��_10~19��"
, FEMALE_POPLTN_CO_20_29 NUMBER(10)    --"2020��10��_��_20~29��"
, FEMALE_POPLTN_CO_30_39 NUMBER(10)    --"2020��10��_��_30~39��"
, FEMALE_POPLTN_CO_40_49 NUMBER(10)    --"2020��10��_��_40~49��"
, FEMALE_POPLTN_CO_50_59 NUMBER(10)    --"2020��10��_��_50~59��"
, FEMALE_POPLTN_CO_60_69 NUMBER(10)    --"2020��10��_��_60~69��"
, FEMALE_POPLTN_CO_70_79 NUMBER(10)    --"2020��10��_��_70~79��"
, FEMALE_POPLTN_CO_80_89 NUMBER(10)    --"2020��10��_��_80~89��"
, FEMALE_POPLTN_CO_90_99 NUMBER(10)    --"2020��10��_��_90~99��"
, FEMALE_POPLTN_CO_100 NUMBER(10)      --"2020��10��_��_100�� �̻�"
); 

SELECT COUNT(*) FROM TB_POPLTN_DATA; 

CREATE TABLE TB_POPLTN
(
  ADMINIST_ZONE_NO CHAR(10)
, ADMINIST_ZONE_NM VARCHAR2(150)
, STD_MT CHAR(6)
, POPLTN_SE_CD CHAR(1) --M:����, F:����, T:��ü
, AGRDE_SE_CD CHAR(3) -- '000':0��,'010':10��,'020':20��,'030':30��,'040':40��,'050':50��,'060':60��,'070':70��,'080':80��,'090':90��, '100':'100��'
, POPLTN_CNT NUMBER(10)
, CONSTRAINT TB_POPLTN_PK PRIMARY KEY (ADMINIST_ZONE_NO, STD_MT, POPLTN_SE_CD, AGRDE_SE_CD)
);

INSERT INTO TB_POPLTN
SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.STD_MT
     , CASE WHEN LVL1 = 1 THEN 'M' WHEN LVL1 = 2 THEN 'F' WHEN LVL1 = 3 THEN 'T' END AS POPLTN_SE_CD
     , CASE WHEN LVL2 = 1  THEN '000' WHEN LVL2 = 2  THEN '010' WHEN LVL2 = 3  THEN '020' 
            WHEN LVL2 = 4  THEN '030' WHEN LVL2 = 5  THEN '040' WHEN LVL2 = 6  THEN '050'
            WHEN LVL2 = 7  THEN '060' WHEN LVL2 = 8  THEN '070' WHEN LVL2 = 9  THEN '080' WHEN LVL2 = 10 THEN '090' WHEN LVL2 = 11 THEN '100' END AS AGRDE_SE_CD       
     , CASE WHEN LVL1 = 1 AND LVL2 = 1  THEN MALE_POPLTN_CO_0_9     WHEN LVL1 = 1 AND LVL2 = 2  THEN MALE_POPLTN_CO_10_19 
            WHEN LVL1 = 1 AND LVL2 = 3  THEN MALE_POPLTN_CO_20_29   WHEN LVL1 = 1 AND LVL2 = 4  THEN MALE_POPLTN_CO_30_39 
            WHEN LVL1 = 1 AND LVL2 = 5  THEN MALE_POPLTN_CO_40_49   WHEN LVL1 = 1 AND LVL2 = 6  THEN MALE_POPLTN_CO_50_59 
            WHEN LVL1 = 1 AND LVL2 = 7  THEN MALE_POPLTN_CO_60_69   WHEN LVL1 = 1 AND LVL2 = 8  THEN MALE_POPLTN_CO_70_79 
            WHEN LVL1 = 1 AND LVL2 = 9  THEN MALE_POPLTN_CO_80_89   WHEN LVL1 = 1 AND LVL2 = 10 THEN MALE_POPLTN_CO_90_99 
            WHEN LVL1 = 1 AND LVL2 = 11 THEN MALE_POPLTN_CO_100     WHEN LVL1 = 2 AND LVL2 = 1  THEN FEMALE_POPLTN_CO_0_9 
            WHEN LVL1 = 2 AND LVL2 = 2  THEN FEMALE_POPLTN_CO_10_19 WHEN LVL1 = 2 AND LVL2 = 3  THEN FEMALE_POPLTN_CO_20_29
            WHEN LVL1 = 2 AND LVL2 = 4  THEN FEMALE_POPLTN_CO_30_39 WHEN LVL1 = 2 AND LVL2 = 5  THEN FEMALE_POPLTN_CO_40_49
            WHEN LVL1 = 2 AND LVL2 = 6  THEN FEMALE_POPLTN_CO_50_59 WHEN LVL1 = 2 AND LVL2 = 7  THEN FEMALE_POPLTN_CO_60_69
            WHEN LVL1 = 2 AND LVL2 = 8  THEN FEMALE_POPLTN_CO_70_79 WHEN LVL1 = 2 AND LVL2 = 9  THEN FEMALE_POPLTN_CO_80_89
            WHEN LVL1 = 2 AND LVL2 = 10 THEN FEMALE_POPLTN_CO_90_99 WHEN LVL1 = 2 AND LVL2 = 11 THEN FEMALE_POPLTN_CO_100   
            WHEN LVL1 = 3 AND LVL2 = 1  THEN POPLTN_CO_0_9          WHEN LVL1 = 3 AND LVL2 = 2  THEN POPLTN_CO_10_19
            WHEN LVL1 = 3 AND LVL2 = 3  THEN POPLTN_CO_20_29        WHEN LVL1 = 3 AND LVL2 = 4  THEN POPLTN_CO_30_39
            WHEN LVL1 = 3 AND LVL2 = 5  THEN POPLTN_CO_40_49        WHEN LVL1 = 3 AND LVL2 = 6  THEN POPLTN_CO_50_59
            WHEN LVL1 = 3 AND LVL2 = 7  THEN POPLTN_CO_60_69        WHEN LVL1 = 3 AND LVL2 = 8  THEN POPLTN_CO_70_79
            WHEN LVL1 = 3 AND LVL2 = 9  THEN POPLTN_CO_80_89        WHEN LVL1 = 3 AND LVL2 = 10 THEN POPLTN_CO_90_99
            WHEN LVL1 = 3 AND LVL2 = 11 THEN POPLTN_CO_100 END AS POPLTN_CNT     
  FROM 
     (
      SELECT SUBSTR(ADMINIST_ZONE, INSTR(ADMINIST_ZONE, '(') + 1, 10) AS ADMINIST_ZONE_NO
           , SUBSTR(ADMINIST_ZONE, 1, INSTR(ADMINIST_ZONE, '(')-1) AS ADMINIST_ZONE_NM, '202010' AS STD_MT           
           , MALE_POPLTN_CO_0_9    , MALE_POPLTN_CO_10_19  , MALE_POPLTN_CO_20_29 
           , MALE_POPLTN_CO_30_39  , MALE_POPLTN_CO_40_49  , MALE_POPLTN_CO_50_59
           , MALE_POPLTN_CO_60_69  , MALE_POPLTN_CO_70_79  , MALE_POPLTN_CO_80_89  , MALE_POPLTN_CO_90_99  , MALE_POPLTN_CO_100    
           , FEMALE_POPLTN_CO_0_9  , FEMALE_POPLTN_CO_10_19, FEMALE_POPLTN_CO_20_29
           , FEMALE_POPLTN_CO_30_39, FEMALE_POPLTN_CO_40_49, FEMALE_POPLTN_CO_50_59
           , FEMALE_POPLTN_CO_60_69, FEMALE_POPLTN_CO_70_79, FEMALE_POPLTN_CO_80_89, FEMALE_POPLTN_CO_90_99, FEMALE_POPLTN_CO_100              
           , POPLTN_CO_0_9         , POPLTN_CO_10_19, POPLTN_CO_20_29
           , POPLTN_CO_30_39       , POPLTN_CO_40_49, POPLTN_CO_50_59
           , POPLTN_CO_60_69       , POPLTN_CO_70_79, POPLTN_CO_80_89, POPLTN_CO_90_99, POPLTN_CO_100                    
           , LVL1, LVL2
        FROM TB_POPLTN_DATA, (SELECT LEVEL AS LVL1 FROM DUAL CONNECT BY LEVEL <= 3), (SELECT LEVEL AS LVL2 FROM DUAL CONNECT BY LEVEL <= 11)
     ) A ;

COMMIT; 


--03. ��ü �α��� ���ɴ뺰 ���� ���ϱ� 

--2020�� 10�� ���� ���� �ֿ� ��/���� ���ɴ뺰 �α��� �հ踦 ���Ѵ�.
SELECT AGRDE_SE_CD
     , SUM(POPLTN_CNT) AGRDE_POPLTN_CNT
  FROM TB_POPLTN
 WHERE ADMINIST_ZONE_NO LIKE '__00000000' 
   AND POPLTN_SE_CD = 'T' --��ü
   AND STD_MT = '202010'
 GROUP BY AGRDE_SE_CD
 ORDER BY AGRDE_SE_CD
;

--2020�� 10�� ���� ���� �ֿ� ��/���� ���ɴ뺰 �α��� �հ踦 ���ϰ� ���ɴ뺰 �α� ������ ���Ѵ�.
SELECT A.AGRDE_SE_CD
     , A.AGRDE_POPLTN_CNT
     , TO_CHAR(ROUND((A.AGRDE_POPLTN_CNT/A.SUM_AGRDE_POPLTN_CNT) * 100, 2)) || '%' AS "�α�����"
     , SUM_AGRDE_POPLTN_CNT AS "��ü�α�"
  FROM 
     (
      SELECT A.AGRDE_SE_CD
           , A.AGRDE_POPLTN_CNT
           , SUM(A.AGRDE_POPLTN_CNT) OVER() AS SUM_AGRDE_POPLTN_CNT
        FROM 
           (
            SELECT A.AGRDE_SE_CD
                 , SUM(A.POPLTN_CNT) AGRDE_POPLTN_CNT
              FROM TB_POPLTN A 
             WHERE A.ADMINIST_ZONE_NO LIKE '__00000000' 
               AND A.POPLTN_SE_CD = 'T' 
               AND A.STD_MT = '202010'
             GROUP BY A.AGRDE_SE_CD
             ORDER BY A.AGRDE_SE_CD
           ) A 
     ) A
;


--04. ��ü �α��� ����/���� ���� ���ϱ� 


--2020�� 10�� ���� ������ ���� �α��� �հ踦 ���Ѵ�.
SELECT A.POPLTN_SE_CD
     , SUM(A.POPLTN_CNT) AGRDE_POPLTN_CNT     
  FROM TB_POPLTN A 
 WHERE A.ADMINIST_ZONE_NO LIKE '__00000000' 
   AND A.POPLTN_SE_CD IN ('M', 'F') --M:'����' F:'����'
   AND A.STD_MT = '202010'
 GROUP BY A.POPLTN_SE_CD
 ORDER BY A.POPLTN_SE_CD
 ;

--2020�� 10�� ���� ������ ���� �α��� �հ踦 ���Ͽ� ����/���� ������ ���Ѵ�.
SELECT MALE_AGRDE_POPLTN_CNT
     , FEMALE_AGRDE_POPLTN_CNT
     , ROUND(MALE_AGRDE_POPLTN_CNT/FEMALE_AGRDE_POPLTN_CNT, 4) * 100 || '%' AS "����/��������"
     , ROUND(MALE_AGRDE_POPLTN_CNT/(MALE_AGRDE_POPLTN_CNT+FEMALE_AGRDE_POPLTN_CNT) * 100, 2) || '%' AS "��������"
     , ROUND(FEMALE_AGRDE_POPLTN_CNT/(MALE_AGRDE_POPLTN_CNT+FEMALE_AGRDE_POPLTN_CNT) * 100, 2) || '%' AS "��������"
  FROM 
     (
          SELECT        
                 MAX(MALE_AGRDE_POPLTN_CNT) MALE_AGRDE_POPLTN_CNT
               , MAX(FEMALE_AGRDE_POPLTN_CNT) FEMALE_AGRDE_POPLTN_CNT
            FROM 
            (
               SELECT A.POPLTN_SE_CD
                    , CASE WHEN A.POPLTN_SE_CD = 'M' THEN SUM(POPLTN_CNT)  ELSE 0 END MALE_AGRDE_POPLTN_CNT         
                    , CASE WHEN A.POPLTN_SE_CD = 'F' THEN SUM(POPLTN_CNT)  ELSE 0 END FEMALE_AGRDE_POPLTN_CNT    
                 FROM TB_POPLTN A 
                WHERE A.ADMINIST_ZONE_NO LIKE '__00000000' 
                  AND A.POPLTN_SE_CD IN ( 'M', 'F')
                  AND A.STD_MT = '202010'
                GROUP BY A.POPLTN_SE_CD
                ORDER BY A.POPLTN_SE_CD
            ) A        
      )
; 

--05. ���ɴ뺰 �α��� ���� ���� ���� ���ϱ�

--2020�� 10�� ���� ������ ��/��/���� �α���(��/��)�� ��ȸ�Ѵ�.
SELECT
       A.AGRDE_SE_CD
     , A.ADMINIST_ZONE_NO
     , A.ADMINIST_ZONE_NM
     , A.POPLTN_CNT
  FROM TB_POPLTN A
 WHERE A.ADMINIST_ZONE_NO NOT LIKE '_____00000'    
   AND A.POPLTN_SE_CD IN ('T')   
   AND A.POPLTN_CNT > 0 
   AND A.STD_MT = '202010'
ORDER BY POPLTN_CNT DESC;

--2020�� 10�� ���� ������ ��/��/���� �α���(��/��)�� ��ȸ �� ���ɴ뺰 �α��� ���� ���� ������ ��ȸ�Ѵ�.
SELECT 
       A.AGRDE_SE_CD     , A.ADMINIST_ZONE_NO
     , A.ADMINIST_ZONE_NM, A.POPLTN_CNT
  FROM 
     (
        SELECT A.AGRDE_SE_CD
             , A.ADMINIST_ZONE_NO
             , A.ADMINIST_ZONE_NM
             , A.POPLTN_CNT
             , ROW_NUMBER() OVER(PARTITION BY A.AGRDE_SE_CD ORDER BY A.POPLTN_CNT DESC) AS RNUM
          FROM 
             (
                SELECT
                       A.AGRDE_SE_CD
                     , A.ADMINIST_ZONE_NO
                     , A.ADMINIST_ZONE_NM
                     , A.POPLTN_CNT
                  FROM TB_POPLTN A
                 WHERE A.ADMINIST_ZONE_NO NOT LIKE '_____00000'    
                   AND A.POPLTN_SE_CD IN ('T')   
                   AND A.POPLTN_CNT > 0 
                   AND A.STD_MT = '202010'
                 ORDER BY POPLTN_CNT DESC
             ) A
     ) A 
WHERE A.RNUM = 1
ORDER BY A.AGRDE_SE_CD; 


--06. ���ɴ뺰 �α������� ���� ���� ���� ���ϱ�

--2020�� 10�� ���� ������ �� ������ ���ɴ뺰 �α��� ������ ���� ������ ã�´�.
SELECT A.AGRDE_SE_CD, A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT, A."����������ȣ�������ɴ����α����������ϴº���", A.RNUM
  FROM 
     (
SELECT A.AGRDE_SE_CD
     , A.ADMINIST_ZONE_NO
     , A.ADMINIST_ZONE_NM
     , A.POPLTN_CNT
     , A."����������ȣ�������ɴ����α����������ϴº���"
     , ROW_NUMBER() OVER(PARTITION BY A.AGRDE_SE_CD ORDER BY A."����������ȣ�������ɴ����α����������ϴº���" DESC) AS RNUM
  FROM 
     (
        SELECT 
               A.AGRDE_SE_CD
             , A.ADMINIST_ZONE_NO
             , A.ADMINIST_ZONE_NM
             , A.POPLTN_CNT
             , ROUND(RATIO_TO_REPORT(POPLTN_CNT) OVER(PARTITION BY ADMINIST_ZONE_NO) * 100, 2)  AS "����������ȣ�������ɴ����α����������ϴº���"
          FROM 
             (
        SELECT
               A.AGRDE_SE_CD
             , A.ADMINIST_ZONE_NO
             , A.ADMINIST_ZONE_NM
             , A.POPLTN_CNT
          FROM TB_POPLTN A
         WHERE A.ADMINIST_ZONE_NO NOT LIKE '_____00000'    
           AND A.POPLTN_SE_CD IN ('T')   
           AND A.POPLTN_CNT > 0 
           AND A.STD_MT = '202010'
         ORDER BY POPLTN_CNT DESC
             ) A
    ) A 
    ) A 
 WHERE RNUM = 1;

--07. �������� ������ ���� ���� ���� ���� ���ϱ�

--������ �� ��/��/�� ���� ������ ������ ������ ���� ���� ���� ������ ���Ѵ�. 
SELECT A.ADMINIST_ZONE_NO
     , A.ADMINIST_ZONE_NM  
     , A.FEMALE_POPLTN_CNT - MALE_POPLTN_CNT AS "�����α���-�����α���"
 FROM 
	  (
				SELECT A.ADMINIST_ZONE_NO
				     , A.ADMINIST_ZONE_NM 
				     , MAX(A.MALE_POPLTN_CNT) AS MALE_POPLTN_CNT
				     , MAX(A.FEMALE_POPLTN_CNT) AS FEMALE_POPLTN_CNT
				  FROM 
				     (
								SELECT A.ADMINIST_ZONE_NO
								     , A.ADMINIST_ZONE_NM 
								     , CASE WHEN A.POPLTN_SE_CD = 'M' THEN A.POPLTN_CNT ELSE 0 END AS MALE_POPLTN_CNT 
								     , CASE WHEN A.POPLTN_SE_CD = 'F' THEN A.POPLTN_CNT ELSE 0 END AS FEMALE_POPLTN_CNT 
								  FROM 
								     (
								SELECT
								        A.ADMINIST_ZONE_NO
								      , A.ADMINIST_ZONE_NM 
								      , A.POPLTN_SE_CD
								      , SUM(A.POPLTN_CNT) AS POPLTN_CNT
								   FROM TB_POPLTN A
								  WHERE A.ADMINIST_ZONE_NO NOT LIKE '_____00000'  
								    AND A.POPLTN_SE_CD IN ('M', 'F')
								    AND A.STD_MT = '202010'
								  GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_SE_CD
								  ORDER BY A.ADMINIST_ZONE_NO, A.POPLTN_SE_CD 
						   ) A
				     ) A 
				GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM   
     ) A 
  ORDER BY "�����α���-�����α���" DESC
  ;

--08. ����/���� ������ ���� ���� ������ ���� ���� ���� ���ϱ�

--������ �� ��/��/�� ���� ���� ���� �� ���� ������ ���� ���� ���� ���ϱ�. 
SELECT * 
   FROM 
       (
          SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.MALE_POPLTN_CNT, A.FEMALE_POPLTN_CNT
               , ROUND((MALE_POPLTN_CNT/TOT_POPLTN_CNT) * 100, 2) AS "�����α�����"
               , ROUND((FEMALE_POPLTN_CNT/TOT_POPLTN_CNT) * 100, 2) AS "�����α�����"
               , ROW_NUMBER() OVER(ORDER BY ROUND((MALE_POPLTN_CNT/TOT_POPLTN_CNT) * 100, 2)) AS "�����α���������"
               , ROW_NUMBER() OVER(ORDER BY ROUND((FEMALE_POPLTN_CNT/TOT_POPLTN_CNT) * 100, 2)) AS "�����α���������"
            FROM 
               (
                 SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM 
                      , MAX(A.MALE_POPLTN_CNT) AS MALE_POPLTN_CNT
                      , MAX(A.FEMALE_POPLTN_CNT) AS FEMALE_POPLTN_CNT
                      , MAX(A.MALE_POPLTN_CNT) + MAX(A.FEMALE_POPLTN_CNT) AS TOT_POPLTN_CNT
                   FROM 
                      (
                        SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM 
                             , CASE WHEN A.POPLTN_SE_CD = 'M' THEN A.POPLTN_CNT ELSE 0 END AS MALE_POPLTN_CNT 
                             , CASE WHEN A.POPLTN_SE_CD = 'F' THEN A.POPLTN_CNT ELSE 0 END AS FEMALE_POPLTN_CNT 
                          FROM 
                             (
                               SELECT
                                      A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_SE_CD
                                    , SUM(A.POPLTN_CNT) AS POPLTN_CNT
                                 FROM TB_POPLTN A
                                WHERE A.ADMINIST_ZONE_NO NOT LIKE '_____00000'  
                                  AND A.POPLTN_SE_CD IN ('M', 'F')
                                  AND A.POPLTN_CNT > 0
                                  AND A.STD_MT = '202010'
                                GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_SE_CD
                                ORDER BY A.ADMINIST_ZONE_NO, A.POPLTN_SE_CD 
                             ) A
                       ) A 
                   GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM 
                ) A
        )
WHERE "�����α���������" = 1 OR "�����α���������" = 1;
