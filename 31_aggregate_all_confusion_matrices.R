clean_result_data <- function(raw_dir_path, cleaned_data_name) {
  results_path <-
    list.files(path = raw_dir_path, full.names = TRUE)
  results <-
    list.files(path = raw_dir_path)

  partition_num <- c()
  accuracy <- c()
  j <- 1
  for (i in results_path) {
    # Get rid "GUIDE_confusion_matrix_num_part_"
    tmp_str <- str_sub(results[j], 41)
    cur_partition_num <- substr(tmp_str, 1, nchar(tmp_str) - 4)
    partition_num[j] <- cur_partition_num
    text <- readLines(i, encoding = "UTF-8")
    accuracy_index <- grep("Accuracy : ", text)
    tmp_str <- str_trim(text[accuracy_index[1]])
    cur_accuracy <- str_sub(tmp_str, 12)
    accuracy[j] <- cur_accuracy
    j <- j + 1
  }
  results_dataframe <-
    data.frame("partition_number" = as.numeric(partition_num),
               "accuracy" = as.numeric(accuracy))
  write.csv(results_dataframe,
            file = cleaned_data_name,
            row.names = FALSE)
  return(results_dataframe)
}

raw_dir_path <- "./confusion_matrices"
cleaned_data_name <-
  "./aggregated_random_forest_confusion_matrices.csv"
random_forest_confusion_matrices_df <-
  clean_result_data(raw_dir_path, cleaned_data_name)
