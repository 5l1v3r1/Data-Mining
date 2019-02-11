setwd("C:/Users/user/Documents/OKUL/ÖDEVLER/18-19/Data Mining")
pkgs <- c("factoextra",  "NbClust")
install.packages(pkgs)
library(factoextra)
library(NbClust)

dataSet<-read.table("spnbmd.csv",header = TRUE, sep =",")
dataSet$idnum <- NULL
summary(dataSet)

dataSet$Asian <-ifelse(dataSet$ethnic == "Asian", 1, 0)
dataSet$Black <-ifelse(dataSet$ethnic == "Black", 1, 0)
dataSet$Hispanic <-ifelse(dataSet$ethnic == "Hispanic", 1, 0)
dataSet$White <-ifelse(dataSet$ethnic == "White", 1, 0)
dataSet$fem <-ifelse(dataSet$sex == "fem", 1, 0)
dataSet$mal <-ifelse(dataSet$sex == "mal", 1, 0)

features <- dataSet
features$ethnic <- NULL
features$sex <- NULL

features <- scale(features)
# Elbow method
fviz_nbclust(features, kmeans, method = "wss") +
  geom_vline(xintercept = 4, linetype = 2)+
  labs(subtitle = "Elbow method")

results <- kmeans(features,4)
dataSet$es <- paste(dataSet$ethnic,dataSet$sex)
dataSet$es <- factor(dataSet$es)
table(dataSet$es,results$cluster)

plot(dataSet[c("es","age","spnbmd")],,col=results$cluster)
plot(dataSet[c("es","age")],,col=results$cluster)
plot(dataSet[c("es","spnbmd")],col=results$cluster)





