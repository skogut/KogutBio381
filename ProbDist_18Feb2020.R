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
