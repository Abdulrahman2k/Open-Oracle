CREATE OR REPLACE VIEW xxehg_salary_paid (
    payment_desc,
    period,
    pay,
    entity
) AS
    SELECT
        'Salary' payment_desc,
        TO_CHAR(cd.effective_date,'YYYYMM') period,
        SUM(cd.credit_amount) - SUM(cd.debit_amount) pay,
        'Emaar Hospitality Group' entity
    FROM
        xxpay_costing_details_v cd
    WHERE
        1 = 1
        AND   cd.effective_date BETWEEN TO_DATE('01-JAN-2017','DD-MON-YYYY') AND TO_DATE('31-JAN-4712','DD-MON-YYYY')
        AND   cd.segment4 = '20201005'
        AND   cd.business_group_id = 1239
        AND   cd.consolidation_set_name <> 'Dubai Opera'
    GROUP BY
        cd.effective_date
    ORDER BY
        cd.effective_date ASC;

GRANT ALL ON apps.xxehg_salary_paid TO xxdcognos;

DROP SYNONYM xxdcognos.xxehg_salary_paid;

CREATE SYNONYM xxdcognos.xxehg_salary_paid FOR apps.xxehg_salary_paid;