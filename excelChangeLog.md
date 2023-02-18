# Changelog

- changed field names to lowercase using LOWER()
- removed spaces between strings inside field names, replaced with underscores, using find & replace
- create column for violation number category using LEFT()
- remove violation numbers from violation descriptions using REPLACE()
- find all cells with errors using conditional formatting
- google the address for the facilities with errors in the name column and correct those cells
- using =RIGHT(), break out the roman numeral risk category (I, II, III) into a separate column called "risk"
- use =PROPER() to make city names consistent
