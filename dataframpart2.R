# finishing data frames,lists
# formatting data
# Feb 13 2020
# SEK

# -------------------------------------------------------------------------

# matrix and data frame similarites and differences
z_mat <- matrix(data= 1:30, ncol=3, byrow= TRUE)
z_dataframe <- as.data.frame(z_mat)

#structure
str(z_mat)
str(z_dataframe)

# appearance
head(z_mat)
head(z_dataframe)

# element referencing is the same
z_mat[2,2]
z_dataframe[2,2]

# column/row referncing the same 
z_mat[,2]
z_dataframe[2,]
z_dataframe$V1

# specifying elements is different
z_mat[2]
z_dataframe[2]

# complete.cases for scrubbing atmoic vectors
zD <- c(runif(3), NA, NA, runif(2))
zD
complete.cases(zD)
zD[complete.cases(zD)]
zD[!complete.cases((zD))]

m<- matrix(1:20, nrow=5)
m[1,1]<-NA
m[5,4]<-NA
m
# sweep all rows wtih missing values
m[complete.cases(m),]
m[complete.cases(m[,c(1,2)]),] # drop row 1
m[complete.cases(m[,c(2,3)]),] # no rows dropped
m[complete.cases(m[,c(3,4)]),]# drop row 4
m[complete.cases(m[,c(1,4)]),]

# techniques for assignments and subsetting matrices and dataframes
m<- matrix(data=1:30, ncol=4)
colSums(m) > 15
m[, colSums(m)> 15]
m[rowSums(m)== 22]
m[m[,"S1"]<3, m["SpA,"]< 5]

# caution: simle subscipting cane change data type
z<- m[1,]
print(z)
str(z)
# use drop=FALSE to retain dimensions
z2<- m[1,,drop=FALSE]
str(z2)


# basic formta for dataframes
#csv
my_data<- read.table(file= "firstdata.csv",
                     header=TRUE,
                     sep= ",",
                     stringsAsFactors = FALSE
                     )
str(my_data)
# use to save: saveRDS() will save an R object as binary

saveRDS(my_data, file="my_RDS")
z<- readRDS("my_RDS")
z


