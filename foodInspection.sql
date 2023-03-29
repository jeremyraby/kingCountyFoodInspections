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

-- Which 5 restaurants had the worst inspection score in 2022?
SELECT
    DISTINCT name,
    inspection_score
FROM reports
WHERE 
    inspection_date LIKE '%/22%'
ORDER BY inspection_score DESC
LIMIT 5;
/*
name, inspection_score
FORTUNE SEAFOOD RESTAURANT, 96
QIN XI'AN NOODLES, 5
WEDGWOOD ALE HOUSE & CAFE, 95
BANGKOK BASIL, 93
FANG LLC DBA MIKE'S NOODLE HOUSE, 93
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

-- What are the 5 most common violations

SELECT 
    violation_num,
    violation_description,
    COUNT(violation_num) AS 'count'
FROM reports
WHERE violation_num != ''
GROUP BY 1
ORDER BY 3 DESC
LIMIT 5;
/*
violation_num, violation_description, count
3400, Wiping cloths properly used, stored, proper sanitizer, 12288
2110, Proper cold holding temperatures (greater than  45 degrees F), 12030
600, Adequate handwashing facilities, 11858
200, Food Worker Cards current for all food workers; new food workers trained, 8621
4100, Warewashing facilities properly installed, 8126
*/

-- Did 98105 Zip Code have a change in number of red violations
-- since new inspector was hired (between 2017 & 2019)?

SELECT DISTINCT(COUNT(violation_type))
FROM reports
WHERE 
    inspection_date LIKE '%/17' AND
    zip_code = '98105' AND
    violation_type LIKE 'red';
-- 2017: 316

SELECT DISTINCT(COUNT(violation_type))
FROM reports
WHERE 
    inspection_date LIKE '%/19' AND
    zip_code = '98105' AND
    violation_type LIKE 'red';
-- 2019: 144

-- percent change 
SELECT ROUND(((144.0-316)/316) * 100, 2);
-- -54.43%
-- "Red" violations in zip code 98105 decreased by 54.43% between 2017 & 2019

-- What is the average inspection score for each risk category?
SELECT
    risk,
    ROUND(AVG(inspection_score), 0)
FROM reports
WHERE 
    inspection_score != '' AND
    risk != '' AND
    inspection_closed_business = 'TRUE'
GROUP BY risk;

/*
risk, ROUND(AVG(inspection_score), 0)
I, 29
II, 32
III, 100
*/

-- Which are the 10 violations sans are writing most/least?
-- use zip code as proxy
-- are these vios being written properly?

-- MOST
SELECT 
   violation_num, 
   violation_type,
   COUNT(violation_num)
FROM reports
WHERE 
    inspection_date LIKE '%/19' AND
    zip_code = '98105' AND
    violation_num != ''
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10;
/*
violation_num, violation_type, COUNT(violation_num)
3400, BLUE, 36
2110, RED, 26
4100, BLUE, 25
4200, BLUE, 21
600, RED, 20
3300, BLUE, 20
200, RED, 17
1400, RED, 16
2200, RED, 14
3700, BLUE, 12
*/
-- LEAST
SELECT 
   violation_num, 
   violation_type,
   COUNT(violation_num)
FROM reports
WHERE 
    inspection_date LIKE '%/19' AND
    zip_code = '98105' AND
    violation_num != ''
GROUP BY 1
ORDER BY 3
LIMIT 10;
/*
violation_num, violation_type, COUNT(violation_num)
1000, RED, 1
1710, RED, 1
2300, RED, 1
2600, RED, 1
2800, BLUE, 1
3100, BLUE, 1
4500, BLUE, 1
1500, RED, 2
1720, RED, 2
2900, BLUE, 2
*/

-- Which are the 10 "red" violations sans are writing most/least?
-- use zip code as proxy
-- are these vios being written properly?

-- MOST
SELECT 
   violation_num, 
   violation_description,
   COUNT(violation_num)
FROM reports
WHERE 
    inspection_date LIKE '%/19' AND
    zip_code = '98105' AND
    violation_num != '' AND
    violation_type = 'RED'
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10;
/*
violation_num, violation_description, COUNT(violation_num)
2110, Proper cold holding temperatures (greater than  45 degrees F), 26
600, Adequate handwashing facilities, 20
200, Food Worker Cards current for all food workers; new food workers trained, 17
1400, Raw meats below and away from ready to eat food; species separated, 16
2200, Accurate thermometer provided and used ..., 14
2120, Proper cold holding temperatures ( 42 degrees F to 45 degrees F), 10
1900, No room temperature storage; proper use of time..., 9
1600, Proper cooling procedure, 9
2500, Toxic substances properly identified,..., 7
900, Proper washing of fruits and vegetables, 3
*/

-- LEAST
SELECT 
   violation_num, 
   violation_description,
   COUNT(violation_num)
FROM reports
WHERE 
    inspection_date LIKE '%/19' AND
    zip_code = '98105' AND
    violation_num != '' AND
    violation_type = 'RED'
GROUP BY 1
ORDER BY 3
LIMIT 10;

/*
violation_num, violation_description, COUNT(violation_num)
1000, Food in good condition, safe and unadulterated; approved additives, 1
1710, Proper hot holding temperatures (less than130 degrees), 1
2300, Proper Consumer Advisory posted for raw ..., 1
2600, Compliance with risk control plans, variances, plan of operation; valid permit; appr procedur, 1
1500, Proper handling of pooled eggs, 2
1720, Proper hot holding temperatures; between 130 degrees F to 134 degrees F, 2
400, Hands washed as required, 2
1300, Food contact surfaces and utensils used for raw meat thoroughly cleaned and sanitized.  no .., 3
900, Proper washing of fruits and vegetables, 3
2500, Toxic substances properly identified,..., 7
*/