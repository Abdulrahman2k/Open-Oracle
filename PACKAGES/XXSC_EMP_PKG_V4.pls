CREATE OR REPLACE PACKAGE  XXSC_EMP_PKG AUTHID CURRENT_USER
--  $Header: XXSC_EMP_PKG.pls 12.2 2016/02/22 10:30:06 mrahman noship $
--*************************************************************************
-- Copyright (c)  2016   Shuaa Capital PSC
-- All rights reserved
--*************************************************************************
-- PROGRAM NAME  
-- XXSC_EMP_PKG
--
-- DESCRIPTION
--  This Package is the default Package containing the Procedures
-- |              used by XXSC_EMP_PKG Extract
-- USAGE
--   To install       How to Install
--   To execute       How to Execute
--
-- PROGRAM LIST         DESCRIPTION
-- DEPENDENCIES
--   1. Common Error Check Package.
--
-- CALLED BY
--   Which script, if any, calls this one
--
-- LAST UPDATE DATE   22-FEB-2016
--   Date the program has been modified for the last time
--
-- HISTORY
-- =======
--
-- VERSION  DATE        AUTHOR(S)               DESCRIPTION
-- ------- ----------- --------------- ------------------------------------
-- DRAFT 1A 22-FEB-2016  Mohammed Abdul Rahman    Initial draft version
--************************************************************************
AS
    P_CONC_REQUEST_ID                   NUMBER;
    P_PERSON_ID                         NUMBER;
    P_BUSINESS_GROUP_ID                 NUMBER;
    PROCEDURE XXSC_CREATE_EMP_PHONE_EMAIL(
                                      P_WINDOWS_LOGIN_ID   IN VARCHAR2, 
                                      P_LOCALE              IN VARCHAR2,
                                      P_EMAIL_ADDRESS       IN VARCHAR2, 
                                      P_EMP_PHONE_NUMBER       IN VARCHAR2, 
                                      P_CONTACT_PHONE_NUMBER       IN VARCHAR2,
                                      P_ADDRESS_LINE1              IN VARCHAR2,
                                      P_ADDRESS_LINE2             IN VARCHAR2,
                                      P_EMIRATES                  IN VARCHAR2,
                                      P_STREET                    IN VARCHAR2,
                                      P_BUILDING                  IN VARCHAR2,
                                      P_FLAT_NUMBER                IN VARCHAR2,
                                      P_PO_BOX                     IN VARCHAR2,
                                      P_COUNTRY                    in varchar2,
                                      P_CONTACT_ADDRESS_LINE1              in varchar2,
                                      P_CONTACT_ADDRESS_LINE2             in varchar2,
                                      P_CONTACT_EMIRATES                  in varchar2,
                                      P_CONTACT_STREET                    in varchar2,
                                      P_CONTACT_BUILDING                  in varchar2,
                                      P_CONTACT_FLAT_NUMBER                in varchar2,
                                      P_CONTACT_PO_BOX                     in varchar2,
                                      P_CONTACT_COUNTRY                    IN VARCHAR2,
                                      P_CONTACT_LAST_NAME          IN VARCHAR2,
                                      P_CONTACT_FIRST_NAME         IN VARCHAR2,
                                      P_CONTACT_EMAIL_ADDRESS      IN VARCHAR2,
                                      P_STATUS                     OUT VARCHAR2,
                                      P_ERROR_MESSAGE              OUT VARCHAR2,
                                      P_BUSINESS_GROUP_ID          IN NUMBER
                                      );
  END XXSC_EMP_PKG;
/


CREATE OR REPLACE PACKAGE BODY      XXSC_EMP_PKG
--  $Header: XXSC_EMP_PKG.pls 12.2 2016/02/22 10:30:06 mrahman noship $
--*************************************************************************
-- Copyright (c)  2016   Shuaa Capital PSC
-- All rights reserved
--*************************************************************************
--
--
-- PROGRAM NAME
--  XXSC_EMP_PKG
--
-- DESCRIPTION
--  This Package is the default Package containing the Procedures
-- |              used by XXSC_HR_PKG Extract
-- USAGE
--   To install       How to Install
--   To execute       How to Execute
--
-- PROGRAM LIST         DESCRIPTION
-- DEPENDENCIES
--   1. Common Error Check Package.
--
-- CALLED BY
--   Which script, if any, calls this one
--
-- LAST UPDATE DATE   22-FEB-2016
--   Date the program has been modified for the last time
--
-- HISTORY
-- =======
--
-- VERSION  DATE        AUTHOR(S)               DESCRIPTION
-- ------- ----------- --------------- ------------------------------------
-- DRAFT 1A 22-FEB-2016  Mohammed Abdul Rahman    Initial draft version
--************************************************************************
AS
PROCEDURE XXSC_CREATE_EMP_PHONE_EMAIL (
                                      P_WINDOWS_LOGIN_ID   IN VARCHAR2, 
                                      P_LOCALE              IN VARCHAR2,
                                      P_EMAIL_ADDRESS       IN VARCHAR2, 
                                      P_EMP_PHONE_NUMBER       IN VARCHAR2, 
                                      P_CONTACT_PHONE_NUMBER       IN VARCHAR2,
                                      P_ADDRESS_LINE1              IN VARCHAR2,
                                      P_ADDRESS_LINE2             IN VARCHAR2,
                                      P_EMIRATES                  IN VARCHAR2,
                                      P_STREET                    IN VARCHAR2,
                                      P_BUILDING                  IN VARCHAR2,
                                      P_FLAT_NUMBER                IN VARCHAR2,
                                      P_PO_BOX                     IN VARCHAR2,
                                      P_COUNTRY                    in varchar2,
                                      P_CONTACT_ADDRESS_LINE1              in varchar2,
                                      P_CONTACT_ADDRESS_LINE2             in varchar2,
                                      P_CONTACT_EMIRATES                  in varchar2,
                                      P_CONTACT_STREET                    in varchar2,
                                      P_CONTACT_BUILDING                  in varchar2,
                                      P_CONTACT_FLAT_NUMBER                in varchar2,
                                      P_CONTACT_PO_BOX                     in varchar2,
                                      P_CONTACT_COUNTRY                    IN VARCHAR2,
                                      P_CONTACT_LAST_NAME          IN VARCHAR2,
                                      P_CONTACT_FIRST_NAME         IN VARCHAR2,
                                      P_CONTACT_EMAIL_ADDRESS      IN VARCHAR2,
                                      P_STATUS                     OUT VARCHAR2,
                                      P_ERROR_MESSAGE              OUT VARCHAR2,
                                      P_BUSINESS_GROUP_ID  IN NUMBER
                                      )
