### Manipulating data using dplyr
### SEK
### 03/04/2020

## What is dplyr?
# new-ish
# provides a set of tools for manipulating data
# part of the tidyverse: opinionated collection of packages share the same philoshpy, grammar, and data structure
# specifically written to be fast
# individual functions that correspond to most common operations
# easier to figure out waht you want to do with your data

library(dplyr)

### Core verbs
# filter() filters by criteria, focused on rows
# arrange() arranges by criteria
# select() allows you to select different columns in your dataset
# summarize() and group_by() group by criteria
# mutate() modify, creating a new column based on data you already have 

data(starwars)
class(starwars)

## what is a tibble?
# a modern take on dataframes
# keeps the good aspects, drops frustrating ones (changing variable names, changing input types)

glimpse(starwars) # with tibbles, glimpse works better than str
str(starwars)
head(starwars)
## clean up data
# complete.cases not dplyr

starwarsClean<- starwars[complete.cases(starwars[,1:10]),]
is.na(starwarsClean[,1])
anyNA(starwarsClean)
anyNA(starwars)

## filter(): pick/subset observations by their values
## uses >, >=, <, <= !, == for comparisons
## logical operators: & | !
## filter automatically excludes NAs

filter(starwarsClean, gender == "male", height < 180, height > 100 ) # dataset, what you want to filter. Can use commas here for multiple conditions for same variable

filter(starwarsClean, eye_color %in% c("blue", "brown")) ## %in% is similar to ==

## arrange(): reorders rows
arrange(starwarsClean, by= height) # default is ascending order

arrange(starwarsClean, by= desc(height)) # descending changes the order

arrange(starwarsClean, height, desc(mass)) # shortest to tallest, but heavier goes first in the event of a tie
# add additional argument to break ties in preceding column

starwars1<- arrange(starwars, height)
tail(starwars1) #missing values are at the end

# select(): choose variables by their names

starwarsClean[1:10,2] # base r- selecting the second variable

select(starwarsClean, 1:5) # use numbers
select(starwarsClean, name:height) # can use variable names too

select(starwarsClean, -(films:starships))

# rearrange columns
select(starwarsClean, name, gender, species, everything()) # everything() is helper function useful if you want to move a couple variables to the beginning 

select(starwarsClean, contains("color")) # other helpers: ends_with, starts_with, matches(reg ex), num_range

select( starwarsClean, height, skin_color, films) # not in clumps

### rename columns
select(starwars, haircolor= hair_color)

## rename funciton
rename(starwarsClean, haircolor= hair_color)

#### mutate(): creates new variables with functions of existing variables
# could be good for subtraction diff R^2

mutate(starwarsClean, ratio= height/mass) # we can use arithmetic operators
starwars_lbs <- mutate(starwarsClean, mass_lbs= mass*2.2) # convert kg to lbs
head(starwars_lbs)
select(starwars_lbs, 1:3, mass_lbs, everything()) # bring mass_lbs to beginning of dataset

# transmute- just keeps new variable
transmute(starwarsClean, mass_labs= mass*2.2)

transmute(starwarsClean, mass_labs= mass*2.2, mass)


#### summarize and group_by(): collapses values down to a single summary
summarize(starwarsClean, meanHeight= mean(height))

## working with NAs
summarize(starwars, meanHeight= mean(height, na.rm= TRUE), TotalNumber= n()) # n() helper function calculates sample size

starwarsGenders<- group_by(starwars, gender)
head(starwarsGenders)

summarize(starwarsGenders, meanHeight= mean(height, na.rm=T), number= n())

#### Piping
## used to emphasize a sequence of actions 
## passes an intermediate result on to next function (takes output of one statement and makes it input of the next)
## avoid if you have meaningful intermediate results or if you want to mainupalte more than one object at a teime
## formatting: have a space before the pipe, followed by a new line
## %>%
## start with broad object

starwarsClean %>% 
  group_by(gender) %>%
  summarize(meanHeight= mean(height), number= n())

heightsSW <- starwarsClean %>% 
  group_by(gender) %>%
  summarize(meanHeight= mean(height), number= n())


