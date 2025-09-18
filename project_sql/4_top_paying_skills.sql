/*
Answer: what are the top skills based on salary?
- looking at the average associated with each skill for Data Analyst positions
- focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analyst and
    help identify the most financially rewarding skills to acquire more or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
here’s a breakdown in 3 key bullet points:
1. Big Data & ML Pay the Most – Tools like PySpark, Databricks, DataRobot, Watson lead salaries, showing demand for analysts who can handle large-scale data + machine learning.
2. Engineering & Cloud Skills Boost Value – GitLab, Bitbucket, Kubernetes, GCP, Airflow highlight that analysts with DevOps and cloud/data engineering abilities earn higher pay.
3. Beyond Traditional BI – While MicroStrategy, PostgreSQL still matter, the real premium comes from hybrid analyst-engineer roles that combine programming, ML, and infrastructure.
*/