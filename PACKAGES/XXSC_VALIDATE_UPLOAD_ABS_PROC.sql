--------------------------------------------------------
--  File created - Wednesday-February-10-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure XXSC_VALIDATE_UPLOAD_ABS_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "APPS"."XXSC_VALIDATE_UPLOAD_ABS_PROC" (
    P_WINDOWS_LOGIN_ID   IN VARCHAR2,
    P_LEAVE_TYPE         IN VARCHAR2,
    P_NOTIFIED_DATE      IN VARCHAR2,--DATE,
    P_START_DATE         IN VARCHAR2,--DATE,
    P_END_DATE           IN VARCHAR2,--DATE,
    P_SESSION_START_DATE IN VARCHAR2,
    P_SESSION_END_DATE   IN VARCHAR2,
    P_STATUS             OUT CHAR,
    P_ERROR_MESSAGE      OUT VARCHAR2,
    P_EFFECTIVE_DATE     IN DATE,
    P_BUSINESS_GROUP_ID  IN NUMBER,
    P_COMMENT            IN  VARCHAR2 --CLOB --Added by Phani on 21-JAN-2016 as per request from Abdulrahman 
    )
IS
  L_ABSENCE_DAYS               NUMBER;
  L_ABSENCE_HOURS              NUMBER;
  L_ABSENCE_ATTENDANCE_ID      NUMBER;
  L_OBJECT_VERSION_NUMBER      NUMBER;
  L_OCCURRENCE                 NUMBER;
  L_DUR_DYS_LESS_WARNING       BOOLEAN;
  L_DUR_HRS_LESS_WARNING       BOOLEAN;
  L_EXCEEDS_PTO_ENTIT_WARNING  BOOLEAN;
  L_EXCEEDS_RUN_TOTAL_WARNING  BOOLEAN;
  L_ABS_OVERLAP_WARNING        BOOLEAN;
  L_ABS_DAY_AFTER_WARNING      BOOLEAN;
  L_DUR_OVERWRITTEN_WARNING    BOOLEAN;
  L_DEL_ELEMENT_ENTRY_WARNING  BOOLEAN;
  --L_BUSINESS_GROUP_ID          NUMBER;
  L_ERR_MESSAGE                VARCHAR2 (1000);
  L_ERR_FLAG                   VARCHAR2 (3) := 'N';
  L_ABSENCE_ATTENDANCE_TYPE_ID NUMBER;
  L_REC_ERR_CNT                NUMBER;
  --L_PERSON_ID                  VARCHAR2 (30);
  L_ATTRIBUTE_CATEGORY         VARCHAR2 (30);
  L_BG_NAME                    VARCHAR2 (240);
--  L_TOT_REC_COUNT              NUMBER := 0;
--  L_ERR_COUNT                  NUMBER := 0;
  L_NEW_REC                    NUMBER := 0;
  L_UPD_REC                    NUMBER := 0;
  L_LEAVE_DESC                 VARCHAR2 (240);
  L_API_CALL                   VARCHAR2 (3);
--  L_SAME_LEAVE_CNT             NUMBER := 0;
--  L_DIFF_LEAVE_CNT             NUMBER := 0;
  L_DATE_NOTIFICATION          DATE;
  L_DATE_START                 DATE;
  L_DATE_END                   DATE;
  L_ABS_INFORMATION1           VARCHAR2 (30);
  L_ABS_INFORMATION2           VARCHAR2 (30);
  L_PERSON_ID                    NUMBER;
  L_EMPLOYEE_NUMBER              VARCHAR2 (100);
  L_BUSINESS_GROUP_ID            NUMBER;
  L_COUNT                        NUMBER;
  l_user                         varchar2(100);
  l_employee_id                  number;
  l_abs_date_start               date;
  l_abs_date_end                date;
  l_session_start_date           varchar2(30);
  l_session_end_date           varchar2(30);
  l_count1                     number;
  l_count2                     number;

  L_ST_DT_CNT1 NUMBER := 0;
  L_ST_DT_CNT2 NUMBER := 0;
  L_ED_DT_CNT1 NUMBER := 0;
  L_ED_DT_CNT2 NUMBER := 0;

  L_ABS_ST_DT DATE;
  L_ABS_ED_DT DATE;
  v_req_id     NUMBER;
  v_request_status BOOLEAN;
  
--  v_req_id NUMBER,
  v_dev_status VARCHAR2(100);
  v_dev_phase VARCHAR2(100);
