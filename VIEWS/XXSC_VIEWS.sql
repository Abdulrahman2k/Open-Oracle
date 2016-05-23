--------------------------------------------------------
--  DDL for View XXSC_AP_APPR_ADM_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_AP_APPR_ADM_V" ("ADM_ROWID", "ADMIN_ID", "HEADER_ID", "LEVEL_CODE", "LEVEL_NAME", "APPROVAL_ID", "APPROVER_NAME", "USER_ID", "USER_NAME", "START_DATE", "END_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT X.ROWID ADM_ROWID,
    X.ADMIN_ID,
    X.HEADER_ID,
    X.LEVEL_CODE ,
    (SELECT MEANING
    FROM FND_LOOKUP_VALUES_VL A
    WHERE LOOKUP_TYPE = 'XXSC_APPROVAL_LEVELS'
    AND A.LOOKUP_CODE = X.LEVEL_CODE
    ) LEVEL_NAME,
    X.APPROVAL_ID,
    (SELECT FULL_NAME
    FROM PER_ALL_PEOPLE_F
    WHERE PERSON_ID=X.APPROVAL_ID
    AND TRUNC (SYSDATE) BETWEEN EFFECTIVE_START_DATE AND NVL (EFFECTIVE_END_DATE, '01-JAN-4712')
    ) APPROVER_NAME,
    X.USER_ID,
    (SELECT USER_NAME FROM FND_USER WHERE USER_ID=X.USER_ID
    ) USER_NAME,
    X.START_DATE,
    X.END_DATE,
    X.CREATION_DATE,
    X.CREATED_BY,
    X.LAST_UPDATE_DATE,
    X.LAST_UPDATED_BY,
    X.LAST_UPDATE_LOGIN
  FROM XXSC_AP_APPR_ADM_T X;
--------------------------------------------------------
--  DDL for View XXSC_AP_APPR_DEPH_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_AP_APPR_DEPH_V" ("DEPH_ROWID", "DEPH_ID", "HEADER_ID", "DEPT_CODE", "DEPT_CODE_NAME", "DESCRIPTION", "APPROVER_ID", "APPR_USER_ID", "APPROVER_NAME", "APPROVER_NO", "APPR_USER_NAME", "CFO_EMP_ID", "CFO_USER_ID", "CFO_NAME", "CFO_EMP_NO", "CFO_USER_NAME", "START_DATE", "END_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT X.ROWID DEPH_ROWID,
    X.DEPH_ID,
    X.HEADER_ID,
    X.DEPT_CODE ,
    (SELECT SEGMENT_NAME
    FROM XXGL_FLEXFIELD_V
    WHERE SEGMENT_NUM=3
    AND FLEX_VALUE   =X.DEPT_CODE
    ) DEPT_CODE_NAME,
    (SELECT DESCRIPTION
    FROM XXGL_FLEXFIELD_V
    WHERE SEGMENT_NUM=3
    AND FLEX_VALUE   =X.DEPT_CODE
    ) DESCRIPTION,
    X.APPROVER_ID,
    X.APPR_USER_ID,
    (SELECT EMPLOYEE_NAME FROM XXSC_HR_POINFO_V WHERE EMPLOYEE_ID=X.APPROVER_ID
    ) APPROVER_NAME,
    (SELECT EMPLOYEE_NUMBER FROM XXSC_HR_POINFO_V WHERE EMPLOYEE_ID=X.APPROVER_ID
    ) APPROVER_NO,
    (SELECT USER_NAME FROM FND_USER WHERE USER_ID=X.APPR_USER_ID
    ) APPR_USER_NAME,
    X.CFO_EMP_ID ,
    X.CFO_USER_ID,
    (SELECT EMPLOYEE_NAME FROM XXSC_HR_POINFO_V WHERE employee_id=X.CFO_EMP_ID
    ) CFO_NAME,
    (SELECT EMPLOYEE_NUMBER FROM XXSC_HR_POINFO_V WHERE EMPLOYEE_ID=X.CFO_EMP_ID
    ) CFO_EMP_NO,
    (SELECT USER_NAME FROM FND_USER WHERE USER_ID=X.CFO_USER_ID
    ) CFO_USER_NAME,
    X.START_DATE,
    X.END_DATE,
    X.CREATION_DATE,
    X.CREATED_BY,
    X.LAST_UPDATE_DATE,
    X.LAST_UPDATED_BY,
    X.LAST_UPDATE_LOGIN
  FROM XXSC_AP_APPR_DEPH_T X;
--------------------------------------------------------
--  DDL for View XXSC_AP_APPR_FIN_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_AP_APPR_FIN_V" ("FIN_ROWID", "FIN_ID", "HEADER_ID", "LEVEL_CODE", "LEVEL_NAME", "APPROVAL_ID", "APPROVER_NAME", "USER_ID", "USER_NAME", "START_DATE", "END_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT X.ROWID FIN_ROWID,
    X.FIN_ID,
    X.HEADER_ID,
    X.LEVEL_CODE ,
    (SELECT MEANING
    FROM FND_LOOKUP_VALUES_VL A
    WHERE LOOKUP_TYPE = 'XXSC_APPROVAL_LEVELS'
    AND A.LOOKUP_CODE = X.LEVEL_CODE
    ) LEVEL_NAME,
    X.APPROVAL_ID,
    (SELECT FULL_NAME
    FROM PER_ALL_PEOPLE_F
    WHERE PERSON_ID=X.APPROVAL_ID
    AND TRUNC (SYSDATE) BETWEEN EFFECTIVE_START_DATE AND NVL (EFFECTIVE_END_DATE, '01-JAN-4712')
    ) APPROVER_NAME ,
    X.USER_ID,
    (SELECT USER_NAME FROM FND_USER WHERE USER_ID=X.USER_ID
    ) USER_NAME,
    X.START_DATE,
    X.END_DATE,
    X.CREATION_DATE,
    X.CREATED_BY,
    X.LAST_UPDATE_DATE,
    X.LAST_UPDATED_BY,
    X.LAST_UPDATE_LOGIN
  FROM XXSC_AP_APPR_FIN_T X;
--------------------------------------------------------
--  DDL for View XXSC_AP_APPR_HDR_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_AP_APPR_HDR_V" ("HDR_ROWID", "HEADER_ID", "LEDGER_ID", "LEDGER_NAME", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT X.ROWID HDR_ROWID,
    X.HEADER_ID,
    X.LEDGER_ID,
    (SELECT NAME FROM GL_LEDGERS A WHERE LEDGER_ID = X.LEDGER_ID
    ) LEDGER_NAME,
    X.CREATION_DATE,
    X.CREATED_BY,
    X.LAST_UPDATE_DATE,
    X.LAST_UPDATED_BY,
    X.LAST_UPDATE_LOGIN
  FROM XXSC_AP_APPR_HDR_T X;
--------------------------------------------------------
--  DDL for View XXSC_AP_APPR_LNE_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_AP_APPR_LNE_V" ("LINE_ROWID", "LINE_ID", "HEADER_ID", "LEVEL_CODE", "LEVEL_NAME", "APPROVAL_TYPE_CODE", "APPROVAL_TYPE_NAME", "START_DATE", "END_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT X.ROWID LINE_ROWID,
    X.LINE_ID,
    X.HEADER_ID,
    X.LEVEL_CODE ,
    (SELECT MEANING
    FROM FND_LOOKUP_VALUES_VL A
    WHERE LOOKUP_TYPE = 'XXSC_LEVEL_TYPES'
    AND A.LOOKUP_CODE = X.LEVEL_CODE
    ) LEVEL_NAME,
    X.APPROVAL_TYPE_CODE ,
    (SELECT MEANING
    FROM FND_LOOKUP_VALUES_VL A
    WHERE LOOKUP_TYPE = 'XXSC_APPROVAL_TYPES'
    AND A.LOOKUP_CODE = X.APPROVAL_TYPE_CODE
    ) APPROVAL_TYPE_NAME,
    X.START_DATE,
    X.END_DATE,
    X.CREATION_DATE,
    X.CREATED_BY,
    X.LAST_UPDATE_DATE,
    X.LAST_UPDATED_BY,
    X.LAST_UPDATE_LOGIN
  from XXSC_AP_APPR_LNE_T X;
--------------------------------------------------------
--  DDL for View XXSC_AP_APPR_MANG_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_AP_APPR_MANG_V" ("MANG_ROWID", "MANG_ID", "HEADER_ID", "EMPLOYEE_ID", "EMP_USER_ID", "DEPT_EMP_ID", "DEPT_USER_ID", "EMPLOYEE_NAME", "EMPLOYEE_NO", "DEPARTMENT", "EMP_USER_NAME", "DEPT_HEAD", "DEPT_EMPLOYEE_NO", "DEPT_USER_NAME", "APPROVAL_FLAG", "START_DATE", "END_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT X.ROWID MANG_ROWID,
    X.MANG_ID,
    X.HEADER_ID,
    X.EMPLOYEE_ID ,
    X.EMP_USER_ID,
    X.DEPT_EMP_ID ,
    X.DEPT_USER_ID,
    (SELECT EMPLOYEE_NAME FROM XXSC_HR_POINFO_V WHERE employee_id=X.EMPLOYEe_ID
    ) EMPLOYEE_NAME,
    (SELECT EMPLOYEE_NUMBER FROM XXSC_HR_POINFO_V WHERE employee_id=X.EMPLOYEe_ID
    ) EMPLOYEE_NO,
    (SELECT EMP_DEPARTMENT FROM XXSC_HR_POINFO_V WHERE EMPLOYEE_ID=X.EMPLOYEE_ID
    ) DEPARTMENT,
    (SELECT USER_NAME FROM FND_USER WHERE USER_ID=X.EMP_USER_ID
    ) EMP_USER_NAME,
    (SELECT EMPLOYEE_NAME FROM XXSC_HR_POINFO_V WHERE employee_id=X.DEPT_EMP_ID
    ) DEPT_HEAD,
    (SELECT EMPLOYEE_NUMBER FROM XXSC_HR_POINFO_V WHERE employee_id=X.DEPT_EMP_ID
    ) DEPT_EMPLOYEE_NO,
    (SELECT USER_NAME FROM FND_USER WHERE USER_ID=X.DEPT_USER_ID
    ) DEPT_USER_NAME,
    X.APPROVAL_FLAG ,
    X.START_DATE,
    X.END_DATE,
    X.CREATION_DATE,
    X.CREATED_BY,
    X.LAST_UPDATE_DATE,
    X.LAST_UPDATED_BY,
    X.LAST_UPDATE_LOGIN
  FROM XXSC_AP_APPR_MANG_T X;
--------------------------------------------------------
--  DDL for View XXSC_AP_DEF_REV_EXP_HDR_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_AP_DEF_REV_EXP_HDR_V" ("ROW_ID", "HEADER_ID", "OPERATING_UNIT", "DOC_SEQUENCE_VALUE", "OU_ID", "VENDOR_ID", "VENDOR_NUMBER", "VENDOR_NAME", "VENDOR_SITE_ID", "VENDOR_SITE_CODE", "VOUCHER_NUMBER", "PRE_PAID_ACCT_ID", "PREPAID_ACCOUNT", "TYPE", "EXPENSE_ACCT_ID", "EXPENSE_ACCOUNT", "DISTRIBUTION_SET_ID", "DISTRIBUTION_SET_NAME", "INVOICE_NUM", "INV_LINE_NUMBER", "INVOICE_DATE", "GL_DATE", "CURRENCY_CODE", "INV_AMOUNT", "FUNCTIONAL_AMOUNT", "SET_OF_BOOKS_ID", "ORG_ID", "INVOICE_ID", "DIST_CODE_COMBINATION_ID", "INVOICE_DISTRIBUTION_ID", "DISTRIBUTION_LINE_NUMBER", "REVERSE_STATUS", "FIRST_SCHEDULE_DATE", "NO_OF_TIMES", "RULE", "STATUS", "DESCRIPTION", "CREATED_BY", "CREATION_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATE_LOGIN", "TERMINATE_DATE", "TERMINATE_FLAG", "CANCEL_FLAG", "DOC_TYPE_CODE", "DOCUMENT_TYPE", "SOURCE_TYPE_CODE", "CLOSE_FLAG", "REVERSAL_FLAG", "PROJECT_ID", "EXPENDITURE_TYPE_ID", "TASK_ID", "PROJECT_NO", "EXPENDITURE_TYPE", "TASK_NO") AS 
  SELECT x.ROWID row_id, x.header_id, e.NAME operating_unit,
          doc_sequence_value, a.org_id ou_id, c.vendor_id,
          c.segment1 vendor_number, c.vendor_name vendor_name,
          d.vendor_site_id, d.vendor_site_code,
          a.doc_sequence_value voucher_number,
          b.dist_code_combination_id pre_paid_acct_id,
          xxsc_ap_def_rev_exp_pkg.xxgl_comb
                                  (b.dist_code_combination_id)
                                                              prepaid_account,
          x.TYPE, expense_acct_id,
          xxsc_ap_def_rev_exp_pkg.xxgl_comb
                                           (x.expense_acct_id)
                                                              expense_account,
          x.distribution_set_id,
          (SELECT distribution_set_name
             FROM ap_distribution_sets_all
            WHERE distribution_set_id =
                                  x.distribution_set_id)
                                                        distribution_set_name,
             a.invoice_num
          || '-'
          || inv_line_number
          || '-'
          || b.distribution_line_number invoice_num,
          inv_line_number, a.invoice_date, b.accounting_date gl_date,
          a.invoice_currency_code currency_code, b.amount inv_amount,
          NVL (b.base_amount, b.amount) functional_amount, a.set_of_books_id,
          a.org_id, a.invoice_id, b.dist_code_combination_id,
          b.invoice_distribution_id, b.distribution_line_number,
          DECODE (NVL (b.reversal_flag, 'X'),
                  'Y', 'Reversed',
                  NULL
                 ) reverse_status,
          x.first_schedule_date, x.no_of_times, x.rule, x.status,
          x.description, x.created_by, x.creation_date, x.last_updated_by,
          x.last_update_date, x.last_update_login, x.terminate_date,
          x.terminate_flag, x.cancel_flag, x.doc_type_code,
          (SELECT DISTINCT meaning
                      FROM fnd_lookup_values
                     WHERE lookup_type = 'XXAP_EREX_DOC_TYPE'
                       AND lookup_code = x.doc_type_code
                       AND NVL (enabled_flag, 'N') = 'Y'
                       AND end_date_active IS NULL) document_type,
          x.source_type_code, x.close_flag, b.reversal_flag, x.project_id,
          x.expenditure_type_id, x.task_id,
          (SELECT ppa.segment1
             FROM pa_projects_all ppa
            WHERE ppa.org_id = x.org_id
              AND NVL (ppa.enabled_flag, 'N') = 'Y'
              AND ppa.project_status_code = 'APPROVED'
              AND ppa.project_id = x.project_id) project_no,
          (SELECT pet.expenditure_type
             FROM pa_expenditure_types pet
            WHERE expenditure_type_id =
                                       x.expenditure_type_id)
                                                             expenditure_type,
          (SELECT pt.task_number
             FROM pa_tasks pt
            WHERE pt.project_id = x.project_id
              AND pt.task_id = x.task_id) task_no
     FROM ap_invoices_all a,
          ap_invoice_lines_all ail,
          ap_invoice_distributions_all b,
          xxsc_ap_def_rev_exp_hdr_t x,
          hr_operating_units e,
          ap_suppliers c,
          ap_supplier_sites_all d
    WHERE a.invoice_id = x.invoice_id
      -- AND a.invoice_type_lookup_code IN ('STANDARD')
      AND a.invoice_type_lookup_code IN ('STANDARD', 'MIXED', 'CREDIT')
      AND a.invoice_id = ail.invoice_id
      AND b.invoice_id = ail.invoice_id
      AND ail.line_number = b.invoice_line_number
      AND b.distribution_line_number = x.distribution_line_number
      AND b.dist_code_combination_id = x.dist_code_combination_id
      AND ail.line_number = x.inv_line_number
      AND a.org_id = e.organization_id
      AND a.vendor_id = c.vendor_id
      AND d.vendor_id = c.vendor_id
      AND d.vendor_site_id = x.vendor_site_id
      --  AND NVL (b.posted_flag, 'N') = 'Y'
      --  AND NVL (b.reversal_flag, 'X') <> 'Y'
      --  AND NVL (a.attribute11, 'X') = 'Amortize'
      AND x.source_type_code = 'PAYABLE'
   UNION
   SELECT xdef.ROWID row_id, xdef.header_id,
          (SELECT DISTINCT NAME
                      FROM hr_operating_units
                     WHERE organization_id = xdef.org_id) operating_unit,
          NULL doc_sequence_value, xdef.org_id ou_id, xdef.vendor_id,
          (SELECT DISTINCT segment1
                      FROM ap_suppliers
                     WHERE vendor_id = xdef.vendor_id) vendor_number,
          (SELECT DISTINCT vendor_name
                      FROM ap_suppliers
                     WHERE vendor_id = xdef.vendor_id) vendor_name,
          xdef.vendor_site_id,
          (SELECT DISTINCT vendor_site_code
                      FROM ap_supplier_sites_all
                     WHERE vendor_id = xdef.vendor_id
                       AND vendor_site_id = xdef.vendor_site_id)
                                                             vendor_site_code,
          NULL voucher_number, xdef.pre_paid_acct_id,
          xxsc_ap_def_rev_exp_pkg.xxgl_comb
                                       (xdef.pre_paid_acct_id)
                                                              prepaid_account,
          xdef.TYPE, expense_acct_id,
          xxsc_ap_def_rev_exp_pkg.xxgl_comb
                                        (xdef.expense_acct_id)
                                                              expense_account,
          xdef.distribution_set_id,
          (SELECT distribution_set_name
             FROM ap_distribution_sets_all
            WHERE distribution_set_id =
                               xdef.distribution_set_id)
                                                        distribution_set_name,
          xdef.invoice_num, NULL inv_line_number, xdef.invoice_date,
          xdef.gl_date gl_date, xdef.currency_code, xdef.inv_amount,
          xdef.functional_amount, NULL set_of_books_id, xdef.org_id,
          xdef.invoice_id, xdef.dist_code_combination_id,
          xdef.invoice_distribution_id, xdef.distribution_line_number,
          DECODE (NVL (xdef.reversal_flag, 'X'),
                  'Y', 'Reversed',
                  NULL
                 ) reverse_status,
          xdef.first_schedule_date, xdef.no_of_times, xdef.rule, xdef.status,
          xdef.description, xdef.created_by, xdef.creation_date,
          xdef.last_updated_by, xdef.last_update_date, xdef.last_update_login,
          xdef.terminate_date, xdef.terminate_flag, xdef.cancel_flag,
          xdef.doc_type_code,
          (SELECT DISTINCT meaning
                      FROM fnd_lookup_values
                     WHERE lookup_type = 'XXAP_EREX_DOC_TYPE'
                       AND lookup_code = xdef.doc_type_code
                       AND NVL (enabled_flag, 'N') = 'Y'
                       AND end_date_active IS NULL) document_type,
          xdef.source_type_code, xdef.close_flag,
          NVL (xdef.reversal_flag, 'N') reversal_flag, xdef.project_id,
          xdef.expenditure_type_id, xdef.task_id,
          (SELECT ppa.segment1
             FROM pa_projects_all ppa
            WHERE ppa.org_id = xdef.org_id
              AND NVL (ppa.enabled_flag, 'N') = 'Y'
              AND ppa.project_status_code = 'APPROVED'
              AND ppa.project_id = xdef.project_id) project_no,
          (SELECT pet.expenditure_type
             FROM pa_expenditure_types pet
            WHERE expenditure_type_id =
                                    xdef.expenditure_type_id)
                                                             expenditure_type,
          (SELECT pt.task_number
             FROM pa_tasks pt
            WHERE pt.project_id = xdef.project_id
              AND pt.task_id = xdef.task_id) task_no
     FROM xxsc_ap_def_rev_exp_hdr_t xdef
    WHERE source_type_code = 'OTHER' ;
