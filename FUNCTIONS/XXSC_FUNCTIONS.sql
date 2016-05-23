--------------------------------------------------------
--  DDL for Function XXSC_ANNUAL_LEAVE_ACCR_DAYS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_ANNUAL_LEAVE_ACCR_DAYS" (
    P_BGP_ID         IN NUMBER,
    P_ASSIGNMENT_ID  IN NUMBER,
    P_EFFECTIVE_DATE IN DATE,
    P_COMPL_DATE     IN DATE,
    P_TAB_NAME       IN VARCHAR2,
    P_COL_VAL        IN VARCHAR2)
  RETURN NUMBER
IS
  L_ACCRRUAL NUMBER;
  L_BG_NAME  VARCHAR2 (100);
BEGIN
  BEGIN
    SELECT SUM(XXSC_HRMS_OBJECTS.GET_HR_TABLE_VALUE (BUSINESS_GROUP_ID, P_TAB_NAME, P_COL_VAL, X.GRADE,X.EFFECTIVE_START_DATE)*L_DAYS)
    INTO L_ACCRRUAL
    FROM
      (SELECT PASF.BUSINESS_GROUP_ID,
        PAPF.EMPLOYEE_NUMBER,
        PASF.ASSIGNMENT_ID,
        GRADE_ID,
        (SELECT NAME FROM PER_GRADES WHERE GRADE_ID = PASF.GRADE_ID
        ) GRADE,
        GREATEST(TRUNC(P_EFFECTIVE_DATE,'YEAR'),PASF.EFFECTIVE_START_DATE) EFFECTIVE_START_DATE,
        LEAST(LAST_DAY(ADD_MONTHS(P_COMPL_DATE,(12    -(EXTRACT (MONTH FROM TO_DATE(P_COMPL_DATE,'DD-MON-YYYY')))))),PASF.EFFECTIVE_END_DATE) EFFECTIVE_END_DATE,
        ((((LEAST(LAST_DAY(ADD_MONTHS(P_COMPL_DATE,(12-(EXTRACT (MONTH FROM TO_DATE(P_COMPL_DATE,'DD-MON-YYYY')))))),PASF.EFFECTIVE_END_DATE)) -(GREATEST(TRUNC(P_EFFECTIVE_DATE,'YEAR'),PASF.EFFECTIVE_START_DATE)))+1)/((LAST_DAY(ADD_MONTHS(P_COMPL_DATE,(12-(EXTRACT (MONTH FROM TO_DATE(P_COMPL_DATE,'DD-MON-YYYY')))))) - TRUNC(P_COMPL_DATE,'YEAR'))+1)) L_DAYS
      FROM PER_ALL_PEOPLE_F PAPF,
        PER_ALL_ASSIGNMENTS_F PASF
      WHERE PAPF.PERSON_ID       =PASF.PERSON_ID
      AND PASF.ASSIGNMENT_ID     = P_ASSIGNMENT_ID
      AND PAPF.BUSINESS_GROUP_ID = P_BGP_ID
      AND PASF.ASSIGNMENT_STATUS_TYPE_ID=1  -- Added on 09MAR16 to calculate accrual upto Actual Termination Date
      AND SYSDATE BETWEEN PAPF.EFFECTIVE_START_DATE AND PAPF.EFFECTIVE_END_DATE
      AND TO_CHAR (PASF.EFFECTIVE_START_DATE, 'YYYY') <= TO_CHAR(P_EFFECTIVE_DATE,'YYYY')
      AND TO_CHAR (PASF.EFFECTIVE_END_DATE, 'YYYY')   >= TO_CHAR(P_EFFECTIVE_DATE,'YYYY')
      ) X;
  EXCEPTION
  WHEN OTHERS THEN
    L_ACCRRUAL :=0;
  END;
  BEGIN
    SELECT NAME
    INTO L_BG_NAME
    FROM PER_BUSINESS_GROUPS
    WHERE BUSINESS_GROUP_ID = P_BGP_ID;
  EXCEPTION
  WHEN OTHERS THEN
    L_BG_NAME := NULL;
  END;
  IF L_BG_NAME IN ('Shuaa Group UAE') THEN
    --select ceil(L_TOT * 2)/2 into L_TOT from dual; -- Commented on 13SEP15
    SELECT CEIL (TRUNC (L_ACCRRUAL, 1) * 2) / 2
    INTO L_ACCRRUAL
    FROM DUAL;
  END IF;
  RETURN L_ACCRRUAL;
END;

/

--------------------------------------------------------
--  DDL for Function XXSC_ANNUAL_LEAVE_ENTITMNT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_ANNUAL_LEAVE_ENTITMNT" (p_grade varchar2,p_business_group_id number,p_date date)
  RETURN CHAR
IS
  l_bg_name VARCHAR2(200) := NULL;
  l_value VARCHAR2(80) := NULL;