--  v_request_status BOOLEAN,
  p_request_id NUMBER;
  v_phase VARCHAR2 (2000);
  v_wait_status VARCHAR2 (2000);
  v_message VARCHAR2 (2000);
  LN_PROXY_USER_E_PORTAL NUMBER;
  LN_PROXY_RESP_E_PORTAL NUMBER;
  lb_result              BOOLEAN;
    
BEGIN 

/*BEGIN
  SELECT user_name
  INTO l_user
  FROM fnd_user
  WHERE upper(user_name) = upper(trim(P_WINDOWS_LOGIN_ID));
EXCEPTION
WHEN NO_DATA_FOUND THEN
  L_ERR_FLAG    := 'Y';
  L_ERR_MESSAGE := ' :- Invalid Windows Login ID -: ';
WHEN OTHERS THEN
  L_ERR_FLAG    := 'Y';
  L_ERR_MESSAGE := ' :- Invalid Windows Login ID -: ';
END;

   
IF L_ERR_FLAG <> 'Y' THEN
begin
 SELECT employee_id
  INTO l_employee_id
  FROM fnd_user
  WHERE upper(user_name) = upper(trim(P_WINDOWS_LOGIN_ID));
  
  IF l_employee_id IS NULL THEN
  L_ERR_FLAG    := 'Y';
  L_ERR_MESSAGE := ' :- Employee Does not Exist for this Windows Login ID -: ';
  END IF;
EXCEPTION
WHEN OTHERS THEN
  L_ERR_FLAG    := 'Y';
  L_ERR_MESSAGE := ' :- Employee Does not Exist for this Windows Login ID -: ';
end;
 END IF;*/
 
   
BEGIN
  SELECT PAPF.PERSON_ID,
    PAPF.EMPLOYEE_NUMBER,
    PAPF.BUSINESS_GROUP_ID
  INTO L_PERSON_ID,
    L_EMPLOYEE_NUMBER,
    L_BUSINESS_GROUP_ID
  FROM PER_ALL_PEOPLE_F PAPF,
    PER_ALL_ASSIGNMENTS_F PASF
  WHERE UPPER (papf.attribute6) =UPPER (trim(P_WINDOWS_LOGIN_ID))
  AND PAPF.PERSON_ID         = PASF.PERSON_ID
  AND PAPF.BUSINESS_GROUP_ID = P_BUSINESS_GROUP_ID
  AND TRUNC (SYSDATE) BETWEEN PAPF.EFFECTIVE_START_DATE AND PAPF.EFFECTIVE_END_DATE
  AND TRUNC (SYSDATE) BETWEEN PASF.EFFECTIVE_START_DATE AND PASF.EFFECTIVE_END_DATE;
EXCEPTION
WHEN OTHERS THEN
  L_ERR_FLAG    := 'Y';
  L_ERR_MESSAGE :=   '-: Invalid Windows Login ID or Invalid Business Group ID :-';  
END;


/*--------- New logic ---------*/
IF L_ERR_FLAG <> 'Y' THEN 

L_ABS_ST_DT := FND_CONC_DATE.STRING_TO_DATE(P_START_DATE); 

IF P_SESSION_START_DATE = 'PM' THEN 

SELECT COUNT(1) 
INTO L_ST_DT_CNT1
FROM PER_ABSENCE_ATTENDANCES_V
WHERE BUSINESS_GROUP_ID = L_BUSINESS_GROUP_ID
AND PERSON_ID           = L_PERSON_ID
AND trunc(DATE_START) = FND_CONC_DATE.STRING_TO_DATE(P_START_DATE)--trunc(P_START_DATE)
AND ABS_INFORMATION1 = P_SESSION_START_DATE;


SELECT COUNT(1) 
INTO L_ST_DT_CNT2
FROM PER_ABSENCE_ATTENDANCES_V
WHERE BUSINESS_GROUP_ID = L_BUSINESS_GROUP_ID
AND PERSON_ID           = L_PERSON_ID
AND trunc(DATE_END) = FND_CONC_DATE.STRING_TO_DATE(P_START_DATE) -- trunc(P_START_DATE)
AND ABS_INFORMATION2 = P_SESSION_START_DATE;

L_ABS_ST_DT := LEAST (FND_CONC_DATE.STRING_TO_DATE(P_START_DATE) + 1, FND_CONC_DATE.STRING_TO_DATE(P_END_DATE));

END IF;

L_ABS_ED_DT := P_END_DATE;

IF P_SESSION_END_DATE = 'AM' THEN

