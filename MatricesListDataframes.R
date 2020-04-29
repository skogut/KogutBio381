# Working with Matrices, lists, data frames
# 11 Feb 2020
# SEK


# -------------------------------------------------------------------------

library(ggplot2)



# Matrices ----------------------------------------------------------------

# a matrix is just an atomic vector reorganized into two dimensions 
# create a matrix with matrix function
m <- matrix(data=1:12, nrow= 4, ncol=3)
print(m)

# use byrow=TRUE to change filling direction
m <- matrix(data= 1:12, nrow=4, byrow=TRUE)
print(m)

# use dim() function 
dim(m)

# change dim of matrix
dim(m) <- c(4,3)
print(m)

# individual row and column dimensions
nrow(m)
ncol(m)

# length of atomic vector is still there
length(m)

# add names
rownames(m)<- c("a", "b", "c", "d")
colnames(m)<- LETTERS[1:ncol(m)]
print(m)
rownames(m)<- letters[nrow(m):1]

# grabbing an entire atomic vector
z<- runif(3)
z[]

# specify rows and columns, separated by a comma
m[2,3]
# choose row 2 and all columns
m[2,]
# print all
print(m)
print(m[])
print(m[,])

# dimnames requires a list
dimnames(m)<- list(paste("Site", 1:nrow(m), sep= ""), paste("Species", 1:ncol(m), sep= "_"))
print(m)

# transpose a matrix
m2 <- t(m)
print(m2)

# add a row to a matrix with rbind()
m2<- rbind(m2, c(10,20,30,40))
rownames(m2)

# call the function ot get the atomic
rownames(m2)[4]<- "myfix"

# access row and columns with names as well as index numbers
m2["myfix", "Site3"]
m2[4,3]
m2[c("myfix", "Species_1"), c("Site2", "Site2")]

# cbind will add a column to a matrix
my_vec <- as.vector(m)


# Lists -------------------------------------------------------------------

# Lists are like atomic vectors in that they are 1D, but each element can hold different things of differenttypes and sizes

my_list <- list(1:10, matrix( data=1:8, nrow=4, byrow=TRUE),  letters[1:3],pi)
str(my_list)
# grabbing one list component requires double brackets; single brackets return list from a list
my_list[4]
my_list[4]-3
typeof(my_list[[4]])
## double bracket always extracts a single element of the correct type
my_list[[4]]-3

# ifa list has 10 elements, it is like a train with 10 cars
# [[5]] gives me the contents of car 5
# [c(4,5,6)] gives me a little train with cars 4,5, 6
# [5] is a train with 1 car (5)

my_list[[2]][2,2]
# name list items as we create them
my_list2 <- list(Tester= FALSE, 
                 liitle_m= matrix(runif(9), nrow=3))
print(my_list2)
my_list2$liitle_m[2,3]
my_list2$liitle_m  
my_list2$liitle_m[2,]
my_list2$liitle_m[2]

# using a list to access output from a linear model
y_var <- runif(10)
x_var <- runif(10)
my_model <- lm(y_var~ x_var)
qplot(x= x_var, y= y_var)
print(my_model)
summary(my_model)
str(summary(my_model))
# useful hack
# use the unlist function to flatten the output
z<- unlist(summary(my_model), recursive= TRUE)
print(z)

 my_slope <- z$ coefficients2
my_pval<- z$coefficients8 
print(c(my_slope, my_pval))

# Data frames
# a list of equal lengthed vectors, each of which is a column
# a data frame differs from a matrix only in that different columns may be of different data types

var_a <- 1:12
var_b <- rep(c("con", "lowN", "highN"), each=4)
var_c <- runif(12)
d_frame<- data.frame(var_a, var_b, var_c, stringsAsFactors = FALSE)
print(d_frame)
head(d_frame)
str(d_frame)
# add new row: must set uo new row as a list because of variation in component
new_data <- list(var_a=13, var_b= "HighN", var_c= 0.0668 )
d_frame <- rbind(d_frame, new_data)
# add new column: all one datatype
# atomic vector
new_var <-runif(nrow(d_frame))
d_frame <- cbind(d_frame, new_var)