BEGIN
  BEGIN
    SELECT name
    INTO l_bg_name
    FROM per_business_groups
    WHERE business_group_id = p_business_group_id;
  EXCEPTION
  WHEN OTHERS THEN
    l_bg_name := NULL;
  END;
  SELECT value
  INTO l_value
  FROM
    (SELECT BUSINESS_GROUP_ID,
      (SELECT USER_TABLE_NAME
      FROM PAY_USER_TABLES_Fv t,
        PAY_USER_COLUMNS_FV c
      WHERE t.USER_TABLE_ID   = c.USER_TABLE_ID
      AND x.USER_COLUMN_ID    = c.USER_COLUMN_ID
      AND t.BUSINESS_GROUP_ID =c.BUSINESS_GROUP_ID
      AND t.BUSINESS_GROUP_ID =x.BUSINESS_GROUP_ID
      AND c.BUSINESS_GROUP_ID =x.BUSINESS_GROUP_ID
      )USER_TABLE_NAME ,
      (SELECT ROW_LOW_RANGE_OR_NAME
      FROM PAY_USER_ROWS_F_vl
      WHERE BUSINESS_GROUP_ID = P_business_group_id
      AND USER_ROW_ID         = X.USER_ROW_ID
      ) ROW_LOW_RANGE_OR_NAME,
      (SELECT USER_COLUMN_NAME
      FROM PAY_USER_COLUMNS_FV
      WHERE BUSINESS_GROUP_ID = P_business_group_id
      AND USER_COLUMN_ID      = X.USER_COLUMN_ID
      ) USER_COLUMN_NAME,
      x.VALUE
    FROM PAY_USER_COLUMN_INSTANCES_F x
    WHERE business_group_id = P_business_group_id
    AND TRUNC(p_date) BETWEEN effective_start_date AND effective_end_date
    )
  WHERE USER_TABLE_NAME     = decode( l_bg_name , 'Shuaa Group UAE', 'SC AL ACCRUAL','Shuaa Group KSA','SCSA AL ACCRUAL','GFC UAE','GFC AL ACCRUAL','GFC KSA','GFC AL ACCRUAL')
  AND ROW_LOW_RANGE_OR_NAME = p_grade;
  RETURN l_value;
EXCEPTION
WHEN OTHERS THEN
  l_value :=NULL;
  RETURN l_value;
END;

/

--------------------------------------------------------
--  DDL for Function XXSC_DOCUMENT_OF_RECORDS_EXIST
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_DOCUMENT_OF_RECORDS_EXIST" (
   P_BUSINESS_GROUP_ID   IN NUMBER,
   P_ASSIGNMENT_ID       IN NUMBER,
   P_DOC_TYPE            IN VARCHAR2)
   RETURN VARCHAR2
IS
   L_COUNT   NUMBER;
BEGIN
   BEGIN
      SELECT COUNT (*)
        INTO L_COUNT
        FROM PER_ALL_PEOPLE_F PAP,
             PER_ALL_ASSIGNMENTS_F PAF,
             PER_PERSON_TYPES PPT,
             HR_DOCUMENT_TYPES HDT,
             HR_DOCUMENT_EXTRA_INFO HDE,
             HR_ALL_ORGANIZATION_UNITS HRU
       WHERE     PAP.PERSON_ID = PAF.PERSON_ID
             AND PPT.PERSON_TYPE_ID = PAP.PERSON_TYPE_ID
             AND HRU.ORGANIZATION_ID = PAF.ORGANIZATION_ID
             AND HDT.DOCUMENT_TYPE_ID(+) = HDE.DOCUMENT_TYPE_ID
             AND PAP.PERSON_ID = HDE.PERSON_ID(+)
             AND TRUNC (SYSDATE) BETWEEN PAP.EFFECTIVE_START_DATE
                                     AND PAP.EFFECTIVE_END_DATE
             AND TRUNC (SYSDATE) BETWEEN PAF.EFFECTIVE_START_DATE
                                     AND PAF.EFFECTIVE_END_DATE
             AND HDE.DATE_FROM = (SELECT MAX (HDE.DATE_FROM)
                                    FROM HR_DOCUMENT_EXTRA_INFO HDE1
                                   WHERE HDE.PERSON_ID = HDE1.PERSON_ID)
             AND PAF.ASSIGNMENT_ID = P_ASSIGNMENT_ID
             AND UPPER (SYSTEM_DOCUMENT_TYPE) = UPPER (P_DOC_TYPE)
             AND PAP.BUSINESS_GROUP_ID = P_BUSINESS_GROUP_ID;
   EXCEPTION
      WHEN OTHERS
      THEN
         L_COUNT := 0;
   END;

   IF L_COUNT > 0
   THEN
      RETURN 'Y';
   ELSE
      RETURN 'N';
   END IF;
END;

/

--------------------------------------------------------
--  DDL for Function XXSC_EMP_NUM_GEN_CODE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_EMP_NUM_GEN_CODE" (
   p_business_group_id   IN     NUMBER,
   p_person_type         IN     VARCHAR2,
   p_message                OUT VARCHAR2)
   RETURN VARCHAR2
IS
   l_resp_id       NUMBER;
   l_comp_code     CHAR (1) := NULL;
   l_min_value     NUMBER;
   l_max_value     NUMBER;
   l_flex_value    VARCHAR2 (10) := NULL;
   l_next_number   per_all_people_f.employee_number%TYPE := NULL;