SELECT COUNT(1) 
INTO L_ED_DT_CNT1
FROM PER_ABSENCE_ATTENDANCES_V
WHERE BUSINESS_GROUP_ID = L_BUSINESS_GROUP_ID
AND PERSON_ID           = L_PERSON_ID
AND trunc(DATE_START) = FND_CONC_DATE.STRING_TO_DATE(P_END_DATE) --trunc(P_END_DATE)
AND ABS_INFORMATION1 = P_SESSION_END_DATE;


SELECT COUNT(1) 
INTO L_ED_DT_CNT2
FROM PER_ABSENCE_ATTENDANCES_V
WHERE BUSINESS_GROUP_ID = L_BUSINESS_GROUP_ID
AND PERSON_ID           = L_PERSON_ID
AND trunc(DATE_END) = FND_CONC_DATE.STRING_TO_DATE(P_END_DATE) --trunc(P_END_DATE)
AND ABS_INFORMATION2 = P_SESSION_END_DATE;

L_ABS_ED_DT := GREATEST (FND_CONC_DATE.STRING_TO_DATE(P_END_DATE) - 1, FND_CONC_DATE.STRING_TO_DATE(P_START_DATE) );

END IF;

IF L_ST_DT_CNT1 <> 0 OR L_ST_DT_CNT2 <> 0 OR L_ED_DT_CNT1 <> 0 OR L_ED_DT_CNT2 <> 0 THEN 
 L_ERR_FLAG    := 'Y';
 L_ERR_MESSAGE := 'Absence overlaps another absence1';
 
ELSIF L_ABS_ED_DT = L_ABS_ST_DT
THEN 
  L_COUNT := 0;
ELSE

    SELECT COUNT(1)
    INTO L_COUNT
    FROM PER_ABSENCE_ATTENDANCES_V
    WHERE BUSINESS_GROUP_ID = L_BUSINESS_GROUP_ID
    AND PERSON_ID           = L_PERSON_ID
    AND ( (trunc(L_ABS_ST_DT) BETWEEN DATE_START AND DATE_END
    OR trunc(L_ABS_ED_DT) BETWEEN DATE_START AND DATE_END)
    OR (DATE_START >= trunc(L_ABS_ST_DT)
    AND DATE_END   <= trunc(L_ABS_ED_DT)));

    IF L_COUNT <> 0 THEN 
     L_ERR_FLAG    := 'Y';
 L_ERR_MESSAGE := 'Absence overlaps another absence2';--||L_ST_DT_CNT1||L_ST_DT_CNT2||L_ED_DT_CNT1||L_ED_DT_CNT2||L_COUNT||P_SESSION_START_DATE||P_SESSION_END_DATE;
 END IF;

END IF;

