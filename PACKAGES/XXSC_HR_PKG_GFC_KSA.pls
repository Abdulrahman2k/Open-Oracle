CREATE OR REPLACE PACKAGE      XXSC_HR_PKG AUTHID CURRENT_USER
--  $Header: XXSC_HR_PKG.pls 12.1 2015/01/21 10:30:06 mrahman noship $
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
-- DRAFT 1A 22-JAN-2015  Mohammed Abdul Rahman    Initial draft version
--************************************************************************
AS
  P_CONC_REQUEST_ID                   NUMBER;
  P_PERSON_ID                         NUMBER;
  P_BUSINESS_GROUP_ID                   NUMBER;
  P_DEP_ORG_ID                          NUMBER;
  P_BU_ORG_ID                           NUMBER;
--  p_cc_org_id                          NUMBER;
--  p_div_org_id                          NUMBER;
  p_start_date                          DATE;
  p_end_date                            DATE;
  p_date                                DATE;
  P_PAYROLL_ID                          number;
  P_DIFFERED                            VARCHAR2(1);
  P_TIME_PERIOD_ID                      NUMBER;
  P_PERIOD_END_DATE                     DATE;
  P_ELEMENT_NAME                        VARCHAR2(2000);
  P_ELEMENT_NAME1                       VARCHAR2(2000);
  P_ELEMENT_NAME2                       VARCHAR2(2000);
  P_ELEMENT_NAME3                       VARCHAR2(2000);
  P_ELEMENT_INPUT_NAME1                 VARCHAR2(2000);
  P_ELEMENT_INPUT_NAME2                 VARCHAR2(2000);
  P_ELEMENT_INPUT_NAME3                 VARCHAR2(2000);
  P_ACCOUNT_CODE                        VARCHAR2(2000);
  P_EMP_OR_EX                           varchar2(10);
  P_EMPLOYER                            VARCHAR2(2000);
  P_EMP_OR_EX_SQL                       varchar2(2000)  := 'AND 1=1';
  P_PAY_DATE                            VARCHAR2(2000);
  P_PERIOD                              VARCHAR2(10);
  P_LOCATION_ID                         NUMBER;
  P_LEDGER_ID                           NUMBER;
-------------------(BEGIN XXPAY_EMP_VOUCHER PARAMETERS)------------
    P_BATCH VARCHAR2(240);
    P_BANK VARCHAR2(240);
-------------------(END XXPAY_EMP_VOUCHER PARAMETERS)------------
  FUNCTION beforereport          RETURN BOOLEAN;
  FUNCTION afterreport           RETURN BOOLEAN;
  FUNCTION get_current_date      RETURN VARCHAR2;
  FUNCTION get_operating_unit    RETURN VARCHAR2;
  FUNCTION get_operating_unit_param   RETURN VARCHAR2;
  FUNCTION get_company_param           RETURN VARCHAR2;
--  FUNCTION get_division_param          RETURN VARCHAR2;
  FUNCTION get_department_param        RETURN VARCHAR2;
--  FUNCTION get_section_param           RETURN VARCHAR2;
  FUNCTION get_employee_param           RETURN VARCHAR2;
  FUNCTION get_business_unit    (ORG_ID NUMBER)      RETURN VARCHAR2;
--  FUNCTION get_division   (ORG_ID NUMBER)      RETURN VARCHAR2;
  FUNCTION get_department (ORG_ID NUMBER)      RETURN VARCHAR2;
--  FUNCTION get_cost_centre    (ORG_ID NUMBER)      RETURN VARCHAR2;
  FUNCTION get_project    (ORG_ID NUMBER)      RETURN VARCHAR2;
  FUNCTION P_EMP_OR_EX_SQL_formula             RETURN VARCHAR2;
  FUNCTION GET_ORG_NAME   (P_ORG_ID  NUMBER)   RETURN VARCHAR2;
  FUNCTION get_payroll_param           RETURN VARCHAR2;
  FUNCTION GET_PARENT_ORG_ID (P_ORG_ID NUMBER,P_ORG_TYPE_CODE VARCHAR2) RETURN NUMBER;
  FUNCTION GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  NUMBER, P_ORG_TYPE_CODE VARCHAR2 ) RETURN VARCHAR2;
  FUNCTION GET_SALARY (P_PERSON_ID NUMBER )    RETURN NUMBER ;
  END XXSC_HR_PKG;
/


