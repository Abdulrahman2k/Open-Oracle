CREATE OR REPLACE VIEW xxemr_malls_salary_paid (
    payment_desc,
    period,
    pay,
    entity
) AS
    SELECT
        DECODE(cd.consolidation_set_name,'Setup Business Group','Salary','EMAAR Final Settlement','Final Settlement') "Payment_Desc",
        TO_CHAR(cd.effective_date,'YYYYMM') period,
        SUM(cd.credit_amount) - SUM(cd.debit_amount) pay,
        hr_general.decode_organization(xxemr_single_payroll_pkg.xxget_legal_entity_id(cd.organization_id) ) entity
    FROM
        xxpay_costing_details_v cd
    WHERE
        1 = 1
        AND   cd.effective_date BETWEEN TO_DATE('01-JAN-2017','DD-MON-YYYY') AND TO_DATE('31-JAN-4712','DD-MON-YYYY')
        AND   cd.segment3 = '31900004'
        AND   cd.consolidation_set_name IN (
            'Setup Business Group',
            'EMAAR Final Settlement'
        )
    GROUP BY
        cd.effective_date,
        hr_general.decode_organization(xxemr_single_payroll_pkg.xxget_legal_entity_id(cd.organization_id) ),
        cd.consolidation_set_name
    ORDER BY
        TO_CHAR(effective_date,'YYYYMM') ASC;

GRANT ALL ON apps.xxemr_malls_salary_paid TO xxmcognos;

DROP SYNONYM xxmcognos.xxemr_malls_salary_paid;

CREATE SYNONYM xxmcognos.xxemr_malls_salary_paid FOR apps.xxemr_malls_salary_paid;