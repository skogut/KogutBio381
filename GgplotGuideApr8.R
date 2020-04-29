# -----------------------------------------------------
# Basics of ggplot grammar and graphics
# 09 Apr 2020
# SEK
# -----------------------------------------------------
# Videos A, B, C

# 1. data (must be in a data frame)
# 2. aestheteic mapping (variables in data are mapped to an aesthetic (most basic: which is on x and y axis))
# 3. geom (geometric object used to draw the layer: points, bars, polygons, etc. Can have their own aesthetic mapping)
# 4. stat (takes raw data and transforms it into something useful in a plot; regression line, confidence interval)
# 5. position (adjusts points for overplotting)
# 6. facet functions (ex facet grid, multiple plots by subsetting across 1 or more variables)


# Template for ggplot components ----------------------------------

# p1<- ggplot(data= <DATA>,
#             mapping= aes(<MAPPING>))  +
#     <GEOM_FUNCTION(mapping= aes(<MAPPING>),
#                   stat= <STAT>,
#                   position= <POSITION>) +
#     <COORDINATE_FUNCTION> (flip x and y) + 
#     <FACET_FUNCTION>
# ptint(p1)
# ggsave(plot=p1,
#         file_name= "MyPlot";
#         width=5,
#         height=3,
#         units="in",
#         device= "pdf")


# Preliminaries -----------------------------------------------------------

library(ggplot2)
library(ggthemes)
library(patchwork)
library(TeachingDemos)
char2seed("doubling time")

d<- mpg # use built in data set on car performance 
str(d)
table(d$fl)

# fast plotting w qplot ---------------------------------------------------
# mimics underlying base graphics_> allows you to graph whatever, does not require use of data frame
# not publication quality
# just quick look at data

#  basic histogram
qplot(x=d$hwy)
qplot(x=d$hwy, fill=I("tan"), color=I("black"))
# fill= fill color
# color= outline color
# use identity call = I()

# make your own custom histogram function
my_histo<- function(x_var, fil_col= "goldenrod") {
  qplot(x=x_var, color=I("black"), fill= I(fil_col))
}
my_histo(d$hwy)
my_histo(d$hwy, "thistle")

# basic density plot
qplot(x=d$hwy, geom= "density")

# basic scatter plot
qplot(x=d$displ,
      y=d$hwy,
      geom= c("smooth", "point"))

# basic scatterplot with linear regression line
qplot(x=d$displ,
      y=d$hwy,
      geom= c("smooth", "point"), method= "lm")

# basic boxplot
qplot(x= d$fl, y= d$cty, geom= "boxplot", fill=I("tan"))

# basic barplot ("long format")
qplot(x=d$fl, geom= "bar", fill=I("tan"))

# AVOID common mistake: missing I== ggplot trying t map the variable "tan", but cannot find tan, gives it default color. I means not mapping but assignment of color
qplot(x=d$fl, geom= "bar", fill= "tan")

# bar plot with specified counts or means ("short format")
x_treatment= c("Control", "Low", "High")
y_response= c(12,2.5, 22.9)
qplot(x=x_treatment, y= y_response, geom= "col", fill=I(c("grey20", "grey50", "grey80")))

# basic curves and functions
my_vec<- seq(1,100, by=0.1)
head(my_vec)
my_fun<- function(x) sin(x) +0.1*x
qplot(x= my_vec, y=sin(my_vec), geom="line") # built in function
qplot(x= my_vec, y= dgamma(my_vec, shape=5, scale=3), 
      geom= "line") # denstiy functions for stats
qplot(x=my_vec, y=my_fun(my_vec), geom="line") # user defined function


# Themes and fonts --------------------------------------------------------

p1<- ggplot(data=d,
            mapping= aes(x=displ, y=cty)) +
  geom_point() + stat_smooth(method= "lm")
print(p1)

p1 + theme_classic()
p1 + theme_linedraw()
p1 + theme_dark()
p1 + theme_base()
p1 + theme_void()
p1 + theme_economist()
p1+ theme_bw()
p1 + theme_grey() # default


# Major theme modifications -----------------------------------------------
# base_size and base_family take place within theme_classic()
p1 +theme_classic(base_size=15) # adjust sizes of axes/ labels/font
p1 + theme_classic(base_family= "serif") # changes to font w serif

# Defaults: theme_grey, base_size=16, base_family= "Helvetica"
# not standard for publication

# Default font families: Times, Ariel, Monaco, Courier, Helvetica, serif, sans

# use coordinate_flip to invert entire plot 
p2<- ggplot(data=d, mapping=aes(x=fl, fill= fl)) + geom_bar()
print(p2)

p2 + coord_flip()


# Minor theme modifications -----------------------------------------------
# modifying point size, shape color
# labels
# setting x and y lim
p1<- ggplot(data=d,
            mapping= aes(x=displ, y=cty)) +
      geom_point(size=7, shape=21, 
               color= "black", fill ="steelBlue") +
      labs(title= "My graph title here",
           subtitle= "An extended subtitle that will print below the main title",
           x= "My x axis label",
           y= "My y axis label") + 
  xlim(0,4) +
  ylim(0,20)
print(p1)