CREATE OR REPLACE PACKAGE BODY      XXSC_HR_PKG
--  $Header: XXSC_HR_PKG.pls 12.1 2015/01/21 10:30:06 mrahman noship $
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
-- DRAFT 1A 22-JAN-2015  Mohammed Abdul Rahman    Initial draft version
--************************************************************************
AS
CURSOR  CUR_CHILD_OU_CO_DIV_DEP_SEC( P_CHILD_ORG_ID   NUMBER
                                , P_ORG_TYPE_CODE  VARCHAR2)
IS
  --  ORG_TYPE_CODE = 'BU'   --'10' -- Business Unit -- Company Code
  --  ORG_TYPE_CODE = 'DIV'  --'20' -- Division -- Division Code
  --  ORG_TYPE_CODE = 'DEP'  --'30' -- Department -- Department Code
  --  ORG_TYPE_CODE = 'CC'   --'40'      -- Branch -- Cost Center
  --  ORG_TYPE_CODE = 'BG'  -- Business Group
 SELECT POSE.organization_id_child
      , haou1.name
 FROM  PER_ORG_STRUCTURE_ELEMENTS POSE
     , HR_ALL_ORGANIZATION_UNITS HAOU1
 WHERE
 POSE.ORGANIZATION_ID_CHILD = HAOU1.ORGANIZATION_ID
   AND HAOU1.TYPE =  P_ORG_TYPE_CODE
  --  AND HAOU2.TYPE = '10' -- Company Code
  --  AND HAOU2.TYPE = '20' -- Division Code
  --  AND HAOU2.TYPE = '30' -- Department Code
  --  AND HAOU2.TYPE = '40' -- Section Code
  --  ORG_TYPE_CODE = 'OU' -- Operating Unit
  --  START WITH POSE.organization_id_child= 169
  START WITH POSE.organization_id_child= P_CHILD_ORG_ID
CONNECT BY NOCYCLE PRIOR POSE.organization_id_parent = POSE.organization_id_child;
CURSOR  CUR_PARENT_ORG_ID( P_CHILD_ORG_ID   NUMBER
                          , P_ORG_TYPE_CODE  VARCHAR2)
IS
  --  ORG_TYPE_CODE = '01' -- Company Code
 SELECT POSE.organization_id_parent
      , haou1.name
 FROM  PER_ORG_STRUCTURE_ELEMENTS POSE
     , HR_ALL_ORGANIZATION_UNITS HAOU1
 WHERE
 POSE.ORGANIZATION_ID_parent = HAOU1.ORGANIZATION_ID
 AND HAOU1.TYPE = P_ORG_TYPE_CODE -- Section Code
 START WITH POSE.organization_id_child= P_CHILD_ORG_ID
CONNECT BY NOCYCLE PRIOR POSE.organization_id_parent = POSE.organization_id_child;
CURSOR  CUR_PARENT_CO( P_CHILD_ORG_ID   NUMBER
                          , P_ORG_TYPE_CODE  VARCHAR2)
IS
  --  ORG_TYPE_CODE = '01' -- Company Code
 SELECT POSE.organization_id_child
      , haou1.name
 FROM  PER_ORG_STRUCTURE_ELEMENTS POSE
     , HR_ALL_ORGANIZATION_UNITS HAOU1
 WHERE
 POSE.ORGANIZATION_ID_parent = HAOU1.ORGANIZATION_ID
 AND HAOU1.TYPE = P_ORG_TYPE_CODE -- Section Code
 START WITH POSE.organization_id_parent= P_CHILD_ORG_ID
