--------------------------------------------------------
--  DDL for Procedure XXSC_CORRECT_LEAVE_ENTRIES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "APPS"."XXSC_CORRECT_LEAVE_ENTRIES" 
AS
CURSOR XXSC_CUR IS SELECT XHAS.*  --SUBSTR(XHAS.ERROR_MESSAGE,25,5)
FROM xxsc_hr_absence_stg_t XHAS
WHERE ERROR_MESSAGE LIKE 'Absence Attendance ID :%'
AND NOT EXISTS (SELECT 1 FROM per_absence_attendances
WHERE absence_attendance_id = SUBSTR(XHAS.ERROR_MESSAGE,25,5));
BEGIN
 FOR XXSC_REC IN XXSC_CUR
  LOOP
  INSERT INTO XXSC_HR_ABSENCE_STG_T
  (WINDOWS_LOGIN_ID,
  LEAVE_TYPE,
  notified_date,
  START_DATE,
  END_DATE,
  session_start_date,
  session_end_date,
  effective_date,
  business_group_id,
  comments)
  VALUES
(XXSC_REC.WINDOWS_LOGIN_ID,
  XXSC_REC.LEAVE_TYPE,
  XXSC_REC.notified_date,
  XXSC_REC.START_DATE,
  XXSC_REC.END_DATE,
  XXSC_REC.session_start_date,
  XXSC_REC.session_end_date,
  XXSC_REC.effective_date,
  XXSC_REC.business_group_id,
  XXSC_REC.comments);
  END LOOP;
  COMMIT;
END;

/

--------------------------------------------------------
--  DDL for Procedure XXSC_EXPENSES_TO_PAYROLL_BEE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "APPS"."XXSC_EXPENSES_TO_PAYROLL_BEE" (
   X_RETCODE              OUT NOCOPY NUMBER,
   X_ERRBUF               OUT NOCOPY VARCHAR2,
   P_BUSINESS_GRP_ID   IN            NUMBER,
   P_EFFECTIVE_DATE    IN            VARCHAR2,
   P_EMP_FROM          IN            VARCHAR2 DEFAULT NULL,
   P_EMP_TO            IN            VARCHAR2 DEFAULT NULL)
