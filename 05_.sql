CREATE TABLE TB_TRDAR_DATA
(
  TRDAR_NO VARCHAR2(4000) NOT NULL
, CMPNM_NM VARCHAR2(4000)
, BHF_NM VARCHAR2(4000)
, TRDAR_INDUTY_LRGE_CL_CD VARCHAR2(4000)
, TRDAR_INDUTY_LRGE_CL_NM VARCHAR2(4000)
, TRDAR_INDUTY_MIDDL_CL_CD VARCHAR2(4000)
, TRDAR_INDUTY_MIDDL_CL_NM VARCHAR2(4000)
, TRDAR_INDUTY_SMALL_CL_CD VARCHAR2(4000)
, TRDAR_INDUTY_SMALL_CL_NM VARCHAR2(4000)
, STD_INDUST_CL_CD VARCHAR2(4000)
, STD_INDUST_CL_NM VARCHAR2(4000)
, CTPRVN_CD VARCHAR2(4000)
, CTPRVN_NM VARCHAR2(4000)
, SIGNGU_CD VARCHAR2(4000)
, SIGNGU_NM VARCHAR2(4000)
, ADSTRD_CD VARCHAR2(4000)
, ADSTRD_NM VARCHAR2(4000)
, LEGALDONG_CD VARCHAR2(4000)
, LEGALDONG_NM VARCHAR2(4000)
, LNM_CD VARCHAR2(4000)
, PLOT_SE_CD VARCHAR2(4000)
, PLOT_SE_NM VARCHAR2(4000)
, LNM_MAIN_LNBR VARCHAR2(4000)
, LNM_SUB_LNBR VARCHAR2(4000)
, LNM_ADRES VARCHAR2(4000)
, RN_CD VARCHAR2(4000)
, RN VARCHAR2(4000)
, BULD_MAIN_LNBR VARCHAR2(4000)
, BULD_SUB_LNBR VARCHAR2(4000)
, BULD_MANAGE_NO VARCHAR2(4000)
, BULD_NM VARCHAR2(4000)
, RN_ADRES VARCHAR2(4000)
, OLD_ZIP VARCHAR2(4000)
, NW_ZIP VARCHAR2(4000)
, DONG_INFO VARCHAR2(4000)
, FLOOR_INFO VARCHAR2(4000)
, HO_INFO VARCHAR2(4000)
, LO VARCHAR2(4000)
, LA VARCHAR2(4000)
);

DELETE FROM TB_TRDAR_DATA WHERE TRDAR_NO = '상가업소번호'; 
COMMIT; 

SELECT COUNT(*) FROM TB_TRDAR_DATA; 

CREATE TABLE TB_TRDAR
(
  TRDAR_NO CHAR(8) NOT NULL
, CMPNM_NM VARCHAR2(150) NOT NULL
, BHF_NM VARCHAR2(100)
, TRDAR_INDUTY_LRGE_CL_CD VARCHAR2(6) NOT NULL
, TRDAR_INDUTY_LRGE_CL_NM VARCHAR2(100)
, TRDAR_INDUTY_MIDDL_CL_CD VARCHAR2(6) NOT NULL
, TRDAR_INDUTY_MIDDL_CL_NM VARCHAR2(100)
, TRDAR_INDUTY_SMALL_CL_CD VARCHAR2(6) NOT NULL
, TRDAR_INDUTY_SMALL_CL_NM VARCHAR2(100)
, STD_INDUST_CL_CD VARCHAR2(6)
, STD_INDUST_CL_NM VARCHAR2(100)
, CTPRVN_CD VARCHAR2(10) NOT NULL
, CTPRVN_NM VARCHAR2(100) NOT NULL
, SIGNGU_CD VARCHAR2(10) NOT NULL
, SIGNGU_NM VARCHAR2(100) NOT NULL
, ADSTRD_CD VARCHAR2(10) NOT NULL
, ADSTRD_NM VARCHAR2(50)
, LEGALDONG_CD VARCHAR2(10)
, LEGALDONG_NM VARCHAR2(50)
, LNM_CD VARCHAR2(19) NOT NULL
, PLOT_SE_CD VARCHAR2(1) NOT NULL
, PLOT_SE_NM VARCHAR2(100)
, LNM_MAIN_LNBR VARCHAR2(4) NOT NULL
, LNM_SUB_LNBR VARCHAR2(4)
, LNM_ADRES VARCHAR2(150) NOT NULL
, RN_CD VARCHAR2(12) NOT NULL
, RN VARCHAR2(150)
, BULD_MAIN_LNBR VARCHAR2(5) NOT NULL
, BULD_SUB_LNBR VARCHAR2(4)
, BULD_MANAGE_NO VARCHAR2(25) NOT NULL
, BULD_NM VARCHAR2(100)
, RN_ADRES VARCHAR2(150) NOT NULL
, OLD_ZIP VARCHAR2(6)
, NW_ZIP VARCHAR2(5)
, DONG_INFO VARCHAR2(50)
, FLOOR_INFO VARCHAR2(50)
, HO_INFO VARCHAR2(50)
, LO NUMBER(16,13) NOT NULL
, LA NUMBER(16,13) NOT NULL
, CONSTRAINT TB_TRDAR_PK PRIMARY KEY (TRDAR_NO) 
);


