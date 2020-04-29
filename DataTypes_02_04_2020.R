# Basic examples of data types and their uses
# 4 Feb 2020
# SEK

# -------------------------------------------------------------------------

# Using the assignment operator
x <- 5 # prefered way
y = 4 # legal but not used except in function defaults
y = y +1
y <- y +1
y
print(y)

# -------------------------------------------------------------------------

# variable names
z <-3 # use lower case
plantHeight <- 3 # camel case naming
plant.height <- 3 # avoid using periods in names
plant_height <- 3 # snake case- preferred way
. <- 5 # use exclusively for temporary variables


# -------------------------------------------------------------------------

# combine or concatenate function
z <- c(3.2, 5, 5, 6)
print(z)
typeof(z)
is.numeric(z)
is.character(z)

# character variable bracketed by quotes (single or double)
z <- c("perch", "striped bass", 'trout')
print(z)

z <- c( "this is one 'character string'", "and another")
z <- c(c(2,3), c(4.4,6))
print(z)
z<- c(TRUE, FALSE, FALSE)
typeof(z)
is.integer(z)

# -------------------------------------------------------------------------

# Properties of atomic vectors
# has a unique type
typeof(z)
is.logical(z)

# has a specified length
length(z)

# optional names
z<- runif(5)
print(z)
names(z)
names(z) <- c("chow", 
              "pug",
              "beagle",
              "greyhound",
              "akita")
print(z)
z[3] #single element
z[c(3,4)]
z[3:4]
z[c("beagle", "greyhound")]
z[c(3,3,3)]

# add names when variable is first built, name does not have to be in quotes in this initial assignment
z2<- c(gold= 3.3, silver= 10, lead= 2)
print(z2)
# reset the names
names(z2)<- NULL

# name some elements, but not others
names(z2)<- c("copper", "zinc")
print(z2)

# -------------------------------------------------------------------------

# NA for missing data
z <- c(3.2, 3.3, NA)
typeof(z)
length(z)
typeof(z[3])
z1<- NA
typeof(z1)
is.na(z) # boolean to find NA
!is.na(z) # boolean to find NOT NA
mean(z)
# returns an NA -- needs all values
mean(!is.na(z)) # do not do this: R has converted to 0,1 and avearged those, logical coercion 
mean(z[!is.na(z)]) # correct

# NaN, -Inf, Inf from numeric division
z <- 0/0
print(z)
typeof(z)
z <- 1/0
print(z)
z<- -1/0
print(z)

# null is nothing
z <- NULL 
typeof(z)
length(z)
is.null(z)


# -------------------------------------------------------------------------

# Three features of atomic vectors
# 1. Coercion
# All atomics are of the same type
# if elements are different, R coerces them into a single type
# logical-> integer -> doubles -> character strings

z <- c(0.1, 5, "O.2")
typeof(z)

# use coercion for useful calculations
a<- runif(10)
print(a)
a > 0.5
# FALSE= 0
# TRUE = 1
sum(a > 0.5) # how many elements are greater than 0.5
mean(a > 0.7) # corresponds to the proportion of elements greater than 0.5

# qualifying exam question:
# in a normal distribution, approximately what percent of observations from a normal (0,1) are larger than 2.0?
mean(rnorm(1000000)> 2) # 0.022702

# 2. Vectorization
z <- c(10, 20, 30)
z+ 1 # r will run this on every element
z2<- c(1,2,3)
z +z2
z^2

# recycling
z<- c(10, 20 ,30)
z2<- c(1,2)
z+z2
