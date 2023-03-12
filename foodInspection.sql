-- What is the average inspection score for restaurants that were closed because of their 
-- performance?
SELECT AVG(inspection_score)
FROM reports
WHERE inspection_closed_business LIKE 'true';
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

-- Which 5 restaurants had the lowest inspection score in 2022?
SELECT
    DISTINCT name
FROM reports
WHERE 
    inspection_date LIKE '%2022%'
ORDER BY inspection_score DESC
LIMIT 5;
/*
FORTUNE SEAFOOD RESTAURANT
MOMO'S KEBAB KC209
ROCK WOOD FIRED PIZZA
THAAL GRAND INDIAN PLATTER
BURBS BURGER- GEORGETOWN
*/

-- Which 5 restaurants had the highest inspection score?
SELECT
    DISTINCT name
FROM reports
WHERE 
    inspection_date LIKE '%2022%'
ORDER BY inspection_score
LIMIT 5;
/*
MENUDERIA MARIA
+MAS CAFE
100 LB CLAM
100TH AVE CAKES
101 GROCERY
*/

-- Which zip code has the worst average score?
SELECT
    zip_code,
    AVG(inspection_score)
FROM reports
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
-- (ZIP) 98104	(AVG SCORE) 22.45894935514313

-- Which city has the worst average score?
SELECT
    city,
    AVG(inspection_score)
FROM reports
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
-- (City) Burien  (AVG score) 30.88888888888889

-- Which restaurant has the worst average score?
SELECT
    name,
    AVG(inspection_score)
FROM reports
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
-- (Restaurant) TASTY SZECHUAN	(AVG score) 84.3913043478261

/*
Per Josh:
  - Care more about what is the san doing on inspections vs what violations are observed -> no info
  - what are the most common violations
  - are vios correlated to fbi
  - which vios are sans writing most/least -> no info
  - which facilities have the most/least violations (spilling ink or being Randy)
  - finish not inspected? -> use zip code or city as proxy for list
  - get numbers? -> use zip code or city as proxy for list
  - was a follow up performed within 2 weeks? 
  - was the same violation written consecutively?
  - quarterly progress report (2022) broken down by qtr on y axis, 
  risk on x axis, % numbers done in qt1 of which risk category
    - quarterly vs trimester for High 3s vs High 4s
*/