--------------------------------------------------------
--  DDL for View XXSC_AP_DEF_REV_EXP_LINES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_AP_DEF_REV_EXP_LINES_V" ("LINE_ROWID", "HEADER_ID", "LINE_ID", "LINE_NUMBER", "JOURNAL_DATE", "AMOUNT", "XFER_GL", "XFER_PA", "GL_TRANSFER_DATE", "DESCRIPTION", "JOURNAL_BATCH_NAME", "CREATED_BY", "CREATION_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATE_LOGIN", "TERMINATE_FLAG", "CANCEL_FLAG", "TERMINATE_DATE", "JE_HEADER_ID", "JE_JOURNAL_DATE", "GL_REVERSE_FLAG", "REV_JE_HEADER_ID", "JOURNAL_NAME", "GL_REVERSE_DATE", "PROJECT_ID", "EXPENDITURE_TYPE_ID", "TASK_ID", "PROJECT_NO", "EXPENDITURE_TYPE", "TASK_NO", "ORG_ID", "PROJ_INTERFACE_FLAG", "PROJ_REVERSE_FLAG") AS 
  SELECT ROWID line_rowid, l.header_id, l.line_id, l.line_number,
          l.journal_date, l.amount, l.xfer_gl, l.proj_interface_flag,
          l.gl_transfer_date, l.description, l.journal_batch_name,
          l.created_by, l.creation_date, l.last_updated_by,
          l.last_update_date, l.last_update_login, l.terminate_flag,
          l.cancel_flag, l.terminate_date, l.je_header_id, l.je_journal_date,
          l.gl_reverse_flag, l.rev_je_header_id, l.journal_name,
          l.gl_reverse_date, l.project_id, l.expenditure_type_id, l.task_id,
          (SELECT ppa.segment1
             FROM pa_projects_all ppa
            WHERE ppa.org_id = l.org_id
              AND NVL (ppa.enabled_flag, 'N') = 'Y'
              AND ppa.project_status_code = 'APPROVED'
              AND ppa.project_id = l.project_id) project_no,
          (SELECT pet.expenditure_type
             FROM pa_expenditure_types pet
            WHERE expenditure_type_id =
                                       l.expenditure_type_id)
                                                             expenditure_type,
          (SELECT pt.task_number
             FROM pa_tasks pt
            WHERE pt.project_id = l.project_id
              AND pt.task_id = l.task_id) task_no,
          l.org_id, l.proj_interface_flag, l.proj_reverse_flag
     FROM xxsc_ap_def_rev_exp_lines_t l ;
--------------------------------------------------------
--  DDL for View XXSC_CC_SETUP_DETAILS_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_CC_SETUP_DETAILS_V" ("DETAIL_ROWID", "HEADER_ID", "LINE_ID", "DETAIL_ID", "EMPLOYEE_ID", "EMP_NUMBER", "EMP_NAME", "EMP_DEPT", "START_DATE", "END_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT d.ROWID detail_rowid,
          d.header_id,
          d.line_id,
          d.detail_id,
          d.employee_id,
          (SELECT employee_number FROM XXSC_HR_POINFO_V where employee_id=d.employee_id) Emp_number,
          (SELECT employee_name FROM XXSC_HR_POINFO_V where employee_id=d.employee_id) Emp_name,
          (SELECT emp_department FROM XXSC_HR_POINFO_V where employee_id=d.employee_id) Emp_dept,
          d.Start_Date,        
          d.End_Date,
          d.creation_date,
          d.created_by,
          d.last_update_date,
          d.last_updated_by,
          d.last_update_login 
        FROM XXSC_CC_SETUP_details_t d;
--------------------------------------------------------
--  DDL for View XXSC_CC_SETUP_HDR_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_CC_SETUP_HDR_V" ("HDR_ROWID", "HEADER_ID", "LEDGER_ID", "LEDGER_NAME", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT h.ROWID hdr_rowid,
    h.header_id,
    h.ledger_id,
    (select name from gl_ledgers where ledger_id=h.ledger_id) Ledger_name,
    h.creation_date,
    h.created_by,
    h.last_update_date,
    h.last_updated_by,
    h.last_update_login       
  FROM XXSC_CC_SETUP_HDR_t h;
--------------------------------------------------------
--  DDL for View XXSC_CC_SETUP_LINES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_CC_SETUP_LINES_V" ("LINE_ROWID", "HEADER_ID", "LINE_ID", "CARD_CLEARING_CODE", "CREDIT_CARD_ISSUER", "CARD_TYPE_CODE", "CREDIT_CARD_TYPE", "CREDIT_CARD_NUMBER", "CARD_HOLDER_NAME", "CREDIT_CARD_NO", "CARD_CLEARING_ACCID", "CREDIT_CARD_CLEARING_ACCOUNT", "START_DATE", "END_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT l.ROWID line_rowid,
          l.header_id,
          l.line_id,
          l.card_clearing_code,
          (SELECT meaning FROM FND_LOOKUP_VALUES where lookup_type='XXSC_CREDIT_CARD_ISSUER' and lookup_code=l.card_clearing_code)                              Credit_card_issuer,
          l.card_type_code,
          (SELECT meaning FROM FND_LOOKUP_VALUES where lookup_type='XXSC_CREDIT_CARD_TYPE' and lookup_code=l.card_type_code)
          Credit_card_type,
          l.Credit_card_number ,
          l.Card_holder_name,
          (SUBSTR(l.Credit_card_number,1,4)||' '||SUBSTR(l.Credit_card_number,5,4)||' '||SUBSTR(l.Credit_card_number,9,4)||' '||SUBSTR          (l.Credit_card_number,13,4)) Credit_card_no,
          l.card_clearing_accid,
          (select concatenated_segments from gl_code_combinations_kfv where code_combination_id=l.card_clearing_accid)
          Credit_card_clearing_account,
          l.Start_Date,
          l.End_Date,
          l.creation_date,
          l.created_by,
          l.last_update_date,
          l.last_updated_by,
          l.last_update_login 
        FROM XXSC_CC_SETUP_lines_t l;
--------------------------------------------------------
--  DDL for View XXSC_CE_BANK_ACCOUNTS_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_CE_BANK_ACCOUNTS_V" ("BANK_NAME", "BANK_SHORT_CODE", "BRANCH_NAME", "ADDRESS1", "ADDRESS2", "ADDRESS3", "CITY", "COUNTRY", "OPERATING_UNIT", "OU_SHORT_CODE", "SET_OF_BOOKS_ID", "BANK_ACCOUNT_NAME", "BANK_ACCOUNT_NUM", "CURRENCY_CODE", "ACCOUNT_OWNER_ORG_NAME", "BANK_ACCOUNT_TYPE", "ASSET_CODE_COMBINATION_ID", "ASSET_CODE_COMBINATION", "CASH_CLEARING", "BANK_CHARGES_CCID", "BANK_ERRORS_CCID", "FX_CHARGE_CCID", "MC_FLAG", "PMC_FLAG", "RMC_FLAG", "AP_USE_ENABLE_FLAG", "AR_USE_ENABLE_FLAG", "PAYMENT_DOC_CATEGORY", "AP_CASH", "AP_CLEARING", "AP_BANK_CHARGES", "AP_BANK_ERRORS", "AP_EX_GAIN", "AP_EX_LOSS", "AP_FUTURE_DATED_PAYMENT", "AR_CASH", "AR_BANK_CHARGES", "AR_CONFIRMED_RECPT", "AR_REMITTED_RECPT", "AR_UNAPPLIED", "AR_UNIDENTIFIED", "AR_ON_ACCOUNT", "AR_FACTOR", "AR_SHORT_TERM_DEPOSIT", "BR_SHORT_TERM_DEPOSIT", "BR_REMITTANCE", "BR_FACTOR", "BANK_INTEREST_EXPENSE_CCID", "BANK_INTEREST_INCOME_CCID", "XTR_ASSET_CCID", "EARNED_DISCOUNT", "UNEARNED_DISCOUNT", "ORG_ID", "BANK_ID", "BANK_BRANCH_ID", "BANK_ACCOUNT_ID", "BANK_ACCT_USE_ID", "OWNER", "OWN_ORG") AS 
  SELECT 
B.PARTY_NAME BANK_NAME,
B.KNOWN_AS BANK_SHORT_CODE,
BB.PARTY_NAME BRANCH_NAME,
BB.ADDRESS1, 
BB.ADDRESS2,
BB.ADDRESS3,
BB.CITY,
(SELECT UPPER (T.TERRITORY_SHORT_NAME)
  FROM FND_TERRITORIES_TL T
 WHERE T.TERRITORY_CODE = BB.COUNTRY 
 AND T.LANGUAGE = 'US') COUNTRY,
(SELECT NAME
FROM HR_OPERATING_UNITS
WHERE ORGANIZATION_ID = U.ORG_ID)OPERATING_UNIT,
(SELECT SHORT_CODE
FROM HR_OPERATING_UNITS
WHERE ORGANIZATION_ID = U.ORG_ID)OU_SHORT_CODE,
(SELECT SET_OF_BOOKS_ID
FROM HR_OPERATING_UNITS
WHERE ORGANIZATION_ID = U.ORG_ID)SET_OF_BOOKS_ID,
A.BANK_ACCOUNT_NAME,
A.BANK_ACCOUNT_NUM,
A.CURRENCY_CODE,
(SELECT NAME FROM
XLE_ENTITY_PROFILES
WHERE LEGAL_ENTITY_ID = A.ACCOUNT_OWNER_ORG_ID)ACCOUNT_OWNER_ORG_NAME,
A.BANK_ACCOUNT_TYPE,
A.ASSET_CODE_COMBINATION_ID,
XXGL_COMB(A.ASSET_CODE_COMBINATION_ID) ASSET_CODE_COMBINATION,
XXGL_COMB(A.CASH_CLEARING_CCID) CASH_CLEARING,
XXGL_COMB(A.BANK_CHARGES_CCID)BANK_CHARGES_CCID,
XXGL_COMB(A.BANK_ERRORS_CCID) BANK_ERRORS_CCID,
XXGL_COMB(A.FX_CHARGE_CCID) FX_CHARGE_CCID,
A.MULTI_CURRENCY_ALLOWED_FLAG MC_FLAG,
A.PAYMENT_MULTI_CURRENCY_FLAG PMC_FLAG,
A.RECEIPT_MULTI_CURRENCY_FLAG RMC_FLAG,
U.AP_USE_ENABLE_FLAG,
U.AR_USE_ENABLE_FLAG,
U.PAYMENT_DOC_CATEGORY,
XXGL_COMB(C.AP_ASSET_CCID)   AP_CASH,
XXGL_COMB(C.CASH_CLEARING_CCID)   AP_CLEARING,
XXGL_COMB(C.BANK_CHARGES_CCID)   AP_BANK_CHARGES,
XXGL_COMB(C.BANK_ERRORS_CCID)   AP_BANK_ERRORS,
XXGL_COMB(C.GAIN_CODE_COMBINATION_ID)   AP_EX_GAIN,
XXGL_COMB(C.LOSS_CODE_COMBINATION_ID)   AP_EX_LOSS,
XXGL_COMB(C.FUTURE_DATED_PAYMENT_CCID)  AP_FUTURE_DATED_PAYMENT,
XXGL_COMB(C.AR_ASSET_CCID)   AR_CASH,
XXGL_COMB(C.AR_BANK_CHARGES_CCID)   AR_BANK_CHARGES,
XXGL_COMB(C.RECEIPT_CLEARING_CCID)   AR_CONFIRMED_RECPT,
XXGL_COMB(C.REMITTANCE_CCID)   AR_REMITTED_RECPT,
XXGL_COMB(C.UNAPPLIED_CCID)   AR_UNAPPLIED,
XXGL_COMB(C.UNIDENTIFIED_CCID)   AR_UNIDENTIFIED,
XXGL_COMB(C.ON_ACCOUNT_CCID)   AR_ON_ACCOUNT,
XXGL_COMB(C.FACTOR_CCID)   AR_FACTOR,
XXGL_COMB(C.AR_SHORT_TERM_DEPOSIT_CCID)   AR_SHORT_TERM_DEPOSIT,
XXGL_COMB(C.BR_SHORT_TERM_DEPOSIT_CCID)   BR_SHORT_TERM_DEPOSIT,
XXGL_COMB(C.BR_REMITTANCE_CCID)   BR_REMITTANCE,
XXGL_COMB(C.BR_FACTOR_CCID)   BR_FACTOR,
XXGL_COMB(C.BANK_INTEREST_EXPENSE_CCID)   BANK_INTEREST_EXPENSE_CCID,
XXGL_COMB(C.BANK_INTEREST_INCOME_CCID)   BANK_INTEREST_INCOME_CCID,
XXGL_COMB(C.XTR_ASSET_CCID)   XTR_ASSET_CCID,
(select NAME from AR_RECEIVABLES_TRX_all ra
where  ra. receivables_trx_id = u. EDISC_RECEIVABLES_TRX_ID
and ra.org_id = u.org_id) Earned_Discount,
(select NAME from AR_RECEIVABLES_TRX_all ra
where  ra. receivables_trx_id = u. UNEDISC_RECEIVABLES_TRX_ID
and ra.org_id = u.org_id) Unearned_Discount,
U.ORG_ID,
A.BANK_ID,
A.BANK_BRANCH_ID,
A.BANK_ACCOUNT_ID,
U.BANK_ACCT_USE_ID,
A.ACCOUNT_OWNER_PARTY_ID OWNER,
A.ACCOUNT_OWNER_ORG_ID OWN_ORG
FROM CE_BANK_ACCOUNTS A,
CE_BANK_ACCT_USES_ALL U,
CE_GL_ACCOUNTS_CCID C,
HZ_PARTIES B,
HZ_PARTIES BB
WHERE A.BANK_ACCOUNT_ID = U.BANK_ACCOUNT_ID (+)
AND C.BANK_ACCT_USE_ID (+) = U.BANK_ACCT_USE_ID
AND A.BANK_ID = B.PARTY_ID
AND A.BANK_BRANCH_ID = BB.PARTY_ID
ORDER BY asset_code_combination_id, bank_name, A.BANK_ACCOUNT_ID, U.ORG_ID, A.BANK_ID;
--------------------------------------------------------
--  DDL for View XXSC_DEPARTMENT_DETAILS_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_DEPARTMENT_DETAILS_V" ("PERSON_ID", "EMPLOYEE_NUMBER", "FULL_NAME", "DEPARTMENT_CODE", "DEPARTMENT_DESC") AS 
  SELECT papf.person_id,
    papf.employee_number,
    paPF.FULL_NAME,
    --  HAOU.NAME,
    GCC.SEGMENT3 department_code,
    (SELECT DESCRIPTION SEGMENT_DESC
    FROM FND_FLEX_VALUES_VL
    WHERE FLEX_VALUE_SET_ID =
      (SELECT FLEX_VALUE_SET_ID
      FROM FND_FLEX_VALUE_SETS
      WHERE FLEX_VALUE_SET_NAME='XXGL_AFF_DEPARTMENT'
      )
    AND FLEX_VALUE=GCC.SEGMENT3
    ) department_desc
  FROM per_all_people_f papf,
    per_all_assignments_f paaf ,
    HR_ALL_ORGANIZATION_UNITS HAOU ,
    gl_code_combinations_kfv gcc
  WHERE papf.person_id          = paaf.person_id
  AND HAOU.ORGANIZATION_ID      = paaf.organization_id
  AND paaf.default_code_comb_id = gcc.code_combination_id
  AND paaf.primary_flag         = 'Y'
  AND papf.business_group_id   IN (83,82)
  AND papf.effective_start_date =
    (SELECT MAX(effective_start_date)
    FROM per_all_people_f
    WHERE PERSON_ID                  = PAPF.PERSON_ID
    AND TRUNC(effective_start_date) <= TRUNC(SYSDATE)
    )
  AND paaf.effective_start_date =
    (SELECT MAX(effective_start_date)
    FROM per_all_assignments_f
    WHERE ASSIGNMENT_ID              = paaf.ASSIGNMENT_ID
    AND TRUNC(effective_start_date) <= TRUNC(SYSDATE)
    )
    --AND TRUNC(sysdate) BETWEEN paaf.effective_start_date AND paaf.effective_end_date
  ORDER BY papf.EMPLOYEE_NUMBER;
