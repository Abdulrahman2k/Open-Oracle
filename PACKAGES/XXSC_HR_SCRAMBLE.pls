CREATE OR REPLACE PACKAGE      XXSC_HR_SCRAMBLE
IS
   PROCEDURE XXHR_DATA (
      errbuf         OUT      VARCHAR2,
      retcode        OUT      NUMBER
   );
END XXSC_HR_SCRAMBLE;
/


CREATE OR REPLACE PACKAGE BODY     XXSC_HR_SCRAMBLE
IS
 PROCEDURE XXHR_DATA
(
      errbuf         OUT      VARCHAR2,
      retcode        OUT      NUMBER
   ) IS
  l_validate                    boolean := FALSE;
  x_emp_no                      varchar2(25);
  x_emp_name                    varchar2(250);
CURSOR C_EMP is
       SELECT emp.employee_number,
              emp.last_name,
              emp.first_name,
              emp.full_name,
              emp.date_of_birth,
              emp.start_date HIRE_DATE,
              emp.person_id ,
              EMP.BUSINESS_GROUP_ID
              FROM   PER_ALL_PEOPLE_F EMP
              WHERE  EMP.person_id < 1;
 R_EMP                     C_EMP%ROWTYPE;
begin
OPEN C_EMP;
    LOOP
      FETCH C_EMP  INTO R_EMP;
      EXIT WHEN C_EMP%NOTFOUND;
      SELECT XXSC.XXHR_EMP_NO_S.NEXTVAL  INTO X_EMP_NO FROM DUAL;
      X_EMP_NAME := 'SCXX'||' '||X_EMP_NO;

      update per_all_people_f set employee_number = x_emp_no , full_name = x_emp_name,
      first_name = 'XX' ,last_name = x_emp_no,email_address = null ,PER_INFORMATION3 = null  where person_id = R_EMP.person_id;

      update per_all_assignments_f set assignment_number = x_emp_no   where person_id = R_EMP.person_id;

      if sql%found then
         commit;
      end IF;

    fnd_file.put_line(fnd_file.log,'Create emp API completed');
    fnd_file.put_line(fnd_file.log,'Employee :- '||''''||R_EMP.full_name||''''||' Created with Person Id : '||R_EMP.person_id);
  END LOOP;
 CLOSE C_EMP;

 -- For Run result basic salary Manipulation

update pay_run_result_values  set result_value = (result_value /5 ) * 1.5
  where (input_value_id ,run_result_id) in
  (select prrv.input_value_id,prrv.run_result_id
  from pay_run_results             prr
                  ,pay_run_result_values       prrv
                  ,pay_element_types_f         pet
                  ,PAY_ELEMENT_CLASSIFICATIONS PEC
                   ,pay_input_values_f  PIVF
                  WHERE PRRV.RUN_RESULT_ID = PRR.RUN_RESULT_ID
               AND PET.CLASSIFICATION_ID = PEC.CLASSIFICATION_ID
               AND PRR.ELEMENT_TYPE_ID = PET.ELEMENT_TYPE_ID
               AND PET.ELEMENT_TYPE_ID = PIVF.ELEMENT_TYPE_ID
         AND PRRV.INPUT_VALUE_ID = PIVF.INPUT_VALUE_ID
                  AND PIVF.NAME='Pay Value'
               AND PET.ELEMENT_NAME
       in ('Total Monthly Salary','Annual Bonus','Other Bonus','Salary Advance','Annual Leave','Incentives','Ex Gratia','Overtime Allowance','Miscellaneous Allowance','Official Expenses','Notice Period Pay','NBC Savings')
	     --  = nvl('Basic Salary',pet.element_name)
	       );




update pay_element_entry_values_f set screen_entry_value = (screen_entry_value /4 ) * 1.25
where (input_value_id ,element_entry_id) in
(SELECT peev.input_value_id,peev.element_entry_id
        FROM pay_element_entries_f      peef
            ,pay_element_entry_values_f peev
            ,pay_element_links_f        link
            ,pay_element_types_f TYPE
            ,pay_input_values_f  input
       WHERE TYPE.element_name
       in ('Annual Bonus','Other Bonus','Salary Advance','Annual Leave','Incentives','Ex Gratia','Overtime Allowance','Miscellaneous Allowance','Official Expenses','Notice Period Pay','NBC Savings')
       --= 'Other Allowance'
       --  AND input.NAME = p_input_name
     --    AND TYPE.business_group_id = p_business_group_id
      --   AND peef.assignment_id = p_assignment_id
         AND TYPE.business_group_id = link.business_group_id
         AND TYPE.business_group_id = input.business_group_id
         AND peef.element_entry_id = peev.element_entry_id
         AND peef.element_link_id = link.element_link_id
         AND link.element_type_id = TYPE.element_type_id
         AND TYPE.element_type_id = input.element_type_id
         AND PEEV.INPUT_VALUE_ID = INPUT.INPUT_VALUE_ID
                  AND INPUT.NAME='Pay Value');


-- For Element level  Other Allowance Manipulation


update pay_element_entry_values_f set screen_entry_value = (screen_entry_value /4 ) * 1.25
where (input_value_id ,element_entry_id) in
(SELECT peev.input_value_id,peev.element_entry_id
        FROM pay_element_entries_f      peef
            ,pay_element_entry_values_f peev
            ,pay_element_links_f        link
            ,pay_element_types_f TYPE
            ,pay_input_values_f  input
       WHERE TYPE.element_name
       in ('Annual Bonus','Other Bonus','Salary Advance','Annual Leave','Incentives','Ex Gratia','Overtime Allowance','Miscellaneous Allowance','Official Expenses','Notice Period Pay','NBC Savings')
       --= 'Basic Salary'
       --  AND input.NAME = p_input_name
     --    AND TYPE.business_group_id = p_business_group_id
      --   AND peef.assignment_id = p_assignment_id
         AND TYPE.business_group_id = link.business_group_id
         AND TYPE.business_group_id = input.business_group_id
         AND peef.element_entry_id = peev.element_entry_id
         AND peef.element_link_id = link.element_link_id
         AND link.element_type_id = TYPE.element_type_id
         AND TYPE.element_type_id = input.element_type_id
         AND PEEV.INPUT_VALUE_ID = INPUT.INPUT_VALUE_ID
                  AND INPUT.NAME='Pay Value');
---Updating Amount Remaining to Zero for all payments---
update AP_PAYMENT_SCHEDULES_ALL
set amount_remaining = 0;

---Updating Amount Due Remaining to Zero for all receipts and status is set to closed 'CL'---
update ar_payment_schedules_all
set amount_due_remaining= 0, status ='CL';

 COMMIT;
 fnd_file.put_LINE(fnd_file.OUTPUT,'DATA SCRAMBLED');
 fnd_file.put_line(fnd_file.log,'DATA SCRAMBLED');
 EXCEPTION
 WHEN OTHERS THEN
    fnd_file.put_line(fnd_file.log,SQLERRM);
     fnd_file.put_line(fnd_file.log,'DATA IS NOT SCRAMBLED');
END XXHR_DATA;

END XXSC_HR_SCRAMBLE;
/
