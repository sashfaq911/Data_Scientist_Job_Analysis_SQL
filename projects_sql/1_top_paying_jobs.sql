/*
Questions: What are the top-paying data scientist jobs?
- Identify the top 10 highest-paying Data Scientist roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Scientist, offering insights into employment
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type AS job_type,
    salary_year_avg AS avg_salary,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_location = 'Canada' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10