BEGIN
   p_message := NULL;
   l_resp_id := fnd_global.resp_id;

   BEGIN
      SELECT profile_option_value
        INTO l_flex_value
        FROM fnd_profile_option_values a, fnd_profile_options b
       WHERE     a.profile_option_id = b.profile_option_id
             AND a.level_value = l_resp_id
             AND b.profile_option_name = 'SC EMPLOYEE NUMBER GENERATION CODE';


      SELECT SUBSTR (l_flex_value, 1, 1) L_CC,
             TO_NUMBER (SUBSTR (l_flex_value, 2)),
             TO_NUMBER (FLV.DESCRIPTION)
        INTO l_comp_code, L_MIN_VALUE, L_MAX_VALUE
        FROM FND_FLEX_VALUE_SETS FVS, FND_FLEX_VALUES_VL FLV
       WHERE     FLV.FLEX_VALUE_SET_ID = FVS.FLEX_VALUE_SET_ID
             AND FVS.FLEX_VALUE_SET_NAME = 'XXSC_EMP_NO_CODES'
             AND flv.flex_value = l_flex_value;



      IF     l_comp_code IS NOT NULL
         AND L_MIN_VALUE IS NOT NULL
         AND L_MAX_VALUE IS NOT NULL
      THEN
         SELECT TRIM (
                   l_comp_code
                   || TRIM (
                         TO_CHAR (
                            NVL (
                               MAX (
                                  TO_NUMBER (SUBSTR (ppf.employee_number, 2)))
                               + 1,
                               l_min_value),
                            '0000')))
           INTO l_next_number
           FROM per_all_people_f ppf
          WHERE employee_number LIKE l_comp_code || '%'
                AND TO_NUMBER (SUBSTR (employee_number, 2)) BETWEEN l_min_value
                                                                AND l_max_value;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         l_comp_code := 'X';
         l_next_number := 'XX';
         p_message := SQLERRM;
   END;

   IF l_comp_code <> 'X' AND l_comp_code IS NOT NULL
   THEN
      p_message := 'SUCCESS';
   ELSE
      p_message := 'ERROR';
      hr_utility.set_message (801, 'SC_HR_EMP_CREATION_ERROR');
      hr_utility.set_message_token (
         'Error',
         'You are not authorized to create an Employee!');
      hr_utility.raise_error;
   END IF;

   RETURN l_next_number;
END;

/

--------------------------------------------------------
--  DDL for Function XXSC_FA_GET_EMPASG_FUNC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_FA_GET_EMPASG_FUNC" (p_asset_id NUMBER)
   RETURN VARCHAR2
IS
   v_person_name   VARCHAR2 (2000);
   lv_n            NUMBER          := 0;
   lv_n2           NUMBER          := 0;
BEGIN
   FOR i IN (SELECT DISTINCT full_name
                        FROM per_all_people_f pp,
                             fa_distribution_history fdh
                       WHERE fdh.assigned_to = pp.person_id
                         AND fdh.asset_id = p_asset_id
                         AND fdh.date_ineffective IS NULL)
   LOOP
      lv_n := lv_n + 1;
   END LOOP;

   FOR i IN (SELECT DISTINCT full_name
                        FROM per_all_people_f pp, fa_distribution_history fdh
                       WHERE fdh.assigned_to = pp.person_id
                         AND fdh.asset_id = p_asset_id
                         AND fdh.date_ineffective IS NULL
                         AND SYSDATE BETWEEN pp.effective_start_date
                                         AND pp.effective_end_date)
   LOOP
      lv_n2 := lv_n2 + 1;

      IF lv_n > 1
      THEN
         IF lv_n2 < lv_n
         THEN
            v_person_name := v_person_name || i.full_name || ',';
         ELSE
            v_person_name := v_person_name || i.full_name || '.';
         END IF;
      ELSIF lv_n = 1
      THEN
         v_person_name := v_person_name || i.full_name || '.';
      END IF;
   END LOOP;

   RETURN v_person_name;
EXCEPTION
   WHEN OTHERS
   THEN
      v_person_name := NULL;
      RETURN NULL;
END xxsc_fa_get_empasg_func; 

/

--------------------------------------------------------
--  DDL for Function XXSC_FIN_ACC_DESC_FUNC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_FIN_ACC_DESC_FUNC" (
   p_combination_id   IN   NUMBER,
   p_sob_id           IN   NUMBER
)
   RETURN VARCHAR2
IS
--+ +++++++++++++++++++++++++++++++++++++++++++++++++++++ +--
--+ Created By      :  Sivareddy.m
--+ Creation Date    :  23 Feb 2015
--+ +++++++++++++++++++++++++++++++++++++++++++++++++++++ +--
   lv_segment1       VARCHAR2 (1000);
   lv_segment2       VARCHAR2 (1000);
   lv_segment3       VARCHAR2 (1000);
   lv_segment4       VARCHAR2 (1000);
   lv_segment5       VARCHAR2 (1000);
   lv_segment6       VARCHAR2 (1000);
   lv_segment7       VARCHAR2 (1000);
   lv_segment8       VARCHAR2 (1000);
   lv_segment9       VARCHAR2 (1000);
   lv_account_desc   VARCHAR2 (3000);
   l_coa_id          NUMBER;

   CURSOR c
   IS
      SELECT segment1, segment2, segment3, segment4, segment5, segment6,
             segment7, segment8, segment9
        FROM gl_code_combinations
       WHERE code_combination_id = p_combination_id;
BEGIN
   BEGIN
      SELECT DISTINCT chart_of_accounts_id
                 INTO l_coa_id
                 FROM gl_ledgers
                WHERE ledger_id = p_sob_id;
   EXCEPTION
      WHEN OTHERS
      THEN
         l_coa_id := 0;
   END;

   FOR i IN c
   LOOP
      BEGIN
         SELECT DISTINCT fv.description
                    INTO lv_segment1
                    FROM fnd_flex_value_sets fvs,
                         fnd_flex_values_vl fv,
                         fnd_id_flex_segments_vl fvl
                   WHERE fvs.flex_value_set_id = fv.flex_value_set_id
                     AND fvs.flex_value_set_id = fvl.flex_value_set_id
                     AND fvl.application_id = 101
                     AND fvl.id_flex_code = 'GL#'
                     AND fvl.id_flex_num = l_coa_id
                     AND fvl.segment_num = 1
                     AND fv.flex_value = i.segment1;
--   AND fvs.flex_value_set_name = 'GALFAR_GL_AFF_COMPANY'
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_segment1 := NULL;
      END;

      BEGIN
         SELECT DISTINCT fv.description
                    INTO lv_segment2
                    FROM fnd_flex_value_sets fvs,
                         fnd_flex_values_vl fv,
                         fnd_id_flex_segments_vl fvl
                   WHERE fvs.flex_value_set_id = fv.flex_value_set_id
                     AND fvs.flex_value_set_id = fvl.flex_value_set_id
                     AND fvl.application_id = 101
                     AND fvl.id_flex_code = 'GL#'
                     AND fvl.id_flex_num = l_coa_id
                     AND fvl.segment_num = 2
