# Convolutional neuronal network
# la de las casillitas

mnist <- dataset_mnist()

image(as.matrix(mnist$train$x[2,,]))

x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y

# normalizar el input (de 0 a 255) a (0-1)
x_train <- x_train/255
x_test <- x_test/255

# one-hot encoding o dummy variable
y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)

# redimensionamiento sustituye al flatten de antes
x_train <- x_train %>%  array_reshape(c(60000,28, 28, 1))
x_test <- x_test %>%  array_reshape(c(10000,28, 28, 1))

image(x_train[150,,,])

layer_conv_2d(kernel_size = c(3,3), activation = "relu", filters=32, input_shape=c(28, 28, 1))


modelo_cnn <- keras_model_sequential()

modelo_cnn %>% 
  layer_conv_2d(kernel_size = c(3,3), activation = "relu", filters = 32,  input_shape=c(28, 28, 1)) %>% 
  layer_conv_2d(kernel_size = c(3,3), activation = "relu", filters = 64,  input_shape=c(28, 28, 1)) %>% 
  layer_max_pooling_2d(pool_size = c(3,3)) %>% 
  layer_dropout(rate = 0.25) %>% 
  layer_flatten() %>% 
  layer_dense(unit=128, activation = "relu") %>% 
  layer_dropout(rate = 0.5) %>% 
  layer_dense(unit=10, activation = "softmax")
summary(modelo_cnn)


modelo_cnn %>%
  compile(
    loss = "categorical_crossentropy",
    optimizer = optimizer_adam(),
    metric = c("accuracy")
  )


resultado <- fit(modelo_cnn, x_train, y_train, epochs = 5,
                 batch_size = 8, validation_split = 0.5)


plot(resultado)


modelo_cnn %>% evaluate(x_test, y_test)


result_xtest <- modelo %>%  predict_classes(x_test)


