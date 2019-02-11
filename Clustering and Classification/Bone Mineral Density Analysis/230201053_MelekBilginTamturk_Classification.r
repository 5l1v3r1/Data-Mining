setwd("C:/Users/user/Documents/OKUL/ÖDEVLER/18-19/Data Mining")
install.packages("rpart")
library(rpart)
library(rpart.plot)
dataSet<-read.table("spnbmd.csv",header = TRUE, sep =",")
dataSet$idnum <- NULL #to decrease the dimensionality and unnecessary attributes
dataWithoutEthnic <- dataSet
dataWithoutEthnic$ethnic<-NULL

decisionTree <- rpart(sex~age+spnbmd,data=dataWithoutEthnic)
prp(decisionTree, extra = 4,  box.palette = "auto")
decisionTree2 <- rpart(ethnic~spnbmd+age+sex,data=dataSet)
prp(decisionTree2,extra = 4, box.palette = "auto")

dataSet$es <- paste(dataSet$ethnic,dataSet$sex)
dataSet$es <- factor(dataSet$es)
dataWithAdditionalClassEs <- dataSet
dataWithAdditionalClassEs$ethnic <- NULL
dataWithAdditionalClassEs$sex <- NULL

decisionTree3 <- rpart(es~spnbmd+age,data=dataWithAdditionalClassEs)
prp(decisionTree3,extra = 4, box.palette = "auto")