CONNECT BY NOCYCLE PRIOR POSE.organization_id_parent = POSE.organization_id_child;
 CURSOR CUR_GET_ORG_NAME(  P_ORG_ID NUMBER )
   IS
   SELECT NAME name
     FROM HR_ORGANIZATION_UNITS
     WHERE organization_id = p_org_id;
  CURSOR RG_EMP_CUR( P_PER_ID NUMBER)
    IS
    SELECT  papf.first_name
  || DECODE(papf.first_name,NULL,NULL,' ')
  || papf.last_name NAME
    FROM
    PER_ALL_PEOPLE_F papf
    WHERE papf.PERSON_ID = P_PER_ID
    AND SYSDATE BETWEEN papf.effective_start_date and papf.effective_end_date;
 /*===========================================================================+
 | PROCEDURE get_parent_org_id                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
    FUNCTION get_parent_org_id (P_ORG_ID NUMBER,P_ORG_TYPE_CODE VARCHAR2) RETURN NUMBER
    IS
    lc_org_id number;
    BEGIN
     FOR RG_REC IN CUR_PARENT_ORG_ID(  P_ORG_ID
                                     , P_ORG_TYPE_CODE  )
   LOOP
     lc_org_id := rg_rec.organization_id_parent;
   EXIT WHEN CUR_PARENT_ORG_ID%NOTFOUND;
   END LOOP;
--  END IF;
   RETURN (lc_org_id);
    END;
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
 FUNCTION  GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  NUMBER
                                     , P_ORG_TYPE_CODE VARCHAR2 ) RETURN VARCHAR2
 IS
 lc_name VARCHAR2(240);
 BEGIN
/* IF p_org_type_code IN ('10','30') THEN

   FOR RG_REC IN CUR_PARENT_CO(  P_CHILD_ORG_ID
                              , P_ORG_TYPE_CODE  )
   LOOP
     lc_name := rg_rec.name;
   EXIT WHEN CUR_PARENT_CO%NOTFOUND;
   END LOOP;

 ELSE*/

   FOR RG_REC IN CUR_CHILD_OU_CO_DIV_DEP_SEC(  P_CHILD_ORG_ID
                                            , P_ORG_TYPE_CODE  )
   LOOP
     lc_name := rg_rec.name;
   EXIT WHEN CUR_CHILD_OU_CO_DIV_DEP_SEC%NOTFOUND;
   END LOOP;
--  END IF;
   RETURN (lc_name);

 END GET_PARENT_OU_CO_DIV_DEP_SEC;
--
 /*===========================================================================+
 | FUNCTION write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
  FUNCTION  GET_ORG_NAME (P_ORG_ID  NUMBER) RETURN VARCHAR2
 IS
 lc_name VARCHAR2(240);
 BEGIN
   FOR RG_REC IN CUR_GET_ORG_NAME(  P_ORG_ID )
   LOOP
     lc_name := rg_rec.name;
   EXIT WHEN CUR_GET_ORG_NAME%NOTFOUND;
   END LOOP;
   RETURN (lc_name);
 END;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
  FUNCTION get_company_param   RETURN VARCHAR2
       IS
  lc_company VARCHAR2(240);
  BEGIN
  lc_company:= GET_ORG_NAME (P_ORG_ID => p_bu_org_id);
  RETURN (lc_company);
  END get_company_param;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
-- FUNCTION get_division_param   RETURN VARCHAR2
--       IS
--  lc_division VARCHAR2(240);
--  BEGIN
--  lc_division:= GET_ORG_NAME (P_ORG_ID => p_div_org_id);
--  RETURN (lc_division);
--  END get_division_param;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
  FUNCTION get_department_param          RETURN VARCHAR2
       IS
  lc_department VARCHAR2(240);
  BEGIN
  lc_department:= GET_ORG_NAME (P_ORG_ID => p_dep_org_id);
  RETURN (lc_department);
  END get_department_param;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
-- FUNCTION get_section_param           RETURN VARCHAR2
--       IS
--  lc_section VARCHAR2(240);
--  BEGIN
--  lc_section:= GET_ORG_NAME (P_ORG_ID => p_cc_org_id);
--  RETURN (lc_section);
--  END get_section_param;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
  FUNCTION get_employee_param           RETURN VARCHAR2
  IS
  lc_emp_name VARCHAR2(240);
  BEGIN
  FOR RG_REC IN RG_EMP_CUR(p_person_id)
    LOOP
      lc_emp_name:= RG_REC.name;
      EXIT WHEN RG_EMP_CUR%NOTFOUND;
    END LOOP;

  RETURN (lc_emp_name);
  END GET_EMPLOYEE_PARAM;
   /*===========================================================================+
 | PROCEDURE get_payroll_param                                            |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Returns Payroll Name          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
  FUNCTION get_payroll_param           RETURN VARCHAR2
  IS
  LC_PAYROLL_NAME VARCHAR2(240);
  CURSOR CUR_PAYROLL (P_PAYROLL_ID number) IS
  SELECT PAYROLL_NAME NAME FROM PAY_PAYROLLS_F
  where payroll_id = P_PAYROLL_ID;
  BEGIN
  FOR RG_REC IN CUR_PAYROLL(p_payroll_id)
    LOOP
      LC_PAYROLL_NAME:= RG_REC.name;
      EXIT WHEN CUR_PAYROLL%NOTFOUND;
    END LOOP;
  RETURN (LC_PAYROLL_NAME);
  END get_payroll_param ;
   /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
 FUNCTION  GET_PARENT_ORG (  P_CHILD_ORG_ID  NUMBER
                                     , P_ORG_TYPE_CODE VARCHAR2 ) RETURN VARCHAR2
 IS
 lc_name VARCHAR2(240);
 BEGIN
 --IF p_org_type_code IN ('10','30') THEN

   FOR RG_REC IN CUR_PARENT_CO(  P_CHILD_ORG_ID
                              , P_ORG_TYPE_CODE  )
   LOOP
     lc_name := rg_rec.name;
   EXIT WHEN CUR_PARENT_CO%NOTFOUND;
   END LOOP;
 /*
-- ELSE

   FOR RG_REC IN CUR_CHILD_OU_CO_DIV_DEP_SEC(  P_CHILD_ORG_ID
                                            , P_ORG_TYPE_CODE  )
   LOOP
     lc_name := rg_rec.name;
   EXIT WHEN CUR_CHILD_OU_CO_DIV_DEP_SEC%NOTFOUND;
   END LOOP;*/
 -- END IF;
   RETURN (lc_name);

 END GET_PARENT_ORG;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
 /*FUNCTION get_company (ORG_ID NUMBER)          RETURN VARCHAR2
       IS
  lc_company VARCHAR2(240);
  BEGIN
  lc_company:= NVL( GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  => ORG_ID
                                         , P_ORG_TYPE_CODE =>'30' )
                   ,GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  => ORG_ID
                                         , P_ORG_TYPE_CODE =>'10' )
                    );
  RETURN (lc_company);
  END get_company;
  */
   FUNCTION get_business_unit (ORG_ID NUMBER)          RETURN VARCHAR2
       IS
  lc_company VARCHAR2(240);
  BEGIN
  lc_company:= NVL(  GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  => ORG_ID
                                         , P_ORG_TYPE_CODE =>'20') --Company/ Businesss Unit )
                         , GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  => ORG_ID
                                         , P_ORG_TYPE_CODE =>'10') --Department)
                    );
  RETURN (lc_company);
  END get_business_unit;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