--            AND fvs.flex_value_set_name = 'GALFAR_GL_AKF_DEPARTMENT'
                     AND fv.flex_value = i.segment2;
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_segment2 := NULL;
      END;

      BEGIN
         SELECT DISTINCT fv.description
                    INTO lv_segment3
                    FROM fnd_flex_value_sets fvs,
                         fnd_flex_values_vl fv,
                         fnd_id_flex_segments_vl fvl
                   WHERE fvs.flex_value_set_id = fv.flex_value_set_id
                     AND fvs.flex_value_set_id = fvl.flex_value_set_id
                     AND fvl.application_id = 101
                     AND fvl.id_flex_code = 'GL#'
                     AND fvl.id_flex_num = l_coa_id
                     AND fvl.segment_num = 3
--            AND fvs.flex_value_set_name = 'GALFAR_GL_AKF_PROJECT'
                     AND fv.flex_value = i.segment3;
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_segment3 := NULL;
      END;

      BEGIN
         SELECT DISTINCT fv.description
                    INTO lv_segment4
                    FROM fnd_flex_value_sets fvs,
                         fnd_flex_values_vl fv,
                         fnd_id_flex_segments_vl fvl
                   WHERE fvs.flex_value_set_id = fv.flex_value_set_id
                     AND fvs.flex_value_set_id = fvl.flex_value_set_id
                     AND fvl.application_id = 101
                     AND fvl.id_flex_code = 'GL#'
                     AND fvl.id_flex_num = l_coa_id
                     AND fvl.segment_num = 4
--            AND fvs.flex_value_set_name = 'GALFAR_GL_AKF_ACCOUNT'
                     AND fv.flex_value = i.segment4;
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_segment4 := NULL;
      END;

      BEGIN
         SELECT DISTINCT fv.description
                    INTO lv_segment5
                    FROM fnd_flex_value_sets fvs,
                         fnd_flex_values_vl fv,
                         fnd_id_flex_segments_vl fvl
                   WHERE fvs.flex_value_set_id = fv.flex_value_set_id
                     AND fvs.flex_value_set_id = fvl.flex_value_set_id
                     AND fvl.application_id = 101
                     AND fvl.id_flex_code = 'GL#'
                     AND fvl.id_flex_num = l_coa_id
                     AND fvl.segment_num = 5
--            AND fvs.flex_value_set_name = 'GALFAR_GL_AKF_SUB-ACCOUNT'
                     AND fv.flex_value = i.segment5;
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_segment5 := NULL;
      END;

      BEGIN
         SELECT DISTINCT fv.description
                    INTO lv_segment6
                    FROM fnd_flex_value_sets fvs,
                         fnd_flex_values_vl fv,
                         fnd_id_flex_segments_vl fvl
                   WHERE fvs.flex_value_set_id = fv.flex_value_set_id
                     AND fvs.flex_value_set_id = fvl.flex_value_set_id
                     AND fvl.application_id = 101
                     AND fvl.id_flex_code = 'GL#'
                     AND fvl.id_flex_num = l_coa_id
                     AND fvl.segment_num = 6
--            AND fvs.flex_value_set_name = 'GALFAR_GL_AKF_FUTURE'
                     AND fv.flex_value = i.segment6;
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_segment6 := NULL;
      END;

      BEGIN
         SELECT DISTINCT fv.description
                    INTO lv_segment7
                    FROM fnd_flex_value_sets fvs,
                         fnd_flex_values_vl fv,
                         fnd_id_flex_segments_vl fvl
                   WHERE fvs.flex_value_set_id = fv.flex_value_set_id
                     AND fvs.flex_value_set_id = fvl.flex_value_set_id
                     AND fvl.application_id = 101
                     AND fvl.id_flex_code = 'GL#'
                     AND fvl.id_flex_num = l_coa_id
                     AND fvl.segment_num = 7
--            AND fvs.flex_value_set_name = 'GALFAR_GL_AKF_INTERCO'
                     AND fv.flex_value = i.segment7;
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_segment7 := NULL;
      END;

      BEGIN
         SELECT DISTINCT fv.description
                    INTO lv_segment8
                    FROM fnd_flex_value_sets fvs,
                         fnd_flex_values_vl fv,
                         fnd_id_flex_segments_vl fvl
                   WHERE fvs.flex_value_set_id = fv.flex_value_set_id
                     AND fvs.flex_value_set_id = fvl.flex_value_set_id
                     AND fvl.application_id = 101
                     AND fvl.id_flex_code = 'GL#'
                     AND fvl.id_flex_num = l_coa_id
                     AND fvl.segment_num = 8
--            AND fvs.flex_value_set_name = 'GALFAR_GL_AKF_INTERCO'
                     AND fv.flex_value = i.segment8;
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_segment8 := NULL;
      END;

      BEGIN
         SELECT DISTINCT fv.description
                    INTO lv_segment9
                    FROM fnd_flex_value_sets fvs,
                         fnd_flex_values_vl fv,
                         fnd_id_flex_segments_vl fvl
                   WHERE fvs.flex_value_set_id = fv.flex_value_set_id
                     AND fvs.flex_value_set_id = fvl.flex_value_set_id
                     AND fvl.application_id = 101
                     AND fvl.id_flex_code = 'GL#'
                     AND fvl.id_flex_num = l_coa_id
                     AND fvl.segment_num = 9