END IF;
/*--------- New logic ---------*/
  
   ------------  Business Group Name --------------------
   IF L_ERR_FLAG <> 'Y' THEN
   BEGIN
      SELECT NAME
      INTO L_BG_NAME
      FROM PER_BUSINESS_GROUPS
      WHERE BUSINESS_GROUP_ID = L_BUSINESS_GROUP_ID;
    EXCEPTION
    WHEN OTHERS THEN
      L_ERR_FLAG    := 'Y';
      L_BG_NAME     := NULL;
      L_ERR_MESSAGE := ' :-Invalid Business Group-: ';
    END;
    END IF;
    ------------------------------------------------------

    ------------------   Absence Type Validation  ----------
    IF L_ERR_FLAG <> 'Y' THEN
    BEGIN
      SELECT ABSENCE_ATTENDANCE_TYPE_ID
      INTO L_ABSENCE_ATTENDANCE_TYPE_ID
      FROM PER_ABSENCE_ATTENDANCE_TYPES
      WHERE BUSINESS_GROUP_ID = L_BUSINESS_GROUP_ID
      AND UPPER (NAME)        = UPPER (TRIM (P_LEAVE_TYPE));
    EXCEPTION
    WHEN OTHERS THEN
      L_ERR_FLAG                   := 'Y';
      L_ABSENCE_ATTENDANCE_TYPE_ID := NULL;
      L_ERR_MESSAGE                :=  ' :-Invalid Absence Type-: ';
    END;
    END IF;
    -----------------------------------------------------------
    
    ----------------  Getting Attribute Category  --------------
    IF L_ERR_FLAG <> 'Y' THEN
    IF L_BG_NAME IN ('Shuaa Group UAE', 'GFC UAE') THEN
      L_ATTRIBUTE_CATEGORY := 'AE';
    ELSIF L_BG_NAME IN ('Shuaa Group KSA') THEN
      BEGIN
        SELECT 'SA_'
          || TRIM (LOOKUP_CODE)
        INTO L_ATTRIBUTE_CATEGORY
        FROM FND_LOOKUP_VALUES
        WHERE LOOKUP_TYPE = 'ABSENCE_CATEGORY'
        AND LOOKUP_CODE   =
          (SELECT ABSENCE_CATEGORY
          FROM PER_ABSENCE_ATTENDANCE_TYPES
          WHERE BUSINESS_GROUP_ID = L_BUSINESS_GROUP_ID
          AND UPPER (NAME)        = UPPER (TRIM (P_LEAVE_TYPE))
          );
      EXCEPTION
      WHEN OTHERS THEN
        L_ATTRIBUTE_CATEGORY := NULL;
      END;
    ELSE
      L_ATTRIBUTE_CATEGORY := NULL;
    END IF;
    IF L_ATTRIBUTE_CATEGORY IS NULL THEN
      L_ERR_FLAG            := 'Y';
      L_ERR_MESSAGE         :=  ' :-Invalid Attribute Category-: ';
    END IF;
    END IF;
    -----------------------------------------------------------
    IF L_ERR_FLAG <> 'Y' THEN
    IF P_START_DATE            IS NULL THEN
      L_ERR_MESSAGE            :=  ' :-Leave Start date should not be null -: ';
      L_ERR_FLAG               := 'Y';
    ELSIF P_END_DATE           IS NULL THEN
      L_ERR_MESSAGE            :=  ' :-Leave end date should not be null -: ';
      L_ERR_FLAG               := 'Y';
    ELSIF P_SESSION_START_DATE IS NULL THEN
      L_ERR_MESSAGE            := ' :- Session Start Date should not be null -: ';
      L_ERR_FLAG               := 'Y';
    ELSIF P_SESSION_END_DATE   IS NULL THEN
      L_ERR_MESSAGE            := ' :- Session End Date should not be null -: ';
      L_ERR_FLAG               := 'Y';
    END IF;
    IF P_START_DATE  > P_END_DATE THEN
      L_ERR_MESSAGE := ' :- Leave Start Date should not be greater than end date -: ';
      L_ERR_FLAG    := 'Y';
    END IF;
    IF P_SESSION_START_DATE NOT IN ('AM', 'PM') OR P_SESSION_END_DATE NOT IN ('AM', 'PM') THEN
      L_ERR_MESSAGE :=  ' :- Session dates are not in proper format -: ';
      L_ERR_FLAG    := 'Y';
    END IF;
   END IF;
   
    IF L_ERR_FLAG  <> 'Y' THEN
      BEGIN
        SAVEPOINT A;
--        HR_PERSON_ABSENCE_API.CREATE_PERSON_ABSENCE ( 
--        P_VALIDATE       => FALSE, 
--        P_EFFECTIVE_DATE => TRUNC (SYSDATE),
--        P_PERSON_ID => L_PERSON_ID,
--        P_BUSINESS_GROUP_ID => L_BUSINESS_GROUP_ID,
--        P_ABSENCE_ATTENDANCE_TYPE_ID => L_ABSENCE_ATTENDANCE_TYPE_ID,
--        P_COMMENTS=>P_COMMENT, --Added by Phani on 21-JAN-2016 as per request from Abdulrahman
--        P_DATE_NOTIFICATION => P_NOTIFIED_DATE,
--        P_DATE_START => P_START_DATE,
--        P_DATE_END => P_END_DATE,
--        P_ABS_INFORMATION_CATEGORY => L_ATTRIBUTE_CATEGORY,
--        P_ABS_INFORMATION1 => P_SESSION_START_DATE,
--        P_ABS_INFORMATION2 => P_SESSION_END_DATE,
--        P_ABSENCE_DAYS => L_ABSENCE_DAYS, 
--        P_ABSENCE_HOURS => L_ABSENCE_HOURS,
--        P_CREATE_ELEMENT_ENTRY => TRUE, 
--        P_ABSENCE_ATTENDANCE_ID => L_ABSENCE_ATTENDANCE_ID,
--        P_OBJECT_VERSION_NUMBER => L_OBJECT_VERSION_NUMBER, 
--        P_OCCURRENCE => L_OCCURRENCE,
--        P_DUR_DYS_LESS_WARNING => L_DUR_DYS_LESS_WARNING, 
--        P_DUR_HRS_LESS_WARNING => L_DUR_HRS_LESS_WARNING, 
--        P_EXCEEDS_PTO_ENTIT_WARNING => L_EXCEEDS_PTO_ENTIT_WARNING,
--        P_EXCEEDS_RUN_TOTAL_WARNING => L_EXCEEDS_RUN_TOTAL_WARNING, 
--        P_ABS_OVERLAP_WARNING => L_ABS_OVERLAP_WARNING,
--        P_ABS_DAY_AFTER_WARNING => L_ABS_DAY_AFTER_WARNING,
--        P_DUR_OVERWRITTEN_WARNING => L_DUR_OVERWRITTEN_WARNING
--        );
/* Added by Abdulrahman on 04-Feb-16*/
            FND_FILE.PUT_LINE(FND_FILE.LOG,'  Starting of call for calling Absence API Programmatically by calling XXSC:Wrapper for Absence API ( Called Programmatically)');
