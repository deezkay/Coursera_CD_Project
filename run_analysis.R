# before running this script you need to set the working directory
# to the location of the parent directory (where features.txt is located)

load_data <- function(data_set) {

    # load measures
    fname <- paste(data_set,"/X_",data_set,".txt", sep="")
    data1 <- read.fwf(fname, width=c(rep(16, 561)))
  
    # reduce data.frame to just columns we need
    data1 <- subset(data1, V1 != "", select=c(V1,V2,V3,V4,V5,V6,
                                             V41,V42,V43,V44,V45,V46,
                                             V81,V82,V83,V84,V85,V86,
                                             V121,V122,V123,V124,V125,V126,
                                             V161,V162,V163,V164,V165,V166,
                                             V201,V202,
                                             V214,V215,
                                             V227,V228,
                                             V240,V241,
                                             V253,V254,
                                             V266,V267,V268,V269,
                                             V270,V271,
                                             V294,V295,V296,
                                             V345,V346,V347,V348,V349,V350,
                                             V373,V374,V375,
                                             V424,V425,V426,V427,V428,V429,
                                             V452,V453,V454,
                                             V503,V504,V513,
                                             V516,V517,V526,
                                             V529,V530,V539,
                                             V542,V543,V552,
                                             V556,V557,V558,V559,
                                             V560,V561))

    # load activities 
    fname <- paste(data_set,"/y_",data_set,".txt", sep="")
    data2 <- read.table(fname, header=FALSE)
    names(data2)[names(data2)=="V1"] <- "Activity_Id"

    # load subjects
    fname <- paste(data_set,"/subject_",data_set,".txt", sep="")
    data3 <- read.table(fname, header=FALSE)
    names(data3)[names(data3)=="V1"] <- "Subject_Id"

    # combine measures + activites + subjects
    system.time(data1 <- cbind(data2, data3, data1))
    rm(data2) # free up memory
    rm(data3)  # free up memory

    return(data1)
}

# load and combine data sets
test_data <- load_data("test")
train_data <- load_data("train")
tidy_data <- rbind(test_data, train_data)
rm(test_data)
rm(train_data)

