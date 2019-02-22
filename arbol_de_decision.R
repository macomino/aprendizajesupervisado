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

miArbol <-tree(Survived ~ Age + Pclass, titanic_train)

predict(miArbol, data=titanic_test)

titanic_train <- titanic_train %>% filter(!is.na(Age))
randomForest(Survived ~ Pclass + Age, titanic_train )