-- FUNCTION get_division  (ORG_ID NUMBER)          RETURN VARCHAR2
--       IS
--  lc_division VARCHAR2(240);
--  BEGIN
--  lc_division:= GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  => ORG_ID
--                                         , P_ORG_TYPE_CODE =>'DIV' );
--  RETURN (lc_division);
--  END get_division;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
  FUNCTION get_department (ORG_ID NUMBER)          RETURN VARCHAR2
       IS
  lc_department VARCHAR2(240);
  BEGIN
  lc_department:= GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  => ORG_ID
                                            , P_ORG_TYPE_CODE =>'10' );
  RETURN (lc_department);
  END get_department;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
-- FUNCTION get_cost_centre (ORG_ID NUMBER)          RETURN VARCHAR2
--       IS
--  lc_section VARCHAR2(240);
--  BEGIN
--  lc_section:= GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  => ORG_ID
--                                             , P_ORG_TYPE_CODE =>'CC' );
--
--  RETURN (lc_section);
--  END get_cost_centre;

 FUNCTION get_project (ORG_ID NUMBER)          RETURN VARCHAR2
       IS
  lc_project VARCHAR2(240);
  BEGIN
  lc_project:= GET_PARENT_OU_CO_DIV_DEP_SEC (  P_CHILD_ORG_ID  => ORG_ID
                                             , P_ORG_TYPE_CODE =>'70' );
  RETURN (lc_project);
  END get_project;
--
 /*===========================================================================+
 | PROCEDURE write_debug_and_log                                             |
 |    	                                                                     |
 | DESCRIPTION                                                               |
 |    Writes standard messages to standard debugging and to the log          |
 |                                                                           |
 | SCOPE - PUBLIC                                                            |
 |                                                                           |
 | EXETERNAL PROCEDURES/FUNCTIONS ACCESSED                                   |
 |    arp_util.debug                                                         |
 |                                                                           |
 | ARGUMENTS  : IN:  p_message - Message to be writted                       |
 |                                                                           |
 | RETURNS    : NONE                                                         |
 |                                                                           |
 +===========================================================================*/
