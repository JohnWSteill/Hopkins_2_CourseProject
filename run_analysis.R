DATA_DIR <- "data//UCI HAR Dataset"
TEST_TRAIN <- c("test","train")
FILE_NAMES <- c("subject_test","X_test","y_test")

readDataWithFileAndPath <- function(dir2,f){
    paste(DATA_DIR,dir2,f,sep='//') %>%
        read.table %>%
        tbl_df
}

allData  <-  rbind(
    cbind(readDataWithFileAndPath("test","subject_test.txt") %>%
              rename(subjId = V1) %>%
              mutate(partitionID = "test"),
          readDataWithFileAndPath("test","Y_test.txt") %>%
              rename(activity = V1),
          readDataWithFileAndPath("test","X_test.txt") %>%
              select(1:6) %>%
              rename(meanXAcc = V1, meanYAcc = V2, meanZAcc = V3,
                     stdXAcc = V4, stdYAcc = V5, stdZAcc = V6)) ,
    cbind(readDataWithFileAndPath("train","subject_train.txt") %>%
              rename(subjId = V1) %>%
              mutate(partitionID = "train"),
          readDataWithFileAndPath("train","Y_train.txt") %>%
              rename(activity = V1),
          readDataWithFileAndPath("train","X_train.txt") %>%
              select(1:6) %>%
              rename(meanXAcc = V1, meanYAcc = V2, meanZAcc = V3,
                     stdXAcc = V4, stdYAcc = V5, stdZAcc = V6))) %>%
    tbl_df

allData <- allData %>%
    mutate(activity = factor(activity, 
                             labels = c("WALKING","WALKING_UPSTAIRS",
                                        "WALKING_DOWNSTAIRS","SITTING",
                                        "STANDING","LAYING")))

summaryByActivityAndSubject  <- allData %>%
    group_by(activity,subjId) %>%
    summarise_each("mean",4:9) %>% %>%
    rename(avgMeanXAcc = meanXAcc, avgMeanYAcc = meanYAcc, avgMeanZAcc = meanZAcc,
           avgStdXAcc = stdXAcc, avgStdYAcc = stdYAcc, avgStdZAcc = stdZAcc)
    print

write.table(summaryByActivityAndSubject, "sum_table.txt", row.name = FALSE)
    