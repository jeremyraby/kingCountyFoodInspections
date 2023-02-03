SELECT
    AVG(inspection_score)
FROM reports
WHERE inspection_closed_business = 'true';