PROCEDURE write_debug_and_log(p_message IN VARCHAR2) IS



BEGIN

 /*------------------------------------------------+
  | Write the message to log and to the standard   |
  | debugging channel                              |
  +------------------------------------------------*/
  IF FND_GLOBAL.CONC_REQUEST_ID is not null THEN

   /*------------------------------------------------+
    | Only write to the log if call was made from    |
    | concurrent program.                            |
    +------------------------------------------------*/
    fnd_file.put_line(FND_FILE.LOG,p_message);
    FND_FILE.PUT_LINE(FND_FILE.OUTPUT,p_message);

  END IF;


EXCEPTION
  WHEN others THEN
   /*-------------------------------------------------------+
    | Error writing to the log, nothing we can do about it. |
    | Error is not raised since API messages also contain   |
    | non fatal warnings. If a real exception happened it   |
    | is handled on the calling routine.                    |
    +-------------------------------------------------------*/
    NULL;

END write_debug_and_log;
--
--*************************************************************************
--
-- PROCEDURE get_operating_unit
--
--
-- DESCRIPTION
--   returns operating unit
--************************************************************************
  FUNCTION get_operating_unit RETURN VARCHAR2
  IS
  lc_proc      CONSTANT    VARCHAR2(60) := 'cle_get_operating_unit'; -- as per Bug 19960
  lc_xx_operating_unit  VARCHAR2(100);
  /*CURSOR lcr_org_name IS   SELECT name
                           FROM HR_OPERATING_UNITS
                           WHERE organization_id=FND_PROFILE.VALUE('ORG_ID');*/
  BEGIN
   /* OPEN lcr_org_name;
      LOOP
        FETCH lcr_org_name INTO lc_xx_operating_unit ;
        EXIT WHEN lcr_org_name%NOTFOUND OR lcr_org_name%NOTFOUND IS NULL;
      END LOOP;
    CLOSE lcr_org_name;
    RETURN  NVL(lc_xx_operating_unit,'');*/
    RETURN  ('');
  END get_operating_unit;
--
--*************************************************************************
--
-- PROCEDURE cle_get_current_date
--
--
-- DESCRIPTION
--   returns current date
--************************************************************************
  FUNCTION get_current_date RETURN VARCHAR2
  IS
  lc_proc      CONSTANT    VARCHAR2(60) := 'cle_get_current_date'; -- as per Bug 19960
  BEGIN
    RETURN fnd_date.date_to_charDT(sysdate);
  END get_current_date;
--
-- +======================================================================+
-- Name: BEFORE_REPORT
--
-- Description: This function is called as a before report trigger by the
--              data template. It calls cle_main Function which populates the data
--              in the PIPED table TYPE cle_f006_inv_tp
--              and creates the  data template  queries(lexical reference).
--
-- Parameters:   None
-- +======================================================================+
--
  FUNCTION beforereport RETURN BOOLEAN
  IS
    lc_set_status VARCHAR2(100);
   BEGIN
   IF   P_EMP_OR_EX ='EX' THEN
   P_EMP_OR_EX_SQL :=' AND  PAPf.effective_end_date <> to_date(''31/12/4712'', ''DD/MM/YYYY'')  ';
   ELSIF   P_EMP_OR_EX ='EMP' THEN
   P_EMP_OR_EX_SQL :=' AND  PAPf.effective_end_date =  to_date(''31/12/4712'', ''DD/MM/YYYY'')   ';
   ELSE P_EMP_OR_EX_SQL := ' AND  1=1 ';
   END IF;
    RETURN (TRUE);
  EXCEPTION
  WHEN OTHERS THEN
    write_debug_and_log('EXCEPTION' || SQLERRM || SQLCODE);
    RETURN (FALSE);
  END beforereport;
