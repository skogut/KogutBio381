# more functions and tricks with atomic vectors
# 06 FEb 2020
#SEK

# -------------------------------------------------------------------------

# create empty vector, psecify mode and length
z <- vector(mode= 'numeric', length= 0)
z <- c(z, 5)
print(z)
# dynamic sizing: dont do this in R
# preferred method: preallocate space to a vector
z <- rep(0, 100)
head(z)
# fill with NA
z<- rep(NA, 100)
head(z)
typeof(z)
z[1] <- "Washington"
typeof(z)
# can chage 100 to anything
v_size <- 100
my_vector <- runif(v_size)
my_names <- paste("Species", seq(1:length(my_vector)), sep= "")
# paste welds elements in a vector 
head(my_names)
names(my_vector) <- my_names
head(my_vector)

#repeat function
rep(0.5,6)
rep(x=0.5, times=6)
# specify your arguments
# opotions in rep function
my_vec <- c(1,2,3)
rep(x= my_vec, times=2)
rep(x= my_vec, each = 2)
rep(x=my_vec, times=my_vec)
rep(x=my_vec, each=my_vec)

# using seq to create regulat sequences
seq(from=2, to=4)
2:4
`:`(2,4)
# all identical functions
seq(from=2, to=4, by=0.5)
x <- seq(from=2, to=4, length=7)
print(x)
my_vec <- 1:length(x)
seq_along(my_vec)
print(my_vec)
# what

# using the ranodm number generator
runif(5)
runif(n=5, min=100, max=110)
# noraml dist
rnorm(6)
rnorm(n=5, mean=100, sd= 30)
library(ggplot2)
z<- runif(1000)
qplot(x=z)
z <- rnorm(1000)
qplot(z)
# sample function to draw random values from an existing vector
long_vec <- seq_len(10)
print(long_vec)
sample(x=long_vec)
sample(x=long_vec, size=3)
sample(x=long_vec, size=16, replace=TRUE)
# weighted random sampling
my_weights <- c(rep(20,5), rep(100,5))
print(my_weights)
sample(x=long_vec, replace=TRUE, prob= my_weights)

# techinques for subsetting atomic vectors
z<- c(3.1, 9.2, 1.3, 0.4, 4.5)
# subset with positive index values
z[c(2,3)]
#subset with negative values
z[-c(1,5)]
# create a logical vector of conditions for subsetting
z[z<3]
tester <- z<3
print(tester)
z[tester]
# which function
which(z<3)
z[which(z<3)]

#use length for relative positioning
# negative sign is exclusive 
z[-c(length(z):(length(z)-2))]
# also subset using named vector elements
names(z)<- letters[1:5]
z
z[c("b","b")]

# relational operators
# < less than
# > greater than
# <= less than or equal
# >= greater than or equal
# == equal

# logical operators
# ! NOT
# & and (vector)
# | or (vector)
# xor(a,b) a or b, but not a and b
# && and (first element of the vector)
# || or (first element)

# examples
x <- 1:5
y <- c(1:3, 7,7)
# comparing the vectors x and y, 1:1
x==2
x != 2
x ==1 & y == 7
x ==1 | y == 7
x ==3 | y==3
xor(x==3, y==3)
x== 3 && y ==3


# subscript with missing values
set.seed(90)
z <- runif(10)
z
z< 0.5
z[z <0.5]
which(z < 0.5)
z[which(z< 0.5)]
zD<- c(z, NA, NA)
zD[zD < 0.5]
zD[which(zD< 0.5)]
