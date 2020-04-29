# pheno= read.csv("/Users/skogut/Desktop/CompBio/KogutBio381/cornell_pheno.csv")
# pheno$sample_id= gsub("-", "_", pheno$sample_id)
# caucfemale= which(pheno$sex== "F" & pheno$race== "w")
# caucfemalepheno= pheno[caucfemale,]
# IDcaucfemale=caucfemalepheno$sample_id

########################################################
# FUNCTION is_outlier
# description: filteres outliers
# inputs: 1 column of data
# outputs: T/F for each point
# -----------------------------------------------------
is_outlier <- function(x) {
  return(x < quantile(x, 0.25) - 1.5 * IQR(x) | x > quantile(x, 0.75) + 1.5 * IQR(x))
}
# end of is_outlier
########################################################

# dir.create("SelectedJeff/")
# Create files ----------------------------------
# two sets of counts per file: 1 set from ERV, transcript per top 1000 pairs

########################################################
# FUNCTION file_builder
# description: creates a sest of random files for regression
# inputs: file_n = number f files to create
#         file_folder = name of folder for random file
#         file_size = c(min,max) number of rows in file
#        file_NA= average number of NA values per column
# outputs: creates a set of random files
# -----------------------------------------------------
# file_builder <- function(file_n=1000,
#                          file_folder= "PositiveERV_Trans/",
#                          ERVdata= 1:1000,
#                          Transcriptdata= 1:1000,
#                          SelectPairs= 1:1000, 
#                          Status= 1:1000) {
#   
#   for (i in 1:nrow(SelectPairs)) {
#     
#     var_x<- SelectPairs[i,1] # ERV
#     var_y<-SelectPairs[i,2] # Transcript
#     
#     
#     
#     
#     df<- data.frame(status= Status, var_x = ERVdata[[ which(colnames(ERVdata)== var_x)]], var_y= Transcriptdata[[which(colnames(Transcriptdata)== var_y)]]) # bind into a data frame
#     
#     colnames(df)<- c("status", var_x, var_y)
#     print(df)
#     
#     # create label for file name with padded zeroes
#     file_label<- paste(file_folder, "PharmPair",
#                        formatC(i, 
#                                width=3,
#                                format= "d",
#                                flag= "0"),
#                        ".csv",
#                        sep="")
#     
#     # set up data file and incorporate time stamp and minimal meta data
#     write.table(cat("# Simulated random data filefor batch processing", "\n",
#                     "# timestamp: ", as.character(Sys.time()), 
#                     "\n",
#                     "# SEK", "\n",
#                     "#----------------------------", "\n",
#                     "\n",
#                     file=file_label,
#                     row.names= "",
#                     col.names= "",
#                     sep= "") )
#     
#     # now add the data frame
#     write.table(x=df,
#                 file= file_label,
#                 sep=",",
#                 row.names= FALSE,
#                 append=TRUE)
#     
#   }
#   
# }  # end of file_builder
# ########################################################
# # inputs to add: all of them
# # using file builder:
# # altering files for consistent naming format
# 
# status<- caucfemalepheno$status
# 
# # running function file builder-
#  file_builder(file_n= 500, file_folder= "SelectedJeff/", ERVdata = ERVs, Transcriptdata = Transcripts, SelectPairs= SelectPairs, Status= status )
