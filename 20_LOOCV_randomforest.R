set.seed(1030)
n <- unique(result_df$partition_number)
nr <- nrow(prostate_data)

for (j in n) {
  random_forest_predictions <- list()
  for (i in  1:nr) {
    train <- prostate_data[-c(i), ]
    test <- prostate_data[i,]
    rf.fit <- ranger(state ~ ., data = train, num.trees = j)
    pred <- predict(rf.fit, test)
    random_forest_predictions[[i]] <- pred$predictions
  }

  # back up the result since this took awhile to run
  file_path  <- str_c('intermediate_data/LOOCV_random_forest_results_num_part_',
                      j, '.csv')
  write.csv(random_forest_predictions,
            file = file_path,
            row.names = FALSE)
}
