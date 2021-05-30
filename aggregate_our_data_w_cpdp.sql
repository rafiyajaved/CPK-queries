
WITH cpdp_updated as
(SELECT 
*,
lower(last_name) as l_name,
lower(first_name) as f_name,

 FROM `linear-stock-314817.invisinsitute_chicago_police_data.accused_updated_aggregated`),

team_spreadsheet as (SELECT *, lower(split(cop_name, " ")[OFFSET(0)]) as f_name,
lower(split(cop_name, " ")[OFFSET(1)]) as l_name, FROM `linear-stock-314817.invisinsitute_chicago_police_data.our_data`)


SELECT 
cop_name,
num_murders,
Year_hired,
Year_of_Birth,
Latest_Star_Number,
team_spreadsheet.Race as team_race,
cpdp_updated.Race as cpdp_race,
sex,
gender as cpdp_gender,
still_on_force,
team_spreadsheet.current_unit as team_current_unit,
cpdp_updated.past_units as cpdp_past_units,
latest_base_salary,
hr_salaries,
cpdp_updated.appointed_data as cpdp_appointed_date,
cpdp_updated.birth_year as cpdp_birth_year,
cpdp_updated.current_age as cpdp_current_age,
cpdp_updated.ranks_held as cpdp_ranks_held,
cpdp_updated.current_star as cpdp_current_star,
cpdp_updated.current_status as cpdp_current_status,
cpdp_updated.resignation_date as cpdp_resignation_date,
cpdp_updated.resignation_year as cpdp_resignation_year,
cpdp_updated.unit_description as cpdp_unit_description,
cpdp_updated.complaint_category as cpdp_complaint_category,
cpdp_updated.complaint_code as cpdp_complaint_code,
cpdp_updated.cr_id as cpdp_cr_id,
cpdp_updated.final_finding as cpdp_final_finding,
cpdp_updated.final_outcome as cpdp_final_outcome,
cpdp_updated.recc_finding as cpdp_recc_finding,
cpdp_updated.recc_outcome as cpdp_rec_outcome
 FROM 
cpdp_updated 
JOIN 
team_spreadsheet
USING(f_name, l_name)