AS
   -- Local Variables  
   -- -----------------------  
    LN_PH_EMP_OBJ_VER_NUMBER    PER_PHONES.OBJECT_VERSION_NUMBER%TYPE;  
    LN_OBJECT_VERSION_NUMBER    PER_ALL_PEOPLE_F.OBJECT_VERSION_NUMBER%TYPE     ;  
    LN_EMP_OBJECT_VERSION_NUMBER     PER_ALL_PEOPLE_F.OBJECT_VERSION_NUMBER%TYPE     ;  
    LC_DT_UD_MODE               VARCHAR2(100)                    := NULL;  
    LN_PERSON_ID                PER_ALL_PEOPLE_F.PERSON_ID%TYPE                ;
    LC_EMPLOYEE_NUMBER          PER_ALL_PEOPLE_F.EMPLOYEE_NUMBER%TYPE          ;  
    LC_CONTACT_EMPLOYEE_NUMBER  PER_ALL_PEOPLE_F.EMPLOYEE_NUMBER%TYPE          ;  
    LN_PHONE_ID                 PER_PHONES.PHONE_ID%TYPE; 
    LN_PHONE_OBJECT_VERSION_NUMBER    PER_PHONES.OBJECT_VERSION_NUMBER%TYPE; 
    LN_CONTACT_PHONE_ID         PER_PHONES.PHONE_ID%TYPE; 
    LN_CONTACT_PHONE_OBJECT_NUMBER    PER_PHONES.OBJECT_VERSION_NUMBER%TYPE; 
    LN_ADDRESS_ID               PER_ADDRESSES.ADDRESS_ID%TYPE; 
    LN_AD_OBJECT_VERSION_NUMBER PER_ADDRESSES.OBJECT_VERSION_NUMBER%TYPE;
    LN_CONT_ADDRESS_ID          PER_ADDRESSES.ADDRESS_ID%TYPE; 
    LN_CNT_AD_OBJ_VER_NUMBER    PER_ADDRESSES.OBJECT_VERSION_NUMBER%TYPE; 
    LC_ADDRESS_LINE1            PER_ADDRESSES.ADDRESS_LINE1%TYPE   ;
    LC_ADDRESS_LINE2            PER_ADDRESSES.ADDRESS_LINE2%TYPE   ;
    LC_EMIRATES                 PER_ADDRESSES.ADDRESS_LINE3%TYPE   ;
    LC_STREET                   PER_ADDRESSES.ADDRESS_LINE3%TYPE   ;
    LC_BUILDING                 PER_ADDRESSES.ADDRESS_LINE3%TYPE    ;
    LC_FLAT_NUMBER              PER_ADDRESSES.ADD_INFORMATION14%TYPE ;
    LC_PO_BOX                   PER_ADDRESSES.ADD_INFORMATION15%TYPE  ;
    LC_COUNTRY                  PER_ADDRESSES.COUNTRY%TYPE ;
    LC_CONTACT_LAST_NAME        PER_ALL_PEOPLE_F.FULL_NAME%TYPE;
    LC_CONTACT_FIRST_NAME       PER_ALL_PEOPLE_F.FULL_NAME%TYPE;
    LN_BUSINESS_GROUP_ID        PER_ALL_PEOPLE_F.BUSINESS_GROUP_ID%TYPE;
    LC_EMIRATES_CODE            FND_LOOKUP_VALUES.LOOKUP_CODE%TYPE;
    LD_DATE_OF_HIRE             PER_ALL_PEOPLE_F.ORIGINAL_DATE_OF_HIRE%TYPE;
    LC_PRIMARY_ADDRESS            VARCHAR2(1);
    LC_PRIMARY_ADDRESS_TO_CREATE  VARCHAR2(1);
   -- Out Variables for Find Date Track Mode API  
   -- ----------------------------------------------------------------  
    LB_CORRECTION                       BOOLEAN;  
    LB_UPDATE                          BOOLEAN;  
    LB_UPDATE_OVERRIDE                 BOOLEAN;   
    LB_UPDATE_CHANGE_INSERT            BOOLEAN;

   -- Out Variables for Update Employee API  
   -- -----------------------------------------------------------  
    LD_EFFECTIVE_START_DATE                       DATE;  
    LD_EFFECTIVE_END_DATE                         DATE;  
    LD_CNT_EFFECTIVE_START_DATE                   DATE;
    LD_CNT_START_DATE                             DATE;
    LD_CONTACT_EFFECTIVE_END_DATE                 DATE;  
    LC_FULL_NAME                                  PER_ALL_PEOPLE_F.FULL_NAME%TYPE;  
    LC_CONTACT_FULL_NAME                          PER_ALL_PEOPLE_F.FULL_NAME%type;  
    LN_COMMENT_ID                                 PER_ALL_PEOPLE_F.COMMENT_ID%TYPE;   
    LN_CONTACT_COMMENT_ID                         PER_ALL_PEOPLE_F.COMMENT_ID%TYPE; 
    LB_NAME_COMBINATION_WARNING                   BOOLEAN; 
    LB_CNT_NAME_COMBN_WARNING                     BOOLEAN;  
    LB_ASSIGN_PAYROLL_WARNING                     BOOLEAN;  
    LB_CNT_ASSIGN_PAYROLL_WARNING                 BOOLEAN;  
    LB_ORIG_HIRE_WARNING                          BOOLEAN;
    LB_CONTACT_ORIG_HIRE_WARNING                  BOOLEAN;
    LC_EMAIL_ADDRESS                              PER_ALL_PEOPLE_F.ATTRIBUTE10%type   ; 
    LC_CONTACT_EMAIL_ADDRESS                      PER_ALL_PEOPLE_F.ATTRIBUTE10%type   ; 
    LC_EMP_PHONE_NUMBER                           PER_PHONES.PHONE_NUMBER%type                     ;
    LC_CONTACT_PHONE_NUMBER                       PER_PHONES.PHONE_NUMBER%type                     ;
    LN_CONTACT_REL_ID                             PER_CONTACT_RELATIONSHIPS.CONTACT_RELATIONSHIP_ID%type;  
    LN_CTR_OBJECT_VER_NUM                         PER_CONTACT_RELATIONSHIPS.OBJECT_VERSION_NUMBER%type;  
    LN_CONTACT_PERSON                             PER_ALL_PEOPLE_F.PERSON_ID%type;  
    LN_EMP_CONT_OBJ_VER_NUMBER                    PER_CONTACT_RELATIONSHIPS.OBJECT_VERSION_NUMBER%type;  
    LN_EMP_CONT_REL_OBJ_VER_NUMBER                PER_CONTACT_RELATIONSHIPS.OBJECT_VERSION_NUMBER%type;   
    LD_PER_EFFECTIVE_START_DATE                   DATE;  
    LD_PER_EFFECTIVE_END_DATE                     DATE;  
    LN_PER_COMMENT_ID                             PER_ALL_PEOPLE_F.COMMENT_ID%TYPE;  
    LB_NAME_COMB_WARNING                          BOOLEAN;  
    LC_ERR_MESSAGE                                VARCHAR2 (1000);
    LC_ERR_FLAG                                   VARCHAR2 (3) := 'N';
    LC_COMP_LAST_NAME                             PER_ALL_PEOPLE_F.FULL_NAME%TYPE;
    LC_COMP_FIRST_NAME                            PER_ALL_PEOPLE_F.FULL_NAME%TYPE;
    LD_DATE_FROM                                  PER_ADDRESSES_V.DATE_FROM%TYPE;
        CURSOR XXSC_EMP_CUR (WINDOWS_ID VARCHAR2)
        IS
          SELECT papf.OBJECT_VERSION_NUMBER,
            papf.PERSON_ID,
            papf.EMPLOYEE_NUMBER,
            papf.ORIGINAL_DATE_OF_HIRE
          FROM PER_ALL_PEOPLE_F PAPF
          WHERE TRIM(UPPER(PAPF.ATTRIBUTE6)) = TRIM(UPPER(WINDOWS_ID))
          AND papf.effective_end_date        =
            (SELECT MAX (papf2.effective_end_date)
            FROM PER_ALL_PEOPLE_F papf2
            WHERE papf2.person_id = papf.person_id
            );
          CURSOR XXSC_EMIRATES_CUR (LC_EMIRATES_CODE VARCHAR2)
          IS
            SELECT LOOKUP_CODE
            FROM FND_LOOKUP_VALUES
            WHERE LOOKUP_TYPE        ='AE_EMIRATE'
            AND UPPER(TRIM(MEANING)) = UPPER(TRIM(LC_EMIRATES_CODE));
          CURSOR XXSC_ADDR_EXISTS (LN_PERSON_ID NUMBER)
          IS
            SELECT NVL(PRIMARY_FLAG,'N') PRIMARY_ADDRESS_TO_CREATE
            FROM PER_ADDRESSES_V
            WHERE PERSON_ID  = LN_PERSON_ID
            AND NVL(DATE_TO,TO_DATE ('31/12/4712', 'DD/MM/YYYY'))= TO_DATE ('31/12/4712', 'DD/MM/YYYY') 
            AND PRIMARY_FLAG = 'Y'
          UNION
          SELECT 'N' PRIMARY_ADDRESS_TO_CREATE
          FROM DUAL
          WHERE NOT EXISTS
            (SELECT 1
            FROM PER_ADDRESSES_V
            WHERE PERSON_ID  = LN_PERSON_ID
            AND NVL(DATE_TO,TO_DATE ('31/12/4712', 'DD/MM/YYYY'))= TO_DATE ('31/12/4712', 'DD/MM/YYYY') 
            AND PRIMARY_FLAG = 'Y'
            ) ;                                    
          CURSOR XXSC_EMP_PHONE_CUR(L_PERSON_ID NUMBER, L_EMP_PHONE_NUMBER VARCHAR2)
          IS
            SELECT PHONE_ID,
              object_version_number,
              PARENT_ID
            FROM PER_PHONES
            WHERE PARENT_ID                      = L_PERSON_ID
            AND PHONE_TYPE                       ='M'
            AND ( REPLACE(TRANSLATE(phone_number,'-+()',' '),' ', '') =REPLACE(TRANSLATE(L_EMP_PHONE_NUMBER,'-+()',' '),' ', '') OR TO_CHAR(DATE_FROM,'DD-MON-RR') = TO_CHAR(SYSDATE,'DD-MON-RR')); --'17-FEB-16';
          CURSOR XXSC_EMP_ADD_CUR(L_PERSON_ID NUMBER,P_ADDRESS_LINE1 VARCHAR2)
          IS
            SELECT ADDRESS_ID,
              OBJECT_VERSION_NUMBER,
              PRIMARY_FLAG PRIMARY_ADDRESS,
              DATE_FROM 
            FROM per_addresses
            WHERE PERSON_ID                     = L_PERSON_ID
            AND NVL(DATE_TO,TO_DATE ('31/12/4712', 'DD/MM/YYYY'))= TO_DATE ('31/12/4712', 'DD/MM/YYYY') 
            AND ( TO_CHAR(DATE_FROM,'DD-MON-RR') = TO_CHAR(SYSDATE,'DD-MON-RR')
            OR   TRIM(UPPER(P_ADDRESS_LINE1))  = TRIM(UPPER(ADDRESS_LINE1))
                );
          -- ;
          CURSOR XXSC_CONTACT_PHONE_CUR(L_PERSON_ID NUMBER) --, L_EMP_PHONE_NUMBER VARCHAR2)
          IS
            SELECT PHONE_ID,
              object_version_number,
              PARENT_ID
            FROM PER_PHONES
            WHERE PARENT_ID                        = L_PERSON_ID--'17-FEB-16'
            AND   PHONE_TYPE                       ='M'
            AND   TO_CHAR(DATE_FROM,'DD-MON-RR') = TO_CHAR(SYSDATE,'DD-MON-RR') ;
          CURSOR XXSC_CONTACT_CUR (L_PERSON_ID NUMBER,LC_FIRST_NAME VARCHAR2, LC_LAST_NAME VARCHAR2)
          IS
            SELECT pcr.contact_relationship_id,
              CNT.FIRST_NAME,
              CNT.LAST_NAME ,
              PCR.CONTACT_PERSON_ID ,
              PCR.OBJECT_VERSION_NUMBER ,
              CNT.EMPLOYEE_NUMBER ,
              CNT.EFFECTIVE_START_DATE
            FROM per_contact_relationships pcr ,
              per_all_people_f cnt
            WHERE pcr.contact_person_id           = cnt.person_id
            AND PCR.CONTACT_TYPE                  ='EMRG'
            AND PCR.PERSON_ID                     = L_PERSON_ID --436;
            AND ( (TRIM(UPPER(CNT.FIRST_NAME))    = TRIM(UPPER(LC_FIRST_NAME))
            AND TRIM(UPPER(CNT.LAST_NAME))        = TRIM(UPPER(LC_LAST_NAME)) )
                OR TO_CHAR(DATE_START,'dd-MON-RR')= TO_CHAR(SYSDATE,'dd-MON-RR')
                )
            AND ROWNUM                            =1; 
       --   AND REPLACE(TRANSLATE(phone_number,'-+()',' '),' ', '') =L_EMP_PHONE_NUMBER; 
