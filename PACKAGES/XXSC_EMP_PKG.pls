CREATE OR REPLACE PACKAGE  XXSC_EMP_PKG AUTHID CURRENT_USER
--  $Header: XXSC_EMP_PKG.pls 12.1 2015/01/21 10:30:06 mrahman noship $
--
--
-- PROGRAM NAME
--
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
-- LAST UPDATE DATE   22-JAN-2015
--   Date the program has been modified for the last time
--
-- HISTORY
-- =======
--
-- VERSION  DATE        AUTHOR(S)               DESCRIPTION
-- ------- ----------- --------------- ------------------------------------
-- DRAFT 1A 29-NOV-2015  Mohammed Abdul Rahman    Initial draft version
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
                                      P_CONTACT_FIRST_NAME         in varchar2,
                                      P_STATUS                     OUT VARCHAR2,
                                      P_ERROR_MESSAGE              OUT VARCHAR2,
                                      P_BUSINESS_GROUP_ID          IN NUMBER
                                      );
  END XXSC_EMP_PKG;
/


CREATE OR REPLACE PACKAGE BODY      XXSC_EMP_PKG
--  $Header: XXSC_HR_PKG.pls 12.1 2015/11/29 10:30:06 mrahman noship $
--*************************************************************************
-- Copyright (c)  2000    Oracle Solution Services (India)  Product Development
-- All rights reserved
--*************************************************************************
--
--
-- PROGRAM NAME
--
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
-- LAST UPDATE DATE   22-JAN-2015
--   Date the program has been modified for the last time
--
-- HISTORY
-- =======
--
-- VERSION  DATE        AUTHOR(S)               DESCRIPTION
-- ------- ----------- --------------- ------------------------------------
-- DRAFT 1A 29-NOV-2015  Mohammed Abdul Rahman    Initial draft version
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
                                      P_STATUS                     OUT VARCHAR2,
                                      P_ERROR_MESSAGE              OUT VARCHAR2,
                                      P_BUSINESS_GROUP_ID  IN NUMBER
                                      )
AS
   -- Local Variables  
   -- -----------------------  
   LN_OBJECT_VERSION_NUMBER            PER_ALL_PEOPLE_F.OBJECT_VERSION_NUMBER%TYPE     ;  
   LN_EMP_OBJECT_VERSION_NUMBER        PER_ALL_PEOPLE_F.OBJECT_VERSION_NUMBER%TYPE     ;  
    lc_dt_ud_mode                      VARCHAR2(100)                                   := NULL;  
--    LN_ASSIGNMENT_ID                   PER_ALL_ASSIGNMENTS_F.ASSIGNMENT_ID%TYPE        := 33564;  
    LN_PERSON_ID                       PER_ALL_PEOPLE_F.PERSON_ID%TYPE                ;
    lc_employee_number                 PER_ALL_PEOPLE_F.EMPLOYEE_NUMBER%TYPE          ;  
   
   -- Out Variables for Find Date Track Mode API  
   -- ----------------------------------------------------------------  
   lb_correction                       BOOLEAN;  
    lb_update                          BOOLEAN;  
    LB_UPDATE_OVERRIDE                 BOOLEAN;   
    lb_update_change_insert            BOOLEAN;

   -- Out Variables for Update Employee API  
   -- -----------------------------------------------------------  
    ld_effective_start_date                       DATE;  
    ld_effective_end_date                        DATE;  
    lc_full_name                                         PER_ALL_PEOPLE_F.FULL_NAME%TYPE;  
    ln_comment_id                                    PER_ALL_PEOPLE_F.COMMENT_ID%TYPE;   
    lb_name_combination_warning    BOOLEAN;  
    lb_assign_payroll_warning             BOOLEAN;  
    LB_ORIG_HIRE_WARNING                        BOOLEAN;
    LC_EMAIL_ADDRESS                    PER_ALL_PEOPLE_F.ATTRIBUTE10%TYPE   ; --:='ramy@gmail.com';     