--------------------------------------------------------
--  DDL for View XXSC_EMP_FOR_PAYSLIP
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_EMP_FOR_PAYSLIP" ("FULL_NAME", "EMPLOYEE_NUMBER", "BUSINESS_GROUP_ID", "EFFECTIVE_START_DATE", "EFFECTIVE_END_DATE", "SECURITY_PROFILE_ID", "DATE_FROM", "DATE_TO") AS 
  SELECT PPF.FULL_NAME,
    PPF.EMPLOYEE_NUMBER,
    PPF.BUSINESS_GROUP_ID,
    PAF.EFFECTIVE_START_DATE,
    PAF.EFFECTIVE_END_DATE,
    org.SECURITY_PROFILE_ID,
    org.DATE_FROM,
    org.DATE_TO
  FROM PER_ALL_PEOPLE_F PPF,
    PER_ALL_ASSIGNMENTS_F PAF,
    (SELECT POSE.ORGANIZATION_ID_CHILD,
      POSV.DATE_FROM,
      POSV.DATE_TO,
      PSP.SECURITY_PROFILE_ID
    FROM PER_ORGANIZATION_STRUCTURES POS,
      PER_ORG_STRUCTURE_VERSIONS POSV,
      PER_ORG_STRUCTURE_ELEMENTS POSE,
      PER_SECURITY_PROFILES PSP
    WHERE POS.ORGANIZATION_STRUCTURE_ID = POSV.ORGANIZATION_STRUCTURE_ID
    AND POSV.ORG_STRUCTURE_VERSION_ID   = POSE.ORG_STRUCTURE_VERSION_ID
    --AND TRUNC(sysdate) BETWEEN POSV.DATE_FROM AND NVL (POSV.DATE_TO,TRUNC(sysdate))
    AND POS.ORGANIZATION_STRUCTURE_ID = PSP.ORGANIZATION_STRUCTURE_ID
    ) org
  WHERE PPF.PERSON_ID       = PAF.PERSON_ID
  AND PPF.BUSINESS_GROUP_ID = PAF.BUSINESS_GROUP_ID
  AND TRUNC(SYSDATE) BETWEEN PPF.EFFECTIVE_START_DATE AND PPF.EFFECTIVE_END_DATE
  AND org.ORGANIZATION_ID_CHILD = paf.organization_id
  UNION
  SELECT 'All Employees' Full_name,
    NULL EMPLOYEE_NUMBER,
    NULL BUSINESS_GROUP_ID,
    NULL EFFECTIVE_START_DATE,
    NULL EFFECTIVE_END_DATE,
    NULL SECURITY_PROFILE_ID,
    NULL DATE_FROM,
    NULL DATE_TO
  FROM dual
  ORDER BY 2;
--------------------------------------------------------
--  DDL for View XXSC_EMPLOYEE_EXP_HDR_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_EMPLOYEE_EXP_HDR_V" ("HDR_ROWID", "HEADER_ID", "ORG_ID", "OPERATING_UNIT", "LEDGER_ID", "LEDGER", "REIMBURSEMENT_TYPE", "EMPLOYEE_ID", "EMPLOYEE_NO", "EMPLOYEE_NAME", "DEPARTMENT_SEG_ID", "DEPARTMENT_SEG", "PROJECT_SEG_ID", "PROJECT_SEG", "ACCOUNTING_DATE", "EXPENSE_START_DATE", "EXPENSE_END_DATE", "DOCUMENT_NO", "ENTERED_DATE", "USER_NAME", "GL_INTERFACE_DATE", "PAY_REIMBURSEMENT_DATE", "PAY_RECOVERY_DATE", "DESCRIPTION", "LEDGER_CURRENCY", "RECOVERY_AMOUNT", "REIMBURSEMENT_AMOUNT", "CORPORATE_CARD_AMOUNT", "STATUS_CODE", "STATUS", "GL_IFACE_ERRORS", "VOUCHER_NO", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT h.ROWID hdr_rowid, h.header_id, h.org_id,
          (SELECT NAME
             FROM hr_operating_units
            WHERE organization_id = h.org_id) operating_unit, h.ledger_id,
          (SELECT NAME
             FROM gl_ledgers
            WHERE ledger_id = h.ledger_id) ledger, h.reimbursement_type,
          h.employee_id, (SELECT employee_number
                            FROM xxsc_hr_poinfo_v
                           WHERE employee_id = h.employee_id) employee_no,
          (SELECT employee_name
             FROM xxsc_hr_poinfo_v
            WHERE employee_id = h.employee_id) employee_name,
          h.department_seg_id, h.department_seg, h.project_seg_id,
          h.project_seg, h.accounting_date, h.expense_start_date,
          h.expense_end_date, h.document_no, h.entered_date, h.user_name,
          h.gl_interface_date, h.pay_reimbursement_date, h.pay_recovery_date,
          h.description, h.ledger_currency, h.recovery_amount,
          h.reimbursement_amount, h.corporate_card_amount, h.status_code,
          DECODE (h.status_code,
                  'I', 'In Process',
                  'D', 'Draft',
                  'R', 'Rejected',
                  'A', 'Approved'
                 ) status,
          h.gl_iface_errors,
          (SELECT doc_sequence_value voucher_no
             FROM gl_je_headers
            WHERE SUBSTR (NAME, 1, INSTR (NAME, ' ') - 1) =
                                                     h.document_no
              AND je_source = '6'
              AND ROWNUM = 1) voucher_no,
          h.creation_date, h.created_by, h.last_update_date,
          h.last_updated_by, h.last_update_login
     FROM xxsc_employee_exp_hdr_t h;
--------------------------------------------------------
--  DDL for View XXSC_EMPLOYEE_EXP_LINES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_EMPLOYEE_EXP_LINES_V" ("LN_ROWID", "LINE_ID", "HEADER_ID", "TYPE", "EXP_CODE", "EXPENSE_TYPE", "DEPARTMENT_SEG_ID", "DEPARTMENT_SEG", "PROJECT_SEG_ID", "PROJECT_SEG", "REGION_SEG_ID", "REGION_SEG", "ACCOUNT_SEG_ID", "ACCOUNT_SEG", "ACCOUNT_CC_ID", "ACCOUNT", "CREDIT_CARD_ID", "CREDIT_CARD_NUMBER", "CURRENCY", "AMOUNT", "EXCHANGE_RATE_TYPE", "EXPENSE_DATE", "EXCHANGE_RATE", "LEDGER_CURRENCY_AMT", "DESCRIPTION", "PRECISION", "LC_PRECISION", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT l.ROWID, l.line_id, l.header_id, l.TYPE, l.exp_code,
          DECODE (l.TYPE,
                  'T', (SELECT meaning
                          FROM fnd_lookup_values
                         WHERE lookup_type = 'XXSC_EXPENSE_TYPES'
                           AND lookup_code = l.exp_code
                           AND SYSDATE BETWEEN start_date_active
                                           AND NVL (end_date_active,
                                                    '31-DEC-4712'
                                                   )),
                  'Recovery'
                 ) expense_type,
          l.department_seg_id, l.department_seg, l.project_seg_id,
          l.project_seg, l.region_seg_id, l.region_seg, l.account_seg_id,
          l.account_seg, l.account_cc_id,
          (SELECT concatenated_segments
             FROM gl_code_combinations_kfv
            WHERE code_combination_id = l.account_cc_id) ACCOUNT,
          l.credit_card_id, l.credit_card_number, l.currency, l.amount,
          l.exchange_rate_type, l.expense_date, l.exchange_rate,
          l.ledger_currency_amt, l.description,l.PRECISION,l.LC_PRECISION, 
          l.creation_date, l.created_by,
          l.last_update_date, l.last_updated_by, l.last_update_login
     from XXSC_EMPLOYEE_EXP_LINES_T L;
--------------------------------------------------------
--  DDL for View XXSC_EXP_EMP_DEL_HDR_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_EXP_EMP_DEL_HDR_V" ("HDR_ROWID", "HEADER_ID", "EMPLOYEE_ID", "LEDGER_ID", "EMPLOYEE_NUMBER", "EMPLOYEE_NAME", "EMP_DEPARTMENT", "LEDGER", "EXPENSE_ACCOUNT", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT h.ROWID hdr_rowid,
    h.header_id,
    h.employee_id,
   h.ledger_id,
    hr.employee_number,
   hr.employee_name,
   hr.emp_department,
   hr.ledger,
   hr.company||'.'||hr.line_of_business||'.'||hr.department||'.'||hr.ACCOUNT||'.'||hr.SUB_ACCOUNT||'.'||hr.PRODUCT_PROJECT||'.'||hr.REGION||'.'||  hr.INERTCOMPANY||'.'||     hr.FUTURE  EXPENSE_ACCOUNT,
    h.creation_date,
    h.created_by,
    h.last_update_date,
    h.last_updated_by,
    h.last_update_login
  FROM xxsc_exp_emp_del_hdr_t h, XXSC_HR_POINFO_V  hr  where h.employee_id=hr.employee_id;
--------------------------------------------------------
--  DDL for View XXSC_EXP_EMP_DEL_LINES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_EXP_EMP_DEL_LINES_V" ("LINE_ROWID", "HEADER_ID", "LINE_ID", "EMPLOYEE_ID", "EMPLOYEE_NAME", "EMPLOYEE_NUMBER", "USER_ID", "USER_NAME", "START_DATE", "END_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT l.ROWID line_rowid,
          l.header_id,
          l.line_id,            
          l.Employee_Id,
          hr.employee_name,
          hr.employee_number,
          u.user_id,
          u. user_name ,
          l.Start_Date,        
          l.End_Date,
          l.creation_date,
          l.created_by,
          l.last_update_date,
          l.last_updated_by,
          l.last_update_login 
        FROM xxsc_exp_emp_del_lines_t l ,XXSC_HR_POINFO_V  hr ,fnd_user u 
        where l.employee_id=hr.employee_id  and l.user_id=u.user_id and 
       l.employee_id=u.employee_id;
--------------------------------------------------------
--  DDL for View XXSC_EXP_PAYROLL_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_EXP_PAYROLL_EMPLOYEES" ("EMPLOYEE_NUMBER", "PERSON_ID", "BUSINESS_GROUP_ID", "EFFECTIVE_START_DATE", "EFFECTIVE_END_DATE") AS 
  SELECT DISTINCT PAPF.EMPLOYEE_NUMBER,
                   PAPF.PERSON_ID,
                   PAPF.BUSINESS_GROUP_ID,
                   PASF.EFFECTIVE_START_DATE,
                   PASF.EFFECTIVE_END_DATE
     FROM XXSC_PAY_EMP_EXPENSES_V X,
          PER_ALL_PEOPLE_F PAPF,
          PER_ALL_ASSIGNMENTS_F PASF
    WHERE X.EMPLOYEE_ID = PAPF.PERSON_ID AND PAPF.PERSON_ID = PASF.PERSON_ID
          AND SYSDATE BETWEEN PAPF.EFFECTIVE_START_DATE
                          AND PAPF.EFFECTIVE_END_DATE
          AND (X.PAY_REIMBURSEMENT_DATE IS NULL
               OR X.PAY_RECOVERY_DATE IS NULL)
   UNION
   SELECT DISTINCT PAPF.EMPLOYEE_NUMBER,
                   PAPF.PERSON_ID,
                   PAPF.BUSINESS_GROUP_ID,
                   PASF.EFFECTIVE_START_DATE,
                   PASF.EFFECTIVE_END_DATE
     FROM XXSC_PAY_STAFF_RECOVERIES_V X,
          PER_ALL_PEOPLE_F PAPF,
          PER_ALL_ASSIGNMENTS_F PASF
    WHERE X.EMPLOYEE_ID = PAPF.PERSON_ID AND PAPF.PERSON_ID = PASF.PERSON_ID
          AND SYSDATE BETWEEN PAPF.EFFECTIVE_START_DATE
                          AND PAPF.EFFECTIVE_END_DATE
          AND X.PAYROLL_INTERFACE_DATE IS NULL;
--------------------------------------------------------
--  DDL for View XXSC_FA_CAP_CIP_ADDITIONS_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_FA_CAP_CIP_ADDITIONS_V" ("TYPE", "BOOK_TYPE_CODE", "ASSET_ID", "PERIOD_COUNTER_ADJUSTED", "ADJUSTMENT_AMOUNT") AS 
  SELECT   'ADDITION' TYPE, b.book_type_code, b.asset_id,
            b.period_counter_adjusted,
            SUM (b.adjustment_amount) adjustment_amount
       FROM fa_adjustments b
      WHERE asset_id IN (SELECT DISTINCT asset_id
                                    FROM fa_adjustments a
                                   WHERE a.source_type_code = 'CIP ADDITION')
        AND b.adjustment_type = 'COST'
        AND b.source_type_code = 'ADDITION'
        AND b.debit_credit_flag = 'DR'
   GROUP BY b.book_type_code, b.asset_id, b.period_counter_adjusted
   UNION
   SELECT   'ADDITION' TYPE, b.book_type_code, b.asset_id,
            b.period_counter_adjusted,
            SUM (b.adjustment_amount * -1) adjustment_amount
       FROM fa_adjustments b
      WHERE asset_id IN (SELECT DISTINCT asset_id
                                    FROM fa_adjustments a
                                   WHERE a.source_type_code = 'CIP ADDITION')
        AND b.adjustment_type = 'COST'
        AND b.source_type_code = 'ADDITION'
        AND b.debit_credit_flag = 'CR'
   GROUP BY b.book_type_code, b.asset_id, b.period_counter_adjusted ;
--------------------------------------------------------
--  DDL for View XXSC_FIN_ACC_SET_HDR_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_FIN_ACC_SET_HDR_V" ("HDR_ROWID", "HEADER_ID", "LEDGER_ID", "LEDGER_NAME", "STA_RECV_ACCOUNT", "STA_RECV_ACCOUNT_ID", "STA_REIM_ACCOUNT", "STA_REIM_ACCOUNT_ID", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT h.ROWID hdr_rowid,
    h.header_id,
    h.ledger_id,
    (select name from gl_ledgers where ledger_id=h.ledger_id) Ledger_name,
    XXGL_COMB(STA_RECV_ACCOUNT_ID) STA_RECV_ACCOUNT,
    H.STA_RECV_ACCOUNT_ID,
    XXGL_COMB(STA_REIM_ACCOUNT_ID) STA_REIM_ACCOUNT,
    H.STA_REIM_ACCOUNT_ID,
    h.creation_date,
    h.created_by,
    h.last_update_date,
    h.last_updated_by,
    h.last_update_login       
  FROM XXSC_FIN_ACC_SET_HDR_T h;
--------------------------------------------------------
--  DDL for View XXSC_FIN_ACC_SET_LIN_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_FIN_ACC_SET_LIN_V" ("LINE_ROWID", "LINE_ID", "HEADER_ID", "EXPENSE_NAME", "EXP_CODE", "ACCOUNT_CODE", "ACCOUNT_CODE_ID", "START_DATE", "END_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  SELECT l.ROWID line_rowid,
          l.line_id,
          l.header_id,
          (SELECT meaning FROM FND_LOOKUP_VALUES where lookup_type='XXSC_EXPENSE_TYPES' and lookup_code=l.EXP_CODE)    EXPENSE_NAME,
          l.EXP_CODE,
          XXGL_COMB(L.ACCOUNT_CODE_ID) ACCOUNT_CODE,
          L.ACCOUNT_CODE_ID,
          l.Start_Date,
          l.End_Date,
          l.creation_date,
          l.created_by,
          l.last_update_date,
          l.last_updated_by,
          l.last_update_login 
        FROM XXSC_FIN_ACC_SET_LIN_T l;
