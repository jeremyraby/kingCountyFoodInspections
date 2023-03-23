# README

## Introduction

Are you concerned about the safety of the food you buy at restaurants and grocery stores in your area? Look no further than your local Health Department's records of restaurant inspections! Restaurant inspections are essential for ensuring food safety, and the data produced from inspections is a valuable resource for identifying areas that need improvement. This analysis provides insights into restaurant inspections in King County, Washington, using data from more than 9,000 inspections conducted since 2003.

Through SQL queries, this analysis answers important questions such as the average inspection score for closed restaurants and the most common violations. It also looks at trends over time, highlighting significant decreases in critical violations in particular zip codes.

Overall, my project provides a deep dive into the world of restaurant inspections in King County, offering insights and trends that are sure to interest anyone who cares about food safety.

## Key Insights

- Handwashing violations are the second-most common type of violation observed
- One particular zip code had a 54% reduction in critical violations over a two year period
- This analysis can be used to help regional managers pinpoint future training topics surrounding the most often written violations to ensure they're being identified and cited properly

## Data Information

King County, Washington publishes CSVs of their restaurant inspection reports to their own website. However, the data used for this project were published on [data.gov](https://catalog.data.gov/dataset/food-establishment-inspection-data).This dataset was last updated on 01/25/2023 and is current from 1/1/2006 to 01/21/2023.

### Risk Assessment

Facilities are assessed a risk level based on the potential for risk factors within the majority of the facility's preparation processes.

- Level 1 risk doesn't include food prep and is only dealing with ready-to-eat food, for example, groceries in a Dollar General
- Level 2 risk involves food prep and is typically a cook-and-serve operation such as most fast food restaurants
- Level 3 risk typically involves multiple trips through the "temperature danger zone" between 41F and 135F for cooking, cooling, and reheating the food, like is done at BBQ restaurants and buffets

### Scoring

Restaurants are given scores from [0-400 points](https://kingcounty.gov/depts/health/environmental-health/food-safety/inspection-system/closure-decision.aspx) based on number of violations and how risky those violations are.

Specific behaviors or conditions the Centers for Disease Control and Prevention (CDC) have identified as contributing to the most foodborne illnesses are also considered in how violations are scored. Those five risk factors [are](https://www.fda.gov/media/110822/download):

> - Improper holding temperatures,
> - Inadequate cooking,
> - Contaminated equipment,
> - Food from unsafe sources, and
> - Poor personal hygiene

#### Types of violations

There are two types of violations within King County's system: "red" & "blue." Red violations carry the most risk for foodborne illness and are often called "critical"; an example of a red violation would be food left in the "temperature danger zone" between 41F and 135F for more than 4 hours. Many red violations are also directly related to one of the five risk factors mentioned earlier. Blue violations can be thought of as a general cleanliness or facility maintenance issue with dirty floors or shelving or torn refigerator door gaskets being good examples. Red violations are assigned values of 5-25 points while blue violations have values between 2-5 points. An example inspection report can be viewed [here](https://github.com/jeremyraby/kingCountyFoodInspections/blob/main/sample-food-inspection-form.pdf).

[Inspections are also rated as "satisfactory" or "unsatisfactory" based on their violations](https://info.kingcounty.gov/health/ehs/foodsafety/inspections/Results.aspx?Output=W&Business_Name=monsoon&Business_Address=&Longitude=&Latitude=&City=seattle&Zip_Code=&Inspection_Type=All&Inspection_Start=&Inspection_End=&Inspection_Closed_Business=A&Violation_Points=&Violation_Red_Points=&Violation_Descr=&Fuzzy_Search=N&Sort=B) and may result either in follow-up inspections or immediate closure.

> - One red critical violation equals an unsatisfactory inspection
> - 35 or more red critical violation points require a reinspection witin 14 days.
> - 90 or more red critical violation points require the establishment be closed.
> - 120 or more total (red & blue) points also requires the establishment be closed.

#### Immediate closure

In addition to scoring 120+ combined points on the inspection, several other observed violations will lead to the immediate closure of the facility until the condition is remedied:

> - Sewage backing up in kitchen and/or bathroom
> - No hot water/running water
> - Electricity goes out
> - Other imminent health hazards: broken refrigeration, damage caused by accidents or natural disasters, or when establishment is linked to a foodborne illness outbreak
> - Other: No permit to be operating (The permit assures that they have met all of the structural & equipment requirements for the menu items they are going to serve); the owner/manager interferes with the inspector's ability to do her/his duties.
