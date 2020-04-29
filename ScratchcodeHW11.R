## scratch work fro homework 11

file_folder<- "PositiveERV_Trans/"
n_files<- 100
file_out<- "StatsSummary.csv"
#######################################################
# create random datasets
par(mfrow= c(3,3))

file_names<- list.files(path= file_folder)
par(mfrow = c(2,2))

p<-list(1:4)

plotpairs<- function(file_folder= file_folder,
                     file_names= file_names) {
  
  data<- read.table(file=paste(file_folder, file_names,
                               sep=""),
                    sep=",", 
                    header= TRUE)
  qplot(x=data[,1],
        y=data[,2],
        geom= c("smooth", "point"), method= "lm")
  
}

lapply(x= file_names, FUN= plotpairs(x))




par(mfrow = c(2,2))

p<-list(1:4)

for (i in 1:4) {
  data<- read.table(file=paste(file_folder, file_names[i],
                               sep=""),
                    sep=",", 
                    header= TRUE)
  qplot(x=data[,1],
        y=data[,2],
        geom= c("smooth", "point"), method= "lm")
  
}



# p1<- ggplot(data=data,
#             mapping= aes(x=data[,1], y=data[,2])) +
#   geom_point() + stat_smooth(method= "lm") +
#   labs(
#           x= "ERV" ,
#            y= "transcript")
# print(p1)
       