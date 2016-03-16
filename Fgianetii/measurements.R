library(xlsx)

### Table for Farlowella gianetii

### Measurements as percentages of SL, HL, or ratio characters.
### Remove the *100 part of each line marked as # *100 for proportion results
### Please note that round(..., 1) should be changed to 3 for ratio data
dataset <- read.csv(file = "gianetiiJauruensis.csv", header = TRUE, dec = ".", stringsAsFactors = FALSE)
dataset <- dataset[dataset$Species == "Farlowella gianetii", ]
corrected <- dataset[, c(5:18)]/dataset[, "SL"]*100 # *100
corrected <- cbind(corrected, dataset[, c(19:22)]/dataset[, "HL"]*100) # *100
corrected <- cbind(CollNum = dataset$CollNum, SL = dataset$SL, corrected)

### Retzer & Page's ratio variables
ratios <- cbind(SnoutMouthL_PecL = dataset$SnoutMouthL/dataset$PecspineL*100, # *100
                SnoutMouthL_HL = dataset$SnoutMouthL/dataset$HL*100, # *100
                HL_SnoutMouthL= dataset$HL/dataset$SnoutMouthL*100, # *100
                BodyDp_PelvicL = dataset$BodyDpDor/dataset$PelspineL*100, # *100
                PecL_SnoutMouthL = dataset$PecspineL/dataset$SnoutMouthL*100, # *100
                SnoutMouthL_InterorbitalW = dataset$SnoutMouthL/dataset$InterorbitalW*100, # *100
                BodyW_SnoutMouthL = dataset$BodyWDor/dataset$SnoutMouthL*100) # *100

### Append ratios to corrected values
corrected <- cbind(corrected, ratios)

### Construction of summaries
corrected <- corrected[, -1] # remove 'Lot' column for table construction
Stats <- rbind(round(apply(corrected, 2, FUN = mean, na.rm = TRUE), 1),
               round(apply(corrected, 2, FUN = sd, na.rm = TRUE), 1),
               round(apply(corrected, 2, FUN = min, na.rm = TRUE), 1),
               round(apply(corrected, 2, FUN = max, na.rm = TRUE), 1))
Stats <- t(Stats)
Stats <- data.frame(Stats, paste(Stats[, 3], Stats[, 4], sep = " - "))
Stats <- Stats[, -c(3, 4)]
Stats <- cbind(rownames(Stats), Stats)
# In this case the second entry in the dataset corresponds to measurements of the holotype. Change accordingly for other cases.
Stats <- cbind(Stats[, 1], round(unname(t(corrected[2 ,])), 1), Stats[, 2:4])
colnames(Stats) <- c("Measurement", "Holotype", "Mean", "SD", "Range")
rownames(Stats) <- NULL
totalTable <- Stats


### Table for Farlowella jauruensis

### Measurements as ratios of SL or SL respectively
### Measurements as percentages of SL, HL, or ratio characters.
### Remove the *100 part of each line marked as # *100 for proportion results
### Please note that round(..., 1) should be changed to 3 for ratio data
dataset <- read.csv(file = "gianetiiJauruensis.csv", header = TRUE, dec = ".", stringsAsFactors = FALSE)
dataset <- dataset[dataset$Species == "Farlowella jauruensis", ]
corrected <- dataset[, c(5:18)]/dataset[, "SL"]*100 # *100
corrected <- cbind(corrected, dataset[, c(19:22)]/dataset[, "HL"]*100) # *100
corrected <- cbind(CollNum = dataset$CollNum, SL = dataset$SL, corrected)

### Retzer & Page's ratio variables
ratios <- cbind(SnoutMouthL_PecL = dataset$SnoutMouthL/dataset$PecspineL*100, # *100
                SnoutMouthL_HL = dataset$SnoutMouthL/dataset$HL*100, # *100
                HL_SnoutMouthL= dataset$HL/dataset$SnoutMouthL*100, # *100
                BodyDp_PelvicL = dataset$BodyDpDor/dataset$PelspineL*100, # *100
                PecL_SnoutMouthL = dataset$PecspineL/dataset$SnoutMouthL*100, # *100
                SnoutMouthL_InterorbitalW = dataset$SnoutMouthL/dataset$InterorbitalW*100, # *100
                BodyW_SnoutMouthL = dataset$BodyWDor/dataset$SnoutMouthL*100) # *100

### Append ratios to corrected values
corrected <- cbind(corrected, ratios)

### Construction of summaries
corrected <- corrected[, -1] # remove 'Lot' column for table construction
Stats <- rbind(round(apply(corrected, 2, FUN = mean, na.rm = TRUE), 1),
               round(apply(corrected, 2, FUN = sd, na.rm = TRUE), 1),
               round(apply(corrected, 2, FUN = min, na.rm = TRUE), 1),
               round(apply(corrected, 2, FUN = max, na.rm = TRUE), 1))
Stats <- t(Stats)
Stats <- data.frame(Stats, paste(Stats[, 3], Stats[, 4], sep = " - "))
Stats <- Stats[, -c(3, 4)]
Stats <- cbind(rownames(Stats), Stats)
colnames(Stats) <- c("Measurement", "Mean", "SD", "Range")
rownames(Stats) <- NULL

### Append both 'Stats' tables so that the first columns include information for Farlowella gianetii and the latter for Farlowella jauruensis
totalTable <- cbind(totalTable, Stats[, -1])

### Write table to xls file
write.xlsx(totalTable, "Table 1 percentages.xls", col.names = TRUE, row.names = FALSE,
           showNA = TRUE)
