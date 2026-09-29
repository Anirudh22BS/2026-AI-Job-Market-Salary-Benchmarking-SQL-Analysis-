-- 1. High-Growth & In-Demand AI Roles (2026)
SELECT 
    job_category,
    job_title,
    COUNT(job_id) AS total_postings,
    ROUND(AVG(demand_score), 2) AS avg_demand_score,
    ROUND(AVG(demand_growth_yoy_pct), 2) AS avg_yoy_growth_pct,
    ROUND(AVG(annual_salary_usd), 2) AS avg_salary_usd
FROM ai_jobs
WHERE posting_year = 2026
GROUP BY job_category, job_title
HAVING COUNT(job_id) >= 5
ORDER BY avg_yoy_growth_pct DESC, avg_demand_score DESC
LIMIT 10;


-- 2. Specialized LLM Premium vs. Standard Roles
SELECT 
    company_size,
    is_llm_role,
    COUNT(job_id) AS total_postings,
    ROUND(AVG(annual_salary_usd), 2) AS avg_salary,
    ROUND(AVG(ai_salary_premium_pct), 2) AS avg_ai_premium_pct,
    ROUND(AVG(demand_score), 2) AS avg_demand_score
FROM ai_jobs
GROUP BY company_size, is_llm_role
ORDER BY company_size, is_llm_role DESC;


-- 3. Remote Work Compensation & Demand Matrix
SELECT 
    remote_work,
    COUNT(job_id) AS total_jobs,
    ROUND(AVG(annual_salary_usd), 2) AS avg_annual_salary,
    ROUND(AVG(ai_salary_premium_pct), 2) AS avg_ai_premium_pct,
    ROUND(AVG(demand_score), 2) AS avg_demand_score,
    ROUND(AVG(benefits_score_10), 2) AS avg_benefits_score
FROM ai_jobs
GROUP BY remote_work
ORDER BY avg_annual_salary DESC;


-- 4. Top 3 Salary Rankings by Industry
WITH IndustrySalaries AS (
    SELECT 
        industry,
        job_title,
        experience_level,
        ROUND(AVG(annual_salary_usd), 2) AS avg_salary,
        DENSE_RANK() OVER (
            PARTITION BY industry 
            ORDER BY AVG(annual_salary_usd) DESC
        ) AS salary_rank_in_industry
    FROM ai_jobs
    GROUP BY industry, job_title, experience_level
)
SELECT 
    industry,
    salary_rank_in_industry,
    job_title,
    experience_level,
    avg_salary
FROM IndustrySalaries
WHERE salary_rank_in_industry <= 3
ORDER BY industry, salary_rank_in_industry;


-- 5. Experience & Education Benchmark vs. Elite Tier Roles
SELECT 
    education_required,
    experience_level,
    COUNT(job_id) AS total_postings,
    SUM(CASE WHEN salary_tier = 'Elite (>$300k)' THEN 1 ELSE 0 END) AS elite_tier_count,
    ROUND(
        100.0 * SUM(CASE WHEN salary_tier = 'Elite (>$300k)' THEN 1 ELSE 0 END) / COUNT(job_id), 
        2
    ) AS pct_elite_tier,
    ROUND(AVG(annual_salary_usd), 2) AS avg_salary
FROM ai_jobs
GROUP BY education_required, experience_level
ORDER BY avg_salary DESC;

commit;