--            AND fvs.flex_value_set_name = 'GALFAR_GL_AKF_INTERCO'
                     AND fv.flex_value = i.segment9;
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_segment9 := NULL;
      END;
   END LOOP;

   lv_account_desc :=
         lv_segment1
      || '.'
      || lv_segment2
      || '.'
      || lv_segment3
      || '.'
      || lv_segment4
      || '.'
      || lv_segment5
      || '.'
      || lv_segment6
      || '.'
      || lv_segment7
      || '.'
      || lv_segment8
      || '.'
      || lv_segment9;
   RETURN RTRIM (RTRIM (LTRIM (lv_account_desc, ' '), ' '), '.');
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN NULL;
END xxsc_fin_acc_desc_func; 

/

--------------------------------------------------------
--  DDL for Function XXSC_FIN_FLX_DES_FUN
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_FIN_FLX_DES_FUN" (
   p_flex_value     VARCHAR2,
   p_segment_name   VARCHAR2
)
   RETURN VARCHAR2
/*=================================================================
 CREATED BY    : SIVAREDDY.M
 CREATION DATE : 7-Feb-15
 DESCRIPTION   : TO GET FLEX VALUE DESCRIPTION
 MODIFIED BY   :
 MODIFIED DATE :
 REASON        :
 =================================================================*/
IS
   lv_desc   VARCHAR2 (240);
BEGIN
   SELECT ffv.description
     INTO lv_desc
     FROM fnd_id_flex_structures fifs,
          fnd_id_flex_segments fifg,
          fnd_flex_value_sets ffvs,
          fnd_flex_values_vl ffv
    WHERE fifs.id_flex_code = fifg.id_flex_code
      AND fifs.id_flex_num = fifg.id_flex_num
      AND fifs.id_flex_structure_code = 'ACCOUNTING_FLEXFIELD'
      AND fifs.id_flex_code = 'GL#'
      AND fifg.flex_value_set_id = ffvs.flex_value_set_id
      AND ffv.flex_value_set_id = ffvs.flex_value_set_id
      AND ffv.flex_value = p_flex_value
      AND fifg.segment_name = p_segment_name;

   RETURN lv_desc;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN NULL;
END xxsc_fin_flx_des_fun; 

/

--------------------------------------------------------
--  DDL for Function XXSC_FIN_SORT_VAL_FUNC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_FIN_SORT_VAL_FUNC" (
   p_hierarchy_level     NUMBER,
   p_summary_flag        CHAR,
   p_flex_value_set_id   NUMBER,
   p_flex_value          VARCHAR2
)
   RETURN VARCHAR2
/*=================================================================
CREATED BY    : SIVAREDDY.M
CREATION DATE :7-FEB-15
DESCRIPTION   : TO GET FLEX VALUE ORDER PARENT TO CHILD
MODIFIED BY   :
MODIFIED DATE :
REASON        :
=================================================================*/
IS
   lv_v1   NUMBER         := 0;
   lv_fv   VARCHAR2 (200);
   lv_lv   VARCHAR2 (200);
BEGIN
   FOR i IN 1 .. LENGTH (p_flex_value)
   LOOP
      IF ASCII (SUBSTR (p_flex_value, i, 1)) BETWEEN 48 AND 57
      THEN
         lv_v1 := lv_v1 + 1;
      ELSE
         lv_v1 := 0;
      END IF;
   END LOOP;

   IF lv_v1 <> LENGTH (p_flex_value)
   THEN
      IF p_hierarchy_level = 2 AND p_summary_flag = 'Y'
      THEN
         SELECT parent_flex_value
           INTO lv_fv
           FROM fnd_flex_value_norm_hierarchy
          WHERE flex_value_set_id = p_flex_value_set_id
            AND p_flex_value BETWEEN child_flex_value_low
                                 AND child_flex_value_high;
      ELSIF p_hierarchy_level = 3 AND p_summary_flag = 'Y'
      THEN
         SELECT parent_flex_value
           INTO lv_fv
           FROM fnd_flex_value_norm_hierarchy
          WHERE (SELECT parent_flex_value
                   FROM fnd_flex_value_norm_hierarchy
                  WHERE flex_value_set_id = p_flex_value_set_id
                    AND p_flex_value BETWEEN child_flex_value_low
                                         AND child_flex_value_high)
                   BETWEEN child_flex_value_low
                       AND child_flex_value_high;
      ELSIF p_hierarchy_level = 3 AND p_summary_flag = 'N'
      THEN
         SELECT parent_flex_value
           INTO lv_fv
           FROM fnd_flex_value_hierarchies
          WHERE flex_value_set_id = p_flex_value_set_id
            AND p_flex_value BETWEEN child_flex_value_low
                                 AND child_flex_value_high
            AND ROWNUM = 1;
      ELSE
         lv_fv := NULL;
      END IF;

      lv_lv := lv_fv || p_flex_value;
      RETURN lv_lv;
   ELSE
      RETURN p_flex_value;
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN NULL;
END; 

/

--------------------------------------------------------
--  DDL for Function XXSC_GET_GLOBAL_VALUE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_GET_GLOBAL_VALUE" (p_bus_grp_id IN NUMBER,p_global_name IN VARCHAR2)
  RETURN NUMBER
IS
  l_glb_val NUMBER;
BEGIN
  BEGIN
    SELECT to_number(global_value)
    INTO l_glb_val
    FROM FF_GLOBALS_F
    WHERE business_group_id = p_bus_grp_id
    AND global_name         = p_global_name
    AND TRUNC(sysdate) BETWEEN effective_start_date AND effective_end_date;
  EXCEPTION
  WHEN OTHERS THEN
    l_glb_val := 0;
  END;
  RETURN l_glb_val;
END;

/