--    LN_OVN    NUMBER;

--       ln_phone_id                              PER_PHONES.PHONE_ID%TYPE; 

       LC_EMP_PHONE_NUMBER                   PER_PHONES.PHONE_NUMBER%TYPE                     ;--:='0501264905'; 
       LC_CONTACT_PHONE_NUMBER               PER_PHONES.PHONE_NUMBER%TYPE                     ;--:='0557850265'; 
       
    ln_contact_rel_id             PER_CONTACT_RELATIONSHIPS.CONTACT_RELATIONSHIP_ID%TYPE;  
    ln_ctr_object_ver_num         PER_CONTACT_RELATIONSHIPS.OBJECT_VERSION_NUMBER%TYPE;  
    LN_CONTACT_PERSON             PER_ALL_PEOPLE_F.PERSON_ID%TYPE;  
--    ln_object_version_number     PER_CONTACT_RELATIONSHIPS.OBJECT_VERSION_NUMBER%TYPE;  
    ld_per_effective_start_date DATE;  
    ld_per_effective_end_date  DATE;  
--    lc_full_name                            PER_ALL_PEOPLE_F.FULL_NAME%TYPE;  
    ln_per_comment_id              PER_ALL_PEOPLE_F.COMMENT_ID%TYPE;  
    lb_name_comb_warning     BOOLEAN;  
--    lb_orig_hire_warning           BOOLEAN; 
    
    
    LN_PHONE_ID                              PER_PHONES.PHONE_ID%TYPE; 
    LN_PHONE_OBJECT_VERSION_NUMBER    PER_PHONES.OBJECT_VERSION_NUMBER%type; 
    LN_CONTACT_PHONE_ID                              PER_PHONES.PHONE_ID%TYPE; 
    LN_CONTACT_PHONE_OBJECT_NUMBER    PER_PHONES.OBJECT_VERSION_NUMBER%type; 
    
    LN_ADDRESS_ID               PER_ADDRESSES.ADDRESS_ID%TYPE; 
    LN_AD_OBJECT_VERSION_NUMBER PER_ADDRESSES.OBJECT_VERSION_NUMBER%TYPE; 
    LC_ADDRESS_LINE1            PER_ADDRESSES.ADDRESS_LINE1%TYPE   ;-- :='Flat No 211';
    LC_ADDRESS_LINE2            PER_ADDRESSES.ADDRESS_LINE2%TYPE   ;-- :='Emirates Building';
    LC_EMIRATES                 PER_ADDRESSES.ADDRESS_LINE3%TYPE   ;-- :='2';
    LC_STREET                   PER_ADDRESSES.ADDRESS_LINE3%TYPE   ;-- :='Khalid Bin Waleed Street';
    LC_BUILDING                 PER_ADDRESSES.ADDRESS_LINE3%TYPE    ;--:='Al Mulla Plaza';
    LC_FLAT_NUMBER              PER_ADDRESSES.ADD_INFORMATION14%TYPE ;-- :='211';
    LC_PO_BOX                   PER_ADDRESSES.ADD_INFORMATION15%TYPE  ;--:='21045';
    LC_COUNTRY                  PER_ADDRESSES.COUNTRY%TYPE ;-- :='AE';
    LC_CONTACT_LAST_NAME        PER_ALL_PEOPLE_F.FULL_NAME%TYPE;
    LC_CONTACT_FIRST_NAME       PER_ALL_PEOPLE_F.FULL_NAME%TYPE;
    LN_BUSINESS_GROUP_ID        PER_ALL_PEOPLE_F.BUSINESS_GROUP_ID%TYPE;
    LC_EMIRATES_CODE            FND_LOOKUP_VALUES.LOOKUP_CODE%TYPE;
    LD_DATE_OF_HIRE             PER_ALL_PEOPLE_F.ORIGINAL_DATE_OF_HIRE%TYPE;
    LC_PRIMARY_ADDRESS            VARCHAR2(1);
    LC_PRIMARY_ADDRESS_TO_CREATE  VARCHAR2(1);
    
    LC_ERR_MESSAGE                VARCHAR2 (1000);
    LC_ERR_FLAG                   VARCHAR2 (3) := 'N';

       CURSOR XXSC_EMP_CUR (WINDOWS_ID VARCHAR2) IS 
              SELECT papf.OBJECT_VERSION_NUMBER,
                papf.PERSON_ID,
                papf.EMPLOYEE_NUMBER,
                papf.ORIGINAL_DATE_OF_HIRE
              FROM PER_ALL_PEOPLE_F PAPF
              WHERE TRIM(UPPER(PAPF.ATTRIBUTE6)) = TRIM(UPPER(WINDOWS_ID)) 
                 AND papf.effective_end_date =
                (SELECT MAX (papf2.effective_end_date)
                FROM PER_ALL_PEOPLE_F papf2
                WHERE papf2.person_id = papf.person_id
                );

       CURSOR XXSC_EMIRATES_CUR (LC_EMIRATES_CODE VARCHAR2) IS
          SELECT LOOKUP_CODE FROM FND_LOOKUP_VALUES 
          WHERE LOOKUP_TYPE ='AE_EMIRATE'
          and UPPER(TRIM(MEANING)) = UPPER(TRIM(LC_EMIRATES_CODE)); --'Dubai';   
          
      cursor XXSC_ADDR_EXISTS (LN_PERSON_ID number) 
      IS
         SELECT NVL(PRIMARY_FLAG,'N') PRIMARY_ADDRESS_TO_CREATE FROM PER_ADDRESSES_V  
                  WHERE PERSON_ID = LN_PERSON_ID --436
                  AND PRIMARY_FLAG = 'Y'
          UNION
            SELECT 'N' PRIMARY_ADDRESS_TO_CREATE FROM DUAL WHERE  NOT EXISTS ( SELECT 1 FROM PER_ADDRESSES_V  
            WHERE PERSON_ID = LN_PERSON_ID --436
            AND PRIMARY_FLAG = 'Y')
                                    ;
