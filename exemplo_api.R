library(plumber)

model <- readRDS("modelo_rf.rds")

#' @post /predict
#' @param sepal_length
#' @param sepal_width
#' @param petal_length
#' @param petal_width
#' @json

predict_species <- function(sepal_length, sepal_width, petal_length, petal_width) {
  input <- data.frame(
    Sepal.Length = as.numeric(sepal_length),
    Sepal.Width = as.numeric(sepal_width),
    Petal.Length = as.numeric(petal_length),
    Petal.Width = as.numeric(petal_width)
  )
  pred <- predict(model, input)
  return(list(prediction = as.character(pred)))
}

pr <- plumber::plumb("/exemplo_api.R")
pr$run(host = "0.0.0.0", port = 8000)