--------------------------------------------------------
--  DDL for View XXSC_FIN_INVSTA_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_FIN_INVSTA_V" ("STATUS", "DISP_STATUS", "ORG_ID") AS 
  SELECT ap_invoices_utility_pkg.get_approval_status
                                         (aia.invoice_id,
                                          aia.invoice_amount,
                                          aia.payment_status_flag,
                                          aia.invoice_type_lookup_code
                                         ) status,
                   CASE ap_invoices_utility_pkg.get_approval_status
                                    (aia.invoice_id,
                                     aia.invoice_amount,
                                     aia.payment_status_flag,
                                     aia.invoice_type_lookup_code
                                    )
                      WHEN 'APPROVED'
                         THEN 'Validated'
                      WHEN 'NEEDS REAPPROVAL'
                         THEN 'Needs Revalidation'
                      WHEN 'NEVER APPROVED'
                         THEN 'Never Validated'
                      WHEN 'UNAPPROVED'
                         THEN 'Unvalidated'
                      WHEN 'UNPAID'
                         THEN 'Unpaid'
                      WHEN 'AVAILABLE'
                         THEN 'Available'
                      WHEN 'FULL'
                         THEN 'Fully Applied'
                      WHEN 'PERMANENT'
                         THEN 'Permanent'
                      WHEN 'CANCELLED'
                         THEN 'Cancelled'
                      WHEN 'SELECTED FOR PAYMENT'
                         THEN 'Selected for Payment'
                   END disp_status,
                   org_id
              FROM ap_invoices_all aia ;
--------------------------------------------------------
--  DDL for View XXSC_GFC_GL_ACCESS_SETS_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GFC_GL_ACCESS_SETS_V" ("ACCESS_SET_ID", "NAME", "SECURITY_SEGMENT_CODE", "ENABLED_FLAG", "CHART_OF_ACCOUNTS_ID", "PERIOD_SET_NAME", "ACCOUNTED_PERIOD_TYPE", "AUTOMATICALLY_CREATED_FLAG", "LAST_UPDATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATE_LOGIN", "CREATED_BY", "CREATION_DATE", "SECURED_SEG_VALUE_SET_ID", "DEFAULT_LEDGER_ID", "DESCRIPTION", "CONTEXT", "ATTRIBUTE1", "ATTRIBUTE2", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "ATTRIBUTE6", "ATTRIBUTE7", "ATTRIBUTE8", "ATTRIBUTE9", "ATTRIBUTE10", "ATTRIBUTE11", "ATTRIBUTE12", "ATTRIBUTE13", "ATTRIBUTE14", "ATTRIBUTE15") AS 
  select "ACCESS_SET_ID","NAME","SECURITY_SEGMENT_CODE","ENABLED_FLAG","CHART_OF_ACCOUNTS_ID","PERIOD_SET_NAME","ACCOUNTED_PERIOD_TYPE","AUTOMATICALLY_CREATED_FLAG","LAST_UPDATED_BY","LAST_UPDATE_DATE","LAST_UPDATE_LOGIN","CREATED_BY","CREATION_DATE","SECURED_SEG_VALUE_SET_ID","DEFAULT_LEDGER_ID","DESCRIPTION","CONTEXT","ATTRIBUTE1","ATTRIBUTE2","ATTRIBUTE3","ATTRIBUTE4","ATTRIBUTE5","ATTRIBUTE6","ATTRIBUTE7","ATTRIBUTE8","ATTRIBUTE9","ATTRIBUTE10","ATTRIBUTE11","ATTRIBUTE12","ATTRIBUTE13","ATTRIBUTE14","ATTRIBUTE15" from gl_access_sets where default_ledger_id = 2040;
--------------------------------------------------------
--  DDL for View XXSC_GFC_GL_BALANCES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GFC_GL_BALANCES_V" ("LEDGER_ID", "CODE_COMBINATION_ID", "CURRENCY_CODE", "PERIOD_NAME", "ACTUAL_FLAG", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "BUDGET_VERSION_ID", "ENCUMBRANCE_TYPE_ID", "TRANSLATED_FLAG", "REVALUATION_STATUS", "PERIOD_TYPE", "PERIOD_YEAR", "PERIOD_NUM", "PERIOD_NET_DR", "PERIOD_NET_CR", "PERIOD_TO_DATE_ADB", "QUARTER_TO_DATE_DR", "QUARTER_TO_DATE_CR", "QUARTER_TO_DATE_ADB", "YEAR_TO_DATE_ADB", "PROJECT_TO_DATE_DR", "PROJECT_TO_DATE_CR", "PROJECT_TO_DATE_ADB", "BEGIN_BALANCE_DR", "BEGIN_BALANCE_CR", "PERIOD_NET_DR_BEQ", "PERIOD_NET_CR_BEQ", "BEGIN_BALANCE_DR_BEQ", "BEGIN_BALANCE_CR_BEQ", "TEMPLATE_ID", "ENCUMBRANCE_DOC_ID", "ENCUMBRANCE_LINE_NUM", "QUARTER_TO_DATE_DR_BEQ", "QUARTER_TO_DATE_CR_BEQ", "PROJECT_TO_DATE_DR_BEQ", "PROJECT_TO_DATE_CR_BEQ") AS 
  select "LEDGER_ID","CODE_COMBINATION_ID","CURRENCY_CODE","PERIOD_NAME","ACTUAL_FLAG","LAST_UPDATE_DATE","LAST_UPDATED_BY","BUDGET_VERSION_ID","ENCUMBRANCE_TYPE_ID","TRANSLATED_FLAG","REVALUATION_STATUS","PERIOD_TYPE","PERIOD_YEAR","PERIOD_NUM","PERIOD_NET_DR","PERIOD_NET_CR","PERIOD_TO_DATE_ADB","QUARTER_TO_DATE_DR","QUARTER_TO_DATE_CR","QUARTER_TO_DATE_ADB","YEAR_TO_DATE_ADB","PROJECT_TO_DATE_DR","PROJECT_TO_DATE_CR","PROJECT_TO_DATE_ADB","BEGIN_BALANCE_DR","BEGIN_BALANCE_CR","PERIOD_NET_DR_BEQ","PERIOD_NET_CR_BEQ","BEGIN_BALANCE_DR_BEQ","BEGIN_BALANCE_CR_BEQ","TEMPLATE_ID","ENCUMBRANCE_DOC_ID","ENCUMBRANCE_LINE_NUM","QUARTER_TO_DATE_DR_BEQ","QUARTER_TO_DATE_CR_BEQ","PROJECT_TO_DATE_DR_BEQ","PROJECT_TO_DATE_CR_BEQ" from gl_balances where ledger_id = 2040;
--------------------------------------------------------
--  DDL for View XXSC_GFC_GL_JE_BATCHES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GFC_GL_JE_BATCHES_V" ("JE_BATCH_ID", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "SET_OF_BOOKS_ID_11I", "NAME", "STATUS", "STATUS_VERIFIED", "ACTUAL_FLAG", "DEFAULT_EFFECTIVE_DATE", "AVERAGE_JOURNAL_FLAG", "BUDGETARY_CONTROL_STATUS", "APPROVAL_STATUS_CODE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_LOGIN", "STATUS_RESET_FLAG", "DEFAULT_PERIOD_NAME", "UNIQUE_DATE", "EARLIEST_POSTABLE_DATE", "POSTED_DATE", "DATE_CREATED", "DESCRIPTION", "CONTROL_TOTAL", "RUNNING_TOTAL_DR", "RUNNING_TOTAL_CR", "RUNNING_TOTAL_ACCOUNTED_DR", "RUNNING_TOTAL_ACCOUNTED_CR", "PARENT_JE_BATCH_ID", "ATTRIBUTE1", "ATTRIBUTE2", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "ATTRIBUTE6", "ATTRIBUTE7", "ATTRIBUTE8", "ATTRIBUTE9", "ATTRIBUTE10", "CONTEXT", "UNRESERVATION_PACKET_ID", "PACKET_ID", "USSGL_TRANSACTION_CODE", "CONTEXT2", "POSTING_RUN_ID", "REQUEST_ID", "ORG_ID", "POSTED_BY", "CHART_OF_ACCOUNTS_ID", "PERIOD_SET_NAME", "ACCOUNTED_PERIOD_TYPE", "GROUP_ID", "APPROVER_EMPLOYEE_ID", "GLOBAL_ATTRIBUTE_CATEGORY", "GLOBAL_ATTRIBUTE1", "GLOBAL_ATTRIBUTE2", "GLOBAL_ATTRIBUTE3", "GLOBAL_ATTRIBUTE4", "GLOBAL_ATTRIBUTE5", "GLOBAL_ATTRIBUTE6", "GLOBAL_ATTRIBUTE7", "GLOBAL_ATTRIBUTE8", "GLOBAL_ATTRIBUTE9", "GLOBAL_ATTRIBUTE10", "GLOBAL_ATTRIBUTE11", "GLOBAL_ATTRIBUTE12", "GLOBAL_ATTRIBUTE13", "GLOBAL_ATTRIBUTE14", "GLOBAL_ATTRIBUTE15", "GLOBAL_ATTRIBUTE16", "GLOBAL_ATTRIBUTE17", "GLOBAL_ATTRIBUTE18", "GLOBAL_ATTRIBUTE19", "GLOBAL_ATTRIBUTE20") AS 
  select "JE_BATCH_ID","LAST_UPDATE_DATE","LAST_UPDATED_BY","SET_OF_BOOKS_ID_11I","NAME","STATUS","STATUS_VERIFIED","ACTUAL_FLAG","DEFAULT_EFFECTIVE_DATE","AVERAGE_JOURNAL_FLAG","BUDGETARY_CONTROL_STATUS","APPROVAL_STATUS_CODE","CREATION_DATE","CREATED_BY","LAST_UPDATE_LOGIN","STATUS_RESET_FLAG","DEFAULT_PERIOD_NAME","UNIQUE_DATE","EARLIEST_POSTABLE_DATE","POSTED_DATE","DATE_CREATED","DESCRIPTION","CONTROL_TOTAL","RUNNING_TOTAL_DR","RUNNING_TOTAL_CR","RUNNING_TOTAL_ACCOUNTED_DR","RUNNING_TOTAL_ACCOUNTED_CR","PARENT_JE_BATCH_ID","ATTRIBUTE1","ATTRIBUTE2","ATTRIBUTE3","ATTRIBUTE4","ATTRIBUTE5","ATTRIBUTE6","ATTRIBUTE7","ATTRIBUTE8","ATTRIBUTE9","ATTRIBUTE10","CONTEXT","UNRESERVATION_PACKET_ID","PACKET_ID","USSGL_TRANSACTION_CODE","CONTEXT2","POSTING_RUN_ID","REQUEST_ID","ORG_ID","POSTED_BY","CHART_OF_ACCOUNTS_ID","PERIOD_SET_NAME","ACCOUNTED_PERIOD_TYPE","GROUP_ID","APPROVER_EMPLOYEE_ID","GLOBAL_ATTRIBUTE_CATEGORY","GLOBAL_ATTRIBUTE1","GLOBAL_ATTRIBUTE2","GLOBAL_ATTRIBUTE3","GLOBAL_ATTRIBUTE4","GLOBAL_ATTRIBUTE5","GLOBAL_ATTRIBUTE6","GLOBAL_ATTRIBUTE7","GLOBAL_ATTRIBUTE8","GLOBAL_ATTRIBUTE9","GLOBAL_ATTRIBUTE10","GLOBAL_ATTRIBUTE11","GLOBAL_ATTRIBUTE12","GLOBAL_ATTRIBUTE13","GLOBAL_ATTRIBUTE14","GLOBAL_ATTRIBUTE15","GLOBAL_ATTRIBUTE16","GLOBAL_ATTRIBUTE17","GLOBAL_ATTRIBUTE18","GLOBAL_ATTRIBUTE19","GLOBAL_ATTRIBUTE20" from gl_je_batches b where exists (select 'x' from gl_je_headers h where h.je_batch_id = b.je_batch_id
and h.ledger_id = 2040);
--------------------------------------------------------
--  DDL for View XXSC_GFC_GL_JE_HEADERS_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GFC_GL_JE_HEADERS_V" ("JE_HEADER_ID", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LEDGER_ID", "JE_CATEGORY", "JE_SOURCE", "PERIOD_NAME", "NAME", "CURRENCY_CODE", "STATUS", "DATE_CREATED", "ACCRUAL_REV_FLAG", "MULTI_BAL_SEG_FLAG", "ACTUAL_FLAG", "DEFAULT_EFFECTIVE_DATE", "TAX_STATUS_CODE", "CONVERSION_FLAG", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_LOGIN", "ENCUMBRANCE_TYPE_ID", "BUDGET_VERSION_ID", "BALANCED_JE_FLAG", "BALANCING_SEGMENT_VALUE", "JE_BATCH_ID", "FROM_RECURRING_HEADER_ID", "UNIQUE_DATE", "EARLIEST_POSTABLE_DATE", "POSTED_DATE", "ACCRUAL_REV_EFFECTIVE_DATE", "ACCRUAL_REV_PERIOD_NAME", "ACCRUAL_REV_STATUS", "ACCRUAL_REV_JE_HEADER_ID", "ACCRUAL_REV_CHANGE_SIGN_FLAG", "DESCRIPTION", "CONTROL_TOTAL", "RUNNING_TOTAL_DR", "RUNNING_TOTAL_CR", "RUNNING_TOTAL_ACCOUNTED_DR", "RUNNING_TOTAL_ACCOUNTED_CR", "CURRENCY_CONVERSION_RATE", "CURRENCY_CONVERSION_TYPE", "CURRENCY_CONVERSION_DATE", "EXTERNAL_REFERENCE", "PARENT_JE_HEADER_ID", "REVERSED_JE_HEADER_ID", "ORIGINATING_BAL_SEG_VALUE", "INTERCOMPANY_MODE", "DR_BAL_SEG_VALUE", "CR_BAL_SEG_VALUE", "ATTRIBUTE1", "ATTRIBUTE2", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "ATTRIBUTE6", "ATTRIBUTE7", "ATTRIBUTE8", "ATTRIBUTE9", "ATTRIBUTE10", "CONTEXT", "GLOBAL_ATTRIBUTE_CATEGORY", "GLOBAL_ATTRIBUTE1", "GLOBAL_ATTRIBUTE2", "GLOBAL_ATTRIBUTE3", "GLOBAL_ATTRIBUTE4", "GLOBAL_ATTRIBUTE5", "GLOBAL_ATTRIBUTE6", "GLOBAL_ATTRIBUTE7", "GLOBAL_ATTRIBUTE8", "GLOBAL_ATTRIBUTE9", "GLOBAL_ATTRIBUTE10", "USSGL_TRANSACTION_CODE", "CONTEXT2", "DOC_SEQUENCE_ID", "DOC_SEQUENCE_VALUE", "JGZZ_RECON_CONTEXT", "JGZZ_RECON_REF", "REFERENCE_DATE", "LOCAL_DOC_SEQUENCE_ID", "LOCAL_DOC_SEQUENCE_VALUE", "DISPLAY_ALC_JOURNAL_FLAG", "JE_FROM_SLA_FLAG", "POSTING_ACCT_SEQ_VERSION_ID", "POSTING_ACCT_SEQ_ASSIGN_ID", "POSTING_ACCT_SEQ_VALUE", "CLOSE_ACCT_SEQ_VERSION_ID", "CLOSE_ACCT_SEQ_ASSIGN_ID", "CLOSE_ACCT_SEQ_VALUE") AS 
  select "JE_HEADER_ID","LAST_UPDATE_DATE","LAST_UPDATED_BY","LEDGER_ID","JE_CATEGORY","JE_SOURCE","PERIOD_NAME","NAME","CURRENCY_CODE","STATUS","DATE_CREATED","ACCRUAL_REV_FLAG","MULTI_BAL_SEG_FLAG","ACTUAL_FLAG","DEFAULT_EFFECTIVE_DATE","TAX_STATUS_CODE","CONVERSION_FLAG","CREATION_DATE","CREATED_BY","LAST_UPDATE_LOGIN","ENCUMBRANCE_TYPE_ID","BUDGET_VERSION_ID","BALANCED_JE_FLAG","BALANCING_SEGMENT_VALUE","JE_BATCH_ID","FROM_RECURRING_HEADER_ID","UNIQUE_DATE","EARLIEST_POSTABLE_DATE","POSTED_DATE","ACCRUAL_REV_EFFECTIVE_DATE","ACCRUAL_REV_PERIOD_NAME","ACCRUAL_REV_STATUS","ACCRUAL_REV_JE_HEADER_ID","ACCRUAL_REV_CHANGE_SIGN_FLAG","DESCRIPTION","CONTROL_TOTAL","RUNNING_TOTAL_DR","RUNNING_TOTAL_CR","RUNNING_TOTAL_ACCOUNTED_DR","RUNNING_TOTAL_ACCOUNTED_CR","CURRENCY_CONVERSION_RATE","CURRENCY_CONVERSION_TYPE","CURRENCY_CONVERSION_DATE","EXTERNAL_REFERENCE","PARENT_JE_HEADER_ID","REVERSED_JE_HEADER_ID","ORIGINATING_BAL_SEG_VALUE","INTERCOMPANY_MODE","DR_BAL_SEG_VALUE","CR_BAL_SEG_VALUE","ATTRIBUTE1","ATTRIBUTE2","ATTRIBUTE3","ATTRIBUTE4","ATTRIBUTE5","ATTRIBUTE6","ATTRIBUTE7","ATTRIBUTE8","ATTRIBUTE9","ATTRIBUTE10","CONTEXT","GLOBAL_ATTRIBUTE_CATEGORY","GLOBAL_ATTRIBUTE1","GLOBAL_ATTRIBUTE2","GLOBAL_ATTRIBUTE3","GLOBAL_ATTRIBUTE4","GLOBAL_ATTRIBUTE5","GLOBAL_ATTRIBUTE6","GLOBAL_ATTRIBUTE7","GLOBAL_ATTRIBUTE8","GLOBAL_ATTRIBUTE9","GLOBAL_ATTRIBUTE10","USSGL_TRANSACTION_CODE","CONTEXT2","DOC_SEQUENCE_ID","DOC_SEQUENCE_VALUE","JGZZ_RECON_CONTEXT","JGZZ_RECON_REF","REFERENCE_DATE","LOCAL_DOC_SEQUENCE_ID","LOCAL_DOC_SEQUENCE_VALUE","DISPLAY_ALC_JOURNAL_FLAG","JE_FROM_SLA_FLAG","POSTING_ACCT_SEQ_VERSION_ID","POSTING_ACCT_SEQ_ASSIGN_ID","POSTING_ACCT_SEQ_VALUE","CLOSE_ACCT_SEQ_VERSION_ID","CLOSE_ACCT_SEQ_ASSIGN_ID","CLOSE_ACCT_SEQ_VALUE" from gl_je_headers where ledger_id = 2040;
