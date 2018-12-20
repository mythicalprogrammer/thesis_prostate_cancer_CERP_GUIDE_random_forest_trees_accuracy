prostate_data <- read.table("start_data/GDS1390_after_anova.csv",
                            sep = ",",
                            header = TRUE)
pruned_df <- read.table("start_data/clean_pruned.csv",
                            sep = ",",
                            header = TRUE)
unpruned_df <- read.table("start_data/clean_unpruned.csv",
                            sep = ",",
                            header = TRUE)

result_df <- rbind(pruned_df,unpruned_df)