--------------------------------------------------------
--  DDL for Function XXSC_HR_MGRNAME_FUN
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_HR_MGRNAME_FUN" (p_date date,p_assignment_id number) return Char is
L_VAL varchar2(200) := null;
begin
  SELECT
  (SELECT pap1.full_name
  FROM per_all_people_f pap1
  WHERE pap1.person_id = paf.SUPERVISOR_ID
  AND p_date BETWEEN pap1.effective_start_date AND pap1.effective_end_date
  ) manager
  INTO L_VAL
FROM PER_ALL_PEOPLE_F PPF,
  per_ALL_ASSIGNMENTS_F PAF
WHERE PPF.PERSON_ID      = PAF.PERSON_ID
AND PAF.ASSIGNMENT_ID    = p_assignment_id
AND PPF.EMPLOYEE_NUMBER IS NOT NULL
AND Paf.Primary_Flag     = 'Y'
AND p_date BETWEEN PPF.EFFECTIVE_START_DATE AND PPF.EFFECTIVE_END_DATE
AND p_date BETWEEN PAF.EFFECTIVE_START_DATE AND PAF.EFFECTIVE_END_DATE;
 RETURN L_VAL;
EXCEPTION
WHEN OTHERS THEN
  RETURN NULL;
END;

/

--------------------------------------------------------
--  DDL for Function XXSC_HR_MINPAYPROCESS_FUN
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_HR_MINPAYPROCESS_FUN" (
    p_business_group_id NUMBER,
    p_assignment_id     NUMBER)
  RETURN NUMBER
IS
  l_val NUMBER :=0;
BEGIN
  SELECT MIN(assignment_action_id)
  INTO l_val
  FROM pay_payroll_actions ppa,
    pay_assignment_actions paa
  WHERE ppa.payroll_action_id = paa.payroll_action_id
  AND paa.assignment_id       = p_assignment_id
  AND ppa.business_group_id   = p_business_group_id
  AND ppa.action_type        IN ('Q','R')
  AND ppa.action_status       = 'C';
  RETURN l_val;
EXCEPTION
WHEN OTHERS THEN
  RETURN 0;
END; 

/

--------------------------------------------------------
--  DDL for Function XXSC_PAY_NOTCICEPAY_FUNC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_PAY_NOTCICEPAY_FUNC" (
    p_assignment_id       NUMBER,
    P_NOTICE_PERIOD_ST_DT DATE,
    P_NOTICE_PERIOD_DT    DATE) return number
IS
  l_value NUMBER := 0;
BEGIN
  SELECT SUM(cal_day_val)
  INTO l_value
  FROM
    (SELECT *
    FROM
      (SELECT peef.ASSIGNMENT_ID,
        greatest(peef.effective_start_date, P_NOTICE_PERIOD_ST_DT) sal_change_date,
        least(peef.effective_end_date, P_NOTICE_PERIOD_DT) sal_change_end_date,
        greatest(peef.effective_start_date, P_NOTICE_PERIOD_ST_DT) - 1 sal_change_date_before,
        screen_entry_value,
        ( least(peef.effective_end_date, P_NOTICE_PERIOD_DT) - greatest(peef.effective_start_date, P_NOTICE_PERIOD_ST_DT) ) +1 days,
        ROUND(( (screen_entry_value                                / TO_CHAR(last_day(least(peef.effective_end_date, P_NOTICE_PERIOD_DT) ),'DD' ) ) * ( ( least(peef.effective_end_date, P_NOTICE_PERIOD_DT) ) - ( greatest(peef.effective_start_date, P_NOTICE_PERIOD_ST_DT) )+1 ) ),2)cal_day_val
      FROM Pay_element_types_f petf,
        pay_element_entries_f peef,
        pay_element_entry_values_f peevf,
        pay_input_values_f pivf
      WHERE pivf.ELEMENT_TYPE_ID = petf.ELEMENT_TYPE_ID
      AND peef.ELEMENT_ENTRY_ID  = peevf.ELEMENT_ENTRY_ID
      AND petf.ELEMENT_TYPE_ID   = peef.ELEMENT_TYPE_ID
      AND peevf.INPUT_VALUE_ID   = pivf.INPUT_VALUE_ID
      AND peef.ASSIGNMENT_ID     = p_assignment_id
      AND P_NOTICE_PERIOD_DT BETWEEN pivf.EFFECTIVE_START_DATE AND pivf.EFFECTIVE_END_DATE
      AND P_NOTICE_PERIOD_DT BETWEEN petf.EFFECTIVE_START_DATE AND petf.EFFECTIVE_END_DATE
      AND peevf.effective_start_date = peef.effective_start_date
      AND (peevf.effective_start_date BETWEEN P_NOTICE_PERIOD_ST_DT AND P_NOTICE_PERIOD_DT
      OR peevf.effective_end_date BETWEEN P_NOTICE_PERIOD_ST_DT AND P_NOTICE_PERIOD_DT
      OR (peevf.effective_start_date <= P_NOTICE_PERIOD_ST_DT
      AND peevf.effective_end_date   >= P_NOTICE_PERIOD_DT))
      AND ( (petf.element_name        = 'Total Monthly Salary'
      AND pivf.name                   = 'Monthly Salary') )
      )
    GROUP BY sal_change_date,
      sal_change_end_date,
      sal_change_date_before,
      ASSIGNMENT_ID,
      days,
      cal_day_val,
      screen_entry_value
    );
  RETURN l_value;
EXCEPTION
WHEN OTHERS THEN
  RETURN 0;
END;

/

