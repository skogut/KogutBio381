# -----------------------------------------------------
# Control Structures: For loop
# 26 Mar 2020
# SEK
# -----------------------------------------------------
##### VIDEO A: For loop
# Basic anatomy and use of a for loop
# for (var in seq) { # start of our loop
 
# body of for loop
# } end of the loop

# var is a counter variable that holds the current value of the counter in the loop
# seq is a integer vector or vec of character strings that defines the starting and ending values of the loop

# suggestions: using i, j, k for var (counter)

my_dogs<- c("chow", "akita", "malamute", "husky", "samoyed")
# wrong
for (i in my_dogs){
  print(i)
}

# use this method instead
for (i in 1:length(my_dogs)){
  cat("i=", i, "my_dogs[i]=", my_dogs[i], "\n")
}

# potential hazard- empty vector
my_bad_dogs<- NULL

for (i in 1:length(my_bad_dogs)){
  cat("i=", i, "my_bad_dogs[i]=", my_bad_dogs[i], "\n")
}

# safer way to code var is use seq_along

for(i in seq_along(my_dogs)) {
  cat("i=", i, "my_dogs[i]=", my_dogs[i], "\n")
}

# handles empty vector
for (i in seq_along(my_bad_dogs)){
  cat("i=", i, "my_bad_dogs[i]=", my_bad_dogs[i], "\n")
}

# could also define vector length from a constant
zz<- 5
for(i in seq_len(zz)){
  cat("i=", i, "my_dogs[i]=", my_dogs[i], "\n")
}



##### VIDEO B: Tips for for loops

# tip #1: do NOT change object dimensions inside a loop
# avoid these functions (cbind, rbind, c, list)

my_dat<- runif(1)

for (i in 2:10) {
  temp <- runif(1)
  my_dat<- c(my_dat, temp) # do not do this
  cat("loop number=", i, "vector element =", my_dat[i], "\n")
}
print(my_dat)

# tip #2: don't do things in a loop if you don't need to

for (i in 1:length(my_dogs)){
  my_dogs[i]<- toupper(my_dogs[i])
  cat("i=", i, "my_dogs[i] =", my_dogs[i], "\n")
}

z<- c("dog", "cat", "pig")
toupper(z)

# tip #3: do not use a loop at all if you can vectorize!

my_dat<- seq(1:10)
for( i in seq_along(my_dat)) {
  my_dat[i]<- my_dat[i] + my_dat[i]^2
  cat("loop number =", i, "vector element-", my_dat[i], "\n")
}

# no loop needed here
z<- 1:10
z<- z+ z^2
print(z)


# tip #4: underestand the distinction between the counter variable i, and the vector element z[i]

z<- c(10,2,4)
for (i in seq_along(z)) {
  cat("i=", i, "z[i] =", z[i], "\n")
}
# what is the value of i at the end of the loop?
print(i)
print(z)

# tip #5: use next to skip certain elements in the loop

z<- 1:20

# suppose we want to work only odd-numbered elements?

for (i in seq_along(z)) {
  if( i %% 2==0) next
  print(i)
}

# another method, probs faster

z<- 1:20
z_sub<- z[z %% 2!=0] # contrast w above code- now creating vector of only odd vectors
length(z)
length(z_sub)
for (i in seq_along(z_sub)) {
  cat("i=", i, "z_sub[i]=", z_sub[i], "\n")
}

##### VIDEO C: Random walk
# tip #6: use break to set up a conditional to break out of a loop early

# create a simple random walk population model function

########################################################
# FUNCTION ran_walk
# description: stochastic random walk
# inputs: times= number of time steps
#         n1= initial population size (=n[1])
#         lambda= finite rate of increase
#         noise_sd= standard deviation of a normal           distribution with mean of 0
# outputs: vector n with population sizes >0
#           until extinction, then NA values
# -----------------------------------------------------
library(tcltk)
library(ggplot2)
ran_walk <- function(times=100,
                     n1=50,
                     lambda= 1.0,
                     noise_sd=10) {
n<- rep(NA,times) # create output vector
n[1] <- n1 #initialize starting population size
noise<- rnorm(n=times, mean=0, sd= noise_sd) # create random noise vector

for(i in 1:(times-1)) { # start of for loop
  n[i+1]<- n[i]*lambda + noise[i]
  if(n[i+1] <=0) { # start of our if statement
    n[i+1] <- NA
    cat("Population extinction at time", i, "\n")
    break
  } # end of if statement
  
} # end of for loop
return(n)

}  # end of ran_walk
########################################################

##### VIDEO A Random walk ii          3/31
# exlpore our model parameters interactively with simple graphic
pop<- ran_walk(noise_sd=5, lambda= 0.98)
qplot(x=1:100, y=pop, geom= "line")
  ######### stopped at 6:30 

# double for loops ----------------------------------

m<- matrix(round(runif(20), digits=2), nrow=5)

# loop over the rows in the matrix
for ( i in 1:nrow(m)){
  m[i,]<-m[i,]+i
}

print(m)

# loop  over the columns
for (j in 1:ncol(m)){
  m[,j]<- m[,j] + j
}
print(m)

# double for loop

m<- matrix(round(runif(20), digits=2), nrow=5)

for (i in 1:nrow(m)){ # start outer row loop
  for (j in 1:ncol(m)) { # start inner col loop
    m[i,j]<- m[i,j] + i + j
  } # end inner
} # end outer
print(m)
