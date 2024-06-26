/*
Question: What are the most in-demand skills for data scientist?
- Join job postings to inner join table similar to query 2
- Identitfy the top 5 in-demand skills for a data scientist
- Focus on all job postings
- Why? Retrieves the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_work_from_home = TRUE 
    AND job_title_short = 'Data Scientist'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Here is the breakdown of the most demanded skills for data scientist 2023
Python & SQL, as well as R remain fundemental, emphasizing the need for strong programming skills in data processing & manipulation.
Meanwhile, AWS and Tableau are essential must-haves for data visualization and cloud data storage.

[
  {
    "skills": "python",
    "demand_count": "10390"
  },
  {
    "skills": "sql",
    "demand_count": "7488"
  },
  {
    "skills": "r",
    "demand_count": "4674"
  },
  {
    "skills": "aws",
    "demand_count": "2593"
  },
  {
    "skills": "tableau",
    "demand_count": "2458"
  }
]

*/