INSERT /*+ APPEND */ INTO TB_TRDAR T 
SELECT * FROM TB_TRDAR_DATA A 
;

COMMIT; 


SELECT COUNT(*) FROM TB_TRDAR; 


SELECT A.CTPRVN_CD
     , A.CTPRVN_NM
     , A.SIGNGU_CD
     , A.SIGNGU_NM        
     , A.TRDAR_INDUTY_LRGE_CL_CD
     , A.TRDAR_INDUTY_LRGE_CL_NM
     , COUNT(*) CNT
  FROM TB_TRDAR A
 WHERE SIGNGU_CD = '11680' --강남구
 GROUP BY A.CTPRVN_CD, A.CTPRVN_NM, A.SIGNGU_CD, A.SIGNGU_NM, A.TRDAR_INDUTY_LRGE_CL_CD , A.TRDAR_INDUTY_LRGE_CL_NM 
 ORDER BY CNT DESC;

CREATE INDEX IDX_TB_TRDAR_01 ON TB_TRDAR(SIGNGU_CD); 

SELECT 
       * 
  FROM 
     (
        SELECT A.CTPRVN_CD
             , A.CTPRVN_NM
             , A.SIGNGU_CD
             , A.SIGNGU_NM
             , A.ADSTRD_CD
             , A.ADSTRD_NM
             , COUNT(*) CNT
          FROM TB_TRDAR A
         WHERE (   A.CMPNM_NM LIKE '%스타벅스%'
                OR UPPER(A.CMPNM_NM) LIKE '%' || UPPER('STAR')||'%'||UPPER('BUCKS')||'%'
               )
           AND A.TRDAR_INDUTY_SMALL_CL_CD = 'Q12A01' --커피전문점/카페/다방
           GROUP BY A.CTPRVN_CD, A.CTPRVN_NM, A.SIGNGU_CD, A.SIGNGU_NM, A.ADSTRD_CD, A.ADSTRD_NM
           ORDER BY CNT DESC
     ) A
WHERE ROWNUM <= 10;

SELECT * 
  FROM 
     (
SELECT A.ADMINIST_ZONE_NO
     , A.ADMINIST_ZONE_NM
     , A.SIGNGU_CD
     , A."인구수"
     , A."커피전문점매장수"
     , TRUNC(A."인구수"/A."커피전문점매장수") "매장1개당인구수"
  FROM 
     (
        SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT "인구수",B.SIGNGU_CD, COUNT(*) AS "커피전문점매장수"
          FROM 
             (
               SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM , SUM(A.POPLTN_CNT) AS POPLTN_CNT
                 FROM TB_POPLTN A 
                WHERE A.STD_MT = '202010'
                  AND A.POPLTN_SE_CD = 'T'                  
                  AND A.ADMINIST_ZONE_NO LIKE '_____00000'                    
                  GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM 
             ) A 
             , TB_TRDAR B 
         WHERE SUBSTR(A.ADMINIST_ZONE_NO, 1, 5) = B.SIGNGU_CD 
           AND B.TRDAR_INDUTY_SMALL_CL_CD = 'Q12A01' --커피전문점/카페/다방
           GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT, B.SIGNGU_CD
           ORDER BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM
     )  A 
ORDER BY "매장1개당인구수" DESC    
    ) 
WHERE ROWNUM <= 10;

SELECT * 
  FROM 
     (
SELECT A.ADMINIST_ZONE_NO
     , A.ADMINIST_ZONE_NM
     , A.SIGNGU_CD
     , A."인구수"
     , A."학원수"
     , TRUNC(A."인구수"/A."학원수") "학원수1개당인구수"
  FROM 
     (
        SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT "인구수",B.SIGNGU_CD, COUNT(*) AS "학원수"
          FROM 
             (
               SELECT A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM , SUM(A.POPLTN_CNT) AS POPLTN_CNT
                 FROM TB_POPLTN A 
                WHERE A.STD_MT = '202010'
                  AND A.POPLTN_SE_CD = 'T'
                  AND A.AGRDE_SE_CD IN ('000', '010')
                  AND A.ADMINIST_ZONE_NO LIKE '_____00000'                    
                  GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM 
             ) A 
             , TB_TRDAR B 
         WHERE SUBSTR(A.ADMINIST_ZONE_NO, 1, 5) = B.SIGNGU_CD 
           AND B.TRDAR_INDUTY_LRGE_CL_CD = 'R' --학문/교육
           GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT, B.SIGNGU_CD
           ORDER BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM
     )  A 
ORDER BY "학원수1개당인구수" DESC    
) 
WHERE ROWNUM <= 10;







