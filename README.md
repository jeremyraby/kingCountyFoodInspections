# README

## About 

This a collection of SQL queries exploring King County, Washington's restaurant inspection data published on [data.gov](https://catalog.data.gov/dataset/food-establishment-inspection-data).
> "This dataset was last updated on 01/25/2023 and is current from 1/1/2006 to 01/21/2023."

## Info about the data

### Scoring

Restaurants are given scores from [0-400 points](https://kingcounty.gov/depts/health/environmental-health/food-safety/inspection-system/closure-decision.aspx) based on number of violations and how risky those violations are.
> The violations are added up between red and blue violations. If the total red critical violations is 90 or more, or the total of red and blue is 120 or more, then the establishment will be closed.

#### Types of violations

Red violations carry the most risk for food borne illness and are often called "critical"; an example of a "red" violation would be food left in the "danger zone" between 41F and 135F for more than 4 hours. Blue violations can be thought of as a general cleanliness or facility maintenance issue. Dirty floors or shelving or torn refigerator door gaskets are possible "blue" violations. Red violations are assigned values of 5-25 points while blue violations have values between 2-5 points. An example inspection report can be viewed [here](https://github.com/jeremyraby/kingCountyFoodInspections/blob/main/sample-food-inspection-form.pdf).

#### Immediate closure

> High score on the routine inspection*
> Sewage backing up in kitchen and/or bathroom
> No hot water/running water
> Electricity goes out
> Other imminent health hazards: broken refrigeration, damage caused by accidents or natural disasters, or when > establishment is linked to a food borne illness outbreak
> Other: No permit to be operating (The permit assures that they have met all of the structural & equipment > requirements for the menu items they are going to serve); the owner/manager interferes with the inspector's > ability to do her/his duties.