BEGIN     ---MAIN START
                    LC_ERR_FLAG := 'N';
                    -- SETTING ERROR FLAG TO NULL EXPLICITLY
                    IF P_COUNTRY='AE' THEN
                        LN_BUSINESS_GROUP_ID :=83;
                    ELSIF P_COUNTRY='SA' THEN
                        LN_BUSINESS_GROUP_ID :=82;
                    END IF;

                  FOR XXSC_REC IN XXSC_EMP_CUR (P_WINDOWS_LOGIN_ID)
                    LOOP
                      BEGIN
                      LN_EMP_OBJECT_VERSION_NUMBER :=XXSC_REC.OBJECT_VERSION_NUMBER;
                      LC_EMPLOYEE_NUMBER           :=XXSC_REC.EMPLOYEE_NUMBER;
                      LN_PERSON_ID                 :=XXSC_REC.PERSON_ID;
                      LD_DATE_OF_HIRE              :=XXSC_REC.ORIGINAL_DATE_OF_HIRE;
                      END;
                    end LOOP;
--                    DBMS_OUTPUT.PUT_LINE('PERSON_ID'||' '||LN_PERSON_ID);
--                    DBMS_OUTPUT.PUT_LINE('EMPLOYEE_NUMBER'||' '||LC_EMPLOYEE_NUMBER);
--                    DBMS_OUTPUT.PUT_LINE('OVN NUMBER IS '||' '||LN_EMP_OBJECT_VERSION_NUMBER);

                  FOR XXSC_REC IN XXSC_ADDR_EXISTS (LN_PERSON_ID)
                    LOOP
                      LC_PRIMARY_ADDRESS :=XXSC_REC.PRIMARY_ADDRESS_TO_CREATE;
                    END LOOP;
                    
                    LC_PRIMARY_ADDRESS_TO_CREATE := NULL;
                    IF LC_PRIMARY_ADDRESS ='Y' THEN
                        LC_PRIMARY_ADDRESS_TO_CREATE :='N';
                    ELSIF LC_PRIMARY_ADDRESS ='N' THEN
                        LC_PRIMARY_ADDRESS_TO_CREATE :='Y' ;
                    END IF;   
                    
                    
                 IF P_EMP_PHONE_NUMBER IS NOT NULL  THEN  ---PHONE NUMBER START
                 
                     IF LC_ERR_FLAG  <> 'Y' THEN
                        SAVEPOINT A;
                 
                   BEGIN
                   -- Create or Update Employee Phone Detail 
                   -- ----------------------------------------------------------- 
                    hr_phone_api.create_or_update_phone 
                    (   -- Input data elements 
                        -- ----------------------------- 
                        P_DATE_FROM                              => sysdate, 
                        P_PHONE_TYPE                             => 'M', 
                        P_PHONE_NUMBER                           => P_EMP_PHONE_NUMBER, --'0501264905', 
                        P_PARENT_ID                              => LN_PERSON_ID, --436, 
                        P_PARENT_TABLE                           => 'PER_ALL_PEOPLE_F', 
                        p_effective_date                         => SYSDATE,
                        -- Output data elements 
                        -- -------------------------------- 
                        p_phone_id                              => ln_phone_id, 
                        p_object_version_number    => ln_object_version_number 
                     ); 
                  
                
                    EXCEPTION 
                         WHEN OTHERS THEN 
                                    ROLLBACK TO A; 
                                    LC_ERR_MESSAGE       := 'Error while creating Employee Phone :-' || SQLERRM;
                                  
                                    P_STATUS            := 'E';
                                    P_ERROR_MESSAGE     := LC_ERR_MESSAGE;
                                     DBMS_OUTPUT.PUT_LINE(SQLERRM); 
                     END; 
                     END IF;                               -- Error Flag 
                  END IF;                                 ---PHONE NUMBER START

                           ---EMPLOYEE EMPLOYEE EMAIL ADDRESS UPDATE
                 IF   P_EMAIL_ADDRESS IS NOT NULL THEN         
                           
                     IF LC_ERR_FLAG  <> 'Y' THEN
                        SAVEPOINT A;
              
                       -- CORRECTION 
                       -- ---------------------- 
                       lc_dt_ud_mode := 'CORRECTION'; 
              
                                      BEGIN
                                      -- Update Employee API 
                                      -- ---------------------------------   
                                      hr_person_api.update_person 
                                      (       -- Input Data Elements 
                                              -- ------------------------------ 
                                              p_effective_date                => SYSDATE,
                                              P_DATETRACK_UPDATE_MODE         => LC_DT_UD_MODE, 
                                              P_PERSON_ID                     => LN_PERSON_ID, 
                                              p_attribute10                   => P_email_address, 
                                              -- Output Data Elements 
                                              -- ---------------------------------- 
                                             P_EMPLOYEE_NUMBER                       => LC_EMPLOYEE_NUMBER, 
                                             p_object_version_number                 => LN_EMP_OBJECT_VERSION_NUMBER, 
                                             p_effective_start_date                  => ld_effective_start_date, 
                                             p_effective_end_date                    => ld_effective_end_date, 
                                             p_full_name                             => lc_full_name, 
                                             P_COMMENT_ID                            => LN_COMMENT_ID, 
                                             P_NAME_COMBINATION_WARNING              => LB_NAME_COMBINATION_WARNING, 
                                             p_assign_payroll_warning                => lb_assign_payroll_warning, 
                                             p_orig_hire_warning                     => lb_orig_hire_warning 
                                      ); 
