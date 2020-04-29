# Probability distributions
# 18 February 2020
# SEK
# d probabilty density function
# p cumulative probability distribution
# q quantile function (inverse of p)
# r random number generator

# Poisson distribution ----------------------------------------------------

library(ggplot2)
library(MASS)
library(dplyr)
library(tidyverse)

# discrete 0 to infinity
# parameter lambda > 0 (continous)
# constant rate parameter (observations per unit time or unit area)

# d function for probability density
hits <- 0:10
my_vec<- dpois(x=hits, lambda=1)
qplot(x= hits,
      y= my_vec,
      geom= "col",
      color= I("black"),
      fill= I("goldenrod"))
# data will come as columns; outline color is black, fill is golden

my_vec<- dpois(x=hits, lambda=4.4)
qplot(x= hits,
      y= my_vec,
      geom= "col",
      color= I("black"),
      fill= I("goldenrod"))
sum(my_vec)

# for a poisson with lambda=2
# what is probability that a single draw will yield x=0?
dpois(x=0, lambda=2)
hits <-0:10
my_vec <- ppois(q= hits, lambda= 2)
qplot(x= hits,
      y= my_vec,
      geom= "col",
      color= I("black"),
      fill= I("goldenrod"))

# for a poisson with lambda= 2, what is the probabilty that a single random draw will yield x<= 1?

ppois(q=1, lambda=2)
# 1- the above would give anything bigger than 1

p1<- dpois(x=1, lambda=2)
print(p1)
p2 <- dpois(x=0, lambda=2)
print(p2)
p1+p2

# the q fucntion is the inverse of p
qpois(p=0.5, lambda=2.5)

# simulate a poisson to get actual values
ran_pois <- rpois(n=1000, lambda=2.5)
qplot(x= ran_pois,
      color= I("black"),
      fill= I("goldenrod"))
quantile(x=ran_pois, probs= c(0.025, 0.975))


# Binomial distribution ---------------------------------------------------

# describing a single process wtih a dichotomous outcome
# p = probability of dichotomous outcome
# size = number of trials
# x= possible outcomes
# outcome x is bounded between a minimum of 0 and a maximum of size

# density function for binomial
hits <- 0:10
my_vec <- dbinom(x= hits, size= 10, prob=0.5)
qplot(x= hits,
      y= my_vec,
      geom= "col",
      color= I("black"),
      fill= I("goldenrod"))

# what is probability of getting 5 heads
# out of 10 tosses
my_vec<- dbinom(x=hits, size=10, prob= 0.05)
# biased coin
qplot(x= hits,
      y= my_vec,
      geom= "col",
      color= I("black"),
      fill= I("goldenrod"))

# p function for tail probability
# probaiilty of 5 or fewer heads
# out of 10 tosses
pbinom(q=4, size=9, prob=0.5)

# what is a 95% confidence interval for 100 trials of a coin with p=0.7
qbinom(p= c(0.025, 0.975),
       size= 100,
       prob=0.7)
# how does this compare to a sample interval for real data
my_coins <- rbinom(n=50, size= 100, prob= 0.50)
qplot(x=my_coins,
      color= I("black"),
      fill= I("goldenrod"))
quantile(x= my_coins, probs= c(0.025, 0.975))


# Negative binomial distribution ------------------------------------------

# slightly more realistic version of the poisson
# number of "failures" in a series of (Bernouli trials) with p= probabilty of success (= size)
# How many failures do we get before a targeted number of sucesses? 
# generates a distribution that is more heterogenous ("overdispersed") than Poisson

hits <- 0:40
my_vec<- dnbinom(x= hits,
                 size=5,
                 prob= 0.5)
qplot(x= hits,
      y= my_vec,
      geom= "col",
      color= I("black"),
      fill= I("olivedrab3"))

# geometric series is a special case where the number of successes = 1
# each bar is a constant fraction of the one that came before it with prob 1-p
my_vec<- dnbinom(x= hits, size= 1, prob=0.1)
qplot(x= hits,
      y= my_vec,
      geom= "col",
      color= I("darkgoldenrod4"),
      fill= I("royalblue2"))

# alternatively specify mean= mu of distribition and size
# this will give us a poisson with a lambda value that varies
# dispersion parameter is the shape parameter from a gamma distribution
# as it increases, the distribution, the variance gets smaller