# apply descriptive names
names(tidy_data)[names(tidy_data)=="V1"] <- "tBodyAcc_mean_X"
names(tidy_data)[names(tidy_data)=="V2"] <- "tBodyAcc_mean_Y"
names(tidy_data)[names(tidy_data)=="V3"] <- "tBodyAcc_mean_Z"
names(tidy_data)[names(tidy_data)=="V4"] <- "tBodyAcc_std_X"
names(tidy_data)[names(tidy_data)=="V5"] <- "tBodyAcc_std_Y"
names(tidy_data)[names(tidy_data)=="V6"] <- "tBodyAcc_std_Z"
names(tidy_data)[names(tidy_data)=="V41"] <- "tGravityAcc_mean_X"
names(tidy_data)[names(tidy_data)=="V42"] <- "tGravityAcc_mean_Y"
names(tidy_data)[names(tidy_data)=="V43"] <- "tGravityAcc_mean_Z"
names(tidy_data)[names(tidy_data)=="V44"] <- "tGravityAcc_std_X"
names(tidy_data)[names(tidy_data)=="V45"] <- "tGravityAcc_std_Y"
names(tidy_data)[names(tidy_data)=="V46"] <- "tGravityAcc_std_Z"
names(tidy_data)[names(tidy_data)=="V81"] <- "tBodyAccJerk_mean_X"
names(tidy_data)[names(tidy_data)=="V82"] <- "tBodyAccJerk_mean_Y"
names(tidy_data)[names(tidy_data)=="V83"] <- "tBodyAccJerk_mean_Z"
names(tidy_data)[names(tidy_data)=="V84"] <- "tBodyAccJerk_std_X"
names(tidy_data)[names(tidy_data)=="V85"] <- "tBodyAccJerk_std_Y"
names(tidy_data)[names(tidy_data)=="V86"] <- "tBodyAccJerk_std_Z"
names(tidy_data)[names(tidy_data)=="V121"] <- "tBodyGyro_mean_X"
names(tidy_data)[names(tidy_data)=="V122"] <- "tBodyGyro_mean_Y"
names(tidy_data)[names(tidy_data)=="V123"] <- "tBodyGyro_mean_Z"
names(tidy_data)[names(tidy_data)=="V124"] <- "tBodyGyro_std_X"
names(tidy_data)[names(tidy_data)=="V125"] <- "tBodyGyro_std_Y"
names(tidy_data)[names(tidy_data)=="V126"] <- "tBodyGyro_std_Z"
names(tidy_data)[names(tidy_data)=="V161"] <- "tBodyGyroJerk_mean_X"
names(tidy_data)[names(tidy_data)=="V162"] <- "tBodyGyroJerk_mean_Y"
names(tidy_data)[names(tidy_data)=="V163"] <- "tBodyGyroJerk_mean_Z"
names(tidy_data)[names(tidy_data)=="V164"] <- "tBodyGyroJerk_std_X"
names(tidy_data)[names(tidy_data)=="V165"] <- "tBodyGyroJerk_std_Y"
names(tidy_data)[names(tidy_data)=="V166"] <- "tBodyGyroJerk_std_Z"
names(tidy_data)[names(tidy_data)=="V201"] <- "tBodyAccMag_mean"
names(tidy_data)[names(tidy_data)=="V202"] <- "tBodyAccMag_std"
names(tidy_data)[names(tidy_data)=="V214"] <- "tGravityAccMag_mean"
names(tidy_data)[names(tidy_data)=="V215"] <- "tGravityAccMag_std"
names(tidy_data)[names(tidy_data)=="V227"] <- "tBodyAccJerkMag_mean"
names(tidy_data)[names(tidy_data)=="V228"] <- "tBodyAccJerkMag_std"
names(tidy_data)[names(tidy_data)=="V240"] <- "tBodyGyroMag_mean"
names(tidy_data)[names(tidy_data)=="V241"] <- "tBodyGyroMag_std"
names(tidy_data)[names(tidy_data)=="V253"] <- "tBodyGyroJerkMag_mean"
names(tidy_data)[names(tidy_data)=="V254"] <- "tBodyGyroJerkMag_std"
names(tidy_data)[names(tidy_data)=="V266"] <- "fBodyAcc_mean_X"
names(tidy_data)[names(tidy_data)=="V267"] <- "fBodyAcc_mean_Y"
names(tidy_data)[names(tidy_data)=="V268"] <- "fBodyAcc_mean_Z"
names(tidy_data)[names(tidy_data)=="V269"] <- "fBodyAcc_std_X"
names(tidy_data)[names(tidy_data)=="V270"] <- "fBodyAcc_std_Y"
names(tidy_data)[names(tidy_data)=="V271"] <- "fBodyAcc_std_Z"
names(tidy_data)[names(tidy_data)=="V294"] <- "fBodyAcc_meanFreq_X"
names(tidy_data)[names(tidy_data)=="V295"] <- "fBodyAcc_meanFreq_Y"
names(tidy_data)[names(tidy_data)=="V296"] <- "fBodyAcc_meanFreq_Z"
names(tidy_data)[names(tidy_data)=="V345"] <- "fBodyAccJerk_mean_X"
names(tidy_data)[names(tidy_data)=="V346"] <- "fBodyAccJerk_mean_Y"
names(tidy_data)[names(tidy_data)=="V347"] <- "fBodyAccJerk_mean_Z"
names(tidy_data)[names(tidy_data)=="V348"] <- "fBodyAccJerk_std_X"
names(tidy_data)[names(tidy_data)=="V349"] <- "fBodyAccJerk_std_Y"
names(tidy_data)[names(tidy_data)=="V350"] <- "fBodyAccJerk_std_Z"
names(tidy_data)[names(tidy_data)=="V373"] <- "fBodyAccJerk_meanFreq_X"
names(tidy_data)[names(tidy_data)=="V374"] <- "fBodyAccJerk_meanFreq_Y"
names(tidy_data)[names(tidy_data)=="V375"] <- "fBodyAccJerk_meanFreq_Z"
names(tidy_data)[names(tidy_data)=="V424"] <- "fBodyGyro_mean_X"
names(tidy_data)[names(tidy_data)=="V425"] <- "fBodyGyro_mean_Y"
names(tidy_data)[names(tidy_data)=="V426"] <- "fBodyGyro_mean_Z"
names(tidy_data)[names(tidy_data)=="V427"] <- "fBodyGyro_std_X"
names(tidy_data)[names(tidy_data)=="V428"] <- "fBodyGyro_std_Y"
names(tidy_data)[names(tidy_data)=="V429"] <- "fBodyGyro_std_Z"
names(tidy_data)[names(tidy_data)=="V452"] <- "fBodyGyro_meanFreq_X"
names(tidy_data)[names(tidy_data)=="V453"] <- "fBodyGyro_meanFreq_Y"
names(tidy_data)[names(tidy_data)=="V454"] <- "fBodyGyro_meanFreq_Z"
names(tidy_data)[names(tidy_data)=="V503"] <- "fBodyAccMag_mean"
names(tidy_data)[names(tidy_data)=="V504"] <- "fBodyAccMag_std"
names(tidy_data)[names(tidy_data)=="V513"] <- "fBodyAccMag_meanFreq"
names(tidy_data)[names(tidy_data)=="V516"] <- "fBodyBodyAccJerkMag_mean"
names(tidy_data)[names(tidy_data)=="V517"] <- "fBodyBodyAccJerkMag_std"
names(tidy_data)[names(tidy_data)=="V526"] <- "fBodyBodyAccJerkMag_meanFreq"
names(tidy_data)[names(tidy_data)=="V529"] <- "fBodyBodyGyroMag_mean"
names(tidy_data)[names(tidy_data)=="V530"] <- "fBodyBodyGyroMag_std"
names(tidy_data)[names(tidy_data)=="V542"] <- "fBodyBodyGyroJerkMag_mean"
names(tidy_data)[names(tidy_data)=="V543"] <- "fBodyBodyGyroJerkMag_std"
names(tidy_data)[names(tidy_data)=="V552"] <- "fBodyBodyGyroJerkMag_meanFreq"
names(tidy_data)[names(tidy_data)=="V556"] <- "angle_tBodyAccJerkMean_gravityMean"
names(tidy_data)[names(tidy_data)=="V557"] <- "angle_tBodyGyroMean_gravityMean"
names(tidy_data)[names(tidy_data)=="V558"] <- "angle_tBodyGyroJerkMean_gravityMean"
names(tidy_data)[names(tidy_data)=="V559"] <- "angle_X_gravityMean"
names(tidy_data)[names(tidy_data)=="V560"] <- "angle_Y_gravityMean"
names(tidy_data)[names(tidy_data)=="V561"] <- "angle_Z_gravityMean"

