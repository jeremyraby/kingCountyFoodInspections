-- What is the average inspection score for restaurants that were closed because of their performance?
SELECT
    ROUND(AVG(inspection_score), 2)
FROM reports
WHERE inspection_closed_business = 'true';
-- 95.88

-- What percentage of inspections found handwashing violations?
SELECT COUNT(*) FROM reports;
-- 252543

SELECT
   COUNT(*) AS 'handwashing violations'
FROM reports
WHERE 
    violation_description LIKE '%hand%' OR
    violation_description IN ('0400', '0500', '0600'); -- handwashing violation codes = 0400, 0500, 0600
-- 16154

SELECT ROUND((16154.0 / 252543.0) * 100.0, 2) AS 'handwashing violation percentage';
-- each numbe had to be written as a decimal in order to actually calculate

--6.4