nbi_ran <- rnbinom(n=1000, size= 10, mu=5)
qplot(x= hits,
      y= my_vec,
      geom= "col",
      color= I("darkorchid2"),
      fill= I("firebrick3"))
nbi_ran <- rnbinom(n=1000, size= .1, mu=5)
qplot(x= hits,
      y= my_vec,
      geom= "col",
      color= I("darkorchid2"),
      fill= I("darkblue"))
library(RColorBrewer)



# Exploring Continuous distributions --------------------------------------
# 20 February 2020
# SEK
library(ggplot2)
library(MASS)

# Uniform -----------------------------------------------------------------

qplot(x= runif(n=100, min=1, max=6), 
      color=I("black"), 
      fill=I("goldenrod"))
qplot(x=runif(n=1000,min=1, max=6), 
      color= I("black"), 
      fill= I("goldenrod"))      
qplot( x= sample(1:6, size=1000, replace=TRUE))


# Normal distribution -----------------------------------------------------

my_norm<- rnorm(n=100, mean= 100, sd=2)
qplot(x= my_norm, 
      color=I("black"),
      fill=I("goldenrod"))
# problems with normal when mean is small
my_norm <- rnorm(n=100, mean=2, sd=2)
qplot(x= my_norm,  
      color=I("black"), 
      fill=I("goldenrod"))
toss_zeroes <- my_norm[my_norm>0]
qplot(x= toss_zeroes,  
      color=I("black"), 
      fill=I("goldenrod"))
mean(toss_zeroes)
sd(toss_zeroes)


# Gamma distribution ------------------------------------------------------

# use for continuous data > 0
my_gamma<- rgamma(n=100, shape=1, scale=10)
qplot(x= my_gamma, 
      color= I("black"), 
      fill= I("goldenrod"))

# gamma with shape =1 is exponential with scale= mean
my_gamma<- rgamma(n=100, shape=1, scale=.1)
qplot(x= my_gamma, 
      color= I("black"), 
      fill= I("goldenrod"))

# increasing shape parameter distribution looks more normal
my_gamma<- rgamma(n=100, shape=20, scale=1)
qplot(x= my_gamma, 
      color= I("black"), 
      fill= I("goldenrod"))

# scale parameter changes both mean and the variance!
# mean= hsape*scale
# variance = shape*scale^2

# Beta distribution -------------------------------------------------------

# continuous distribution bounded between 0 and 1

# analogous to binomial, but with a continuous distribution of possible values

# p(data|parameters)

# p(parameters|data) = maximum likelihood estimator of parameters

# shape1 = number of successes + 1
# shape2= number of successes + 1

my_beta <- rbeta(n=1000, shape1=50, shape2=50)
qplot(x= my_beta,
      color= I("black"),
      fill= I("goldenrod"))

# beta with 3 heads and no tails
my_beta <- rbeta(n=1000, shape1=4, shape2=1)
qplot(x= my_beta, 
      color= I("black"), 
      fill= I("goldenrod"))

# good for have data, getting back to parameters
# shape ad scale < 1 gives a U-shaped curve

my_beta <- rbeta(n=1000, shape1=0.2, shape2=0.1)
qplot(x= my_beta, 
      color= I("black"), 
      fill= I("goldenrod"))

# Estimate parameters from data -------------------------------------------

x<- rnorm(1000, mean=92.5, sd=2.5)
qplot(x=x,
      color=I("black"),
      fill=I("goldenrod"))
fitdistr(x, "normal") # data, name of ditribution we are fitting the data to
fitdistr(x, "gamma")
x_sim <- rgamma(n= 1000, shape= 1343.468042, rate= 14.513203)
qplot(x=x_sim,
      color=I("black"),
      fill=I("goldenrod"))


# Experimental Design -----------------------------------------------------

# Regression analysis
# be suspicious: use fake data to test your tests

n<- 50 # number of observations (rows)
var_a<- runif(n) # 50 random uniforms (independent)
var_b <- runif(n) # dependent variable
var_c <- 5.5 + var_a*10 # creates a noisy linear relationship
id<- seq_len(n) # creates a sequence from 1 to n if n >0
reg_df<- data.frame(id, var_a, var_b, var_c)
str(reg_df)
head(reg_df)

