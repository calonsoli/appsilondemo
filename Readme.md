# Code Example for Appsilon.

Please read this document to understand possibilities and approach ideas.

## Cron approach.
If the app have lots of visits, could be a good idea precalculate the results.
This precalculation could be done on a cron script or be done in several ways.
Check the R code in R/appsilon.cron4precalculation.R to see this idea.
Unfortunately, this approach takes so much time on a app execution and only can
be coded as cron. 

So it's coded only as an idea but not working.
This solution will be a good solution if the quantity of data is not too large

## Init load approach.
It's better to load a big file when the application start than on user's sessions
This is the solution developed, quicker to develop.

## Mysql approach.
If the file is too large. We can upload all csv on a MySql database and change the file R/appsilon.loadData to launch querys on a MySql database