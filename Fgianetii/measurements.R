library(xlsx)

### Table for Farlowella gianetii

### Measurements as ratios of SL or SL respectively
dataset <- read.csv(file = "Farlowella data.csv", header = TRUE, dec = ".", stringsAsFactors = FALSE)
dataset <- dataset[dataset$Species == "Farlowella gianetii", ]
corrected <- dataset[, c(5:18)]/dataset[, "SL"]
corrected <- cbind(corrected, dataset[, c(19:22)]/dataset[, "HL"])
corrected <- cbind(CollNum = dataset$CollNum, SL = dataset$SL, corrected)

### Retzer & Page's ratio variables
ratios <- cbind(SnoutMouthL_PecL = dataset$SnoutMouthL/dataset$PecspineL,
                SnoutMouthL_HL = dataset$SnoutMouthL/dataset$HL,
                HL_SnoutMouthL= dataset$HL/dataset$SnoutMouthL,
                BodyDp_PelvicL = dataset$BodyDpDor/dataset$PelspineL,
                PecL_SnoutMouthL = dataset$PecspineL/dataset$SnoutMouthL,
                SnoutMouthL_InterorbitalW = dataset$SnoutMouthL/dataset$InterorbitalW,
                BodyW_SnoutMouthL = dataset$BodyWDor/dataset$SnoutMouthL)

### Append ratios to corrected values
corrected <- cbind(corrected, ratios)

### Construction of summaries
corrected <- corrected[, -1] # remove 'Lot' column for table construction
Stats <- rbind(round(apply(corrected, 2, FUN = mean, na.rm = TRUE), 3),
               round(apply(corrected, 2, FUN = sd, na.rm = TRUE), 3),
               round(apply(corrected, 2, FUN = min, na.rm = TRUE), 3),
               round(apply(corrected, 2, FUN = max, na.rm = TRUE), 3))
Stats <- t(Stats)
Stats <- data.frame(Stats, paste(Stats[, 3], Stats[, 4], sep = " - "))
Stats <- Stats[, -c(3, 4)]
Stats <- cbind(rownames(Stats), Stats)
# In this case the second entry in the dataset corresponds to measurements of the holotype. Change accordingly for other cases.
Stats <- cbind(Stats[, 1], unname(t(corrected[2 ,])), Stats[, 2:4])
colnames(Stats) <- c("Measurement", "Holotype", "Mean", "SD", "Range")
rownames(Stats) <- NULL

### Write table to xls file
write.xlsx(Stats, "Table 1 gianetii.xls", col.names = TRUE, row.names = FALSE,
           showNA = TRUE)


### Table for Farlowella jauruensis

### Measurements as ratios of SL or SL respectively
dataset <- read.csv(file = "Farlowella data.csv", header = TRUE, dec = ".", stringsAsFactors = FALSE)
dataset <- dataset[dataset$Species == "Farlowella jauruensis", ]
corrected <- dataset[, c(5:18)]/dataset[, "SL"]
corrected <- cbind(corrected, dataset[, c(19:22)]/dataset[, "HL"])
corrected <- cbind(CollNum = dataset$CollNum, SL = dataset$SL, corrected)

### Retzer & Page's ratio variables
ratios <- cbind(SnoutMouthL_PecL = dataset$SnoutMouthL/dataset$PecspineL,
                SnoutMouthL_HL = dataset$SnoutMouthL/dataset$HL,
                HL_SnoutMouthL= dataset$HL/dataset$SnoutMouthL,
                BodyDp_PelvicL = dataset$BodyDpDor/dataset$PelspineL,
                PecL_SnoutMouthL = dataset$PecspineL/dataset$SnoutMouthL,
                SnoutMouthL_InterorbitalW = dataset$SnoutMouthL/dataset$InterorbitalW,
                BodyW_SnoutMouthL = dataset$BodyWDor/dataset$SnoutMouthL)

### Append ratios to corrected values
corrected <- cbind(corrected, ratios)

### Construction of summaries
corrected <- corrected[, -1] # remove 'Lot' column for table construction
Stats <- rbind(round(apply(corrected, 2, FUN = mean, na.rm = TRUE), 3),
               round(apply(corrected, 2, FUN = sd, na.rm = TRUE), 3),
               round(apply(corrected, 2, FUN = min, na.rm = TRUE), 3),
               round(apply(corrected, 2, FUN = max, na.rm = TRUE), 3))
Stats <- t(Stats)
Stats <- data.frame(Stats, paste(Stats[, 3], Stats[, 4], sep = " - "))
Stats <- Stats[, -c(3, 4)]
Stats <- cbind(rownames(Stats), Stats)
colnames(Stats) <- c("Measurement", "Mean", "SD", "Range")
rownames(Stats) <- NULL

### Write table to xls file
write.xlsx(Stats, "Table 1 jauruensis.xls", col.names = TRUE, row.names = FALSE,
           showNA = TRUE)