# load activity labels and merged with loaded data
activity_data <- read.csv("activity_labels.txt", header = FALSE, sep = " ")
names(activity_data)[names(activity_data)=="V1"] <- "Activity_Id"
names(activity_data)[names(activity_data)=="V2"] <- "Activity_Name"
tidy_data = merge(activity_data, tidy_data, by.x="Activity_Id", by.y="Activity_Id")

library(plyr)
tidy_data <- ddply(tidy_data, .(Activity_Name, Subject_Id), summarise,
      tBodyAcc_mean_X = mean(tBodyAcc_mean_X),
      tBodyAcc_mean_Y = mean(tBodyAcc_mean_Y),
      tBodyAcc_mean_Z = mean(tBodyAcc_mean_Z),
      tBodyAcc_std_X = mean(tBodyAcc_std_X),
      tBodyAcc_std_Y = mean(tBodyAcc_std_Y),
      tBodyAcc_std_Z = mean(tBodyAcc_std_Z),
      tGravityAcc_mean_X = mean(tGravityAcc_mean_X),
      tGravityAcc_mean_Y = mean(tGravityAcc_mean_Y),
      tGravityAcc_mean_Z = mean(tGravityAcc_mean_Z),
      tGravityAcc_std_X = mean(tGravityAcc_std_X),
      tGravityAcc_std_Y = mean(tGravityAcc_std_Y),
      tGravityAcc_std_Z = mean(tGravityAcc_std_Z),
      tBodyAccJerk_mean_X = mean(tBodyAccJerk_mean_X),
      tBodyAccJerk_mean_Y = mean(tBodyAccJerk_mean_Y),
      tBodyAccJerk_mean_Z = mean(tBodyAccJerk_mean_Z),
      tBodyAccJerk_std_X = mean(tBodyAccJerk_std_X),
      tBodyAccJerk_std_Y = mean(tBodyAccJerk_std_Y),
      tBodyAccJerk_std_Z = mean(tBodyAccJerk_std_Z),
      tBodyGyro_mean_X = mean(tBodyGyro_mean_X),
      tBodyGyro_mean_Y = mean(tBodyGyro_mean_Y),
      tBodyGyro_mean_Z = mean(tBodyGyro_mean_Z),
      tBodyGyro_std_X = mean(tBodyGyro_std_X),
      tBodyGyro_std_Y = mean(tBodyGyro_std_Y),
      tBodyGyro_std_Z = mean(tBodyGyro_std_Z),
      fBodyGyro_meanFreq_X = mean(fBodyGyro_meanFreq_X),
      fBodyGyro_meanFreq_Y = mean(fBodyGyro_meanFreq_Y),
      fBodyGyro_meanFreq_Z = mean(fBodyGyro_meanFreq_Z),
      tBodyGyroJerk_mean_X = mean(tBodyGyroJerk_mean_X),
      tBodyGyroJerk_mean_Y = mean(tBodyGyroJerk_mean_Y),
      tBodyGyroJerk_mean_Z = mean(tBodyGyroJerk_mean_Z),
      tBodyGyroJerk_std_X = mean(tBodyGyroJerk_std_X),
      tBodyGyroJerk_std_Y = mean(tBodyGyroJerk_std_Y),
      tBodyGyroJerk_std_Z = mean(tBodyGyroJerk_std_Z),
      tBodyAccMag_mean = mean(tBodyAccMag_mean),
      tBodyAccMag_std = mean(tBodyAccMag_std),
      fBodyAccMag_meanFreq = mean(fBodyAccMag_meanFreq),
      tGravityAccMag_mean = mean(tGravityAccMag_mean),
      tGravityAccMag_std = mean(tGravityAccMag_std),
      tBodyAccJerkMag_mean = mean(tBodyAccJerkMag_mean),
      tBodyAccJerkMag_std = mean(tBodyAccJerkMag_std),
      fBodyBodyAccJerkMag_meanFreq = mean(fBodyBodyAccJerkMag_meanFreq),
      tBodyGyroMag_mean = mean(tBodyGyroMag_mean),
      tBodyGyroMag_std = mean(tBodyGyroMag_std),
      tBodyGyroJerkMag_mean = mean(tBodyGyroJerkMag_mean),
      tBodyGyroJerkMag_std = mean(tBodyGyroJerkMag_std),
      fBodyAcc_mean_X = mean(fBodyAcc_mean_X),
      fBodyAcc_mean_Y = mean(fBodyAcc_mean_Y),
      fBodyAcc_mean_Z = mean(fBodyAcc_mean_Z),
      fBodyAcc_std_X = mean(fBodyAcc_std_X),
      fBodyAcc_std_Y = mean(fBodyAcc_std_Y),
      fBodyAcc_std_Z = mean(fBodyAcc_std_Z),
      fBodyAcc_meanFreq_X = mean(fBodyAcc_meanFreq_X),
      fBodyAcc_meanFreq_Y = mean(fBodyAcc_meanFreq_Y),
      fBodyAcc_meanFreq_Z = mean(fBodyAcc_meanFreq_Z),
      fBodyAccJerk_mean_X = mean(fBodyAccJerk_mean_X),
      fBodyAccJerk_mean_Y = mean(fBodyAccJerk_mean_Y),
      fBodyAccJerk_mean_Z = mean(fBodyAccJerk_mean_Z),
      fBodyAccJerk_std_X = mean(fBodyAccJerk_std_X),
      fBodyAccJerk_std_Y = mean(fBodyAccJerk_std_Y),
      fBodyAccJerk_std_Z = mean(fBodyAccJerk_std_Z),
      fBodyAccJerk_meanFreq_X = mean(fBodyAccJerk_meanFreq_X),
      fBodyAccJerk_meanFreq_Y = mean(fBodyAccJerk_meanFreq_Y),
      fBodyAccJerk_meanFreq_Z = mean(fBodyAccJerk_meanFreq_Z),
      fBodyGyro_mean_X = mean(fBodyGyro_mean_X),
      fBodyGyro_mean_Y = mean(fBodyGyro_mean_Y),
      fBodyGyro_mean_Z = mean(fBodyGyro_mean_Z),
      fBodyGyro_std_X = mean(fBodyGyro_std_X),
      fBodyGyro_std_Y = mean(fBodyGyro_std_Y),
      fBodyGyro_std_Z = mean(fBodyGyro_std_Z),
      fBodyAccMag_mean = mean(fBodyAccMag_mean),
      fBodyAccMag_std = mean(fBodyAccMag_std),
      fBodyBodyAccJerkMag_mean = mean(fBodyBodyAccJerkMag_mean),
      fBodyBodyAccJerkMag_std = mean(fBodyBodyAccJerkMag_std),
      fBodyBodyGyroMag_mean = mean(fBodyBodyGyroMag_mean),
      fBodyBodyGyroMag_std = mean(fBodyBodyGyroMag_std),
      fBodyBodyGyroJerkMag_mean = mean(fBodyBodyGyroJerkMag_mean),
      fBodyBodyGyroJerkMag_std = mean(fBodyBodyGyroJerkMag_std),
      fBodyBodyGyroJerkMag_meanFreq =  mean(fBodyBodyGyroJerkMag_meanFreq),
      angle_tBodyAccJerkMean_gravityMean = mean(angle_tBodyAccJerkMean_gravityMean),
      angle_tBodyGyroMean_gravityMean = mean(angle_tBodyGyroMean_gravityMean),
      angle_tBodyGyroJerkMean_gravityMean = mean(angle_tBodyGyroJerkMean_gravityMean),
      angle_X_gravityMean = mean(angle_X_gravityMean),
      angle_Y_gravityMean = mean(angle_Y_gravityMean),
      angle_Z_gravityMean = mean(angle_Z_gravityMean))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