--------------------------------------------------------
--  DDL for View XXSC_GFC_GL_JE_LINES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GFC_GL_JE_LINES_V" ("JE_HEADER_ID", "JE_LINE_NUM", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LEDGER_ID", "CODE_COMBINATION_ID", "PERIOD_NAME", "EFFECTIVE_DATE", "STATUS", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_LOGIN", "ENTERED_DR", "ENTERED_CR", "ACCOUNTED_DR", "ACCOUNTED_CR", "DESCRIPTION", "LINE_TYPE_CODE", "REFERENCE_1", "REFERENCE_2", "REFERENCE_3", "REFERENCE_4", "REFERENCE_5", "ATTRIBUTE1", "ATTRIBUTE2", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "ATTRIBUTE6", "ATTRIBUTE7", "ATTRIBUTE8", "ATTRIBUTE9", "ATTRIBUTE10", "ATTRIBUTE11", "ATTRIBUTE12", "ATTRIBUTE13", "ATTRIBUTE14", "ATTRIBUTE15", "ATTRIBUTE16", "ATTRIBUTE17", "ATTRIBUTE18", "ATTRIBUTE19", "ATTRIBUTE20", "CONTEXT", "CONTEXT2", "INVOICE_DATE", "TAX_CODE", "INVOICE_IDENTIFIER", "INVOICE_AMOUNT", "NO1", "STAT_AMOUNT", "IGNORE_RATE_FLAG", "CONTEXT3", "USSGL_TRANSACTION_CODE", "SUBLEDGER_DOC_SEQUENCE_ID", "CONTEXT4", "SUBLEDGER_DOC_SEQUENCE_VALUE", "REFERENCE_6", "REFERENCE_7", "GL_SL_LINK_ID", "GL_SL_LINK_TABLE", "REFERENCE_8", "REFERENCE_9", "REFERENCE_10", "GLOBAL_ATTRIBUTE_CATEGORY", "GLOBAL_ATTRIBUTE1", "GLOBAL_ATTRIBUTE2", "GLOBAL_ATTRIBUTE3", "GLOBAL_ATTRIBUTE4", "GLOBAL_ATTRIBUTE5", "GLOBAL_ATTRIBUTE6", "GLOBAL_ATTRIBUTE7", "GLOBAL_ATTRIBUTE8", "GLOBAL_ATTRIBUTE9", "GLOBAL_ATTRIBUTE10", "JGZZ_RECON_STATUS_11I", "JGZZ_RECON_DATE_11I", "JGZZ_RECON_ID_11I", "JGZZ_RECON_REF_11I", "JGZZ_RECON_CONTEXT_11I", "TAXABLE_LINE_FLAG", "TAX_TYPE_CODE", "TAX_CODE_ID", "TAX_ROUNDING_RULE_CODE", "AMOUNT_INCLUDES_TAX_FLAG", "TAX_DOCUMENT_IDENTIFIER", "TAX_DOCUMENT_DATE", "TAX_CUSTOMER_NAME", "TAX_CUSTOMER_REFERENCE", "TAX_REGISTRATION_NUMBER", "TAX_LINE_FLAG", "TAX_GROUP_ID", "CO_THIRD_PARTY", "CO_PROCESSED_FLAG") AS 
  select "JE_HEADER_ID","JE_LINE_NUM","LAST_UPDATE_DATE","LAST_UPDATED_BY","LEDGER_ID","CODE_COMBINATION_ID","PERIOD_NAME","EFFECTIVE_DATE","STATUS","CREATION_DATE","CREATED_BY","LAST_UPDATE_LOGIN","ENTERED_DR","ENTERED_CR","ACCOUNTED_DR","ACCOUNTED_CR","DESCRIPTION","LINE_TYPE_CODE","REFERENCE_1","REFERENCE_2","REFERENCE_3","REFERENCE_4","REFERENCE_5","ATTRIBUTE1","ATTRIBUTE2","ATTRIBUTE3","ATTRIBUTE4","ATTRIBUTE5","ATTRIBUTE6","ATTRIBUTE7","ATTRIBUTE8","ATTRIBUTE9","ATTRIBUTE10","ATTRIBUTE11","ATTRIBUTE12","ATTRIBUTE13","ATTRIBUTE14","ATTRIBUTE15","ATTRIBUTE16","ATTRIBUTE17","ATTRIBUTE18","ATTRIBUTE19","ATTRIBUTE20","CONTEXT","CONTEXT2","INVOICE_DATE","TAX_CODE","INVOICE_IDENTIFIER","INVOICE_AMOUNT","NO1","STAT_AMOUNT","IGNORE_RATE_FLAG","CONTEXT3","USSGL_TRANSACTION_CODE","SUBLEDGER_DOC_SEQUENCE_ID","CONTEXT4","SUBLEDGER_DOC_SEQUENCE_VALUE","REFERENCE_6","REFERENCE_7","GL_SL_LINK_ID","GL_SL_LINK_TABLE","REFERENCE_8","REFERENCE_9","REFERENCE_10","GLOBAL_ATTRIBUTE_CATEGORY","GLOBAL_ATTRIBUTE1","GLOBAL_ATTRIBUTE2","GLOBAL_ATTRIBUTE3","GLOBAL_ATTRIBUTE4","GLOBAL_ATTRIBUTE5","GLOBAL_ATTRIBUTE6","GLOBAL_ATTRIBUTE7","GLOBAL_ATTRIBUTE8","GLOBAL_ATTRIBUTE9","GLOBAL_ATTRIBUTE10","JGZZ_RECON_STATUS_11I","JGZZ_RECON_DATE_11I","JGZZ_RECON_ID_11I","JGZZ_RECON_REF_11I","JGZZ_RECON_CONTEXT_11I","TAXABLE_LINE_FLAG","TAX_TYPE_CODE","TAX_CODE_ID","TAX_ROUNDING_RULE_CODE","AMOUNT_INCLUDES_TAX_FLAG","TAX_DOCUMENT_IDENTIFIER","TAX_DOCUMENT_DATE","TAX_CUSTOMER_NAME","TAX_CUSTOMER_REFERENCE","TAX_REGISTRATION_NUMBER","TAX_LINE_FLAG","TAX_GROUP_ID","CO_THIRD_PARTY","CO_PROCESSED_FLAG" from gl_je_lines where ledger_id = 2040;
--------------------------------------------------------
--  DDL for View XXSC_GFC_GL_LEDGER_SET_ASGNS_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GFC_GL_LEDGER_SET_ASGNS_V" ("LEDGER_SET_ID", "LEDGER_ID", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN", "CREATION_DATE", "CREATED_BY", "START_DATE", "END_DATE", "STATUS_CODE") AS 
  select "LEDGER_SET_ID","LEDGER_ID","LAST_UPDATE_DATE","LAST_UPDATED_BY","LAST_UPDATE_LOGIN","CREATION_DATE","CREATED_BY","START_DATE","END_DATE","STATUS_CODE" from gl_ledger_set_assignments where ledger_id = 2040;
--------------------------------------------------------
--  DDL for View XXSC_GFC_GL_LEDGERS_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GFC_GL_LEDGERS_V" ("LEDGER_ID", "NAME", "SHORT_NAME", "DESCRIPTION", "LEDGER_CATEGORY_CODE", "ALC_LEDGER_TYPE_CODE", "OBJECT_TYPE_CODE", "LE_LEDGER_TYPE_CODE", "COMPLETION_STATUS_CODE", "CONFIGURATION_ID", "CHART_OF_ACCOUNTS_ID", "CURRENCY_CODE", "PERIOD_SET_NAME", "ACCOUNTED_PERIOD_TYPE", "FIRST_LEDGER_PERIOD_NAME", "RET_EARN_CODE_COMBINATION_ID", "SUSPENSE_ALLOWED_FLAG", "ALLOW_INTERCOMPANY_POST_FLAG", "TRACK_ROUNDING_IMBALANCE_FLAG", "ENABLE_AVERAGE_BALANCES_FLAG", "CUM_TRANS_CODE_COMBINATION_ID", "RES_ENCUMB_CODE_COMBINATION_ID", "NET_INCOME_CODE_COMBINATION_ID", "ROUNDING_CODE_COMBINATION_ID", "ENABLE_BUDGETARY_CONTROL_FLAG", "REQUIRE_BUDGET_JOURNALS_FLAG", "ENABLE_JE_APPROVAL_FLAG", "ENABLE_AUTOMATIC_TAX_FLAG", "CONSOLIDATION_LEDGER_FLAG", "TRANSLATE_EOD_FLAG", "TRANSLATE_QATD_FLAG", "TRANSLATE_YATD_FLAG", "TRANSACTION_CALENDAR_ID", "DAILY_TRANSLATION_RATE_TYPE", "AUTOMATICALLY_CREATED_FLAG", "BAL_SEG_VALUE_OPTION_CODE", "BAL_SEG_COLUMN_NAME", "MGT_SEG_VALUE_OPTION_CODE", "MGT_SEG_COLUMN_NAME", "BAL_SEG_VALUE_SET_ID", "MGT_SEG_VALUE_SET_ID", "IMPLICIT_ACCESS_SET_ID", "CRITERIA_SET_ID", "FUTURE_ENTERABLE_PERIODS_LIMIT", "LEDGER_ATTRIBUTES", "IMPLICIT_LEDGER_SET_ID", "LATEST_OPENED_PERIOD_NAME", "LATEST_ENCUMBRANCE_YEAR", "PERIOD_AVERAGE_RATE_TYPE", "PERIOD_END_RATE_TYPE", "BUDGET_PERIOD_AVG_RATE_TYPE", "BUDGET_PERIOD_END_RATE_TYPE", "SLA_ACCOUNTING_METHOD_CODE", "SLA_ACCOUNTING_METHOD_TYPE", "SLA_DESCRIPTION_LANGUAGE", "SLA_ENTERED_CUR_BAL_SUS_CCID", "SLA_SEQUENCING_FLAG", "SLA_BAL_BY_LEDGER_CURR_FLAG", "SLA_LEDGER_CUR_BAL_SUS_CCID", "ENABLE_SECONDARY_TRACK_FLAG", "ENABLE_REVAL_SS_TRACK_FLAG", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_LOGIN", "CONTEXT", "ATTRIBUTE1", "ATTRIBUTE2", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "ATTRIBUTE6", "ATTRIBUTE7", "ATTRIBUTE8", "ATTRIBUTE9", "ATTRIBUTE10", "ATTRIBUTE11", "ATTRIBUTE12", "ATTRIBUTE13", "ATTRIBUTE14", "ATTRIBUTE15", "ENABLE_RECONCILIATION_FLAG", "CREATE_JE_FLAG", "SLA_LEDGER_CASH_BASIS_FLAG", "COMPLETE_FLAG", "COMMITMENT_BUDGET_FLAG", "NET_CLOSING_BAL_FLAG", "AUTOMATE_SEC_JRNL_REV_FLAG") AS 
  select "LEDGER_ID","NAME","SHORT_NAME","DESCRIPTION","LEDGER_CATEGORY_CODE","ALC_LEDGER_TYPE_CODE","OBJECT_TYPE_CODE","LE_LEDGER_TYPE_CODE","COMPLETION_STATUS_CODE","CONFIGURATION_ID","CHART_OF_ACCOUNTS_ID","CURRENCY_CODE","PERIOD_SET_NAME","ACCOUNTED_PERIOD_TYPE","FIRST_LEDGER_PERIOD_NAME","RET_EARN_CODE_COMBINATION_ID","SUSPENSE_ALLOWED_FLAG","ALLOW_INTERCOMPANY_POST_FLAG","TRACK_ROUNDING_IMBALANCE_FLAG","ENABLE_AVERAGE_BALANCES_FLAG","CUM_TRANS_CODE_COMBINATION_ID","RES_ENCUMB_CODE_COMBINATION_ID","NET_INCOME_CODE_COMBINATION_ID","ROUNDING_CODE_COMBINATION_ID","ENABLE_BUDGETARY_CONTROL_FLAG","REQUIRE_BUDGET_JOURNALS_FLAG","ENABLE_JE_APPROVAL_FLAG","ENABLE_AUTOMATIC_TAX_FLAG","CONSOLIDATION_LEDGER_FLAG","TRANSLATE_EOD_FLAG","TRANSLATE_QATD_FLAG","TRANSLATE_YATD_FLAG","TRANSACTION_CALENDAR_ID","DAILY_TRANSLATION_RATE_TYPE","AUTOMATICALLY_CREATED_FLAG","BAL_SEG_VALUE_OPTION_CODE","BAL_SEG_COLUMN_NAME","MGT_SEG_VALUE_OPTION_CODE","MGT_SEG_COLUMN_NAME","BAL_SEG_VALUE_SET_ID","MGT_SEG_VALUE_SET_ID","IMPLICIT_ACCESS_SET_ID","CRITERIA_SET_ID","FUTURE_ENTERABLE_PERIODS_LIMIT","LEDGER_ATTRIBUTES","IMPLICIT_LEDGER_SET_ID","LATEST_OPENED_PERIOD_NAME","LATEST_ENCUMBRANCE_YEAR","PERIOD_AVERAGE_RATE_TYPE","PERIOD_END_RATE_TYPE","BUDGET_PERIOD_AVG_RATE_TYPE","BUDGET_PERIOD_END_RATE_TYPE","SLA_ACCOUNTING_METHOD_CODE","SLA_ACCOUNTING_METHOD_TYPE","SLA_DESCRIPTION_LANGUAGE","SLA_ENTERED_CUR_BAL_SUS_CCID","SLA_SEQUENCING_FLAG","SLA_BAL_BY_LEDGER_CURR_FLAG","SLA_LEDGER_CUR_BAL_SUS_CCID","ENABLE_SECONDARY_TRACK_FLAG","ENABLE_REVAL_SS_TRACK_FLAG","LAST_UPDATE_DATE","LAST_UPDATED_BY","CREATION_DATE","CREATED_BY","LAST_UPDATE_LOGIN","CONTEXT","ATTRIBUTE1","ATTRIBUTE2","ATTRIBUTE3","ATTRIBUTE4","ATTRIBUTE5","ATTRIBUTE6","ATTRIBUTE7","ATTRIBUTE8","ATTRIBUTE9","ATTRIBUTE10","ATTRIBUTE11","ATTRIBUTE12","ATTRIBUTE13","ATTRIBUTE14","ATTRIBUTE15","ENABLE_RECONCILIATION_FLAG","CREATE_JE_FLAG","SLA_LEDGER_CASH_BASIS_FLAG","COMPLETE_FLAG","COMMITMENT_BUDGET_FLAG","NET_CLOSING_BAL_FLAG","AUTOMATE_SEC_JRNL_REV_FLAG" from gl_ledgers where ledger_id = 2040;
--------------------------------------------------------
--  DDL for View XXSC_GFC_GL_PERIOD_STATUSES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GFC_GL_PERIOD_STATUSES_V" ("APPLICATION_ID", "SET_OF_BOOKS_ID", "PERIOD_NAME", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "CLOSING_STATUS", "START_DATE", "END_DATE", "YEAR_START_DATE", "QUARTER_NUM", "QUARTER_START_DATE", "PERIOD_TYPE", "PERIOD_YEAR", "EFFECTIVE_PERIOD_NUM", "PERIOD_NUM", "ADJUSTMENT_PERIOD_FLAG", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_LOGIN", "ELIMINATION_CONFIRMED_FLAG", "ATTRIBUTE1", "ATTRIBUTE2", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "CONTEXT", "CHRONOLOGICAL_SEQ_STATUS_CODE", "LEDGER_ID", "MIGRATION_STATUS_CODE", "TRACK_BC_YTD_FLAG") AS 
  select "APPLICATION_ID","SET_OF_BOOKS_ID","PERIOD_NAME","LAST_UPDATE_DATE","LAST_UPDATED_BY","CLOSING_STATUS","START_DATE","END_DATE","YEAR_START_DATE","QUARTER_NUM","QUARTER_START_DATE","PERIOD_TYPE","PERIOD_YEAR","EFFECTIVE_PERIOD_NUM","PERIOD_NUM","ADJUSTMENT_PERIOD_FLAG","CREATION_DATE","CREATED_BY","LAST_UPDATE_LOGIN","ELIMINATION_CONFIRMED_FLAG","ATTRIBUTE1","ATTRIBUTE2","ATTRIBUTE3","ATTRIBUTE4","ATTRIBUTE5","CONTEXT","CHRONOLOGICAL_SEQ_STATUS_CODE","LEDGER_ID","MIGRATION_STATUS_CODE","TRACK_BC_YTD_FLAG" from gl_period_statuses where set_of_books_id = 2040;
