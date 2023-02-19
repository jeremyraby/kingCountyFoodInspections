# Changelog

- changed field names to lowercase using LOWER()
- removed spaces between strings inside field names, replaced with underscores, using find & replace
- create column for violation number category using LEFT()
- remove violation numbers from violation descriptions using REPLACE()
- find all cells with errors using conditional formatting
- google the address for the facilities with errors in the name column and correct those cells
- using =RIGHT(), break out the roman numeral risk category (I, II, III) into a separate column called "risk"
- use =PROPER() to make city names consistent
- 1600+ rows hadn't had their violations entered properly (or weren't exported properly to the csv), so I filtered by violation_description to only show certain mistakes and manually corrected one of them then used the fill handle to copy down the columns. Corrections were made by comparing against the sample food inspection form.