--            dbms_output.put_line('  Starting of call for calling Absence API Programmatically by calling XXSC:Wrapper for Absence API ( Called Programmatically)');
               v_req_id :=NULL;
            FND_FILE.PUT_LINE(FND_FILE.LOG,'  Initializing Apps');
                LN_PROXY_USER_E_PORTAL := FND_PROFILE.VALUE('XXSC_PROXY_USER_E_PORTAL');
                LN_PROXY_RESP_E_PORTAL := FND_PROFILE.VALUE('XXSC_PROXY_RESPONSIBILITY_E_PORTAL');
                /* Submit a request from a database trigger */

                FND_GLOBAL.Apps_Initialize(USER_ID=>LN_PROXY_USER_E_PORTAL, RESP_ID=>LN_PROXY_RESP_E_PORTAL, RESP_APPL_ID =>800);
                lb_result := FND_REQUEST.SET_MODE(TRUE);
                                v_req_id:=   FND_REQUEST.SUBMIT_REQUEST(
                                            'XXSC',
                                            'XXSC_WRAP_ABS_API',
                                            '',
                                            '',
                                            FALSE --,
                                            ,L_PERSON_ID
                                            ,L_BUSINESS_GROUP_ID
                                            ,L_ABSENCE_ATTENDANCE_TYPE_ID
                                            ,L_ATTRIBUTE_CATEGORY
                                            ,P_COMMENT
                                            ,P_NOTIFIED_DATE
                                            ,P_START_DATE
                                            ,P_END_DATE
                                            ,P_SESSION_START_DATE
                                            ,P_SESSION_END_DATE);
commit;
                FND_FILE.PUT_LINE(FND_FILE.LOG,'   Submitted the Program' || '-'||  v_req_id);
                FND_FILE.PUT_LINE(FND_FILE.LOG,'   Waiting for the Program');
                FND_FILE.PUT_LINE(FND_FILE.LOG,'   Value Of P_COMMENT '||P_COMMENT);
                 v_request_status:=
                                        fnd_concurrent.wait_for_request
                                        (request_id => v_req_id,
                                        INTERVAL => 5,
                                        max_wait => 600,
                                        phase => v_phase,
                                        status => v_wait_status,
                                        dev_phase => v_dev_phase,
                                        dev_status => v_dev_status,
                                        MESSAGE => v_message);
commit;
                FND_FILE.PUT_LINE(FND_FILE.LOG,'  Program Request Phase' || '-'||  v_dev_phase);
                FND_FILE.PUT_LINE(FND_FILE.LOG,'  Program Request Dev status' || '-'||  v_dev_status);
               IF v_dev_status ='ERROR' THEN
                  P_STATUS          := 'E';
                  P_ERROR_MESSAGE   := v_message||' v_phase: '||v_phase||' v_wait_status: '||v_wait_status||' v_dev_phase: '||v_dev_phase||' v_dev_status: '||v_dev_status;
               ELSE
                  P_STATUS          := 'I';
                  P_ERROR_MESSAGE   := NULL;
               END IF;
                
                EXCEPTION
                 WHEN OTHERS THEN
                         ROLLBACK TO A;
                            v_req_id := NULL;
                            FND_FILE.PUT_LINE(FND_FILE.LOG,'  Ending of Procedure call XXSC_WRAP_ABS_API');           
                            L_ERR_MESSAGE := 'Error while inserting:-' ||v_message||' v_phase: '||v_phase||' v_wait_status: '||v_wait_status||' v_dev_phase: '||v_dev_phase||' v_dev_status: '||v_dev_status||' Error Message '|| SQLERRM;
                            P_STATUS          := 'E';
                            P_ERROR_MESSAGE   := L_ERR_MESSAGE;

      END;    
    ELSE
        P_STATUS          := 'E';      
        P_ERROR_MESSAGE     := L_ERR_MESSAGE;
/* Added by Abdulrahman on 04-Feb-16*/      
    END IF;
    COMMIT;

END XXSC_VALIDATE_UPLOAD_ABS_PROC;

/

