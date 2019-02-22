# Modelo con interaccion

#install.packages("tree")
#install.packages("titanic")
#install.packages("ROCR")

library(tree)
library(dplyr)
library(randomForest)
library(titanic)
library(caret)
library(ROCR)

tree(Survived ~ Age, titanic_train)



