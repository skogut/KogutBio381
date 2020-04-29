#### DPLYR two
#### SEK
#### 3/5/20

### Exporting and importing data

library(dplyr)
data(starwars)

starwars1<- select(starwars, name:species)

## write.table
write.table(starwars1, file = "StarwarsNamesInfo.csv", row.names= F, sep= ",") ## creating csv

data<- read.csv(file= "StarwarsNamesInfo.csv", header= T, sep= ",", stringsAsFactors= F, comment.char= "#")

data<- read.table(file= "StarwarsNamesInfo.csv", header= T, sep= ",", stringsAsFactors= F, comment.char= "#")

head(data)
class(data)

## only working in R
## saveRDS()

saveRDS(starwars1, file= "StarwarsTibble")
sw<- readRDS("StarWarsTibble")

################################################################################3

## Further into dplyr
glimpse(sw)

## count of NAs
sum(is.na(sw))
## how many not NA
sum(!is.na(sw))

swSp <- sw %>%
  group_by(species) %>% 
  arrange(desc(mass))
swSp

#determine the sample
swSp %>%
  summarize(avgMass = mean(mass, na.rm= T), avgHeight= mean(height, na.rm= T), n= n())

# filter out low sample size
swSp %>%
  summarize(avgMass = mean(mass, na.rm= T), avgHeight= mean(height, na.rm= T), n= n()) %>% filter(n >= 2) %>% arrange(desc(n))

#### count helper
swSp %>% 
  count(eye_color) # gives the number of individuals w a given eye color
swSp %>% 
  count(wt= height) # gives "weight sum"


## useful summary functions
## use base R a lot
 starwarsSummary <- swSp %>%
   summarize(avgHeight= mean(height, na.rm=T), medHeight= median(height, na.rm=T), height_sd= sd(height, na.rm=T), heightIQR= IQR(height, na.rm=T), min_height= min(height, na.rm=T), first_height= first(height), n= n(), n_eyecolors= n_distinct(eye_color)) %>%
   filter(n >=2) %>%
   arrange(desc(n))
starwarsSummary

#### grouping multiple variables/ ungroup
# clean up
sw2<- sw[complete.cases(sw),]
sw2groups<- group_by(sw2, species, hair_color)
summarize(sw2groups, n=n())

sw3groups <- group_by(sw2, species, hair_color, gender)
summarize(sw3groups, n= n())
### ungrouping
sw3groups %>%
  ungroup() %>%
summarize(n=n())


## grouping with mutate
## ex: stanrdadize within group

sw3<- sw2 %>%
  group_by(species) %>%
  mutate(prop_height= height/sum(height)) %>%
  select(species, height, prop_height)
sw3
sw3 %>%
  arrange(species)

## pivot_longer an pivot_wider function
## compare to gather and spread

TrtA<- rnorm(n=20, mean= 50, sd=10)
TrtB<- rnorm(n=20, mean= 45, sd=10)
TrtC<- rnorm(n=20, mean= 62, sd=10)
z<- data.frame(TrtA, TrtB, TrtC)
library(tidyr)

# long_z <- gather(z, Treatment,Data, TrtA:TrtC)
z %>% 
  pivot_longer(TrtA:TrtC, names_to= "Treatment", values_to= "Data")

### pivot_wider- names_from and values_from

vignette("pivot")
