# -----------------------------------------------------
# GGplot guide ii 
# 14 Apr 2020
# SEK
# -----------------------------------------------------
#
### VIDEO A; Set-up multiple plots


# preliminaries -----------------------------------------------------------

library(ggplot2)
library(ggthemes)
library(patchwork)
library(TeachingDemos)
char2seed("crocus")
d<- mpg # use mpg data set


# multple plots -----------------------------------------------------------

# create a series of plots

g1<- ggplot(data=d,
            mapping=aes(x=displ, y=cty)) +
  geom_point() + geom_smooth()

print(g1)

g2<- ggplot(data=d, mapping= aes(x=fl,
                                 fill= I("tomato"), color=I("black"))) + geom_bar(stat= "count") +
  theme(legend.position = "none")

print(g2)

g3<- ggplot(data=d, mapping= aes(x=displ,
                                 fill=I("royalblue"), color=I("black"))) +geom_histogram()

print(g3)

g4<- ggplot(data=d,
            mapping=aes(x=fl, y= cty, fill= fl)) + geom_boxplot() + theme(legend.position= "none") 

print(g4)

### VIDEO B: Multi panel plots with patchwork

# use patchwork to combine plots
# place two plots horizontally
g1+g2

# place three plots vertically
g1 + g2 +g3 + plot_layout(ncol=1)

# change realtive area of each plot 
g1+g2+ plot_layout(ncol=1, heights= c(2,1))
g1+g2 +plot_layout(ncol=2, widths=c(1,2))

# add a spacer plot
g1 + plot_spacer() + g2

# use nested plots
g1+ {
  g2 + {
    g3 +{
      g4 +
        plot_layout(ncol=1)
    }
  } + plot_layout(ncol= 1)
}

# - operator for subtrack element
g1 + g2 - g3 + plot_layout(ncol=1)

# / and | for intuitive plot layouts
(g1| g2 |g3) / g4

(g1| g2) / (g3 | g4)

# Add a title, subtitle to patchwork plot
g1 +g2 + plot_annotation("This is a title",
                         caption= "made with patchwork")

# change styling of patchwork annotations
g1+ g2 + plot_annotation( title= "This is a title",
 caption= "made with patchwork",
 theme= theme(plot.title= element_text(size=16)))

# add tags to plots
g1/ (g2 | g3) + plot_annotation(tag_levels= "A")
