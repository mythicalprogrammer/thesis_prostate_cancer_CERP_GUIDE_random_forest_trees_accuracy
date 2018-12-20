sinkall <- function() {
  i <- sink.number()
  while (i > 0) {
    sink()
    i <- i - 1
  }
}

create_confusion_matrix <- function(forest_predictions, actual, num_partition) {
  pred <- factor(unlist(forest_predictions))
  levels(pred) <- c("D", "I") # HARDCODED
  levels(actual)
  file_path  <- str_c('confusion_matrices/random_forest_confusion_matrix_num_part_',
                      num_partition,
                      '.txt')
  sink(file_path)
  print(confusionMatrix(pred, actual))
  sinkall()
}
