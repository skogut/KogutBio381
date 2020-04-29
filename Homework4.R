# Homework 4
# 5 Feb 2020
# SEK

# -------------------------------------------------------------------------

# Question 1
x<- 1.1
a <- 2.2
b<- 3.3
z <- x^(a^b)
print(z)
# 3.61714
z <- (x^a)^b
print(z)
# 1.997611
z <- 3*x^3 + 2*x^2 +1 
print(z)
# 7.413

# Question 2
? rep
? seq
# a.
a<- c(seq(from= 1, to= 8, by= 1), seq(from= 7, to= 1) )
print(a)    
# 1 2 3 4 5 6 7 8 7 6 5 4 3 2 1
# b. 
b<- seq(from= 1, to=5)
b2 <- c(rep(b,b))
print(b2)
# 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5
w= seq(5,1)
c= rep(w, b)
print(c)
# or
c <- c(rep(b[5], 1), rep(b[4], 2),  rep(b[3], 3), rep(b[2], 4), rep(b[1], 5))
print(c)
# 5 4 4 3 3 3 2 2 2 2 1 1 1 1 1

# question 3
vec1<-runif(2)
print(vec1)
# 0.7456000 0.9016976
x <- vec1[1]
y <- vec1[2]
polar <- c(sqrt(x^2 + y^2), atan(y/x))
print(polar)
# r= 1.1700333, theta= 0.8798759

# question 4
queue <- c("sheep", "fox", "owl", "ant")
ark <-c()
# a.
queue <- c(queue, "serpent")
print(queue)
# b. 
ark <- "sheep"
queue <- queue[-1]
print(queue)
# c.
queue <- c("donkey", queue)
print(queue)
# d.
queue <- queue[-5]
print(queue)
# e. 
queue <- queue[-3]
print(queue)
# f. 
queue <- c(queue[1:2], "aphid", queue[3])
print(queue)
# or append function 
? append
append(queue, "aphid", after= 2)
# g
which(queue[]== "aphid")
# The aphid is 3rd in line


#Question 5 
vec1= seq(from= 1, to= 100)
divisors= c(2,3,7)
result= vector()

result= which(vec1[] %% 2 != 0 & vec1[] %% 3 != 0 & vec1[] %% 7 != 0)
print(result)
#  1  5 11 13 17 19 23 25 29 31 37 41 43 47 53 55 59 61 65 67 71 73 79 83 85 89 95 97





