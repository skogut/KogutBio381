# Functions: sturcture and use
# 25 FEb 2020
# SEK


# -------------------------------------------------------------------------

# everything in R is a function
sum(3,2) # prefix function
3+2 # an operator, but actually a function
`+`(3,2) # rewritten as an infix function
y<- 3
print(y)
`<-`(yy,3)
print(yy)

# to see contents of a function, print it
 print(read.table)

 sdq        # print function
 sd(c(3,2)) # call function with parameters
 sd()       # call function w no input: error
 

# The anatomy of a user-defined function ----------------------------------
# use verb for function name
function_name <- function(par_x= default_x,
                          par_y=default_y,
                          par_z= default_z) {
  # function body
  # lines of R code and annotation
  # can call otehr functions
  # can create functions inside of function?
  # create local variables
  return(z) # returns from the function a single element
} # ends function
 