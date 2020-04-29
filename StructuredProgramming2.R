
# ------------------------------------------------------------------------- Video A 3/19/2020 Code Snippets

# Pseudocode
# Get data
# Calculate stuff
# Summarize output
# graph results

# code will eventually look like this:
# get_data()
# calc_stuff()
# summarize_output()
# graph_results()


# Getting input -----------------------------------------------------------
# SNIPPETS-> use tab to set up code syntax
# edit snippets: tools-> global options -> code-> edit snippets -> follow syntax, use tab**
my_fun <- function(x=5) {
  z<- 5 + runif(1)
  return(z)
}
my_fun()

# try using m_bar
#######################################################
# m_sec
# ${1:allows box for changing text}
# Get data ----------------------------------


##### VIDEO B Code Snippets
# -----------------------------------------------------
# Setting up a new script: m_head
# 19 Mar 2020
# SEK
# -----------------------------------------------------
#

# trying new function snippet m_fun
# -----------------------------------------------------
# FUNCTION trial_funct
# description: one line explanation here
# inputs: just x=5 for now
# outputs: real number
#######################################################
trial_funct <- function(x=5) {

# function body

return("Checking...trial_funct")

}  # end of trial_funct
# -----------------------------------------------------
trial_funct()

##### VIDEO C Sourcing Files
# see MyFunctions
source("MyFunctions.R") # run other scripts to get things in memory
get_data()
calc_stuff()
summarize_output()
graph_results()

##### VIDEO D Coding Functions

##### VIDEO E Assemble Program

# load libraries ----------------------------------------------------------
library(ggplot2)

# source files ------------------------------------------------------------
source("MyFunctions.R")


# global variables --------------------------------------------------------
ant_file<- "antcountydata.csv"
x_col<- 7 # column 7, latitude center of each county
y_col<- 5 # column 5, number of ant species
#############################################
temp1<- get_data(file_name= ant_file)

x<- temp1[,x_col] # extract predictor variable
y<- temp1[,y_col] # extract response variable 
# fit regression model
temp2<- calc_stuff(x_var=x, y_var=y)
# extract residuals
temp3<- summarize_output(z= temp2)
# create a graph
graph_results(x_var=x, y_var=y)

print(temp3) # show residuals
print(temp2)
