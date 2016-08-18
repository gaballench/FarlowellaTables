library(xlsx)

#### Table for ration measurements

### Measurements as ratios of SL or SL respectively
dataset <- read.csv(file = "mitoupibo.csv", header = TRUE, dec = ".", stringsAsFactors = FALSE)
corrected <- dataset[, c(3:16)]/dataset[, "SL"]
corrected <- cbind(corrected, dataset[, c(17:20)]/dataset[, "HL"])
corrected <- cbind(Lot = dataset$Lot, SL = dataset$SL, corrected)

### Retzer & Page's ratio variables
ratios <- cbind(SnoutMouthL_PecL = dataset$SnoutMouthL/dataset$PecspineL,
                SnoutMouthL_HL = dataset$SnoutMouthL/dataset$HL,
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
write.xlsx(Stats, "Table 1 ratios.xls", col.names = TRUE, row.names = FALSE,
           showNA = TRUE)

#### Table for percentage measurements

### Measurements as ratios of SL or SL respectively
dataset <- read.csv(file = "mitoupibo.csv", header = TRUE, dec = ".", stringsAsFactors = FALSE)
corrected <- dataset[, c(3:16)]/dataset[, "SL"]*100 # the *100 part converts ratios to percentages
corrected <- cbind(corrected, dataset[, c(17:20)]/dataset[, "HL"]*100) # the *100 part converts ratios to percentages
corrected <- cbind(Lot = dataset$Lot, SL = dataset$SL, corrected)

### Retzer & Page's ratio variables, the *100 parts convert ratios to percentages
ratios <- cbind(SnoutMouthL_PecL = dataset$SnoutMouthL/dataset$PecspineL*100,
                SnoutMouthL_HL = dataset$SnoutMouthL/dataset$HL*100,
                BodyDp_PelvicL = dataset$BodyDpDor/dataset$PelspineL*100,
                PecL_SnoutMouthL = dataset$PecspineL/dataset$SnoutMouthL*100,
                SnoutMouthL_InterorbitalW = dataset$SnoutMouthL/dataset$InterorbitalW*100,
                BodyW_SnoutMouthL = dataset$BodyWDor/dataset$SnoutMouthL*100)

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
Stats <- cbind(Stats[, 1], round(unname(t(corrected[3, ])), 1), Stats[, -1])
colnames(Stats) <- c("Measurement", "Holotype", "Mean", "SD", "Range")
rownames(Stats) <- NULL

### Write table to xls file
write.xlsx(Stats, "Table 1 percentages.xls", col.names = TRUE, row.names = FALSE,
           showNA = TRUE)
