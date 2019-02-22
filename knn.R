library(class)

iris
ggplot(iris)+ geom_point(aes_string(x="Petal.Length", y="Petal.Width", color="Species"))


nrow(iris)


idxTraining <- sample(1:nrow(iris), 110)


#idxTraining <- iris %>%  sample_n(110)

iris_training <- iris[idxTraining,]
iris_test <- iris[-idxTraining,]

cl <- iris_training$Species
#iris_training <- iris_training[, -5]
iris_training <- iris_training[, colnames(iris_training) != "Species"]
iris_test <- iris_test[, colnames(iris_test) != "Species"]


knn(iris_training, iris_test, cl,k=100, prob=T)  #Mal


knn(iris_training, iris_test, cl,k=4, prob=T)



