--02. 인구 데이터 테이블 생성 및 데이터 입력
CREATE TABLE TB_POPLTN_DATA
(
  ADMINIST_ZONE VARCHAR2(150)          --"행정구역"
, TOT_POPLTN_CO NUMBER(10)             --"2020년10월_계_총인구수"
, AGE_SCTN_POPLTN_CO NUMBER(10)        --"2020년10월_계_연령구간인구수"
, POPLTN_CO_0_9 NUMBER(10)             --"2020년10월_계_0~9세"
, POPLTN_CO_10_19 NUMBER(10)           --"2020년10월_계_10~19세"
, POPLTN_CO_20_29 NUMBER(10)           --"2020년10월_계_20~29세"
, POPLTN_CO_30_39 NUMBER(10)           --"2020년10월_계_30~39세"
, POPLTN_CO_40_49 NUMBER(10)           --"2020년10월_계_40~49세"
, POPLTN_CO_50_59 NUMBER(10)           --"2020년10월_계_50~59세"
, POPLTN_CO_60_69 NUMBER(10)           --"2020년10월_계_60~69세"
, POPLTN_CO_70_79 NUMBER(10)           --"2020년10월_계_70~79세"
, POPLTN_CO_80_89 NUMBER(10)           --"2020년10월_계_80~89세"
, POPLTN_CO_90_99 NUMBER(10)           --"2020년10월_계_90~99세"
, POPLTN_CO_100 NUMBER(10)             --"2020년10월_계_100세 이상"
, MALE_TOT_POPLTN_CO NUMBER(10)        --"2020년10월_남_총인구수"
, MALE_AGE_SCTN_POPLTN_CO NUMBER(10)   --"2020년10월_남_연령구간인구수"
, MALE_POPLTN_CO_0_9 NUMBER(10)        --"2020년10월_남_0~9세"
, MALE_POPLTN_CO_10_19 NUMBER(10)      --"2020년10월_남_10~19세"
, MALE_POPLTN_CO_20_29 NUMBER(10)      --"2020년10월_남_20~29세"
, MALE_POPLTN_CO_30_39 NUMBER(10)      --"2020년10월_남_30~39세"
, MALE_POPLTN_CO_40_49 NUMBER(10)      --"2020년10월_남_40~49세"
, MALE_POPLTN_CO_50_59 NUMBER(10)      --"2020년10월_남_50~59세"
, MALE_POPLTN_CO_60_69 NUMBER(10)      --"2020년10월_남_60~69세"
, MALE_POPLTN_CO_70_79 NUMBER(10)      --"2020년10월_남_70~79세"
, MALE_POPLTN_CO_80_89 NUMBER(10)      --"2020년10월_남_80~89세"
, MALE_POPLTN_CO_90_99 NUMBER(10)      --"2020년10월_남_90~99세"
, MALE_POPLTN_CO_100 NUMBER(10)        --"2020년10월_남_100세 이상"
, FEMALE_TOT_POPLTN_CO NUMBER(10)      --"2020년10월_여_Z총인구수"
, FEMALE_AGE_SCTN_POPLTN_CO NUMBER(10) --"2020년10월_여_연령구간인구수"
, FEMALE_POPLTN_CO_0_9 NUMBER(10)      --"2020년10월_여_0~9세"
, FEMALE_POPLTN_CO_10_19 NUMBER(10)    --"2020년10월_여_10~19세"
, FEMALE_POPLTN_CO_20_29 NUMBER(10)    --"2020년10월_여_20~29세"
, FEMALE_POPLTN_CO_30_39 NUMBER(10)    --"2020년10월_여_30~39세"
, FEMALE_POPLTN_CO_40_49 NUMBER(10)    --"2020년10월_여_40~49세"
, FEMALE_POPLTN_CO_50_59 NUMBER(10)    --"2020년10월_여_50~59세"
, FEMALE_POPLTN_CO_60_69 NUMBER(10)    --"2020년10월_여_60~69세"
, FEMALE_POPLTN_CO_70_79 NUMBER(10)    --"2020년10월_여_70~79세"
, FEMALE_POPLTN_CO_80_89 NUMBER(10)    --"2020년10월_여_80~89세"
, FEMALE_POPLTN_CO_90_99 NUMBER(10)    --"2020년10월_여_90~99세"
, FEMALE_POPLTN_CO_100 NUMBER(10)      --"2020년10월_여_100세 이상"
); 

SELECT COUNT(*) FROM TB_POPLTN_DATA; 

