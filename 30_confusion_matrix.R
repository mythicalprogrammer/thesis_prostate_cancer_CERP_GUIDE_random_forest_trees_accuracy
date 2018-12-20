dir_path <- "./intermediate_data"
results_path <- list.files(path = dir_path, full.names = TRUE)

for (i in results_path) {
  predictions <- read.table(i, sep = ",", header = TRUE)
  predictions <- matrix(t(predictions))
  predictions <- data.frame(prediction = predictions)
  tmp_str <- str_sub(i, 58)
  cur_partition_num <- substr(tmp_str, 1, nchar(tmp_str) - 4)
  create_confusion_matrix(predictions$prediction,
                          prostate_data$state,
                          cur_partition_num)
}