--
-- +======================================================================+
-- Name: AFTER_REPORT
--
-- Description: This function is called as a after report trigger by the
--              data template. This programs executes only when
--              A. if no invalid invoice exists
--              B. value of corresponding profile is set to yes
--              and then the program submits request
--              to run subsequent reports required by the Extract.
--              The XXRG_HR_PKG Data extract does not have any implementaions
--              with the AFTER_REPORT trigger.However the Procedure is
--              defined to allow the further customizations.
-- Parameters:   None
-- +======================================================================+
--
  FUNCTION afterreport  RETURN BOOLEAN
  IS
    ln_xx_conc_req_id number;
    l_org_id    NUMBER        := FND_PROFILE.VALUE('ORG_ID');
  BEGIN
    RETURN (TRUE);
  EXCEPTION
    WHEN OTHERS THEN
      write_debug_and_log('EXCEPTION' || SQLERRM || SQLCODE);
      RETURN (FALSE);
  END afterreport;
    FUNCTION P_EMP_OR_EX_SQL_formula             RETURN VARCHAR2 IS
	 BEGIN
   IF P_EMP_OR_EX IS NOT NULL AND  P_EMP_OR_EX ='EX' THEN
   P_EMP_OR_EX_SQL :=' AND  PAPf.effective_end_date IS NOT NULL ';
   ELSIF P_EMP_OR_EX IS NOT NULL AND  P_EMP_OR_EX ='EMP' THEN
   P_EMP_OR_EX_SQL :=' AND PAPf.effective_end_date IS NULL ';
   ELSE P_EMP_OR_EX_SQL := ' AND  1=1';
   END IF;
	 RETURN NVL(P_EMP_OR_EX_SQL,' AND  1=1  ');
	 END;
--
-- +======================================================================+
-- Name: XXSC_GET_SALARY
--
-- Description: This function is called in Employee Consolidated Report for salary for an employee on current date, runs only for active employees
--              The XXRG_HR_PKG Data extract does not have any implementaions
--              with the AFTER_REPORT trigger.However the Procedure is
--              defined to allow the further customizations.
-- Parameters:   P_PERSON_ID joins per_all_people_f person_id
-- +======================================================================+
--
    FUNCTION GET_SALARY (P_PERSON_ID NUMBER )
    RETURN NUMBER
    IS
    CURSOR XXSC_EMP_CUR (LP_PERSON_ID NUMBER) IS
    SELECT papf.employee_number
    ,papf.full_name
    ,ppp.proposed_salary_n salary
    FROM
    PER_ASSIGNMENTS_F PAAF
    , PER_PEOPLE_F PAPF
    , per_pay_proposals ppp
    WHERE PAAF.PERSON_ID = PAPF.PERSON_ID
    AND PPP.ASSIGNMENT_ID= PAAF.ASSIGNMENT_ID
    AND SYSDATE BETWEEN papf.effective_start_date AND papf.effective_end_date
    AND SYSDATE BETWEEN PAAF.EFFECTIVE_START_DATE AND PAAF.EFFECTIVE_END_DATE
    AND papf.current_employee_flag = 'Y'
    AND PAAF.ASSIGNMENT_STATUS_TYPE_ID = 1
    AND PAPF.EMPLOYEE_NUMBER IS NOT NULL
    AND PAPF.PERSON_ID = LP_PERSON_ID;
    LN_SALARY NUMBER;
    BEGIN
    FOR XXSC_EMP_REC IN XXSC_EMP_CUR (P_PERSON_ID)
      LOOP
        LN_SALARY :=XXSC_EMP_REC.SALARY;
      END LOOP;
    RETURN (NVL(LN_SALARY,0));
    END GET_SALARY;
    --
-- +======================================================================+
-- Name: GET_OPERATING_UNIT_PARAM
--
-- Description: This function is called in Employee Consolidated Report for salary for an employee on current date, runs only for active employees
--              The XXRG_HR_PKG Data extract does not have any implementaions
--              with the AFTER_REPORT trigger.However the Procedure is
--              defined to allow the further customizations.
-- Parameters:   P_PERSON_ID joins per_all_people_f person_id
-- +======================================================================+
--
 FUNCTION get_operating_unit_param   RETURN VARCHAR2
       IS
  LC_COMPANY VARCHAR2(240);
  CURSOR XXSC_CUR (P_OU_ORG_ID VARCHAR2) IS
  SELECT DESCRIPTION COMPANY
  FROM FND_FLEX_VALUES_VL
  WHERE FLEX_VALUE_SET_ID = 1016227
  AND FLEX_VALUE_MEANING = P_OU_ORG_ID;
  BEGIN
     FOR XXSC_REC IN XXSC_CUR (P_OU_ORG_ID=>P_EMP_OR_EX)
        LOOP
          lc_company:= XXSC_REC.COMPANY;
        END LOOP;
--  lc_company:= GET_ORG_NAME (P_ORG_ID => p_bu_org_id);
  RETURN (LC_COMPANY);
  END get_operating_unit_param;
END XXSC_HR_PKG;
/