BEGIN     ---MAIN START
            LC_ERR_FLAG := 'N';
            -- SETTING ERROR FLAG TO NULL EXPLICITLY
            IF P_COUNTRY            ='AE' THEN
              LN_BUSINESS_GROUP_ID :=83;
            ELSIF P_COUNTRY         ='SA' THEN
              LN_BUSINESS_GROUP_ID :=82;
            END IF;
            FOR XXSC_EMIRATES_REC IN XXSC_EMIRATES_CUR(P_EMIRATES)
            LOOP
              LC_EMIRATES_CODE:=XXSC_EMIRATES_REC.LOOKUP_CODE;
            END LOOP;
            FOR XXSC_REC IN XXSC_EMP_CUR (P_WINDOWS_LOGIN_ID)
            LOOP
              BEGIN
                LN_EMP_OBJECT_VERSION_NUMBER :=XXSC_REC.OBJECT_VERSION_NUMBER;
                LC_EMPLOYEE_NUMBER           :=XXSC_REC.EMPLOYEE_NUMBER;
                LN_PERSON_ID                 :=XXSC_REC.PERSON_ID;
                LD_DATE_OF_HIRE              :=XXSC_REC.ORIGINAL_DATE_OF_HIRE;
              END;
            END LOOP;
            FOR XXSC_REC IN XXSC_ADDR_EXISTS (LN_PERSON_ID)
            LOOP
              LC_PRIMARY_ADDRESS :=XXSC_REC.PRIMARY_ADDRESS_TO_CREATE;
            END LOOP;
            LC_PRIMARY_ADDRESS_TO_CREATE   := NULL;
            IF LC_PRIMARY_ADDRESS           ='Y' THEN
              LC_PRIMARY_ADDRESS_TO_CREATE :='N';
            ELSIF LC_PRIMARY_ADDRESS        ='N' THEN
              LC_PRIMARY_ADDRESS_TO_CREATE :='Y' ;
            END IF;
            IF p_emp_phone_number IS NOT NULL THEN ---PHONE NUMBER START
              SAVEPOINT A;
              FOR XXSC_PHONE_REC IN XXSC_EMP_PHONE_CUR(LN_PERSON_ID, P_EMP_PHONE_NUMBER)
              LOOP
                ln_phone_id              := XXSC_PHONE_REC.PHONE_ID;
                LN_PH_EMP_obj_ver_number := XXSC_PHONE_REC.object_version_number;
              END LOOP;
              BEGIN
                -- Create or Update Employee Phone Detail
                -- -----------------------------------------------------------
                hr_phone_api.create_or_update_phone ( -- Input data elements
                -- -----------------------------
                P_DATE_FROM       => SYSDATE,
                P_DATE_TO         => FND_CONC_DATE.STRING_TO_DATE('31-DEC-4712'),
                P_PHONE_TYPE      => 'M', P_PHONE_NUMBER => P_EMP_PHONE_NUMBER,
                P_PARENT_ID       => LN_PERSON_ID,
                P_PARENT_TABLE    => 'PER_ALL_PEOPLE_F',
                p_effective_date  => SYSDATE+1,
                -- Output data elements
                -- --------------------------------
                p_phone_id => ln_phone_id, p_object_version_number => LN_PH_EMP_obj_ver_number ----ln_object_version_number  updated to refer to phone object version number Abdulrahamn 25-Jan-16
                );
              EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK TO A;
                LC_ERR_MESSAGE  := 'Error while creating Employee Phone :-' || SQLERRM;
                P_STATUS        := 'E';
                P_ERROR_MESSAGE := LC_ERR_MESSAGE;
                DBMS_OUTPUT.PUT_LINE(SQLERRM);
              END;
            END IF; ---PHONE NUMBER START
            ---EMPLOYEE EMPLOYEE EMAIL ADDRESS UPDATE
            IF P_EMAIL_ADDRESS IS NOT NULL THEN
              IF LC_ERR_FLAG   <> 'Y' THEN
                SAVEPOINT C;
                -- CORRECTION
                -- ----------------------
                LC_DT_UD_MODE := 'CORRECTION';
                BEGIN
                  -- Update Employee API
                  -- ---------------------------------
                  hr_person_api.update_person ( -- Input Data Elements
                  -- ------------------------------
                  P_EFFECTIVE_DATE        => SYSDATE,
                  P_DATETRACK_UPDATE_MODE => LC_DT_UD_MODE,
                  P_PERSON_ID             => LN_PERSON_ID,
                  P_ATTRIBUTE10           => P_EMAIL_ADDRESS,
                  -- Output Data Elements
                  -- ----------------------------------
                  P_EMPLOYEE_NUMBER       => LC_EMPLOYEE_NUMBER,
                  P_OBJECT_VERSION_NUMBER => LN_EMP_OBJECT_VERSION_NUMBER,
                  P_EFFECTIVE_START_DATE  => LD_EFFECTIVE_START_DATE,
                  P_EFFECTIVE_END_DATE    => LD_EFFECTIVE_END_DATE,
                  P_FULL_NAME             => LC_FULL_NAME,
                  P_COMMENT_ID            => LN_COMMENT_ID,
                  P_NAME_COMBINATION_WARNING => LB_NAME_COMBINATION_WARNING,
                  P_ASSIGN_PAYROLL_WARNING => LB_ASSIGN_PAYROLL_WARNING,
                  P_ORIG_HIRE_WARNING      => LB_ORIG_HIRE_WARNING );
                EXCEPTION
                WHEN OTHERS THEN
                  ROLLBACK TO C;
                  LC_ERR_MESSAGE := 'Error while creating Employee Email :-' || SQLERRM;
                END;
                P_STATUS        := 'E';
                P_ERROR_MESSAGE := LC_ERR_MESSAGE;
                dbms_output.put_line(SQLERRM);
              END IF; -- Error Flag
            END IF;   -- END OF EMPLOYEE EMAIL ADDRESS UPDATE
            --
            --                      --   -- Start Create employee Address AE
            IF P_ADDRESS_LINE1      IS NOT NULL AND P_EMIRATES IS NOT NULL AND P_COUNTRY='AE' THEN
              FOR XXSC_EMIRATES_REC IN XXSC_EMIRATES_CUR(P_EMIRATES)
              LOOP
                LC_EMIRATES_CODE:=XXSC_EMIRATES_REC.LOOKUP_CODE;
              END LOOP;
              IF LC_ERR_FLAG <> 'Y' THEN
                SAVEPOINT D;
                ------------------------------------------------------------------------------------
                LN_ADDRESS_ID               := NULL;
                LN_AD_OBJECT_VERSION_NUMBER := NULL;
                LC_PRIMARY_ADDRESS          := NULL;
                LD_DATE_FROM                := NULL;
                ------------------------------------------------------------------------------------
                FOR XXSC_EMP_ADD_REC IN XXSC_EMP_ADD_CUR(LN_PERSON_ID,P_ADDRESS_LINE1)
                LOOP
                  LN_ADDRESS_ID               := XXSC_EMP_ADD_REC.ADDRESS_ID;
                  LN_AD_OBJECT_VERSION_NUMBER := XXSC_EMP_ADD_REC.OBJECT_VERSION_NUMBER;
                  LC_PRIMARY_ADDRESS          := XXSC_EMP_ADD_REC.PRIMARY_ADDRESS;
                  LD_DATE_FROM                := XXSC_EMP_ADD_REC.DATE_FROM;
                END LOOP;
                -- UPDATE LOGIC OF ADDRESSS
                IF LN_ADDRESS_ID IS NOT NULL AND LN_AD_OBJECT_VERSION_NUMBER IS NOT NULL THEN
                  BEGIN
                    -- Update Employee Address
                    -- ----------------------------------------
                    hr_person_address_api.update_person_address ( -- Input data elements
                    -- -----------------------------
                    P_EFFECTIVE_DATE    => sysdate,
                    --                                -- Output data elements
                    --                                -- --------------------------------
                    P_PRIMARY_FLAG      => NVL(LC_PRIMARY_ADDRESS,LC_PRIMARY_ADDRESS_TO_CREATE),
                    P_DATE_FROM         => NVL(LD_DATE_FROM,sysdate),
                    P_ADDRESS_LINE1     => P_ADDRESS_LINE1,
                    P_ADDRESS_LINE2     => P_ADDRESS_LINE2,
                    P_ADDRESS_LINE3     => LC_EMIRATES_CODE,
                    P_REGION_2          => P_STREET,
                    P_REGION_3          => P_BUILDING,
                    P_ADD_INFORMATION14 => P_FLAT_NUMBER,
                    P_ADD_INFORMATION15 => P_PO_BOX,
                    p_country           => P_COUNTRY, 
                    -- Output data elements
                    -- --------------------------------
                    P_ADDRESS_ID        => LN_ADDRESS_ID,
                    p_object_version_number => LN_AD_OBJECT_VERSION_NUMBER );
                  EXCEPTION
                  WHEN OTHERS THEN
                    ROLLBACK TO D;
                    LC_ERR_FLAG    := 'Y';
                    LC_ERR_MESSAGE := ' :-Invalid Employee Address Update Details -: '||SQLERRM;
                    dbms_output.put_line(SQLERRM);
                  END;
                END IF;
                -- END OF UPDATE ADDRESSS LOGIC
                -- START OF INSERT ADDRESSS LOGIC
                IF LN_ADDRESS_ID IS NULL AND LN_AD_OBJECT_VERSION_NUMBER IS NULL THEN
                  BEGIN
                    --   -- --------------------------------------
                    hr_person_address_api.create_person_address ( -- Input data elements
                    -- ------------------------------
                    P_EFFECTIVE_DATE    => sysdate,
                    P_PERSON_ID         => LN_PERSON_ID,
                    P_PRIMARY_FLAG      => LC_PRIMARY_ADDRESS_TO_CREATE,
                    P_STYLE             => 'AE',                                                                                                                                                           ---'AE' for UAE and 'SA' for Saudi
                    P_DATE_FROM         => sysdate,
                    P_ADDRESS_LINE1     => P_ADDRESS_LINE1,
                    P_ADDRESS_LINE2     => P_ADDRESS_LINE2,
                    P_ADDRESS_LINE3     => LC_EMIRATES_CODE,
                    P_REGION_2          => P_STREET,
                    P_REGION_3          => P_BUILDING,
                    P_ADD_INFORMATION14 => P_FLAT_NUMBER,
                    P_ADD_INFORMATION15 => P_PO_BOX,
                    p_country           => P_COUNTRY, -- 'AE',
                    -- Output data elements
                    -- --------------------------------
                    P_ADDRESS_ID => LN_ADDRESS_ID, p_object_version_number => LN_AD_OBJECT_VERSION_NUMBER );
                  EXCEPTION
                  WHEN OTHERS THEN
                    ROLLBACK TO D;
                    LC_ERR_FLAG    := 'Y';
                    LC_ERR_MESSAGE := ' :-Invalid Employee Address Insert Details -: '||SQLERRM;
                    dbms_output.put_line(SQLERRM);
                  END;
                END IF;
                -- END OF INSERT ADDRESSS LOGIC
              END IF; -- Error Flag
              --End of Employee Address AE
            ELSIF P_ADDRESS_LINE1 IS NOT NULL AND P_PO_BOX IS NOT NULL AND P_COUNTRY='SA' THEN
              IF LC_ERR_FLAG      <> 'Y' THEN
                SAVEPOINT E;
                ------------------------------------------------------------------------------------
                LN_ADDRESS_ID               := NULL;
                LN_AD_OBJECT_VERSION_NUMBER := NULL;
                ------------------------------------------------------------------------------------
                FOR XXSC_EMP_ADD_REC IN XXSC_EMP_ADD_CUR(LN_PERSON_ID, P_ADDRESS_LINE1)
                LOOP
                  LN_ADDRESS_ID               := XXSC_EMP_ADD_REC.ADDRESS_ID;
                  LN_AD_OBJECT_VERSION_NUMBER := XXSC_EMP_ADD_REC.OBJECT_VERSION_NUMBER;
                END LOOP;
                -- UPDATE LOGIC OF ADDRESSS
                IF LN_ADDRESS_ID IS NOT NULL AND LN_AD_OBJECT_VERSION_NUMBER IS NOT NULL THEN
                  BEGIN
                    -- Update Employee Address
                    -- ----------------------------------------
                    hr_person_address_api.update_person_address ( -- Input data elements
                    -- -----------------------------
                    p_effective_date    => SYSDATE,
                    -- Output data elements
                    -- --------------------------------
                    P_PRIMARY_FLAG      => LC_PRIMARY_ADDRESS_TO_CREATE,
                    P_DATE_FROM         => sysdate,
                    P_ADDRESS_LINE1     => P_ADDRESS_LINE1,
                    P_ADDRESS_LINE2     => P_ADDRESS_LINE2,
                    P_REGION_3          => P_PO_BOX,
                    P_POSTAL_CODE       => P_PO_BOX,
                    P_COUNTRY           => P_COUNTRY,
                    -- Output data elements
                    -- --------------------------------
                    P_ADDRESS_ID        => LN_ADDRESS_ID,
                    p_object_version_number => LN_AD_OBJECT_VERSION_NUMBER );
                  EXCEPTION
                  WHEN OTHERS THEN
                    ROLLBACK TO D;
                    LC_ERR_FLAG    := 'Y';
                    LC_ERR_MESSAGE := ' :-Invalid Employee Address Update Details SA -: '||SQLERRM;
                    dbms_output.put_line(SQLERRM);
                  END;
                END IF;
                -- END OF UPDATE ADDRESSS LOGIC
                -- START OF INSERT ADDRESSS LOGIC
                IF LN_ADDRESS_ID IS NULL AND LN_AD_OBJECT_VERSION_NUMBER IS NULL THEN
                  BEGIN
                    -- Create Employee Address SA
                    -- --------------------------------------
                    hr_person_address_api.create_person_address ( -- Input data elements
                    -- ------------------------------
                    P_EFFECTIVE_DATE    => sysdate,
                    P_PERSON_ID         => LN_PERSON_ID,
                    P_PRIMARY_FLAG      => LC_PRIMARY_ADDRESS_TO_CREATE,
                    P_STYLE             => 'SA',                                                ---'AE' for UAE and 'SA' for Saudi
                    P_DATE_FROM         => sysdate,
                    P_ADDRESS_LINE1     => P_ADDRESS_LINE1,
                    P_ADDRESS_LINE2     => P_ADDRESS_LINE2,
                    P_REGION_3          => P_PO_BOX,
                    P_POSTAL_CODE       => P_PO_BOX,
                    P_COUNTRY           => P_COUNTRY, 
                    -- Output data elements
                    -- --------------------------------
                    P_ADDRESS_ID        => LN_ADDRESS_ID,
                    P_OBJECT_VERSION_NUMBER => LN_AD_OBJECT_VERSION_NUMBER );
                  EXCEPTION
                  WHEN OTHERS THEN
                    ROLLBACK TO E;
                    LC_ERR_FLAG    := 'Y';
                    LC_ERR_MESSAGE := ' :-Invalid Insert Employee Address Details SA -: '||SQLERRM;
                  END;
                END IF; -- END OF INSERT ADDRESSS LOGIC
              END IF;   -- Error Flag
              DBMS_OUTPUT.PUT_LINE(SQLERRM);
            END IF;
            --End of employee Address SA
            -- Start Create Employee Contact
            IF P_CONTACT_LAST_NAME IS NOT NULL OR P_CONTACT_FIRST_NAME IS NOT NULL OR P_CONTACT_PHONE_NUMBER IS NOT NULL OR (P_CONTACT_ADDRESS_LINE1 IS NOT NULL AND P_CONTACT_EMIRATES IS NOT NULL ) THEN
              IF LC_ERR_FLAG       <> 'Y' THEN
                SAVEPOINT F;
                LN_CONTACT_REL_ID          := NULL;
                LN_EMP_CONT_OBJ_VER_NUMBER := NULL;
                LN_CONTACT_PERSON          := NULL;
                LC_COMP_LAST_NAME          := NULL;
                LC_COMP_FIRST_NAME         := NULL;
                FOR XXSC_CONTACT_REC       IN XXSC_CONTACT_CUR(LN_PERSON_ID, P_CONTACT_FIRST_NAME, P_CONTACT_LAST_NAME)
                LOOP
                  LN_CONTACT_REL_ID          := XXSC_CONTACT_REC.CONTACT_RELATIONSHIP_ID;
                  LN_EMP_CONT_OBJ_VER_NUMBER := XXSC_CONTACT_REC.OBJECT_VERSION_NUMBER;
                  LN_CONTACT_PERSON          := XXSC_CONTACT_REC.CONTACT_PERSON_ID;
                  LC_COMP_LAST_NAME          := XXSC_CONTACT_REC.LAST_NAME;
                  LC_COMP_FIRST_NAME         := XXSC_CONTACT_REC.FIRST_NAME;
                  LD_CNT_START_DATE          := XXSC_CONTACT_REC.EFFECTIVE_START_DATE;
                END LOOP;
                IF NVL(UPPER(TRIM(LC_COMP_LAST_NAME)),0) <> NVL(UPPER(TRIM(P_CONTACT_LAST_NAME)),0) OR NVL(UPPER(TRIM(LC_COMP_FIRST_NAME)),0)<> NVL(UPPER(TRIM(P_CONTACT_FIRST_NAME)),0) THEN
                  BEGIN
                    -- Create Employee Contact
                    -- -------------------------------------
                    hr_contact_rel_api.create_contact (
                    -- Input data elements
                    -- -----------------------------
                    P_START_DATE => sysdate,
                    P_BUSINESS_GROUP_ID => P_BUSINESS_GROUP_ID,
                    P_PERSON_ID     => LN_PERSON_ID,
                    P_CONTACT_TYPE  => 'EMRG',
                    P_DATE_START    => sysdate,
                    P_LAST_NAME     => P_CONTACT_LAST_NAME,
                    P_FIRST_NAME    => P_CONTACT_FIRST_NAME,
                    P_PERSONAL_FLAG => 'Y',
                    P_ATTRIBUTE10   => P_CONTACT_EMAIL_ADDRESS,
                    -- Output data elements
                    -- --------------------------------
                    P_CONTACT_RELATIONSHIP_ID   => LN_CONTACT_REL_ID,
                    P_CTR_OBJECT_VERSION_NUMBER => LN_CTR_OBJECT_VER_NUM,
                    P_PER_PERSON_ID             => LN_CONTACT_PERSON,
                    P_PER_OBJECT_VERSION_NUMBER => LN_EMP_CONT_REL_OBJ_VER_NUMBER,
                    P_PER_EFFECTIVE_START_DATE  => LD_PER_EFFECTIVE_START_DATE,
                    P_PER_EFFECTIVE_END_DATE    => LD_PER_EFFECTIVE_END_DATE,
                    P_FULL_NAME                 => LC_FULL_NAME,
                    P_PER_COMMENT_ID            => LN_PER_COMMENT_ID,
                    P_NAME_COMBINATION_WARNING  => LB_NAME_COMB_WARNING,
                    P_ORIG_HIRE_WARNING         => LB_ORIG_HIRE_WARNING );
                  EXCEPTION
                  WHEN OTHERS THEN
                    LC_ERR_FLAG    := 'Y';
                    LC_ERR_MESSAGE := ' :-Invalid contact Details -: '||SQLERRM;
                    DBMS_OUTPUT.PUT_LINE(SQLERRM);
                    ROLLBACK TO F;
                    dbms_output.put_line(SQLERRM);
                  END;
                  --End of employee contact SA
                  -----Else the Value of LN_CONTACT_PERSON is populated from Cursor
                END IF; -- Comparision of First name and Last Name
              END IF;   -- Error Flag
              -- End  contact Name
              IF P_CONTACT_PHONE_NUMBER IS NOT NULL THEN
                -- start contact Mobile
                FOR XXSC_PHONE_REC IN XXSC_EMP_PHONE_CUR(LN_CONTACT_PERSON, P_CONTACT_PHONE_NUMBER)
                LOOP
                  LN_CONTACT_PHONE_ID            := XXSC_PHONE_REC.PHONE_ID;
                  LN_CONTACT_PHONE_OBJECT_NUMBER := XXSC_PHONE_REC.object_version_number;
                END LOOP;
                IF LC_ERR_FLAG <> 'Y' THEN
                  SAVEPOINT G;
                  BEGIN
                    -- Create or Update Contact Phone Detail
                    -- -----------------------------------------------------------
                    hr_phone_api.create_or_update_phone ( -- Input data elements
                    -- -----------------------------
                    P_UPDATE_MODE           => HR_API.G_CORRECTION ,
                    P_DATE_FROM             => sysdate,
                    P_DATE_TO               => FND_CONC_DATE.STRING_TO_DATE('31-DEC-4712'),
                    P_PHONE_TYPE            => 'M',
                    P_PHONE_NUMBER          => P_CONTACT_PHONE_NUMBER ,
                    P_PARENT_ID             => LN_CONTACT_PERSON,
                    P_PARENT_TABLE          => 'PER_ALL_PEOPLE_F',
                    p_effective_date        => sysdate+1,
                    -- Output data elements
                    -- --------------------------------
                    P_PHONE_ID              => LN_CONTACT_PHONE_ID,
                    p_object_version_number => LN_CONTACT_PHONE_OBJECT_NUMBER );
                    -- COMMIT;
                  EXCEPTION
                  WHEN OTHERS THEN
                    LC_ERR_FLAG    := 'Y';
                    LC_ERR_MESSAGE := ' :-Invalid Contact Mobile Number -: '||SQLERRM;
                    ROLLBACK TO G;
                    dbms_output.put_line(SQLERRM);
                  END;
                  --End of contact Phone
                END IF; -- Error Flag
              END IF;
              -- End contact Mobile
              IF P_CONTACT_EMAIL_ADDRESS IS NOT NULL THEN
                IF LC_ERR_FLAG           <> 'Y' THEN
                  SAVEPOINT C;
                  -- CORRECTION
                  -- ----------------------
                  LC_DT_UD_MODE := 'CORRECTION';
                  BEGIN
                    -- Update API for Updating Contact Email Address
                    -- ---------------------------------
                    HR_PERSON_API.UPDATE_PERSON ( 
                    -- Input Data Elements
                    -- ------------------------------
                    p_effective_date        => LD_CNT_START_DATE,
                    P_DATETRACK_UPDATE_MODE => LC_DT_UD_MODE,
                    P_PERSON_ID             => LN_CONTACT_PERSON,
                    p_attribute10           => P_CONTACT_EMAIL_ADDRESS,
                    -- Output Data Elements
                    -- ----------------------------------
                    P_EMPLOYEE_NUMBER       => LC_CONTACT_EMPLOYEE_NUMBER,
                    P_OBJECT_VERSION_NUMBER => LN_EMP_CONT_OBJ_VER_NUMBER,
                    P_EFFECTIVE_START_DATE  => LD_CNT_EFFECTIVE_START_DATE,
                    P_EFFECTIVE_END_DATE    => LD_CONTACT_EFFECTIVE_END_DATE,
                    P_FULL_NAME             => LC_CONTACT_FULL_NAME,
                    P_COMMENT_ID            => LN_CONTACT_COMMENT_ID,
                    P_NAME_COMBINATION_WARNING => LB_CNT_NAME_COMBN_WARNING,
                    P_ASSIGN_PAYROLL_WARNING=> LB_CNT_ASSIGN_PAYROLL_WARNING,
                    p_orig_hire_warning     => LB_CONTACT_ORIG_HIRE_WARNING );
                  EXCEPTION
                  WHEN OTHERS THEN
                    ROLLBACK TO C;
                    LC_ERR_MESSAGE := 'Error while Updating Contact Email Address :-' || SQLERRM;
                  END;
                  P_STATUS        := 'E';
                  P_ERROR_MESSAGE := LC_ERR_MESSAGE;
                  dbms_output.put_line(SQLERRM);
                END IF; -- Error Flag
              END IF;   -- END OF CONTACT EMAIL ADDRESS UPDATE
              --   -- Start Create contact Address AE
              DBMS_OUTPUT.PUT_LINE('Start Create contact Address AE');
              IF P_CONTACT_ADDRESS_LINE1 IS NOT NULL AND P_CONTACT_EMIRATES IS NOT NULL AND P_CONTACT_COUNTRY='AE' THEN
                FOR XXSC_EMIRATES_REC    IN XXSC_EMIRATES_CUR(P_CONTACT_EMIRATES)
                LOOP
                  LC_EMIRATES_CODE:=XXSC_EMIRATES_REC.LOOKUP_CODE;
                END LOOP;
                FOR XXSC_REC IN XXSC_ADDR_EXISTS (LN_CONTACT_PERSON)
                LOOP
                  LC_PRIMARY_ADDRESS :=XXSC_REC.PRIMARY_ADDRESS_TO_CREATE;
                END LOOP;
                LC_PRIMARY_ADDRESS_TO_CREATE   := NULL;
                IF LC_PRIMARY_ADDRESS           ='Y' THEN
                  LC_PRIMARY_ADDRESS_TO_CREATE :='N';
                ELSIF LC_PRIMARY_ADDRESS        ='N' THEN
                  LC_PRIMARY_ADDRESS_TO_CREATE :='Y' ;
                END IF;
                IF LC_ERR_FLAG <> 'Y' THEN
                  SAVEPOINT H;
                  ------------------------------------------------------------------------------------
                  LN_CNT_AD_OBJ_VER_NUMBER := NULL;
                  LN_CONT_ADDRESS_ID       := NULL;
                  ------------------------------------------------------------------------------------
                  FOR XXSC_EMP_ADD_REC IN XXSC_EMP_ADD_CUR(LN_CONTACT_PERSON, P_CONTACT_ADDRESS_LINE1)
                  LOOP
                    LN_CONT_ADDRESS_ID       := XXSC_EMP_ADD_REC.ADDRESS_ID;
                    LN_CNT_AD_OBJ_VER_NUMBER := XXSC_EMP_ADD_REC.OBJECT_VERSION_NUMBER;
                  END LOOP;
                  -- UPDATE LOGIC OF ADDRESSS
                  IF LN_CONT_ADDRESS_ID IS NOT NULL AND LN_CNT_AD_OBJ_VER_NUMBER IS NOT NULL THEN
                    BEGIN
                      -- Update Employee Address
                      -- ----------------------------------------
                      hr_person_address_api.update_person_address ( -- Input data elements
                      -- -----------------------------
                      P_EFFECTIVE_DATE  => SYSDATE,
                      P_DATE_FROM       => SYSDATE,
                      P_ADDRESS_LINE1    => P_CONTACT_ADDRESS_LINE1,
                      P_ADDRESS_LINE2    => P_CONTACT_ADDRESS_LINE2,
                      P_ADDRESS_LINE3    => LC_EMIRATES_CODE,
                      P_REGION_2         => P_CONTACT_STREET,
                      P_REGION_3         => P_CONTACT_BUILDING,
                      P_ADD_INFORMATION14 => P_CONTACT_FLAT_NUMBER,
                      P_ADD_INFORMATION15 => P_CONTACT_PO_BOX,
                      P_COUNTRY           => P_CONTACT_COUNTRY, -- 'AE',
                      -- Output data elements
                      -- --------------------------------
                      P_ADDRESS_ID      => LN_CONT_ADDRESS_ID, 
                      P_OBJECT_VERSION_NUMBER => LN_CNT_AD_OBJ_VER_NUMBER );
                    EXCEPTION
                    WHEN OTHERS THEN
                      ROLLBACK TO H;
                      LC_ERR_FLAG    := 'Y';
                      LC_ERR_MESSAGE := ' :-Invalid Contact Address Update Details -: '||SQLERRM;
                      dbms_output.put_line(SQLERRM);
                    END;
                  END IF;
                  -- END OF UPDATE ADDRESSS LOGIC
                  -- START OF INSERT ADDRESSS LOGIC
                  IF LN_CONT_ADDRESS_ID IS NULL AND LN_CNT_AD_OBJ_VER_NUMBER IS NULL THEN
                    BEGIN
                      --   -- --------------------------------------
                      hr_person_address_api.create_person_address ( -- Input data elements
                      -- ------------------------------
                      P_EFFECTIVE_DATE   => sysdate,
                      P_PERSON_ID        => LN_CONTACT_PERSON,
                      P_PRIMARY_FLAG     => LC_PRIMARY_ADDRESS_TO_CREATE,
                      P_STYLE            => 'AE',                                                                                                                                                                                                              ---'AE' for UAE and 'SA' for Saudi
                      P_DATE_FROM        => sysdate,
                      P_ADDRESS_LINE1    => P_CONTACT_ADDRESS_LINE1,
                      P_ADDRESS_LINE2    => P_CONTACT_ADDRESS_LINE2,
                      P_ADDRESS_LINE3    => LC_EMIRATES_CODE,
                      P_REGION_2         => P_CONTACT_STREET,
                      P_REGION_3         => P_CONTACT_BUILDING,
                      P_ADD_INFORMATION14 => P_CONTACT_FLAT_NUMBER,
                      P_ADD_INFORMATION15 => P_CONTACT_PO_BOX,
                      P_COUNTRY           => P_CONTACT_COUNTRY, -- 'AE',
                      -- Output data elements
                      -- --------------------------------
                      P_ADDRESS_ID => LN_CONT_ADDRESS_ID,
                      P_OBJECT_VERSION_NUMBER => LN_CNT_AD_OBJ_VER_NUMBER );
                    EXCEPTION
                    WHEN OTHERS THEN
                      ROLLBACK TO H;
                      LC_ERR_FLAG    := 'Y';
                      LC_ERR_MESSAGE := ' :-Invalid Contact Address Insert Details -: '||SQLERRM;
                      dbms_output.put_line(SQLERRM);
                    END;
                  END IF;
                  -- END OF INSERT ADDRESSS LOGIC AE
                END IF;
                --  END OF ERROR FLAG FOR AE
                --- ELSE CLAUSE OF ADDRESS FOR SAUDI ARABIA
              ELSIF P_CONTACT_ADDRESS_LINE1 IS NOT NULL AND P_CONTACT_PO_BOX IS NOT NULL AND P_COUNTRY='SA' THEN
                IF LC_ERR_FLAG              <> 'Y' THEN
                  SAVEPOINT I;
                  FOR XXSC_REC IN XXSC_ADDR_EXISTS (LN_CONTACT_PERSON)
                  LOOP
                    LC_PRIMARY_ADDRESS :=XXSC_REC.PRIMARY_ADDRESS_TO_CREATE;
                  END LOOP;
                  LC_PRIMARY_ADDRESS_TO_CREATE   := NULL;
                  IF LC_PRIMARY_ADDRESS           ='Y' THEN
                    LC_PRIMARY_ADDRESS_TO_CREATE :='N';
                  ELSIF LC_PRIMARY_ADDRESS        ='N' THEN
                    LC_PRIMARY_ADDRESS_TO_CREATE :='Y' ;
                  END IF;
                  IF LC_ERR_FLAG <> 'Y' THEN
                    SAVEPOINT H;
                    ------------------------------------------------------------------------------------
                    LN_CNT_AD_OBJ_VER_NUMBER := NULL;
                    LN_CONT_ADDRESS_ID       := NULL;
                    ------------------------------------------------------------------------------------
                    FOR XXSC_EMP_ADD_REC IN XXSC_EMP_ADD_CUR(LN_CONTACT_PERSON,P_CONTACT_ADDRESS_LINE1)
                    LOOP
                      LN_CONT_ADDRESS_ID       := XXSC_EMP_ADD_REC.ADDRESS_ID;
                      LN_CNT_AD_OBJ_VER_NUMBER := XXSC_EMP_ADD_REC.OBJECT_VERSION_NUMBER;
                    END LOOP;
                    -- UPDATE LOGIC OF ADDRESSS
                    IF LN_CONT_ADDRESS_ID IS NOT NULL AND LN_CNT_AD_OBJ_VER_NUMBER IS NOT NULL THEN
                      BEGIN
                        -- Update Employee Address
                        -- ----------------------------------------
                        HR_PERSON_ADDRESS_API.UPDATE_PERSON_ADDRESS ( 
                        -- Input data elements
                        -- -----------------------------
                        P_EFFECTIVE_DATE => SYSDATE,
                        P_PRIMARY_FLAG    => 'Y',
                        --                                
                        -- Output data elements
                        P_DATE_FROM     => sysdate,
                        P_ADDRESS_LINE1 => P_CONTACT_ADDRESS_LINE1,
                        P_ADDRESS_LINE2 => P_CONTACT_ADDRESS_LINE2,
                        P_REGION_3      => P_CONTACT_PO_BOX,
                        P_POSTAL_CODE   => P_CONTACT_PO_BOX,
                        p_country       => P_CONTACT_COUNTRY,
                        -- Output data elements
                        -- --------------------------------
                        P_ADDRESS_ID    => LN_CONT_ADDRESS_ID, p_object_version_number => LN_CNT_AD_OBJ_VER_NUMBER );
                      EXCEPTION
                      WHEN OTHERS THEN
                        ROLLBACK TO H;
                        LC_ERR_FLAG    := 'Y';
                        LC_ERR_MESSAGE := ' :-Saudi Invalid Contact Address Update Details -: '||SQLERRM;
                        --                                        dbms_output.put_line(SQLERRM);
                      END;
                    END IF;
                    -- END OF UPDATE ADDRESSS LOGIC
                    -- START OF INSERT ADDRESSS LOGIC
                    IF LN_CONT_ADDRESS_ID IS NULL AND LN_CNT_AD_OBJ_VER_NUMBER IS NULL THEN
                      BEGIN
                        --   -- --------------------------------------
                        hr_person_address_api.create_person_address ( -- Input data elements
                        -- ------------------------------
                        P_EFFECTIVE_DATE  => sysdate,
                        P_PERSON_ID       => LN_CONTACT_PERSON,
                        P_PRIMARY_FLAG    => LC_PRIMARY_ADDRESS_TO_CREATE,
                        P_STYLE           => 'SA',
                        P_DATE_FROM       => sysdate,
                        P_ADDRESS_LINE1   => P_CONTACT_ADDRESS_LINE1,
                        P_ADDRESS_LINE2   => P_CONTACT_ADDRESS_LINE2,
                        P_REGION_3        => P_CONTACT_PO_BOX,
                        P_POSTAL_CODE     => P_CONTACT_PO_BOX,
                        P_COUNTRY         => P_CONTACT_COUNTRY,
                        -- Output data elements
                        -- --------------------------------
                        P_ADDRESS_ID       => LN_CONT_ADDRESS_ID,
                        P_OBJECT_VERSION_NUMBER => LN_CNT_AD_OBJ_VER_NUMBER );
                      EXCEPTION
                      WHEN OTHERS THEN
                        ROLLBACK TO H;
                        LC_ERR_FLAG    := 'Y';
                        LC_ERR_MESSAGE := ' :-Saudi Invalid Contact Address Insert Details -: '||SQLERRM;
                        --                              dbms_output.put_line(SQLERRM);
                      END;
                    END IF;
                    -- END OF INSERT ADDRESSS LOGIC SA
                  END IF;
                  --  END OF ERROR FLAG FOR SA
                END IF;
                --  End of Contact Address SA
              END IF;
              --End of Contact country Address
            END IF;
            --End of Contact Address   ---
            IF LC_ERR_FLAG    <>'N' THEN
              P_STATUS        := 'E';
              P_ERROR_MESSAGE := LC_ERR_MESSAGE;
            ELSE
              P_STATUS        := 'S';
              P_ERROR_MESSAGE := 'Success';
            END IF;
 COMMIT; 
END XXSC_CREATE_EMP_PHONE_EMAIL;
END XXSC_EMP_PKG;
/
