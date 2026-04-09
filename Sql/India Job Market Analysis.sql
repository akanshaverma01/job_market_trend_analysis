-- =============================================
-- India Job Market Analysis — SQL Queries
-- Database: Job_market_db
-- Table: jobs
-- =============================================


-- Query 1: Total Job Postings
SELECT COUNT(*) AS total_jobs
FROM jobs;


-- Query 2: DS vs DA Role Split
SELECT "Role Type",
       COUNT(*) AS job_count,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM jobs
GROUP BY "Role Type"
ORDER BY job_count DESC;


-- Query 3: Top 10 Cities
SELECT "Primary Location" AS city,
       COUNT(*) AS job_count
FROM jobs
WHERE "Primary Location" IS NOT NULL
GROUP BY "Primary Location"
ORDER BY job_count DESC
LIMIT 10;


-- Query 4: Top 10 Companies
SELECT "Company Names" AS company,
       COUNT(*) AS job_count
FROM jobs
GROUP BY "Company Names"
ORDER BY job_count DESC
LIMIT 10;


-- Query 5: Experience Distribution
SELECT "Exp Category",
       COUNT(*) AS job_count,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM jobs
GROUP BY "Exp Category"
ORDER BY job_count DESC;


-- Query 6: Fresher Friendly Cities
SELECT "Primary Location" AS city,
       COUNT(*) AS fresher_jobs
FROM jobs
WHERE "Exp Category" = 'Fresher (0 Yrs)'
GROUP BY "Primary Location"
ORDER BY fresher_jobs DESC
LIMIT 10;


-- Query 7: DS vs DA per City
SELECT "Primary Location" AS city,
       "Role Type",
       COUNT(*) AS job_count
FROM jobs
WHERE "Role Type" IN ('Data Science', 'Data Analytics')
GROUP BY "Primary Location", "Role Type"
ORDER BY city, job_count DESC;


-- Query 8: Salary Disclosed vs Not
SELECT "Salary Disclosed",
       COUNT(*) AS job_count,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM jobs
GROUP BY "Salary Disclosed"
ORDER BY job_count DESC;


-- Query 9: Top Companies Hiring Freshers
SELECT "Company Names" AS company,
       COUNT(*) AS fresher_openings
FROM jobs
WHERE "Exp Category" = 'Fresher (0 Yrs)'
GROUP BY "Company Names"
ORDER BY fresher_openings DESC
LIMIT 10;


-- Query 10: Remote vs Onsite
SELECT 
    CASE 
        WHEN "Primary Location" = 'Remote' THEN 'Remote'
        ELSE 'Onsite'
    END AS work_type,
    COUNT(*) AS job_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM jobs
GROUP BY work_type
ORDER BY job_count DESC;