--                                   DBMS_OUTPUT.PUT_LINE('LC_EMPLOYEE_NUMBER ' ||LC_EMPLOYEE_NUMBER);
--                                   DBMS_OUTPUT.PUT_LINE('LN_EMP_OBJECT_VERSION_NUMBER ' ||LN_EMP_OBJECT_VERSION_NUMBER);
                                              EXCEPTION 
                                                     WHEN OTHERS THEN 
                                                      ROLLBACK TO A; 
                                                      LC_ERR_MESSAGE       := 'Error while creating Employee Phone :-' || SQLERRM;
                                                    
                                              END; 
                                                      P_STATUS            := 'E';
                                                      P_ERROR_MESSAGE     := LC_ERR_MESSAGE;
                                                                 dbms_output.put_line(SQLERRM); 
                     END IF;                               -- Error Flag 
                     END IF;  -- END OF EMPLOYEE EMAIL ADDRESS UPDATE
--                     
--                      --   -- Start Create employee Address AE
                     IF   P_ADDRESS_LINE1   IS NOT NULL AND  P_EMIRATES IS NOT NULL  AND  P_COUNTRY='AE' THEN 
                         
                       FOR XXSC_EMIRATES_REC IN XXSC_EMIRATES_CUR(P_EMIRATES)
                         LOOP
                          LC_EMIRATES_CODE:=XXSC_EMIRATES_REC.LOOKUP_CODE;
                         END LOOP;
                     IF LC_ERR_FLAG  <> 'Y' THEN
                        SAVEPOINT A;
                       BEGIN
                    --   -- -------------------------------------- 
                        hr_person_address_api.create_person_address 
                        (     -- Input data elements 
                              -- ------------------------------ 
                              P_EFFECTIVE_DATE                      => sysdate, 
                              P_PERSON_ID                           => LN_PERSON_ID, --436, 436,
                              P_PRIMARY_FLAG                        => LC_PRIMARY_ADDRESS_TO_CREATE, --'N', 
                              p_style                               => 'AE',  ---'AE' for UAE and 'SA' for Saudi
                              P_DATE_FROM                           =>  sysdate, 
                              P_ADDRESS_LINE1                       => P_ADDRESS_LINE1, --'50 Main Street',  --
                              P_ADDRESS_LINE2                       => P_ADDRESS_LINE2, -- NULL, 
                              P_ADDRESS_LINE3                       => LC_EMIRATES_CODE, --P_EMIRATES, -- NULL, 
                              P_REGION_2                            => P_STREET,  -- Street
                              P_REGION_3                            => P_BUILDING,  -- Building
                              P_ADD_INFORMATION14                   => P_FLAT_NUMBER,
                              P_ADD_INFORMATION15                   => P_PO_BOX,
                              p_country                             => P_COUNTRY, -- 'AE', 
                              -- Output data elements 
                              -- -------------------------------- 
                              P_ADDRESS_ID                          => LN_ADDRESS_ID, 
                              p_object_version_number               => LN_AD_OBJECT_VERSION_NUMBER 
                       ); 
                       EXCEPTION 
                          WHEN OTHERS THEN 
                              ROLLBACK TO A; 
                                           LC_ERR_FLAG                   := 'Y';
                                           LC_ERR_MESSAGE                :=  ' :-Invalid Employee Address Details -: '||SQLERRM;
                              dbms_output.put_line(SQLERRM); 
                        END; 
                     END IF;                               -- Error Flag
                       --End of Employee Address AE
                    ELSIF  P_ADDRESS_LINE1   IS NOT NULL AND  P_PO_BOX IS NOT NULL  AND  P_COUNTRY='SA' THEN
                     IF LC_ERR_FLAG  <> 'Y' THEN
                        SAVEPOINT A;
                       BEGIN
                       -- Create Employee Address SA
                       -- -------------------------------------- 
                        hr_person_address_api.create_person_address 
                        (     -- Input data elements 
                              -- ------------------------------ 
                              P_EFFECTIVE_DATE                  => sysdate, 
                              P_PERSON_ID                       => LN_PERSON_ID, --436, 436,
                              P_PRIMARY_FLAG                    => LC_PRIMARY_ADDRESS_TO_CREATE, --'N', 
                              p_style                           => 'SA',  ---'AE' for UAE and 'SA' for Saudi
                              P_DATE_FROM                       =>  sysdate, 
                              P_ADDRESS_LINE1                   => P_ADDRESS_LINE1, --'50 Main Street',  --
                              P_ADDRESS_LINE2                   => P_ADDRESS_LINE2, -- NULL, 
                              P_REGION_3                        => P_PO_BOX,   --Postal Code
                              P_POSTAL_CODE                     => P_PO_BOX,  --Postal Code
                              p_country                         => P_COUNTRY, -- 'AE', 
                              -- Output data elements 
                              -- -------------------------------- 
                              P_ADDRESS_ID                      => LN_ADDRESS_ID, 
                              p_object_version_number           => LN_AD_OBJECT_VERSION_NUMBER 
                       ); 
                      EXCEPTION 
                           WHEN OTHERS THEN 
                                            ROLLBACK TO A;
                                           LC_ERR_FLAG                   := 'Y';
                                           LC_ERR_MESSAGE                :=  ' :-Invalid Employee Address Details -: '||SQLERRM;
                       END IF;                               -- Error Flag
                                           DBMS_OUTPUT.PUT_LINE(SQLERRM); 
                       END; 
                      --End of employee Address SA
                       END IF; 
                      --End of employee country Address 
                     
                      -- Start Create Employee Contact 
       IF P_CONTACT_LAST_NAME IS NOT NULL OR P_CONTACT_FIRST_NAME IS NOT NULL  OR P_CONTACT_PHONE_NUMBER IS NOT NULL OR (P_CONTACT_ADDRESS_LINE1   IS NOT NULL AND  P_CONTACT_EMIRATES IS NOT NULL )    THEN 
                   