IS
   L_BATCH_NAME              VARCHAR2 (200);
   L_MAX_NUM                 NUMBER;
   L_BATCH_ID                NUMBER;
   L_OBJECT_VERSION_NUMBER   NUMBER;
   LV_ERR_FLAG               VARCHAR2 (3);
   L_BATCH_LINE_ID           NUMBER;
   L_ELEMENT_TYPE_ID         NUMBER;
   L_ELEMENT_NAME            VARCHAR2 (200);
   LV_ERR_MSG                VARCHAR2 (2000) := 'N';

   CURSOR HDR
   IS
      SELECT DISTINCT PAPF.BUSINESS_GROUP_ID
        FROM XXSC_PAY_EMP_EXPENSES_V X,
             PER_ALL_PEOPLE_F PAPF,
             PER_ALL_ASSIGNMENTS_F PASF
       WHERE     X.EMPLOYEE_ID = PAPF.PERSON_ID
             AND PAPF.PERSON_ID = PASF.PERSON_ID
             AND PAPF.BUSINESS_GROUP_ID = P_BUSINESS_GRP_ID
             AND TRUNC (TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS')) BETWEEN PAPF.EFFECTIVE_START_DATE
                                                                                 AND PAPF.EFFECTIVE_END_DATE
             AND TRUNC (TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS')) BETWEEN PASF.EFFECTIVE_START_DATE
                                                                                 AND PASF.EFFECTIVE_END_DATE
             AND (X.PAY_REIMBURSEMENT_DATE IS NULL
                  OR X.PAY_RECOVERY_DATE IS NULL)
             AND X.AMOUNT IS NOT NULL
             AND PAPF.PERSON_ID BETWEEN NVL (P_EMP_FROM, PAPF.PERSON_ID)
                                    AND NVL (P_EMP_TO, PAPF.PERSON_ID)
      UNION
      SELECT DISTINCT PAPF.BUSINESS_GROUP_ID
        FROM XXSC_PAY_STAFF_RECOVERIES_V X,
             PER_ALL_PEOPLE_F PAPF,
             PER_ALL_ASSIGNMENTS_F PASF
       WHERE     X.EMPLOYEE_ID = PAPF.PERSON_ID
             AND PAPF.PERSON_ID = PASF.PERSON_ID
             AND PAPF.BUSINESS_GROUP_ID = P_BUSINESS_GRP_ID
             AND TRUNC (TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS')) BETWEEN PAPF.EFFECTIVE_START_DATE
                                                                                 AND PAPF.EFFECTIVE_END_DATE
             AND TRUNC (TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS')) BETWEEN PASF.EFFECTIVE_START_DATE
                                                                                 AND PASF.EFFECTIVE_END_DATE
             AND X.PAYROLL_INTERFACE_DATE IS NULL
             AND X.AMOUNT IS NOT NULL
             AND PAPF.PERSON_ID BETWEEN NVL (P_EMP_FROM, PAPF.PERSON_ID)
                                    AND NVL (P_EMP_TO, PAPF.PERSON_ID);


   CURSOR LINES (
      L_BUS_GRP_ID NUMBER)
   IS
      SELECT X.TRX_SOURCE,
             X.TRX_TYPE,
             X.HEADER_ID,
             X.EMPLOYEE_ID,
             X.AMOUNT,
             X.DOCUMENT_NO,
             X.DESCRIPTION,
             X.PAY_REIMBURSEMENT_DATE,
             X.PAY_RECOVERY_DATE,
             PAPF.EMPLOYEE_NUMBER,
             PASF.ASSIGNMENT_NUMBER,
             PAPF.PERSON_ID,
             PASF.ASSIGNMENT_ID,
             PAPF.BUSINESS_GROUP_ID,
             NULL LINE_ID,
             NULL PAYROLL_INTERFACE_DATE
        FROM XXSC_PAY_EMP_EXPENSES_V X,
             PER_ALL_PEOPLE_F PAPF,
             PER_ALL_ASSIGNMENTS_F PASF
       WHERE     X.EMPLOYEE_ID = PAPF.PERSON_ID
             AND PAPF.PERSON_ID = PASF.PERSON_ID
             AND PAPF.BUSINESS_GROUP_ID = L_BUS_GRP_ID
             AND TRUNC (TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS')) BETWEEN PAPF.EFFECTIVE_START_DATE
                                                                                 AND PAPF.EFFECTIVE_END_DATE
             AND TRUNC (TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS')) BETWEEN PASF.EFFECTIVE_START_DATE
                                                                                 AND PASF.EFFECTIVE_END_DATE
             AND (X.PAY_REIMBURSEMENT_DATE IS NULL
                  OR X.PAY_RECOVERY_DATE IS NULL)
             AND X.AMOUNT IS NOT NULL
             AND PAPF.PERSON_ID BETWEEN NVL (P_EMP_FROM, PAPF.PERSON_ID)
                                    AND NVL (P_EMP_TO, PAPF.PERSON_ID)
      UNION
      SELECT X.TRX_SOURCE,
             X.TRX_TYPE,
             X.HEADER_ID,
             X.EMPLOYEE_ID,
             X.AMOUNT,
             X.DOCUMENT_NO,
             X.DESCRIPTION,
             NULL PAY_REIMBURSEMENT_DATE,
             NULL PAY_RECOVERY_DATE,
             PAPF.EMPLOYEE_NUMBER,
             PASF.ASSIGNMENT_NUMBER,
             PAPF.PERSON_ID,
             PASF.ASSIGNMENT_ID,
             PAPF.BUSINESS_GROUP_ID,
             X.LINE_ID,
             X.PAYROLL_INTERFACE_DATE
        FROM XXSC_PAY_STAFF_RECOVERIES_V X,
             PER_ALL_PEOPLE_F PAPF,
             PER_ALL_ASSIGNMENTS_F PASF
       WHERE     X.EMPLOYEE_ID = PAPF.PERSON_ID
             AND PAPF.PERSON_ID = PASF.PERSON_ID
             AND PAPF.BUSINESS_GROUP_ID = L_BUS_GRP_ID
             AND TRUNC (TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS')) BETWEEN PAPF.EFFECTIVE_START_DATE
                                                                                 AND PAPF.EFFECTIVE_END_DATE
             AND TRUNC (TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS')) BETWEEN PASF.EFFECTIVE_START_DATE
                                                                                 AND PASF.EFFECTIVE_END_DATE
             AND X.PAYROLL_INTERFACE_DATE IS NULL
             AND X.AMOUNT IS NOT NULL
             AND PAPF.PERSON_ID BETWEEN NVL (P_EMP_FROM, PAPF.PERSON_ID)
                                    AND NVL (P_EMP_TO, PAPF.PERSON_ID)
      ORDER BY 1, 2;
BEGIN
   BEGIN
      SELECT NVL (
                MAX (SUBSTR (BATCH_NAME, INSTR (BATCH_NAME, '-', -1) + 1, 1)),
                0)
             + 1
        INTO L_MAX_NUM
        FROM PAY_BATCH_HEADERS
       WHERE BUSINESS_GROUP_ID = P_BUSINESS_GRP_ID
             AND BATCH_NAME LIKE
                    '%'
                    || TO_CHAR (
                          TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS'),
                          'MON')
                    || '%RECOVERIES%';
   EXCEPTION
      WHEN OTHERS
      THEN
         L_MAX_NUM := 0;
   END;

   L_BATCH_NAME :=
      TO_CHAR (TO_DATE (P_EFFECTIVE_DATE, 'YYYY/MM/DD HH24:MI:SS'),
               'MON-YYYY')
      || '-RECOVERIES-'
      || L_MAX_NUM;

   FOR I IN HDR
   LOOP
      EXIT WHEN HDR%NOTFOUND;
      LV_ERR_FLAG := 'N';

      BEGIN
         PAY_BATCH_ELEMENT_ENTRY_API.CREATE_BATCH_HEADER (
            P_VALIDATE                   => FALSE,
            P_SESSION_DATE               => TO_CHAR (
                                              TO_DATE (P_EFFECTIVE_DATE,
                                                       'YYYY/MM/DD HH24:MI:SS'),
                                              'DD-MON-YYYY'),
            P_BATCH_NAME                 => L_BATCH_NAME,
            P_BATCH_STATUS               => 'U',
            P_BUSINESS_GROUP_ID          => I.BUSINESS_GROUP_ID,
            P_ACTION_IF_EXISTS           => 'I',
            P_BATCH_REFERENCE            => NULL,
            P_BATCH_SOURCE               => NULL,
            P_COMMENTS                   => NULL,
            P_DATE_EFFECTIVE_CHANGES     => NULL,
            P_PURGE_AFTER_TRANSFER       => 'N',
            P_REJECT_IF_FUTURE_CHANGES   => 'N',
            P_BATCH_ID                   => L_BATCH_ID,
            P_OBJECT_VERSION_NUMBER      => L_OBJECT_VERSION_NUMBER,
            P_REJECT_IF_RESULTS_EXISTS   => 'N',
            P_PURGE_AFTER_ROLLBACK       => 'N',
            P_BATCH_TYPE                 => NULL,
            P_REJECT_ENTRY_NOT_REMOVED   => 'N',
            P_ROLLBACK_ENTRY_UPDATES     => 'N');
      EXCEPTION
         WHEN OTHERS
         THEN
            LV_ERR_FLAG := 'Y';
            FND_FILE.PUT_LINE (FND_FILE.OUTPUT,
                               'Error at Batch Header Level: ' || SQLERRM);
      END;

      IF LV_ERR_FLAG <> 'Y'
      THEN
         FOR J IN LINES (I.BUSINESS_GROUP_ID)
         LOOP
            EXIT WHEN LINES%NOTFOUND;
            COMMIT;

            L_OBJECT_VERSION_NUMBER := NULL;
            L_BATCH_LINE_ID := NULL;
            LV_ERR_MSG := NULL;
            LV_ERR_FLAG := 'N';


            BEGIN
               SELECT MAX (BATCH_ID)
                 INTO L_BATCH_ID
                 FROM PAY_BATCH_HEADERS
                WHERE BUSINESS_GROUP_ID = I.BUSINESS_GROUP_ID
                      AND BATCH_NAME = L_BATCH_NAME;
            EXCEPTION
               WHEN OTHERS
               THEN
                  LV_ERR_FLAG := 'Y';
                  LV_ERR_MSG := LV_ERR_MSG || '  :-Invalid Batch Id-:';
            END;

            IF J.TRX_TYPE = 'Recovery'
            THEN
               BEGIN
                  SELECT ELEMENT_TYPE_ID, ELEMENT_NAME
                    INTO L_ELEMENT_TYPE_ID, L_ELEMENT_NAME
                    FROM PAY_ELEMENT_TYPES_F
                   WHERE BUSINESS_GROUP_ID = I.BUSINESS_GROUP_ID
                         AND ELEMENT_NAME = 'Personal Expenses';
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     LV_ERR_FLAG := 'Y';
                     LV_ERR_MSG :=
                        LV_ERR_MSG
                        || '  :-Unable to get recovery element type';
               END;
            ELSE
               BEGIN
                  SELECT ELEMENT_TYPE_ID, ELEMENT_NAME
                    INTO L_ELEMENT_TYPE_ID, L_ELEMENT_NAME
                    FROM PAY_ELEMENT_TYPES_F
                   WHERE BUSINESS_GROUP_ID = I.BUSINESS_GROUP_ID
                         AND ELEMENT_NAME = 'Official Expenses';
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     LV_ERR_FLAG := 'Y';
                     LV_ERR_MSG :=
                        LV_ERR_MSG
                        || '  :-Unable to get reimbursement element type';
               END;
            END IF;



            IF LV_ERR_FLAG <> 'Y'
            THEN
               BEGIN
                  PAY_BATCH_ELEMENT_ENTRY_API.CREATE_BATCH_LINE (
                     P_VALIDATE                     => FALSE,
                     P_SESSION_DATE                 => TO_CHAR (
                                                         TO_DATE (P_EFFECTIVE_DATE,
                                                                  'YYYY/MM/DD HH24:MI:SS'),
                                                         'DD-MON-YYYY'),
                     P_BATCH_ID                     => L_BATCH_ID,
                     P_BATCH_LINE_STATUS            => 'U',
                     P_ASSIGNMENT_ID                => J.ASSIGNMENT_ID,
                     P_ASSIGNMENT_NUMBER            => J.ASSIGNMENT_NUMBER,
                     P_DATE_EARNED                  => NULL,
                     P_PERSONAL_PAYMENT_METHOD_ID   => NULL,
                     P_SUBPRIORITY                  => NULL,
                     P_BATCH_SEQUENCE               => NULL,
                     P_CONCATENATED_SEGMENTS        => NULL,
                     P_COST_ALLOCATION_KEYFLEX_ID   => NULL,
                     P_EFFECTIVE_DATE               => TO_CHAR (
                                                         TO_DATE (
                                                            P_EFFECTIVE_DATE,
                                                            'YYYY/MM/DD HH24:MI:SS'),
                                                         'DD-MON-YYYY'),
                     P_EFFECTIVE_START_DATE         => NULL,
                     P_EFFECTIVE_END_DATE           => NULL,
                     P_ELEMENT_NAME                 => L_ELEMENT_NAME,
                     P_ELEMENT_TYPE_ID              => L_ELEMENT_TYPE_ID,
                     P_ENTRY_TYPE                   => 'E',
                     P_REASON                       => NULL,
                     P_VALUE_1                      => J.AMOUNT,
                     P_VALUE_2                      => J.DESCRIPTION,
                     P_VALUE_3                      => J.DOCUMENT_NO,
                     P_VALUE_4                      => J.TRX_SOURCE,
                     P_VALUE_5                      => J.TRX_TYPE,
                     P_CANONICAL_DATE_FORMAT        => 'Y',
                     P_IV_ALL_INTERNAL_FORMAT       => 'N',
                     P_BATCH_LINE_ID                => L_BATCH_LINE_ID,
                     P_OBJECT_VERSION_NUMBER        => L_OBJECT_VERSION_NUMBER);

                  IF J.TRX_TYPE = 'Recovery'
                     AND J.TRX_SOURCE = 'Employee Expenses'
                  THEN
                     UPDATE XXSC_EMPLOYEE_EXP_HDR_T
                        SET PAY_RECOVERY_DATE =
                               TO_DATE (P_EFFECTIVE_DATE,
                                        'YYYY/MM/DD HH24:MI:SS')
                      WHERE EMPLOYEE_ID = J.PERSON_ID
                            AND HEADER_ID = J.HEADER_ID;
                  ELSIF J.TRX_TYPE = 'Reimbursement'
                        AND J.TRX_SOURCE = 'Employee Expenses'
                  THEN
                     UPDATE XXSC_EMPLOYEE_EXP_HDR_T
                        SET PAY_REIMBURSEMENT_DATE =
                               TO_DATE (P_EFFECTIVE_DATE,
                                        'YYYY/MM/DD HH24:MI:SS')
                      WHERE EMPLOYEE_ID = J.PERSON_ID
                            AND HEADER_ID = J.HEADER_ID;
                  ELSIF J.TRX_SOURCE = 'Staff Recoveries'
                  THEN
                     UPDATE xxsc_staff_recovery_lines_t
                        SET PAYROLL_INTERFACE_DATE =
                               TO_DATE (P_EFFECTIVE_DATE,
                                        'YYYY/MM/DD HH24:MI:SS')
                      WHERE     HEADER_ID = J.HEADER_ID
                            AND LINE_ID = J.LINE_ID
                            AND EMPLOYEE_ID = J.PERSON_ID;
                  END IF;

                  COMMIT;
               EXCEPTION
                  WHEN OTHERS
                  THEN
                     FND_FILE.PUT_LINE (
                        FND_FILE.OUTPUT,
                           'Error For Transaction Source '
                        || J.TRX_SOURCE
                        || ' and Document No:'
                        || J.DOCUMENT_NO
                        || ': '
                        || SQLERRM);
               END;
            ELSE
               FND_FILE.PUT_LINE (
                  FND_FILE.OUTPUT,
                     'Error For Transaction Source '
                  || J.TRX_SOURCE
                  || ' and Document No:'
                  || J.DOCUMENT_NO
                  || ': '
                  || LV_ERR_MSG);
            END IF;
         END LOOP;
      END IF;
      
      IF L_BATCH_ID IS NOT NULL THEN
      FND_FILE.PUT_LINE (FND_FILE.OUTPUT,
                         'Batch Created with Name:-  ' || L_BATCH_NAME);
      ELSE
      FND_FILE.PUT_LINE (FND_FILE.OUTPUT,
                         'No Record Exists..');
      END IF;
   END LOOP;
END;

/

