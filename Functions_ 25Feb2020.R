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

function_name
function_name()
function_name(par_x= my_matrix, par_y= "Order", par_z=1:10)

# use prominent hash fencing around your fnction code
# give header with function name, description of input, output
# names inside functions can be short
# functions should be short and simple, no more than 1 screen of text
# if too complicatted, break into multiple functions
# providing default values for all input parameters
# make default values from random number generators


#####################################################
# FUNCTION: hardy_weinberg
# input: an allele frequency p (0-1)
# output: p and the frequencies of genotypes AA AB BB 

# -------------------------------------------------------------------------

hardy_weinberg<- function(p= runif(1)) {
  q<- 1-p
  f_AA <- p^2
  f_AB <- 2*p*q
  f_BB<- q^2
  vec_out <- list(p=p, 
                  f_AA=f_AA,
                  f_AB= f_AB,
                  f_BB= f_BB)
  return(vec_out)
}
########################################################

hardy_weinberg()
hardy_weinberg(p=0.5)
pp <- 0.6
hardy_weinberg(p=pp)
print(pp)

#####################################################
# FUNCTION: hardy_weinberg
# input: an allele frequency p (0-1)
# output: p and the frequencies of genotypes AA AB BB 

# -------------------------------------------------------------------------

hardy_weinberg2<- function(p= runif(1)) {
  if( p> 1.0 | p< 0) {
    return( "Function failure: p must be <= 1 and >= 0")
  }
  q<- 1-p
  f_AA <- p^2
  f_AB <- 2*p*q
  f_BB<- q^2
  vec_out <- list(p=p, 
                  f_AA=f_AA,
                  f_AB= f_AB,
                  f_BB= f_BB)
  return(vec_out)
}
########################################################
hardy_weinberg2()
hardy_weinberg(p=1.1)
hardy_weinberg2(p=1.1)
z<- hardy_weinberg2(p=1.1)
print(z)

# use "stop" func for true error trapping
#####################################################
# FUNCTION: hardy_weinberg
# input: an allele frequency p (0-1)
# output: p and the frequencies of genotypes AA AB BB 

# -------------------------------------------------------------------------

hardy_weinberg3<- function(p= runif(1)) {
  if( p> 1.0 | p< 0) {
    stop( "Function failure: p must be <= 1 and >= 0")
    # stop will terminate function and kick out error message, will not be passed to next variable
  }
  q<- 1-p
  f_AA <- p^2
  f_AB <- 2*p*q
  f_BB<- q^2
  vec_out <- list(p=p, 
                  f_AA=f_AA,
                  f_AB= f_AB,
                  f_BB= f_BB)
  return(vec_out)
}
########################################################
hardy_weinberg3(1.1)
z<- hardy_weinberg3(1.1)


# -------------------------------------------------------------------------
# inside of the function: local environment, local variables
# like spring break 

# global variables: visible in all parts of code, declared in main body of the program
# lcoal variables: visible only within the function
# declared in function or passed to it through the input parameters

# functions can "see" variables in global environment
# global environment cannot "see" variables in function environment

my_func<- function(a=3, b=4){
  z<- a+b
  return(z)
}
my_func()

my_func_bad <- function(a=3) {
  z<- a+b
  return(z)
}
my_func_bad()
# cannot find b bc it is local to my_func
# bad because this function will behave differently based on global environment

b<- 100
my_func_bad()

my_func_ok <- function(a=3) {
  bb <-100
  z<- a + bb
  return(z)
}

my_func_ok()

##########################################################
# FUNCTION: fit_linear
# fits simple regression line
#inputs: numerci veectors of predictortor (x) and response (y)
# outputes: slope and p- value


# -------------------------------------------------------------------------

fit_linear <- function(x= runif(20),
                       y=runif(20)) {
  my_mod <- lm(y~x)
  my_out<- list(slope=summary(my_mod)$coefficients[2,1], 
                p_val= summary(my_mod)$coefficients[2,4])
  plot(x=x, y=y)
  return(my_out)
}

# -------------------------------------------------------------------------
##########################################################
fit_linear()

# create more complex input value

##########################################################
# FUNCTION: fit_linear
# fits simple regression line
#inputs: numerci veectors of predictortor (x) and response (y)
# outputs: slope and p- value


# -------------------------------------------------------------------------

fit_linear2 <- function(p=NULL) {
  if(is.null(p)) {
    p<- list(x=runif(20), y= runif(20))
  }
  my_mod <- lm(p$y~p$x)
  my_out<- list(slope=summary(my_mod)$coefficients[2,1], 
                p_val= summary(my_mod)$coefficients[2,4])
  plot(x=p$x, y=p$y)
  return(my_out)
}

# -------------------------------------------------------------------------
##########################################################
fit_linear2()
my_pars <- list( x=1:10, y= runif(10))
fit_linear2(p=my_pars)
fit_linear2(my_pars)

# use do.all to pass a list of parametes to a function
z<- c(runif(99), NA)
mean(z)
mean(x=z, na.rm=TRUE)
mean(x=z, na.rm=TRUE, trim= 0.05)

my_list= list(x=z, na.rm=TRUE, trim=0.05)
mean(my_list)
do.call(mean, my_list)