CREATE TABLE TB_POPLTN
(
  ADMINIST_ZONE_NO CHAR(10)
, ADMINIST_ZONE_NM VARCHAR2(150)
, STD_MT CHAR(6)
, POPLTN_SE_CD CHAR(1) --M:남성, F:여성, T:전체
, AGRDE_SE_CD CHAR(3) -- '000':0대,'010':10대,'020':20대,'030':30대,'040':40대,'050':50대,'060':60대,'070':70대,'080':80대,'090':90대, '100':'100대'
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


--03. 전체 인구의 연령대별 비율 구하기 

--2020년 10월 기준 전국 주요 시/도의 연령대별 인구수 합계를 구한다.
SELECT AGRDE_SE_CD
     , SUM(POPLTN_CNT) AGRDE_POPLTN_CNT
  FROM TB_POPLTN
 WHERE ADMINIST_ZONE_NO LIKE '__00000000' 
   AND POPLTN_SE_CD = 'T' --전체
   AND STD_MT = '202010'
 GROUP BY AGRDE_SE_CD
 ORDER BY AGRDE_SE_CD
;

--2020년 10월 기준 전국 주요 시/도의 연령대별 인구수 합계를 구하고 연령대별 인구 비율을 구한다.
SELECT A.AGRDE_SE_CD
     , A.AGRDE_POPLTN_CNT
     , TO_CHAR(ROUND((A.AGRDE_POPLTN_CNT/A.SUM_AGRDE_POPLTN_CNT) * 100, 2)) || '%' AS "인구비율"
     , SUM_AGRDE_POPLTN_CNT AS "전체인구"
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


--04. 전체 인구의 남성/여성 비율 구하기 


--2020년 10월 기준 전국의 성별 인구수 합계를 구한다.
SELECT A.POPLTN_SE_CD
     , SUM(A.POPLTN_CNT) AGRDE_POPLTN_CNT     
  FROM TB_POPLTN A 
 WHERE A.ADMINIST_ZONE_NO LIKE '__00000000' 
   AND A.POPLTN_SE_CD IN ('M', 'F') --M:'남성' F:'여성'
   AND A.STD_MT = '202010'
 GROUP BY A.POPLTN_SE_CD
 ORDER BY A.POPLTN_SE_CD
 ;

--2020년 10월 기준 전국의 성별 인구수 합계를 구하여 남성/여성 비율을 구한다.
SELECT MALE_AGRDE_POPLTN_CNT
     , FEMALE_AGRDE_POPLTN_CNT
     , ROUND(MALE_AGRDE_POPLTN_CNT/FEMALE_AGRDE_POPLTN_CNT, 4) * 100 || '%' AS "남성/여성비율"
     , ROUND(MALE_AGRDE_POPLTN_CNT/(MALE_AGRDE_POPLTN_CNT+FEMALE_AGRDE_POPLTN_CNT) * 100, 2) || '%' AS "남성비율"
     , ROUND(FEMALE_AGRDE_POPLTN_CNT/(MALE_AGRDE_POPLTN_CNT+FEMALE_AGRDE_POPLTN_CNT) * 100, 2) || '%' AS "여성비율"
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

--05. 연령대별 인구가 가장 많은 지역 구하기

--2020년 10월 기준 전국의 읍/면/동의 인구수(남/여)를 조회한다.
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

--2020년 10월 기준 전국의 읍/면/동의 인구수(남/여)를 조회 후 연령대별 인구가 가장 많은 지역을 조회한다.
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


--06. 연령대별 인구비율이 가장 높은 지역 구하기

--2020년 10월 기준 전국의 각 지열의 연령대별 인구수 비율이 높은 지역을 찾는다.
SELECT A.AGRDE_SE_CD, A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT, A."행정구역번호별각연령대의인구수가차지하는비율", A.RNUM
  FROM 
     (
SELECT A.AGRDE_SE_CD
     , A.ADMINIST_ZONE_NO
     , A.ADMINIST_ZONE_NM
     , A.POPLTN_CNT
     , A."행정구역번호별각연령대의인구수가차지하는비율"
     , ROW_NUMBER() OVER(PARTITION BY A.AGRDE_SE_CD ORDER BY A."행정구역번호별각연령대의인구수가차지하는비율" DESC) AS RNUM
  FROM 
     (
        SELECT 
               A.AGRDE_SE_CD
             , A.ADMINIST_ZONE_NO
             , A.ADMINIST_ZONE_NM
             , A.POPLTN_CNT
             , ROUND(RATIO_TO_REPORT(POPLTN_CNT) OVER(PARTITION BY ADMINIST_ZONE_NO) * 100, 2)  AS "행정구역번호별각연령대의인구수가차지하는비율"
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

--07. 남성보다 여성의 수가 가장 많은 지역 구하기

--전국의 각 읍/면/동 기준 남성의 수보다 여성의 수가 가장 많은 지역을 구한다. 
SELECT A.ADMINIST_ZONE_NO
     , A.ADMINIST_ZONE_NM  
     , A.FEMALE_POPLTN_CNT - MALE_POPLTN_CNT AS "여성인구수-남성인구수"
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
  ORDER BY "여성인구수-남성인구수" DESC
  ;

--08. 남성/여성 비율이 가장 높은 지역과 가장 낮은 지역 구하기

--전국의 각 읍/면/동 기준 남성 비율 및 여성 비율이 가장 높은 지역 구하기. 
SELECT * 
   FROM 
       (
          SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.MALE_POPLTN_CNT, A.FEMALE_POPLTN_CNT
               , ROUND((MALE_POPLTN_CNT/TOT_POPLTN_CNT) * 100, 2) AS "남성인구비율"
               , ROUND((FEMALE_POPLTN_CNT/TOT_POPLTN_CNT) * 100, 2) AS "여성인구비율"
               , ROW_NUMBER() OVER(ORDER BY ROUND((MALE_POPLTN_CNT/TOT_POPLTN_CNT) * 100, 2)) AS "남성인구비율순위"
               , ROW_NUMBER() OVER(ORDER BY ROUND((FEMALE_POPLTN_CNT/TOT_POPLTN_CNT) * 100, 2)) AS "여성인구비율순위"
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
WHERE "남성인구비율순위" = 1 OR "여성인구비율순위" = 1;