# regression model
reg_model <- lm(var_b~ var_a, data=reg_df) # last statement: pull from this dataframe
reg_model # sparse output
str(reg_model)
head(reg_model$residuals)

# summmary of model has waht we usually want
summary(reg_model)
summary(reg_model$coefficients)
str(summary(reg_model))

z <- unlist(summary(reg_model))
reg_sum <- list(intercept= z$coefficients1, 
                slope=z$coefficients2,
                intercept_p= z$coefficients7,
                slope_p= z$coefficients8,
                r2=z$r.squared)

reg_sum$intercept

# regression plot for data
reg_plot <- ggplot(data=reg_df,
                   aes(x=var_a, y=var_b)) + geom_point() + stat_smooth(method= lm, se= 0.95)

reg_plot


# Basic ANOVA -------------------------------------------------------------

n_group <- 3 # number of treatment groups
n_name <- c("Control", "Treat1", "Treat2")
n_size <- c(12, 17,9)
n_mean <- c(40, 41, 60)
n_sd<- c(5,5,5)
t_group <- rep(n_name, n_size)
t_group
table(t_group)

id <- 1:(sum(n_size))

res_var<- c(rnorm(n=n_size[1], mean= n_mean[1], sd=n_sd[1]),
            rnorm(n=n_size[2], mean= n_mean[2], sd=n_sd[2]),
            rnorm(n=n_size[3], mean= n_mean[3], sd=n_sd[3]))
ano_data<- data.frame(id, t_group, res_var)
str(ano_data)
View(ano_data)
ano_model<- aov(res_var~t_group, data=ano_data)
print(ano_model)
print(summary(ano_model))
z<- summary(ano_model)
aggregate(res_var~t_group, data=ano_data, FUN=mean)
# like mapply

unlist(z)
ano_sum<- list(Fval= unlist(z)[7],
               probF= unlist(z)[9])

# ggplot for anova --------------------------------------------------------

ano_plot <- ggplot(data=ano_data,
                   aes(x= t_group,
                       y= res_var,
                       fill= t_group)) + 
                        geom_boxplot()
   # fill specifies grouping variables
print(ano_plot)
ggsave(filename= "plot2.pdf", plot= ano_plot, device= "pdf")


# data frame for logistic regression --------------------------------------

# discrete y variable (0,1), continuous x variable

x_var <- sort(rgamma(n=200, shape=5, scale=5))
head(x_var)
y_var <- sample(rep(c(0,1), each= 100), prob= seq_len(200))
head(y_var)
l_reg_data<- data.frame(x_var, y_var)

# logistic regression code ------------------------------------------------

l_reg_model<- glm(y_var~x_var,
                  data=l_reg_data,
                  family= binomial(link=logit))
summary(l_reg_model)
summary(l_reg_model)$coefficients

# basic ggplot of logistic regression data --------------------------------

lreg_plot<- ggplot(data= l_reg_data,
                   aes(x=x_var, y=y_var)) + 
               geom_point() + stat_smooth(method= glm, method.args= list(family=binomial))
print(lreg_plot)


# contingency table data --------------------------------------------------

# both x and y variables are discrete (= counts)
# integer counts of different groups
vec_1<- c(50,66,22)
vec_2<- c(120,22,30)
data_matrix<- rbind(vec_1, vec_2)
rownames(data_matrix)<- c("cold", "warm")
colnames(data_matrix) <- c("Aphaenogaster", "Camponotus", "Crematogaster")
str(data_matrix)
print(data_matrix)

# simple association test -------------------------------------------------

print(chisq.test(data_matrix))


# plotting contingency data -----------------------------------------------

# base R graphics
mosaicplot(x= data_matrix, 
           col= c("goldenrod", "grey", "black"),
           shade= FALSE)
barplot(height= data_matrix, beside= TRUE, col= c("cornflowerblue", "tomato"))

# ggplot really requires a data frame
d_frame<- as.data.frame(data_matrix)
d_frame<- cbind(d_frame, list(Treatment= c("cold", "warm")))
d_frame<- gather(d_frame, key= Species, Aphaenogaster:Crematogaster, value=Counts)
data_matrix
head(d_frame)
p<- ggplot(data= d_frame,
           aes(x= Species, y= Counts, fill= Treatment)) + geom_bar(stat= "identity", position= "dodge", color =I("black")) + scale_fill_manual(values= c("cornflowerblue", "coral"))
print(p)