--------------------------------------------------------
--  DDL for View XXSC_GFC_GLCC_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GFC_GLCC_V" ("CODE_COMBINATION_ID", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "CHART_OF_ACCOUNTS_ID", "DETAIL_POSTING_ALLOWED_FLAG", "DETAIL_BUDGETING_ALLOWED_FLAG", "ACCOUNT_TYPE", "ENABLED_FLAG", "SUMMARY_FLAG", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "SEGMENT10", "SEGMENT11", "SEGMENT12", "SEGMENT13", "SEGMENT14", "SEGMENT15", "SEGMENT16", "SEGMENT17", "SEGMENT18", "SEGMENT19", "SEGMENT20", "SEGMENT21", "SEGMENT22", "SEGMENT23", "SEGMENT24", "SEGMENT25", "SEGMENT26", "SEGMENT27", "SEGMENT28", "SEGMENT29", "SEGMENT30", "DESCRIPTION", "TEMPLATE_ID", "ALLOCATION_CREATE_FLAG", "START_DATE_ACTIVE", "END_DATE_ACTIVE", "ATTRIBUTE1", "ATTRIBUTE2", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "ATTRIBUTE6", "ATTRIBUTE7", "ATTRIBUTE8", "ATTRIBUTE9", "ATTRIBUTE10", "CONTEXT", "SEGMENT_ATTRIBUTE1", "SEGMENT_ATTRIBUTE2", "SEGMENT_ATTRIBUTE3", "SEGMENT_ATTRIBUTE4", "SEGMENT_ATTRIBUTE5", "SEGMENT_ATTRIBUTE6", "SEGMENT_ATTRIBUTE7", "SEGMENT_ATTRIBUTE8", "SEGMENT_ATTRIBUTE9", "SEGMENT_ATTRIBUTE10", "SEGMENT_ATTRIBUTE11", "SEGMENT_ATTRIBUTE12", "SEGMENT_ATTRIBUTE13", "SEGMENT_ATTRIBUTE14", "SEGMENT_ATTRIBUTE15", "SEGMENT_ATTRIBUTE16", "SEGMENT_ATTRIBUTE17", "SEGMENT_ATTRIBUTE18", "SEGMENT_ATTRIBUTE19", "SEGMENT_ATTRIBUTE20", "SEGMENT_ATTRIBUTE21", "SEGMENT_ATTRIBUTE22", "SEGMENT_ATTRIBUTE23", "SEGMENT_ATTRIBUTE24", "SEGMENT_ATTRIBUTE25", "SEGMENT_ATTRIBUTE26", "SEGMENT_ATTRIBUTE27", "SEGMENT_ATTRIBUTE28", "SEGMENT_ATTRIBUTE29", "SEGMENT_ATTRIBUTE30", "SEGMENT_ATTRIBUTE31", "SEGMENT_ATTRIBUTE32", "SEGMENT_ATTRIBUTE33", "SEGMENT_ATTRIBUTE34", "SEGMENT_ATTRIBUTE35", "SEGMENT_ATTRIBUTE36", "SEGMENT_ATTRIBUTE37", "SEGMENT_ATTRIBUTE38", "SEGMENT_ATTRIBUTE39", "SEGMENT_ATTRIBUTE40", "SEGMENT_ATTRIBUTE41", "SEGMENT_ATTRIBUTE42", "REFERENCE1", "REFERENCE2", "REFERENCE3", "REFERENCE4", "REFERENCE5", "JGZZ_RECON_FLAG", "JGZZ_RECON_CONTEXT", "PRESERVE_FLAG", "REFRESH_FLAG", "IGI_BALANCED_BUDGET_FLAG", "COMPANY_COST_CENTER_ORG_ID", "REVALUATION_ID", "LEDGER_SEGMENT", "LEDGER_TYPE_CODE", "ALTERNATE_CODE_COMBINATION_ID") AS 
  select "CODE_COMBINATION_ID","LAST_UPDATE_DATE","LAST_UPDATED_BY","CHART_OF_ACCOUNTS_ID","DETAIL_POSTING_ALLOWED_FLAG","DETAIL_BUDGETING_ALLOWED_FLAG","ACCOUNT_TYPE","ENABLED_FLAG","SUMMARY_FLAG","SEGMENT1","SEGMENT2","SEGMENT3","SEGMENT4","SEGMENT5","SEGMENT6","SEGMENT7","SEGMENT8","SEGMENT9","SEGMENT10","SEGMENT11","SEGMENT12","SEGMENT13","SEGMENT14","SEGMENT15","SEGMENT16","SEGMENT17","SEGMENT18","SEGMENT19","SEGMENT20","SEGMENT21","SEGMENT22","SEGMENT23","SEGMENT24","SEGMENT25","SEGMENT26","SEGMENT27","SEGMENT28","SEGMENT29","SEGMENT30","DESCRIPTION","TEMPLATE_ID","ALLOCATION_CREATE_FLAG","START_DATE_ACTIVE","END_DATE_ACTIVE","ATTRIBUTE1","ATTRIBUTE2","ATTRIBUTE3","ATTRIBUTE4","ATTRIBUTE5","ATTRIBUTE6","ATTRIBUTE7","ATTRIBUTE8","ATTRIBUTE9","ATTRIBUTE10","CONTEXT","SEGMENT_ATTRIBUTE1","SEGMENT_ATTRIBUTE2","SEGMENT_ATTRIBUTE3","SEGMENT_ATTRIBUTE4","SEGMENT_ATTRIBUTE5","SEGMENT_ATTRIBUTE6","SEGMENT_ATTRIBUTE7","SEGMENT_ATTRIBUTE8","SEGMENT_ATTRIBUTE9","SEGMENT_ATTRIBUTE10","SEGMENT_ATTRIBUTE11","SEGMENT_ATTRIBUTE12","SEGMENT_ATTRIBUTE13","SEGMENT_ATTRIBUTE14","SEGMENT_ATTRIBUTE15","SEGMENT_ATTRIBUTE16","SEGMENT_ATTRIBUTE17","SEGMENT_ATTRIBUTE18","SEGMENT_ATTRIBUTE19","SEGMENT_ATTRIBUTE20","SEGMENT_ATTRIBUTE21","SEGMENT_ATTRIBUTE22","SEGMENT_ATTRIBUTE23","SEGMENT_ATTRIBUTE24","SEGMENT_ATTRIBUTE25","SEGMENT_ATTRIBUTE26","SEGMENT_ATTRIBUTE27","SEGMENT_ATTRIBUTE28","SEGMENT_ATTRIBUTE29","SEGMENT_ATTRIBUTE30","SEGMENT_ATTRIBUTE31","SEGMENT_ATTRIBUTE32","SEGMENT_ATTRIBUTE33","SEGMENT_ATTRIBUTE34","SEGMENT_ATTRIBUTE35","SEGMENT_ATTRIBUTE36","SEGMENT_ATTRIBUTE37","SEGMENT_ATTRIBUTE38","SEGMENT_ATTRIBUTE39","SEGMENT_ATTRIBUTE40","SEGMENT_ATTRIBUTE41","SEGMENT_ATTRIBUTE42","REFERENCE1","REFERENCE2","REFERENCE3","REFERENCE4","REFERENCE5","JGZZ_RECON_FLAG","JGZZ_RECON_CONTEXT","PRESERVE_FLAG","REFRESH_FLAG","IGI_BALANCED_BUDGET_FLAG","COMPANY_COST_CENTER_ORG_ID","REVALUATION_ID","LEDGER_SEGMENT","LEDGER_TYPE_CODE","ALTERNATE_CODE_COMBINATION_ID" from gl_code_combinations where segment1='41';
--------------------------------------------------------
--  DDL for View XXSC_GL_HISTORY_01_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GL_HISTORY_01_V" ("STATUS", "LEDGER_ID", "ACTUAL_FLAG", "DATE_CREATED", "CREATED_BY", "CURRENCY_CODE", "USER_JE_SOURCE_NAME", "USER_JE_CATEGORY_NAME", "ACCOUNTING_DATE", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "ENTERED_DR", "ENTERED_CR", "ACCOUNTED_DR", "ACCOUNTED_CR", "REFERENCE1", "REFERENCE2", "REFERENCE4", "REFERENCE5", "REFERENCE10", "PERIOD_YEAR", "PERIOD_NUM", "ENTERED_DEBIT", "ENTERED_CREDIT", "ACCOUNTED_DEBIT", "ACCOUNTED_CREDIT") AS 
  SELECT
'NEW' STATUS,
new_ledger_id ledger_id,
'A' ACTUAL_FLAG,
SYSDATE DATE_CREATED,
-1 CREATED_BY,
CURRENCY CURRENCY_CODE,
'History' USER_JE_SOURCE_NAME,
'History' USER_JE_CATEGORY_NAME,
--PERIOD_NAME,
ACCOUNTING_DATE,
NEW_SEGMENT1 SEGMENT1,
NEW_SEGMENT2  SEGMENT2,
NEW_SEGMENT3  SEGMENT3,
NEW_SEGMENT4  SEGMENT4,
NEW_SEGMENT5  SEGMENT5,
NEW_SEGMENT6  SEGMENT6,
NEW_SEGMENT7  SEGMENT7,
NEW_SEGMENT8  SEGMENT8,
NEW_SEGMENT9  SEGMENT9,
ENTERED_DR,
ENTERED_CR,
ACCOUNTED_DR,
ACCOUNTED_CR,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')  REFERENCE1,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE2,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE4,  
NEW_SEGMENT1||' TB UPLOAD FOR '|| TO_CHAR(ACCOUNTING_DATE,'MON-RRRR') REFERENCE5,  
substr('Balance in '||ACCT_CODE_LEGACY_SYS, 1, 240)   REFERENCE10,
TO_CHAR(ACCOUNTING_DATE,'RRRR') PERIOD_YEAR,
TO_CHAR(ACCOUNTING_DATE,'MM') PERIOD_NUM,
ENTERED_DEBIT,
ENTERED_CREDIT,
ACCOUNTED_DEBIT,
ACCOUNTED_CREDIT
from XXSC_GL_INTERFACE_TEMP_01 
WHERE  ACCOUNTING_DATE <= '31-DEC-14'  
AND MIGRATED_FLAG = 'Y'
UNION ALL 
SELECT
'NEW' STATUS,
new_ledger_id ledger_id,
'A' ACTUAL_FLAG,
SYSDATE DATE_CREATED,
-1 CREATED_BY,
CURRENCY CURRENCY_CODE,
'History' USER_JE_SOURCE_NAME,
'History' USER_JE_CATEGORY_NAME,
--PERIOD_NAME,
ACCOUNTING_DATE,
NEW_SEGMENT1 SEGMENT1,
NEW_SEGMENT2  SEGMENT2,
NEW_SEGMENT3  SEGMENT3,
NEW_SEGMENT4  SEGMENT4,
NEW_SEGMENT5  SEGMENT5,
NEW_SEGMENT6  SEGMENT6,
NEW_SEGMENT7  SEGMENT7,
NEW_SEGMENT8  SEGMENT8,
NEW_SEGMENT9  SEGMENT9,
ENTERED_DR,
ENTERED_CR,
ACCOUNTED_DR,
ACCOUNTED_CR,
NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')  REFERENCE1,
NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE2,
NVL(JOURNAL_NAME, 'MISSING JV INFO') REFERENCE4,  
NVL(JOURNAL_NAME, 'MISSING JV INFO') REFERENCE5,  
substr(LINE_DESCRIPTION||' | ' ||ACCT_CODE_LEGACY_SYS, 1, 240)   REFERENCE10,
TO_CHAR(ACCOUNTING_DATE,'RRRR') PERIOD_YEAR,
TO_CHAR(ACCOUNTING_DATE,'MM') PERIOD_NUM,
ENTERED_DEBIT,
ENTERED_CREDIT,
ACCOUNTED_DEBIT,
ACCOUNTED_CREDIT
from XXSC_GL_INTERFACE_TEMP_01
WHERE 1=1
AND MIGRATED_FLAG = 'Y'
AND ACCOUNTING_DATE > '31-DEC-14';
--------------------------------------------------------
--  DDL for View XXSC_GL_HISTORY_212224_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GL_HISTORY_212224_V" ("STATUS", "LEDGER_ID", "ACTUAL_FLAG", "DATE_CREATED", "CREATED_BY", "CURRENCY_CODE", "USER_JE_SOURCE_NAME", "USER_JE_CATEGORY_NAME", "ACCOUNTING_DATE", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "ENTERED_DR", "ENTERED_CR", "ACCOUNTED_DR", "ACCOUNTED_CR", "REFERENCE1", "REFERENCE2", "REFERENCE4", "REFERENCE5", "REFERENCE10", "PERIOD_YEAR", "PERIOD_NUM", "ENTERED_DEBIT", "ENTERED_CREDIT", "ACCOUNTED_DEBIT", "ACCOUNTED_CREDIT", "BATCH_REFERENCE") AS 
  SELECT