--------------------------------------------------------
--  DDL for Function XXSC_SPELL_NUMBER
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_SPELL_NUMBER" (
      NUMBER1   IN NUMBER,
      CURRENCY1 IN VARCHAR2)
    RETURN VARCHAR2
    /* Programmer: Tunde Bode Client : Irish Life and Permanent, Ireland. Date : 04/11/1999 Updated : 04/11/1999 USAGE : This is created as a database function, so that it can be invoke (called) within any Oracle based application, e.g. Oracle Forms, Reports, SQL, PL/SQL. As database object whenever you take your export dump, it is automatically copied along with your other database objects. To invoke this function, simply type command below: towords(number1,'currency_code') where number1 is amount to be converted to word, while currency_code is the code defined for the currency. I have defined the following codes --- "E" for Euro, "I" for Punt, "S" for Sterling, "N" for Nigerian Naira and "D" for Dollars. Please note that this is not exhaustive as you can also define additional currencies without changing the main program. All you have to do is just include it in the "Defining currencies section of this program. */
  IS
    inwords   VARCHAR2(1000);
    currency2 VARCHAR2(1);
    curtype   VARCHAR2(6);
    curtype1  VARCHAR2(8);
    mmax      NUMBER       := 5373484;
    number2   NUMBER(20,2) := 0;
  BEGIN
    number2   := number1;
    currency2 := currency1; ---- ---- Defining and setting up currency types ---- --- "E" for Euro, "I" for Punt and "S" for Sterling
--    if upper(currency2) in ('I','S') then curtype := ' PENCE'; curtype1 := ' POUNDS'; elsif upper(currency2) = 'E' then curtype := ' PENCE'; curtype1 := ' EUROS'; elsif upper(currency2) = 'USD' then curtype := ' CENT'; curtype1 := 'DOLLARS'; elsif upper(currency2) = 'S' then curtype := ' PENCE'; curtype1 := ' POUNDS'; elsif upper(currency2) = 'N' then curtype := ' KOBO'; curtype1 := ' NAIRA'; else curtype := ' PENCE'; curtype1 := ' POUNDS'; end if;
    --- --- Process Starts here --- ---
    if number2 = 0 then return('ZERO'||curtype1); elsif number2 < 0
    then return('ERROR - NEGATIVE AMOUNT');
    else
    select decode(sign(length(to_char(trunc(number2)))-7), -1,ltrim(rtrim(decode(sign(1 - floor(number2)), 1,'' ||decode(sign(to_number(number2 - floor(number2))), 0,' ', to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')||curtype),
    to_char(   to_date(trunc(number2),'J'),'JSP') ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')||curtype)))), decode(length(to_char(trunc(number2))), 7,to_char(to_date(to_number(substr(to_char(number2),1,1)), 'J'),'JSP')||' MILLION ' ||decode(to_number(substr(to_char(number2),2,6)), 0,'', to_char(to_date(to_number(substr(to_char(number2),2,6)), 'J'),'JSP')) ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')||curtype), 8,to_char(to_date(to_number(substr(to_char(number2),1,2)), 'J'),'JSP')||' MILLION ' ||decode(to_number(substr(to_char(number2),3,6)), 0,'', to_char(to_date(to_number(substr(to_char(number2),3,6)), 'J'),'JSP')) ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP
   ')||curtype), 9,to_char(to_date(to_number(substr(to_char(number2),1,3)), 'J'),'JSP')||' MILLION ' ||decode(to_number(substr(to_char(number2),4,6)), 0,'', to_char(to_date(to_number(substr(to_char(number2),4,6)), 'J'),'JSP')) ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')||curtype), 10,to_char(to_date(to_number(substr(to_char(number2),1,1)), 'J'),'JSP')||' BILLION ' ||decode(to_number(substr(to_char(number2),2,3)), 0,'', to_char(to_date(to_number(substr(to_char(number2),2,3)), 'J'),'JSP')||' MILLION ') ||decode(to_number(substr(to_char(number2),5,6)), 0,'', to_char(to_date(to_number(substr(to_char(number2),5,6)), 'J'),'JSP')) ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')||curtype), 11,to_char(to_date(to_number(substr(to_char(number2),1,2)), 'J'),'JSP')||'
   BILLION ' ||decode(to_number(substr(to_char(number2),3,3)), 0,'', to_char(to_date(to_number(substr(to_char(number2),3,3)), 'J'),'JSP')||' MILLION ') ||decode(to_number(substr(to_char(number2),6,6)), 0,'', to_char(to_date(to_number(substr(to_char(number2),6,6)), 'J'),'JSP')) ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')||curtype), 12,to_char(to_date(to_number(substr(to_char(number2),1,3)), 'J'),'JSP')||' BILLION ' ||decode(to_number(substr(to_char(number2),4,3)), 0,'', to_char(to_date(to_number(substr(to_char(number2),4,3)), 'J'),'JSP')||' MILLION ') ||decode(to_number(substr(to_char(number2),7,6)), 0,'', to_char(to_date(to_number(substr(to_char(number2),7,6)), 'J'),'JSP')) ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')||curtype), 13,to_char(to_date(to_number
   (substr(to_char(number2),1,1)), 'J'),'JSP')||' TRILLION ' ||decode(to_number(substr(to_char(number2),2,3)), 0,'', to_char(to_date(to_number(substr(to_char(number2),2,3)), 'J'),'JSP')||' BILLION ') ||decode(to_number(substr(to_char(number2),5,3)), 0,'', to_char(to_date(to_number(substr(to_char(number2),5,3)), 'J'),'JSP')||' MILLION ') ||decode(to_number(substr(to_char(number2),8,6)), 0,'', to_char(to_date(to_number(substr(to_char(number2),8,6)), 'J'),'JSP')) ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')||curtype), 14,to_char(to_date(to_number(substr(to_char(number2),1,2)), 'J'),'JSP')||' TRILLION ' ||decode(to_number(substr(to_char(number2),3,3)), 0,'', to_char(to_date(to_number(substr(to_char(number2),3,3)), 'J'),'JSP')||' BILLION ') ||decode(to_number(substr(to_char(number2),6,3)), 0,'', to_char(to_date(to_number(substr(to_char(number2),6,3)), 'J'),'JSP')||' MILLION
   ') ||decode(to_number(substr(to_char(number2),9,6)), 0,'', to_char(to_date(to_number(substr(to_char(number2),9,6)), 'J'),'JSP')) ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')||curtype), 15,to_char(to_date(to_number(substr(to_char(number2),1,3)), 'J'),'JSP')||' TRILLION ' ||decode(to_number(substr(to_char(number2),4,3)), 0,'', to_char(to_date(to_number(substr(to_char(number2),4,3)), 'J'),'JSP')||' BILLION ') ||decode(to_number(substr(to_char(number2),7,3)), 0,'', to_char(to_date(to_number(substr(to_char(number2),7,3)), 'J'),'JSP')||' MILLION ') ||decode(to_number(substr(to_char(number2),10,6)), 0,'', to_char(to_date(to_number(substr(to_char(number2),10,6)), 'J'),'JSP')) ||curtype1|| decode(sign(to_number(number2 - floor(number2))), 0,' ', ' AND '||to_char(to_date(trunc( 100 * to_number(number2 - floor(number2)) ),'J'),'JSP')))) into inwords from dual; return(
   inwords); end if; end xxsc_spell_number;

