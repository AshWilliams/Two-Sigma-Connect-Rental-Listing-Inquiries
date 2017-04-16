#install this package in order to read the data from the json file
#install.packages("jsonlite")

#install this faster to csv writer package
#install.packages("data.table")

# Set the working directory, i have the json files on the desktop, so...
setwd("C:/Users/Cypher/Desktop")
library(jsonlite)
library(data.table)
trainingJson <- fromJSON("train.json",flatten=true)

trainingDataFrame = as.data.frame(t(do.call(rbind, trainingJson)))

#features and photos are lists, they need extra work but not mine lol
cleanData <- data.frame(lapply(trainingDataFrame, as.character), stringsAsFactors=FALSE)

#write the file
fwrite(cleanData, file = "trainingData.csv", sep = ";")