'NEW' STATUS,
new_ledger_id ledger_id,
'A' ACTUAL_FLAG,
SYSDATE DATE_CREATED,
-1 CREATED_BY,
CURRENCY CURRENCY_CODE,
'History' USER_JE_SOURCE_NAME,
'History' USER_JE_CATEGORY_NAME,
--PERIOD_NAME,
ACCOUNTING_DATE,
NEW_SEGMENT1 SEGMENT1,
NEW_SEGMENT2  SEGMENT2,
NEW_SEGMENT3  SEGMENT3,
NEW_SEGMENT4  SEGMENT4,
NEW_SEGMENT5  SEGMENT5,
NEW_SEGMENT6  SEGMENT6,
NEW_SEGMENT7  SEGMENT7,
NEW_SEGMENT8  SEGMENT8,
NEW_SEGMENT9  SEGMENT9,
ENTERED_DR,
ENTERED_CR,
ACCOUNTED_DR,
ACCOUNTED_CR,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')  REFERENCE1,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE2,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE4,  
NEW_SEGMENT1||' TB UPLOAD FOR '|| TO_CHAR(ACCOUNTING_DATE,'MON-RRRR') REFERENCE5,  
substr('Balance in '||ACCT_CODE_LEGACY_SYS, 1, 240)   REFERENCE10,
TO_CHAR(ACCOUNTING_DATE,'RRRR') PERIOD_YEAR,
TO_CHAR(ACCOUNTING_DATE,'MM') PERIOD_NUM,
ENTERED_DEBIT,
ENTERED_CREDIT,
ACCOUNTED_DEBIT,
ACCOUNTED_CREDIT,
BATCH_REFERENCE
from XXSC_GL_INTERFACE_TEMP_212224
where  MIGRATED_FLAG='Y' AND JV_NO IS  NULL
UNION ALL
SELECT
'NEW' STATUS,
new_ledger_id ledger_id,
'A' ACTUAL_FLAG,
SYSDATE DATE_CREATED,
-1 CREATED_BY,
CURRENCY CURRENCY_CODE,
'History' USER_JE_SOURCE_NAME,
'History' USER_JE_CATEGORY_NAME,
--PERIOD_NAME,
ACCOUNTING_DATE,
NEW_SEGMENT1 SEGMENT1,
NEW_SEGMENT2  SEGMENT2,
NEW_SEGMENT3  SEGMENT3,
NEW_SEGMENT4  SEGMENT4,
NEW_SEGMENT5  SEGMENT5,
NEW_SEGMENT6  SEGMENT6,
NEW_SEGMENT7  SEGMENT7,
NEW_SEGMENT8  SEGMENT8,
NEW_SEGMENT9  SEGMENT9,
ENTERED_DR,
ENTERED_CR,
ACCOUNTED_DR,
ACCOUNTED_CR,
NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')  REFERENCE1,
NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE2,
NVL(JV_NO, NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')) REFERENCE4,  
NVL(JV_NO, NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')) REFERENCE5,  
substr(LINE_DESCRIPTION||' | ' ||ACCT_CODE_LEGACY_SYS, 1, 240)   REFERENCE10,
TO_CHAR(ACCOUNTING_DATE,'RRRR') PERIOD_YEAR,
TO_CHAR(ACCOUNTING_DATE,'MM') PERIOD_NUM,
ENTERED_DEBIT,
ENTERED_CREDIT,
ACCOUNTED_DEBIT,
ACCOUNTED_CREDIT,
BATCH_REFERENCE
from XXSC_GL_INTERFACE_TEMP_212224
WHERE  MIGRATED_FLAG='Y' AND JV_NO IS NOT NULL ;
--------------------------------------------------------
--  DDL for View XXSC_GL_HISTORY_21X_Q1_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GL_HISTORY_21X_Q1_V" ("STATUS", "LEDGER_ID", "ACTUAL_FLAG", "DATE_CREATED", "CREATED_BY", "CURRENCY_CODE", "USER_JE_SOURCE_NAME", "USER_JE_CATEGORY_NAME", "ACCOUNTING_DATE", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "ENTERED_DR", "ENTERED_CR", "ACCOUNTED_DR", "ACCOUNTED_CR", "REFERENCE1", "REFERENCE2", "REFERENCE4", "REFERENCE5", "REFERENCE10", "PERIOD_YEAR", "PERIOD_NUM", "ENTERED_DEBIT", "ENTERED_CREDIT", "ACCOUNTED_DEBIT", "ACCOUNTED_CREDIT", "BATCH_REFERENCE") AS 
  SELECT 'NEW' STATUS,
          new_ledger_id ledger_id,
          'A' ACTUAL_FLAG,
          SYSDATE DATE_CREATED,
          -1 CREATED_BY,
          CURRENCY CURRENCY_CODE,
          'History' USER_JE_SOURCE_NAME,
          'History' USER_JE_CATEGORY_NAME,
          --PERIOD_NAME,
          ACCOUNTING_DATE,
          NEW_SEGMENT1 SEGMENT1,
          NEW_SEGMENT2 SEGMENT2,
          NEW_SEGMENT3 SEGMENT3,
          NEW_SEGMENT4 SEGMENT4,
          NEW_SEGMENT5 SEGMENT5,
          NEW_SEGMENT6 SEGMENT6,
          NEW_SEGMENT7 SEGMENT7,
          NEW_SEGMENT8 SEGMENT8,
          NEW_SEGMENT9 SEGMENT9,
          ENTERED_DR,
          ENTERED_CR,
          ACCOUNTED_DR,
          ACCOUNTED_CR,
             NEW_SEGMENT1
          || ' TB UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE1,
             NEW_SEGMENT1
          || ' TB UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE2,
             NEW_SEGMENT1
          || ' TB UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE4,
             NEW_SEGMENT1
          || ' TB UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE5,
          SUBSTR ('Balance in ' || ACCT_CODE_LEGACY_SYS, 1, 240) REFERENCE10,
          TO_CHAR (ACCOUNTING_DATE, 'RRRR') PERIOD_YEAR,
          TO_CHAR (ACCOUNTING_DATE, 'MM') PERIOD_NUM,
          ENTERED_DEBIT,
          ENTERED_CREDIT,
          ACCOUNTED_DEBIT,
          ACCOUNTED_CREDIT,
          BATCH_REFERENCE
     FROM xxsc_gl_interface_temp_21X_Q1
    WHERE MIGRATED_FLAG = 'Y' AND JV_NO IS NULL
   UNION ALL
   SELECT 'NEW' STATUS,
          new_ledger_id ledger_id,
          'A' ACTUAL_FLAG,
          SYSDATE DATE_CREATED,
          -1 CREATED_BY,
          CURRENCY CURRENCY_CODE,
          'History' USER_JE_SOURCE_NAME,
          'History' USER_JE_CATEGORY_NAME,
          --PERIOD_NAME,
          ACCOUNTING_DATE,
          NEW_SEGMENT1 SEGMENT1,
          NEW_SEGMENT2 SEGMENT2,
          NEW_SEGMENT3 SEGMENT3,
          NEW_SEGMENT4 SEGMENT4,
          NEW_SEGMENT5 SEGMENT5,
          NEW_SEGMENT6 SEGMENT6,
          NEW_SEGMENT7 SEGMENT7,
          NEW_SEGMENT8 SEGMENT8,
          NEW_SEGMENT9 SEGMENT9,
          ENTERED_DR,
          ENTERED_CR,
          ACCOUNTED_DR,
          ACCOUNTED_CR,
             NEW_SEGMENT1
          || ' JOURNALS UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE1,
             NEW_SEGMENT1
          || ' JOURNALS UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE2,
          NVL (
             JV_NO,
                NEW_SEGMENT1
             || ' JOURNALS UPLOAD FOR '
             || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR'))
             REFERENCE4,
          NVL (
             JV_NO,
                NEW_SEGMENT1
             || ' JOURNALS UPLOAD FOR '
             || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR'))
             REFERENCE5,
          SUBSTR (LINE_DESCRIPTION || ' | ' || ACCT_CODE_LEGACY_SYS, 1, 240)
             REFERENCE10,
          TO_CHAR (ACCOUNTING_DATE, 'RRRR') PERIOD_YEAR,
          TO_CHAR (ACCOUNTING_DATE, 'MM') PERIOD_NUM,
          ENTERED_DEBIT,
          ENTERED_CREDIT,
          ACCOUNTED_DEBIT,
          ACCOUNTED_CREDIT,
          BATCH_REFERENCE
     FROM xxsc_gl_interface_temp_21X_Q1
    WHERE MIGRATED_FLAG = 'Y' AND JV_NO IS NOT NULL;
--------------------------------------------------------
--  DDL for View XXSC_GL_HISTORY_23_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GL_HISTORY_23_V" ("STATUS", "LEDGER_ID", "ACTUAL_FLAG", "DATE_CREATED", "CREATED_BY", "CURRENCY_CODE", "USER_JE_SOURCE_NAME", "USER_JE_CATEGORY_NAME", "ACCOUNTING_DATE", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "ENTERED_DR", "ENTERED_CR", "ACCOUNTED_DR", "ACCOUNTED_CR", "REFERENCE1", "REFERENCE2", "REFERENCE4", "REFERENCE5", "REFERENCE10", "PERIOD_YEAR", "PERIOD_NUM", "ENTERED_DEBIT", "ENTERED_CREDIT", "ACCOUNTED_DEBIT", "ACCOUNTED_CREDIT", "BATCH_REFERENCE") AS 
  SELECT
'NEW' STATUS,
new_ledger_id ledger_id,
'A' ACTUAL_FLAG,
SYSDATE DATE_CREATED,
-1 CREATED_BY,
CURRENCY CURRENCY_CODE,
'History' USER_JE_SOURCE_NAME,
'History' USER_JE_CATEGORY_NAME,
--PERIOD_NAME,
ACCOUNTING_DATE,
NEW_SEGMENT1 SEGMENT1,
NEW_SEGMENT2  SEGMENT2,
NEW_SEGMENT3  SEGMENT3,
NEW_SEGMENT4  SEGMENT4,
NEW_SEGMENT5  SEGMENT5,
NEW_SEGMENT6  SEGMENT6,
NEW_SEGMENT7  SEGMENT7,
NEW_SEGMENT8  SEGMENT8,
NEW_SEGMENT9  SEGMENT9,
ENTERED_DR,
ENTERED_CR,
ACCOUNTED_DR,
ACCOUNTED_CR,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')  REFERENCE1,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE2,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE4,  
NEW_SEGMENT1||' TB UPLOAD FOR '|| TO_CHAR(ACCOUNTING_DATE,'MON-RRRR') REFERENCE5,  
substr('Balance in '||ACCT_CODE_LEGACY_SYS, 1, 240)   REFERENCE10,
TO_CHAR(ACCOUNTING_DATE,'RRRR') PERIOD_YEAR,
TO_CHAR(ACCOUNTING_DATE,'MM') PERIOD_NUM,
ENTERED_DEBIT,
ENTERED_CREDIT,
ACCOUNTED_DEBIT,
ACCOUNTED_CREDIT,
BATCH_REFERENCE
from XXSC_GL_INTERFACE_TEMP_23
where  MIGRATED_FLAG='Y' AND JV_NO IS  NULL
UNION ALL
SELECT
'NEW' STATUS,
new_ledger_id ledger_id,
'A' ACTUAL_FLAG,
SYSDATE DATE_CREATED,
-1 CREATED_BY,
CURRENCY CURRENCY_CODE,
'History' USER_JE_SOURCE_NAME,
'History' USER_JE_CATEGORY_NAME,
--PERIOD_NAME,
ACCOUNTING_DATE,
NEW_SEGMENT1 SEGMENT1,
NEW_SEGMENT2  SEGMENT2,
NEW_SEGMENT3  SEGMENT3,
NEW_SEGMENT4  SEGMENT4,
NEW_SEGMENT5  SEGMENT5,
NEW_SEGMENT6  SEGMENT6,
NEW_SEGMENT7  SEGMENT7,
NEW_SEGMENT8  SEGMENT8,
NEW_SEGMENT9  SEGMENT9,
ENTERED_DR,
ENTERED_CR,
ACCOUNTED_DR,
ACCOUNTED_CR,
NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')  REFERENCE1,
NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE2,
NVL(JV_NO, NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')) REFERENCE4,  
NVL(JV_NO, NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')) REFERENCE5,  
substr(LINE_DESCRIPTION||' | ' ||ACCT_CODE_LEGACY_SYS, 1, 240)   REFERENCE10,
TO_CHAR(ACCOUNTING_DATE,'RRRR') PERIOD_YEAR,
TO_CHAR(ACCOUNTING_DATE,'MM') PERIOD_NUM,
ENTERED_DEBIT,
ENTERED_CREDIT,
ACCOUNTED_DEBIT,
ACCOUNTED_CREDIT,
BATCH_REFERENCE
from XXSC_GL_INTERFACE_TEMP_23
WHERE  MIGRATED_FLAG='Y' AND JV_NO IS NOT NULL;
--------------------------------------------------------
--  DDL for View XXSC_GL_HISTORY_41_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GL_HISTORY_41_V" ("STATUS", "LEDGER_ID", "ACTUAL_FLAG", "DATE_CREATED", "CREATED_BY", "CURRENCY_CODE", "USER_JE_SOURCE_NAME", "USER_JE_CATEGORY_NAME", "ACCOUNTING_DATE", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "ENTERED_DR", "ENTERED_CR", "ACCOUNTED_DR", "ACCOUNTED_CR", "REFERENCE1", "REFERENCE2", "REFERENCE4", "REFERENCE5", "REFERENCE10", "PERIOD_YEAR", "PERIOD_NUM", "ENTERED_DEBIT", "ENTERED_CREDIT", "ACCOUNTED_DEBIT", "ACCOUNTED_CREDIT", "BATCH_REFERENCE") AS 
  SELECT
'NEW' STATUS,
new_ledger_id ledger_id,
'A' ACTUAL_FLAG,
SYSDATE DATE_CREATED,
-1 CREATED_BY,
CURRENCY CURRENCY_CODE,
'History' USER_JE_SOURCE_NAME,
'History' USER_JE_CATEGORY_NAME,
--PERIOD_NAME,
ACCOUNTING_DATE,
NEW_SEGMENT1 SEGMENT1,
NEW_SEGMENT2  SEGMENT2,
NEW_SEGMENT3  SEGMENT3,
NEW_SEGMENT4  SEGMENT4,
NEW_SEGMENT5  SEGMENT5,
NEW_SEGMENT6  SEGMENT6,
NEW_SEGMENT7  SEGMENT7,
NEW_SEGMENT8  SEGMENT8,
NEW_SEGMENT9  SEGMENT9,
ENTERED_DR,
ENTERED_CR,
ACCOUNTED_DR,
ACCOUNTED_CR,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')  REFERENCE1,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE2,
NEW_SEGMENT1||' TB UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE4,  
NEW_SEGMENT1||' TB UPLOAD FOR '|| TO_CHAR(ACCOUNTING_DATE,'MON-RRRR') REFERENCE5,  
substr('Balance in '||ACCT_CODE_LEGACY_SYS, 1, 240)   REFERENCE10,
TO_CHAR(ACCOUNTING_DATE,'RRRR') PERIOD_YEAR,
TO_CHAR(ACCOUNTING_DATE,'MM') PERIOD_NUM,
ENTERED_DEBIT,
ENTERED_CREDIT,
ACCOUNTED_DEBIT,
ACCOUNTED_CREDIT,
BATCH_REFERENCE
from XXSC_GL_INTERFACE_TEMP_41
where  MIGRATED_FLAG='Y' AND JV_NO IS  NULL
UNION ALL
SELECT
'NEW' STATUS,
new_ledger_id ledger_id,
'A' ACTUAL_FLAG,
SYSDATE DATE_CREATED,
-1 CREATED_BY,
CURRENCY CURRENCY_CODE,
'History' USER_JE_SOURCE_NAME,
'History' USER_JE_CATEGORY_NAME,
--PERIOD_NAME,
ACCOUNTING_DATE,
NEW_SEGMENT1 SEGMENT1,
NEW_SEGMENT2  SEGMENT2,
NEW_SEGMENT3  SEGMENT3,
NEW_SEGMENT4  SEGMENT4,
NEW_SEGMENT5  SEGMENT5,
NEW_SEGMENT6  SEGMENT6,
NEW_SEGMENT7  SEGMENT7,
NEW_SEGMENT8  SEGMENT8,
NEW_SEGMENT9  SEGMENT9,
ENTERED_DR,
ENTERED_CR,
ACCOUNTED_DR,
ACCOUNTED_CR,
NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')  REFERENCE1,
NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR') REFERENCE2,
NVL(JV_NO, NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')) REFERENCE4,  
NVL(JV_NO, NEW_SEGMENT1||' JOURNALS UPLOAD FOR '|| to_char(ACCOUNTING_DATE,'MON-RRRR')) REFERENCE5,  
substr(LINE_DESCRIPTION||' | ' ||ACCT_CODE_LEGACY_SYS, 1, 240)   REFERENCE10,
TO_CHAR(ACCOUNTING_DATE,'RRRR') PERIOD_YEAR,
TO_CHAR(ACCOUNTING_DATE,'MM') PERIOD_NUM,
ENTERED_DEBIT,
ENTERED_CREDIT,
ACCOUNTED_DEBIT,
ACCOUNTED_CREDIT,
BATCH_REFERENCE
from XXSC_GL_INTERFACE_TEMP_41
WHERE  MIGRATED_FLAG='Y' AND JV_NO IS NOT NULL ;
--------------------------------------------------------
--  DDL for View XXSC_GL_HISTORY_51_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_GL_HISTORY_51_V" ("STATUS", "LEDGER_ID", "ACTUAL_FLAG", "DATE_CREATED", "CREATED_BY", "CURRENCY_CODE", "USER_JE_SOURCE_NAME", "USER_JE_CATEGORY_NAME", "ACCOUNTING_DATE", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "ENTERED_DR", "ENTERED_CR", "ACCOUNTED_DR", "ACCOUNTED_CR", "REFERENCE1", "REFERENCE2", "REFERENCE4", "REFERENCE5", "REFERENCE10", "PERIOD_YEAR", "PERIOD_NUM", "ENTERED_DEBIT", "ENTERED_CREDIT", "ACCOUNTED_DEBIT", "ACCOUNTED_CREDIT", "BATCH_REFERENCE") AS 
  SELECT 'NEW' STATUS,
          new_ledger_id ledger_id,
          'A' ACTUAL_FLAG,
          SYSDATE DATE_CREATED,
          -1 CREATED_BY,
          CURRENCY CURRENCY_CODE,
          'History' USER_JE_SOURCE_NAME,
          'History' USER_JE_CATEGORY_NAME,
          --PERIOD_NAME,
          ACCOUNTING_DATE,
          NEW_SEGMENT1 SEGMENT1,
          NEW_SEGMENT2 SEGMENT2,
          NEW_SEGMENT3 SEGMENT3,
          NEW_SEGMENT4 SEGMENT4,
          NEW_SEGMENT5 SEGMENT5,
          NEW_SEGMENT6 SEGMENT6,
          NEW_SEGMENT7 SEGMENT7,
          NEW_SEGMENT8 SEGMENT8,
          NEW_SEGMENT9 SEGMENT9,
          ENTERED_DR,
          ENTERED_CR,
          ACCOUNTED_DR,
          ACCOUNTED_CR,
             NEW_SEGMENT1
          || ' TB UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE1,
             NEW_SEGMENT1
          || ' TB UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE2,
             NEW_SEGMENT1
          || ' TB UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE4,
             NEW_SEGMENT1
          || ' TB UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE5,
          SUBSTR ('Balance in ' || ACCT_CODE_LEGACY_SYS, 1, 240) REFERENCE10,
          TO_CHAR (ACCOUNTING_DATE, 'RRRR') PERIOD_YEAR,
          TO_CHAR (ACCOUNTING_DATE, 'MM') PERIOD_NUM,
          ENTERED_DEBIT,
          ENTERED_CREDIT,
          ACCOUNTED_DEBIT,
          ACCOUNTED_CREDIT,
          BATCH_REFERENCE
     FROM XXSC_GL_INTERFACE_TEMP_51
    WHERE MIGRATED_FLAG = 'Y' AND JV_NO IS NULL
   UNION ALL
   SELECT 'NEW' STATUS,
          new_ledger_id ledger_id,
          'A' ACTUAL_FLAG,
          SYSDATE DATE_CREATED,
          -1 CREATED_BY,
          CURRENCY CURRENCY_CODE,
          'History' USER_JE_SOURCE_NAME,
          'History' USER_JE_CATEGORY_NAME,
          --PERIOD_NAME,
          ACCOUNTING_DATE,
          NEW_SEGMENT1 SEGMENT1,
          NEW_SEGMENT2 SEGMENT2,
          NEW_SEGMENT3 SEGMENT3,
          NEW_SEGMENT4 SEGMENT4,
          NEW_SEGMENT5 SEGMENT5,
          NEW_SEGMENT6 SEGMENT6,
          NEW_SEGMENT7 SEGMENT7,
          NEW_SEGMENT8 SEGMENT8,
          NEW_SEGMENT9 SEGMENT9,
          ENTERED_DR,
          ENTERED_CR,
          ACCOUNTED_DR,
          ACCOUNTED_CR,
             NEW_SEGMENT1
          || ' JOURNALS UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE1,
             NEW_SEGMENT1
          || ' JOURNALS UPLOAD FOR '
          || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR')
             REFERENCE2,
          NVL (
             JV_NO,
                NEW_SEGMENT1
             || ' JOURNALS UPLOAD FOR '
             || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR'))
             REFERENCE4,
          NVL (
             JV_NO,
                NEW_SEGMENT1
             || ' JOURNALS UPLOAD FOR '
             || TO_CHAR (ACCOUNTING_DATE, 'MON-RRRR'))
             REFERENCE5,
          SUBSTR (LINE_DESCRIPTION || ' | ' || ACCT_CODE_LEGACY_SYS, 1, 240)
             REFERENCE10,
          TO_CHAR (ACCOUNTING_DATE, 'RRRR') PERIOD_YEAR,
          TO_CHAR (ACCOUNTING_DATE, 'MM') PERIOD_NUM,
          ENTERED_DEBIT,
          ENTERED_CREDIT,
          ACCOUNTED_DEBIT,
          ACCOUNTED_CREDIT,
          BATCH_REFERENCE
     FROM XXSC_GL_INTERFACE_TEMP_51
    WHERE MIGRATED_FLAG = 'Y' AND JV_NO IS NOT NULL;
--------------------------------------------------------
--  DDL for View XXSC_HR_DOC_TYPES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_HR_DOC_TYPES_V" ("SYSTEM_DOCUMENT_TYPE", "RESPONSIBILITY_ID", "CATEGORY_NAME") AS 
  SELECT DISTINCT HDT.SYSTEM_DOCUMENT_TYPE,
    ITS.RESPONSIBILITY_ID,
    hdt.category_name
  FROM PER_INFO_TYPE_SECURITY ITS,
    FND_DESCR_FLEX_CONTEXTS_VL FLV,
    HR_DOCUMENT_TYPES_V HDT
  WHERE ITS.INFORMATION_TYPE             = HDT.SYSTEM_DOCUMENT_TYPE
  AND ITS.INFO_TYPE_TABLE_NAME           = 'HR_DOCUMENT_TYPES_V'
  AND ITS.INFORMATION_TYPE               = FLV.DESCRIPTIVE_FLEX_CONTEXT_CODE (+)
  AND FLV.DESCRIPTIVE_FLEXFIELD_NAME (+) = 'Extra Document Info DDF'
  AND FLV.ENABLED_FLAG (+)               = 'Y';
--------------------------------------------------------
--  DDL for View XXSC_HR_POINFO_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_HR_POINFO_V" ("EMPLOYEE_NUMBER", "EMPLOYEE_NAME", "EMPLOYEE_ID", "EMP_DEPARTMENT", "PERSON_TYPE", "EFFECTIVE_START_DATE", "EFFECTIVE_END_DATE", "LEDGER", "LEDGER_ID", "COMPANY", "LINE_OF_BUSINESS", "DEPARTMENT", "ACCOUNT", "SUB_ACCOUNT", "PRODUCT_PROJECT", "REGION", "INERTCOMPANY", "FUTURE", "ATTRIBUTE15") AS 
  SELECT   ppf.employee_number, ppf.full_name employee_name,
            ppf.person_id employee_id,
            (SELECT hr.NAME
               FROM hr_all_organization_units hr
              WHERE hr.organization_id = paf.organization_id) emp_department,
            (SELECT user_person_type
               FROM per_person_types
              WHERE person_type_id = ppf.person_type_id) person_type,
            paf.effective_start_date, paf.effective_end_date,
            (SELECT NAME
               FROM gl_ledgers
              WHERE ledger_id = set_of_books_id) ledger,
            set_of_books_id ledger_id, g.segment1 company,
            g.segment2 line_of_business, g.segment3 department,
            g.segment4 ACCOUNT, g.segment5 sub_account,
            g.segment6 product_project, g.segment7 region,
            g.segment8 inertcompany, g.segment9 future, ppf.attribute15
       FROM per_all_people_f ppf,
            per_all_assignments_f paf,
            gl_code_combinations_kfv g
      WHERE ppf.person_id = paf.person_id
        AND g.code_combination_id = paf.default_code_comb_id
        AND TRUNC (SYSDATE) BETWEEN ppf.effective_start_date
                                AND ppf.effective_end_date
        AND paf.effective_start_date = (SELECT MAX (effective_start_date)
                                          FROM per_all_assignments_f paf1
                                         WHERE paf.person_id = paf1.person_id)
  --AND TRUNC(sysdate) BETWEEN paf.EFFECTIVE_start_DATE AND paf.EFFECTIVE_END_DATE
--AND paf.primary_flag     = 'Y'
        AND ppf.employee_number IS NOT NULL
--AND ppf.employee_number  = 'S1000'
   ORDER BY 1 ;
--------------------------------------------------------
--  DDL for View XXSC_PAY_EMP_EXPENSES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_PAY_EMP_EXPENSES_V" ("TRX_SOURCE", "TRX_TYPE", "HEADER_ID", "EMPLOYEE_ID", "ACCOUNTING_DATE", "LEDGER_CURRENCY", "AMOUNT", "DOCUMENT_NO", "DESCRIPTION", "PAY_REIMBURSEMENT_DATE", "PAY_RECOVERY_DATE") AS 
  SELECT 'Employee Expenses' TRX_SOURCE,
          'Reimbursement' TRX_TYPE,
          header_id,
          employee_id,
          accoUnting_date,
          ledger_currency,
          reimbursement_amount amount,
          document_no,
          SUBSTR (description, 1, 60) description,
          pay_reimbursement_date,
          NULL pay_recovery_date
     FROM xxsc_employee_exp_hdr_t
    WHERE gl_interface_date IS NOT NULL AND pay_reimbursement_date IS NULL
   UNION ALL
   SELECT 'Employee Expenses' TRX_SOURCE,
          'Recovery' TRX_TYPE,
          header_id,
          employee_id,
          accoUnting_date,
          ledger_currency,
          recovery_amount amount,
          document_no,
          SUBSTR (description, 1, 60) description,
          NULL,
          pay_recovery_date
     FROM xxsc_employee_exp_hdr_t
    WHERE gl_interface_date IS NOT NULL AND pay_recovery_date IS NULL;
--------------------------------------------------------
--  DDL for View XXSC_PAY_STAFF_RECOVERIES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_PAY_STAFF_RECOVERIES_V" ("TRX_SOURCE", "TRX_TYPE", "HEADER_ID", "LINE_ID", "EMPLOYEE_ID", "EMPLOYEE_NAME", "EMPLOYEE_NO", "DEDUCTION_TYPE", "AMOUNT", "DOCUMENT_NO", "DESCRIPTION", "PAYROLL_INTERFACE_DATE") AS 
  SELECT 'Staff Recoveries' trx_source,
          DECODE (SIGN (l.amt_functional_currency),
                  1, 'Recovery',
                  'Reimbursement')
             trx_type,
          h.header_id,
          l.line_id,
          l.employee_id,
          l.employee_name,
          l.employee_no,
          l.deduction deduction_type,
          ABS (l.amt_functional_currency) amount,
          h.document_no,
          SUBSTR (l.description, 1, 60) description,
          payroll_interface_date
     FROM xxsc_staff_recovery_hdr_v h, xxsc_staff_recovery_lines_v l
    WHERE     h.header_id = l.header_id
          AND status_code = 'C'
          AND payroll_interface_date IS NULL;
--------------------------------------------------------
--  DDL for View XXSC_PAYROLL_ACTION_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_PAYROLL_ACTION_V" ("PAYROLL_ACTION_ID", "BUSINESS_GROUP_ID", "TYPE1", "EFFECTIVE_DATE", "ACTION_TYPE", "PAYROLL_NAME") AS 
  SELECT PAYROLL_ACTION_ID,
    PPA.BUSINESS_GROUP_ID,
    DECODE(ACTION_TYPE,'U','QuickPayre Payments','P','Prepayments') TYPE1,
    EFFECTIVE_DATE,
    ACTION_TYPE,
    PAYROLL_NAME
  FROM PAY_PAYROLL_ACTIONS PPA,
    PAY_PAYROLLS_F PPF
  WHERE PPA.PAYROLL_ID=PPF.PAYROLL_ID;
--------------------------------------------------------
--  DDL for View XXSC_SALARY_DETAILS_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_SALARY_DETAILS_V" ("ASSIGNMENT_ID", "VALUE", "BUSINESS_GROUP_ID") AS 
  SELECT PEE.assignment_id,
            NVL (TO_NUMBER (PEEV.SCREEN_ENTRY_VALUE), 0) VALUE,
            PIVF.BUSINESS_GROUP_ID
       FROM PAY_ELEMENT_ENTRIES_F PEE,
            PAY_ELEMENT_ENTRY_VALUES_F PEEV,
            PAY_ELEMENT_TYPES_F PETF,
            PAY_INPUT_VALUES_F PIVF,
            PAY_ENTRY_PROCESS_DETAILS ENTRY_PROC
      WHERE     PETF.ELEMENT_TYPE_ID = PIVF.ELEMENT_TYPE_ID
            AND PEE.ELEMENT_ENTRY_ID = PEEV.ELEMENT_ENTRY_ID
            AND PETF.ELEMENT_TYPE_ID = PEE.ELEMENT_TYPE_ID
            AND PETF.BUSINESS_GROUP_ID = PIVF.BUSINESS_GROUP_ID
            AND PIVF.INPUT_VALUE_ID = PEEV.INPUT_VALUE_ID
            AND PEE.ELEMENT_ENTRY_ID = ENTRY_PROC.ELEMENT_ENTRY_ID(+)
            AND PETF.ELEMENT_NAME IN ('Total Monthly Salary')
            AND PIVF.NAME IN ('Monthly Salary')
            --AND PEE.ASSIGNMENT_ID IN (P_ASSIGNMENT_ID)
            AND SYSDATE BETWEEN PEE.EFFECTIVE_START_DATE
                            AND PEE.EFFECTIVE_END_DATE
            AND SYSDATE BETWEEN PEEV.EFFECTIVE_START_DATE
                            AND PEEV.EFFECTIVE_END_DATE
            AND SYSDATE BETWEEN PETF.EFFECTIVE_START_DATE
                            AND PETF.EFFECTIVE_END_DATE
            AND SYSDATE BETWEEN PIVF.EFFECTIVE_START_DATE
                            AND PIVF.EFFECTIVE_END_DATE
   ORDER BY 1;
--------------------------------------------------------
--  DDL for View XXSC_STAFF_RECOVERY_HDR_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_STAFF_RECOVERY_HDR_V" ("HDR_ROWID", "HEADER_ID", "SOURCE_CODE", "INVOICE_ID", "INVOICE_NO", "INV_DISTRIBUTION_ID", "ORG_ID", "OPERATING_UNIT", "LEDGER_ID", "LEDGER", "VENDOR_ID", "VENDOR_SITE_ID", "SUPPLIER_NO", "SUPPLIER_NAME", "SUPPLIER_SITE", "RECOVERY_CCID", "RECOVERY_ACCOUNT", "DESCRIPTION", "STATUS_CODE", "STATUS", "DOCUMENT_NO", "INVOICE_DATE", "GL_DATE", "CURRENCY", "CHARGEABLE_AMOUNT", "FUNCTIONAL_AMOUNT", "USER_NAME", "ENTRY_DATE", "COMPLETED_BY", "COMPLETED_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  select h.rowid,
   H.HEADER_ID,
   H.SOURCE_CODE,
  -- DECODE(H.SOURCE_CODE,'P','Payable','O','Other') SOURCE,
   H.INVOICE_ID    ,
   decode(H.SOURCE_CODE,'P',(select AIA.INVOICE_NUM||'-'||AILA.LINE_NUMBER||'-'||AIDA.DISTRIBUTION_LINE_NUMBER
       from AP_INVOICES_ALL AIA,
             AP_INVOICE_LINES_ALL AILA,
             AP_INVOICE_DISTRIBUTIONS_ALL AIDA
      where AIA.INVOICE_ID=AILA.INVOICE_ID
      AND AILA.INVOICE_ID=AIDA.INVOICE_ID
    AND AIDA.INVOICE_DISTRIBUTION_ID=H.INV_DISTRIBUTION_ID
    AND AILA.LINE_NUMBER=AIDA.INVOICE_LINE_NUMBER
    AND AIDA.org_id=h.org_id),'O',h.INVOICE_NO) INVOICE_NO,
    H.INV_DISTRIBUTION_ID       ,
    H.ORG_ID        ,
    (SELECT NAME FROM HR_OPERATING_UNITS WHERE ORGANIZATION_ID= H.ORG_ID) OPERATING_UNIT,
    H.LEDGER_ID     ,
   (SELECT NAME FROM GL_LEDGERS GL where LEDGER_ID=h.LEDGER_ID) LEDGER,
   H.VENDOR_ID     ,
   H.VENDOR_SITE_ID  ,
   (SELECT SEGMENT1 FROM AP_SUPPLIERS WHERE VENDOR_ID=H.VENDOR_ID) SUPPLIER_NO,
   (SELECT VENDOR_NAME FROM AP_SUPPLIERS WHERE VENDOR_ID=H.VENDOR_ID) SUPPLIER_NAME,
   (select VENDOR_SITE_CODE from ap_supplier_sites_all where VENDOR_SITE_ID=H.VENDOR_SITE_ID and org_id=H.ORG_ID) SUPPLIER_SITE,
   H.RECOVERY_CCID   ,
   (select CONCATENATED_SEGMENTS from gl_code_combinations_kfv where CODE_COMBINATION_ID=H.RECOVERY_CCID) RECOVERY_ACCOUNT,
   H.DESCRIPTION     ,
   H.STATUS_CODE     ,
   decode(H.STATUS_CODE,'N','New','C','Completed','I','Interfaced') STATUS,
   H.DOCUMENT_NO     ,
   H.INVOICE_DATE    ,
   H.GL_DATE         ,
   H.CURRENCY        ,
   H.CHARGEABLE_AMOUNT  ,
   H.FUNCTIONAL_AMOUNT ,
   H.USER_NAME        ,    
   H.ENTRY_DATE       ,
   H.COMPLETED_BY     ,
   H.COMPLETED_DATE   ,
   H.CREATION_DATE                  ,
   H.CREATED_BY                     ,
   H.LAST_UPDATE_DATE               ,
   H.LAST_UPDATED_BY                ,
   h.LAST_UPDATE_LOGIN              
FROM xxsc_staff_recovery_hdr_t h;
--------------------------------------------------------
--  DDL for View XXSC_STAFF_RECOVERY_LINES_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_STAFF_RECOVERY_LINES_V" ("LN_ROWID", "LINE_ID", "HEADER_ID", "LINE_NO", "DEDUCTION_CODE", "DEDUCTION", "AMT_FUNCTIONAL_CURRENCY", "EMPLOYEE_ID", "EMPLOYEE_NAME", "EMPLOYEE_NO", "DESCRIPTION", "PAYROLL_INTERFACE_DATE", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "LAST_UPDATE_LOGIN") AS 
  select
   l.ROWID,
   l.LINE_ID,
   l.header_id,
   L.LINE_NO,
   l.DEDUCTION_CODE,
   (SELECT MEANING FROM FND_LOOKUP_VALUES_VL 
      WHERE LOOKUP_TYPE='XXSC_AP_DEDUCTION_TYPE'
      AND LOOKUP_CODE=l.DEDUCTION_CODE
      AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE, '31-DEC-4712'))  DEDUCTION,
   l.AMT_FUNCTIONAL_CURRENCY,
  L.EMPLOYEE_ID,
  (SELECT EMPLOYEE_NAME FROM XXSC_HR_POINFO_V WHERE EMPLOYEE_ID=L.EMPLOYEE_ID) EMPLOYEE_NAME,
  (select EMPLOYEE_NUMBER from XXSC_HR_POINFO_V where EMPLOYEE_ID=L.EMPLOYEE_ID) EMPLOYEE_NO ,
  L.DESCRIPTION,
  l.PAYROLL_INTERFACE_DATE,
  l.CREATION_DATE  ,
  l.CREATED_BY ,
  l.LAST_UPDATE_DATE ,
  l.LAST_UPDATED_BY ,
  l.LAST_UPDATE_LOGIN 
  FROM xxsc_staff_recovery_lines_t l;
--------------------------------------------------------
--  DDL for View XXSC_TELEPHONE_EMP_BEE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "APPS"."XXSC_TELEPHONE_EMP_BEE" ("PERSON_ID", "EMPLOYEE_NUMBER", "BUSINESS_GROUP_ID", "EFFECTIVE_START_DATE", "EFFECTIVE_END_DATE") AS 
  SELECT DISTINCT PAPF.PERSON_ID,
                   PAPF.EMPLOYEE_NUMBER,
                   PAPF.BUSINESS_GROUP_ID,
                   PASF.EFFECTIVE_START_DATE,
                   PASF.EFFECTIVE_END_DATE
     FROM XXSC_HR_TELEDEDUCT_T X,
          PER_ALL_PEOPLE_F PAPF,
          PER_ALL_ASSIGNMENTS_F PASF
    WHERE    NVL(X.PROCESS_FLAG,'N') = 'N'
          AND PAPF.PERSON_ID = PASF.PERSON_ID
          AND UPPER (X.WINDOWS_LOGIN_ID) = UPPER(TRIM(PAPF.ATTRIBUTE6))
          AND PAPF.BUSINESS_GROUP_ID = X.BUSINESS_GROUP_ID
          AND TRUNC (SYSDATE) BETWEEN PAPF.EFFECTIVE_START_DATE
                                  AND PAPF.EFFECTIVE_END_DATE
          AND TRUNC (SYSDATE) BETWEEN PASF.EFFECTIVE_START_DATE
                                AND PASF.EFFECTIVE_END_DATE;
