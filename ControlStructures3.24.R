# -----------------------------------------------------
# Booleans and if/else control structures
# 24 Mar 2020
# SEK
# -----------------------------------------------------
##### VIDEO A: Logical Operators

# review of boolean operators

# Simple inequality
# uses logical operators
5>3
5<3
5>= 5
5<= 5
5==5
5!=3
# compound statements use & or |
# use & for AND
FALSE & FALSE # FALSE
FALSE & TRUE # FALSE
TRUE & TRUE # TRUE

5>3 & 1!=2
1==2 & 1!=2

# use | for OR
FALSE|FALSE #FALSE
FALSE|TRUE #TRUE
TRUE|TRUE #TRUE
1==2| 1!=2

# boolean operators work with vectors
1:5>3
a<- 1:10
b<- 10:1

a>4 & b>4
sum(a>4 & b>4) # coerces boolean to numeric values

# "long" form evaluates only the first element
a< 4 & b>4
a<4 && b>4

# also a long form for or ||
a<4 || b>4

#xor for exclusive "or" testing of vectors
# works for (TRUE FALSE) but not for (FALSE FALSE) or (TRUE TRUE)

a<-c(0,0,1)
b<-c(0,1,1) 
xor(a,b)

# by comparison with ordinary |
a|b

##### VIDEO B: Set Operations
# boolean algebra on sets of atomic vectors (numeric, logical, chr strings)

a<-1:7
b<- 5:10

# union to get all elements (or for a set)
union(a,b)

# intersect to get common elements (and for set)
intersect(a,b)

#setdiff to get distinct elements in a or first set
setdiff(a,b)
setdiff(b,a)

# setequal to get the identical elements
setequal(a,b)

# more generally to compare any two objects
z<- matrix(1:12, nrow=4, byrow=TRUE)
z1<- matrix(1:12,nrow=4, byrow=FALSE)

# this just compares element by element
z==z1
identical(z,z1) # false

# most useful in if statments is %in% or is.element
# these are equivalent but i prefer %in%

d<-12
d %in% union(a,b)
is.element(d, union(a,b))

a<-2
a == 1 | a==2 | a ==3
a %in% c(1,2,3)
# check for partial matching with vector comparison
a<- 1:7
d<- c(10,12)
d %in% union(a,b)
d %in% a


###### VIDEO C: if statement

# anatomy of if statements

# if(condition) expression
# if(condition) expression1 else expression2

# if(condition1) expression1 else
# if(condition2) expression2 else
# expression3

# - final unspecified else captures rest of the unspecified conditions
# else statement must appear on the sameline as previous expression
# instead of single  expression, can use curly brackets to execut a set of lines when condition is met

z<- signif(runif(1), digits=2)
print(z)
# simple if statement
if(z>0.5) cat(z, "is a bigger than average number", "\n")

# compound if statement with 3 outcomes (2 if)

if(z>0.8) cat(z, "is a large number", "\n") else
if(z<0.2) cat(z, "is a small number", "\n") else
{ cat(z, "is a number of typical size", "\n")
  cat("z^2=", z^2, "\n")}

# if statements wants a single boolean value (TRUE FALSE)
# if you give an if statement a vector of booleans, it will only take the very first element in the vec

z<- 1:10
# this doesnt do anything
if (z>7) print(z)

if(z<7) print(z)
# not what we want
print(z[z<7])
# do I really need an if statement?

##### VIDEO D: ifelse
# ifelse function
# ifelse(test,yes,no)
# "test" is an object that can be coerced into a logical TRUE/FLASE
# "yes" returns values for true elements in the test
# "no" returns values for false elemetns in the test

# suppose we have an insect population in which each female lays on average, 10.2 eggs, following a Posson distribution. lambda=10.2. However, there is  35% chance of parasitism, in which case, no eggs are laid. Here is a random sample of eggs laid for a group of 1000 individuals

tester<- runif(1000) # start w random unifrom elements
eggs<- ifelse(tester> 0.35, rpois(n=1000, lambda= 10.2),0)
hist(eggs)

# suppose we have a vector of probability values (perhaps from a simulation). We want to highlight significant values in the vector for plotting

p_vals<- (runif(1000))
z<- ifelse(p_vals <0.025, "lower_tail", "nonsig")
z[p_vals>=0.975] <- "uppertail"
table(z)

# another way
z1<- rep("nonsig", 1000)
z1[p_vals<= 0.025]<- "lower_tail"
z1[p_vals>= 0.975]<- "upppertail"
table(z1)
