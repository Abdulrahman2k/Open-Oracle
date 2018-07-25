SELECT
        TO_CHAR(ptp.end_date,'RRRRMM') period,
        hr_general.decode_organization(xxemr_single_payroll_pkg.xxget_legal_entity_id(c.organization_id) ) company,
        hr_general.decode_organization(b.business_group_id) business_group,
        COUNT(1) total_staff
      FROM
        per_all_people_f b,
        per_all_assignments_f c,
        per_periods_of_service e,
        per_time_periods ptp
      WHERE
        1 = 1
        AND   b.person_id = c.person_id
        AND   e.person_id = b.person_id
        AND   c.payroll_id = ptp.payroll_id
        AND   e.period_of_service_id = c.period_of_service_id
        AND   trunc(ptp.end_date) BETWEEN b.effective_start_date AND b.effective_end_date
        AND   trunc(ptp.end_date) BETWEEN c.effective_start_date AND c.effective_end_date
        AND   (
            e.actual_termination_date IS NULL
            OR    nvl(e.actual_termination_date,TO_DATE('01-JAN-1951','DD-MON-YYYY') ) > ptp.end_date
        )
        AND   EXISTS (
            SELECT
                1
            FROM
                pay_payrolls_f ppf
            WHERE
                ppf.payroll_id = ptp.payroll_id
                AND   ppf.business_group_id =0
        )
        AND   ptp.end_date BETWEEN TO_DATE('01-JAN-2017','DD-MON-YYYY') AND TO_DATE('31-JAN-4712','DD-MON-YYYY')
        AND TO_CHAR(ptp.end_date,'RRRRMM') ='201803'
      GROUP BY
        hr_general.decode_organization(xxemr_single_payroll_pkg.xxget_legal_entity_id(c.organization_id) ),
        ptp.end_date,hr_general.decode_organization(b.business_group_id)
    HAVING
        COUNT(1) > 0
    ;