--                   LD_PER_EFFECTIVE_START_DATE:= LD_DATE_OF_HIRE;
--                   LD_PER_EFFECTIVE_END_DATE  := fnd_conc_date.string_to_date('31-DEC-4712');
                     IF LC_ERR_FLAG  <> 'Y' THEN
                        SAVEPOINT A;
                       BEGIN
                      -- Create Employee Contact 
                      -- ------------------------------------- 
                       hr_contact_rel_api.create_contact 
                       (    -- Input data elements 
                             -- ----------------------------- 
                             P_START_DATE                           => SYSDATE, 
                             P_BUSINESS_GROUP_ID                    => P_BUSINESS_GROUP_ID, --LN_BUSINESS_GROUP_ID,--FND_PROFILE.value('PER_BUSINESS_GROUP_ID'), 
                             p_person_id                            => LN_PERSON_ID, --436,
                             P_CONTACT_TYPE                         => 'EMRG', 
                             P_DATE_START                           => SYSDATE, -- LD_DATE_OF_HIRE,  --testing to make change latest
                             p_last_name                            => P_CONTACT_LAST_NAME, 
                             p_first_name                           => P_CONTACT_FIRST_NAME, 
                             p_personal_flag                         => 'Y', 
                             -- Output data elements 
                             -- -------------------------------- 
                            p_contact_relationship_id            => ln_contact_rel_id, 
                            p_ctr_object_version_number          => ln_ctr_object_ver_num, 
                            p_per_person_id                      => ln_contact_person, 
                            p_per_object_version_number          => ln_object_version_number, 
                            p_per_effective_start_date           => ld_per_effective_start_date, 
                            p_per_effective_end_date             => ld_per_effective_end_date, 
                            p_full_name                          => lc_full_name, 
                            p_per_comment_id                     => ln_per_comment_id, 
                            p_name_combination_warning           => lb_name_comb_warning, 
                            p_orig_hire_warning                  => lb_orig_hire_warning 
                       ); 
                  -- COMMIT; 
                  EXCEPTION 
                              WHEN OTHERS THEN 
                                           LC_ERR_FLAG                   := 'Y';
                                           LC_ERR_MESSAGE                :=  ' :-Invalid contact Details -: '||SQLERRM;
                                           DBMS_OUTPUT.PUT_LINE(SQLERRM); 
                                           ROLLBACK TO A;
                       END; 
                      --End of employee Address SA
                       END IF;                               -- Error Flag
                     -- End  contact Name
                  
                  IF  P_CONTACT_PHONE_NUMBER IS NOT NULL THEN        
                         -- start contact Mobile
                     IF LC_ERR_FLAG  <> 'Y' THEN
                        SAVEPOINT A;
                       BEGIN
                         -- Create or Update Employee Phone Detail 
                         -- ----------------------------------------------------------- 
                          hr_phone_api.create_or_update_phone 
                          (   -- Input data elements 
                              -- ----------------------------- 
                              P_UPDATE_MODE                            =>HR_API.g_correction ,
                              P_DATE_FROM                              => sysdate, --LD_DATE_OF_HIRE,
                              P_DATE_TO                                => fnd_conc_date.string_to_date('31-DEC-4712'),
                              P_PHONE_TYPE                             => 'M', 
                              P_PHONE_NUMBER                           => P_CONTACT_PHONE_NUMBER , -- '0557850265', 
                              P_PARENT_ID                              => LN_CONTACT_PERSON, --436, 
                              P_PARENT_TABLE                           => 'PER_ALL_PEOPLE_F', 
                              p_effective_date                         => sysdate, 
                              -- Output data elements 
                              -- -------------------------------- 
                              P_PHONE_ID                               => LN_CONTACT_PHONE_ID, 
                              p_object_version_number                  => LN_CONTACT_PHONE_OBJECT_NUMBER 
                           ); 
                        
                      -- COMMIT; 
                      
                      EXCEPTION 
                                           DBMS_OUTPUT.PUT_LINE(SQLERRM); 
                           WHEN OTHERS THEN 
                                           LC_ERR_FLAG                   := 'Y';
                                           LC_ERR_MESSAGE                :=  ' :-Invalid Contact Mobile Number -: '||SQLERRM;
                                           ROLLBACK TO A;
                       END; 
                      --End of employee Address SA
                       END IF;                               -- Error Flag
                     END IF;
                         -- End contact Mobile