/

--------------------------------------------------------
--  DDL for Function XXSC_UPDATE_ABSENCE_DURATION_F
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "APPS"."XXSC_UPDATE_ABSENCE_DURATION_F" (
   P_BUSINESS_GROUP_ID    NUMBER,
   P_DATE                 DATE)
   RETURN NUMBER
IS
   L_ABSENCE_DAYS                NUMBER;
   L_ABSENCE_HOURS               NUMBER;
   L_USER_FORMULA                BOOLEAN;
   l_object_version_number       NUMBER;
   l_dur_dys_less_warning        BOOLEAN;
   l_dur_hrs_less_warning        BOOLEAN;
   l_exceeds_pto_entit_warning   BOOLEAN;
   l_exceeds_run_total_warning   BOOLEAN;
   l_abs_overlap_warning         BOOLEAN;
   l_abs_day_after_warning       BOOLEAN;
   l_dur_overwritten_warning     BOOLEAN;
   l_del_element_entry_warning   BOOLEAN;
   l_test_var                    VARCHAR2 (1000) := NULL;

   PRAGMA AUTONOMOUS_TRANSACTION;

   CURSOR EC
   IS
      SELECT *
        FROM PER_ABSENCE_ATTENDANCES
       WHERE BUSINESS_GROUP_ID = P_BUSINESS_GROUP_ID
             AND P_DATE BETWEEN date_start AND date_end;
BEGIN
   IF P_DATE IS NULL
   THEN
      RETURN 0;
   END IF;

   FOR I IN EC
   LOOP
      L_ABSENCE_DAYS := NULL;
      L_ABSENCE_HOURS := NULL;
      L_USER_FORMULA := NULL;

      EXIT WHEN EC%NOTFOUND;

      BEGIN
         PER_ABS_BUS.calculate_absence_duration (
            p_absence_attendance_id        => I.absence_attendance_id,
            p_absence_attendance_type_id   => i.absence_attendance_type_id,
            p_business_group_id            => I.business_group_id,
            p_object_version_number        => I.object_version_number,
            p_effective_date               => TRUNC (SYSDATE),
            p_person_id                    => i.person_id,
            p_date_start                   => i.date_start,
            p_date_end                     => i.date_end,
            p_time_start                   => i.time_start,
            p_time_end                     => i.time_end,
            p_absence_days                 => l_absence_days,
            p_absence_hours                => l_absence_hours,
            p_use_formula                  => l_user_formula);

         IF L_ABSENCE_DAYS <> I.ABSENCE_DAYS
         THEN
            l_object_version_number := i.object_version_number;
            l_dur_dys_less_warning := NULL;
            l_dur_hrs_less_warning := NULL;
            l_exceeds_pto_entit_warning := NULL;
            l_exceeds_run_total_warning := NULL;
            l_abs_overlap_warning := NULL;
            l_abs_day_after_warning := NULL;
            l_dur_overwritten_warning := NULL;
            l_del_element_entry_warning := NULL;

            BEGIN
               hr_person_absence_api.update_person_absence (
                  p_effective_date              => i.date_start,
                  p_absence_attendance_id       => i.absence_attendance_id,
                  p_absence_days                => l_absence_days,
                  p_absence_hours               => L_ABSENCE_HOURS,
                  p_object_version_number       => l_object_version_number,
                  p_dur_dys_less_warning        => l_dur_dys_less_warning,
                  p_dur_hrs_less_warning        => l_dur_hrs_less_warning,
                  p_exceeds_pto_entit_warning   => l_exceeds_pto_entit_warning,
                  p_exceeds_run_total_warning   => l_exceeds_run_total_warning,
                  p_abs_overlap_warning         => l_abs_overlap_warning,
                  p_abs_day_after_warning       => l_abs_day_after_warning,
                  p_dur_overwritten_warning     => l_dur_overwritten_warning,
                  p_del_element_entry_warning   => l_del_element_entry_warning);
               COMMIT;
            EXCEPTION
               WHEN OTHERS
               THEN
                  fnd_file.put_line (fnd_file.output, 'ERROR1 : ' || SQLERRM);
            END;
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            fnd_file.put_line (fnd_file.output, 'ERROR1 : ' || SQLERRM);
      END;
   END LOOP;

   RETURN 0;
END;

/