--                         
                     --   -- Start Create contact Address AE
                     IF   P_CONTACT_ADDRESS_LINE1   IS NOT NULL AND  P_CONTACT_EMIRATES IS NOT NULL  AND  P_COUNTRY='AE' THEN 
              
                       FOR XXSC_EMIRATES_REC IN XXSC_EMIRATES_CUR(P_CONTACT_EMIRATES)
                         LOOP
                          LC_EMIRATES_CODE:=XXSC_EMIRATES_REC.LOOKUP_CODE;
                         END LOOP;
              
                         
                     IF LC_ERR_FLAG  <> 'Y' THEN
                        SAVEPOINT A;
                       BEGIN
                    --   -- -------------------------------------- 
                        hr_person_address_api.create_person_address 
                        (     -- Input data elements 
                              -- ------------------------------ 
                              P_EFFECTIVE_DATE                      => sysdate, 
                              P_PERSON_ID                           => LN_CONTACT_PERSON, --436, 436,
                              P_PRIMARY_FLAG                        => 'Y', 
                              p_style                               => 'AE',  ---'AE' for UAE and 'SA' for Saudi
                              P_DATE_FROM                           =>  sysdate, 
                              P_ADDRESS_LINE1                       => P_CONTACT_ADDRESS_LINE1, --'50 Main Street',  --
                              P_ADDRESS_LINE2                       => P_CONTACT_ADDRESS_LINE2, -- NULL, 
                              P_ADDRESS_LINE3                       => LC_EMIRATES_CODE, --P_CONTACT_EMIRATES, -- NULL, 
                              P_REGION_2                            => P_CONTACT_STREET,  -- Street
                              P_REGION_3                            => P_CONTACT_BUILDING,  -- Building
                              P_ADD_INFORMATION14                   => P_CONTACT_FLAT_NUMBER,
                              P_ADD_INFORMATION15                   => P_CONTACT_PO_BOX,
                              p_country                             => P_CONTACT_COUNTRY, -- 'AE', 
                              -- Output data elements 
                              -- -------------------------------- 
                              P_ADDRESS_ID                          => LN_ADDRESS_ID, 
                              p_object_version_number               => LN_AD_OBJECT_VERSION_NUMBER 
                       ); 
                       EXCEPTION 
                          WHEN OTHERS THEN 
                                           LC_ERR_FLAG                   := 'Y';
                                           LC_ERR_MESSAGE                :=  ' :-Invalid Contact Mobile Number -: '||SQLERRM;
                                           DBMS_OUTPUT.PUT_LINE(SQLERRM); 
                                           ROLLBACK TO A;
                       END; 
                      --End of employee Address SA
                       END IF;                               -- Error Flag
                       --End of Contact Address SA
                    ELSIF  P_CONTACT_ADDRESS_LINE1   IS NOT NULL AND  P_CONTACT_PO_BOX IS NOT NULL  AND  P_COUNTRY='SA' THEN
                       IF LC_ERR_FLAG  <> 'Y' THEN
                        SAVEPOINT A;
                       BEGIN
                       -- Create contact Address SA
                       -- -------------------------------------- 
                        hr_person_address_api.create_person_address 
                        (     -- Input data elements 
                              -- ------------------------------ 
                              P_EFFECTIVE_DATE                  => sysdate, 
                              P_PERSON_ID                       => LN_CONTACT_PERSON, --436, 436,
                              P_PRIMARY_FLAG                    => 'Y', 
                              p_style                           => 'SA',  ---'AE' for UAE and 'SA' for Saudi
                              P_DATE_FROM                       =>  sysdate, 
                              P_ADDRESS_LINE1                   => P_CONTACT_ADDRESS_LINE1, --'50 Main Street',  --
                              P_ADDRESS_LINE2                   => P_CONTACT_ADDRESS_LINE2, -- NULL, 
                              P_REGION_3                        => P_CONTACT_PO_BOX,   --Postal Code
                              P_POSTAL_CODE                     => P_CONTACT_PO_BOX,  --Postal Code
                              p_country                         => P_CONTACT_COUNTRY, -- 'AE', 
                              -- Output data elements 
                              -- -------------------------------- 
                              P_ADDRESS_ID                      => LN_ADDRESS_ID, 
                              p_object_version_number           => LN_AD_OBJECT_VERSION_NUMBER 
                                           LC_ERR_FLAG                   := 'Y';
                       ); 
                      EXCEPTION 
                           WHEN OTHERS THEN 
                                           LC_ERR_MESSAGE                :=  ' :-Invalid Contact Mobile Number -: '||SQLERRM;
                                           DBMS_OUTPUT.PUT_LINE(SQLERRM); 
                                           ROLLBACK TO A;
                       END; 
                      --End of employee Address SA
                       END IF;                               -- Error Flag
                      --End of Contact Address SA
                       END IF; 
                      --End of Contact country Address 

       END IF; 
       --End of Contact Address   ---
   IF  LC_ERR_FLAG <>'N' THEN
        P_STATUS            := 'E';
        P_ERROR_MESSAGE     := LC_ERR_MESSAGE;
   ELSE 
        P_STATUS            := 'S';
        P_ERROR_MESSAGE     := 'Success';
   END IF;
 COMMIT; 
END XXSC_CREATE_EMP_PHONE_EMAIL;
END XXSC_EMP_PKG;
/
