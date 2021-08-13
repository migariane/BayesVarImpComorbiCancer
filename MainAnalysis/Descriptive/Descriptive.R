# Tools to produce Table One
library(devtools)
#install_github("isubirana/compareGroups")
#install.packages('forecast', dependencies = TRUE)
library(forecast)
library(compareGroups)

###################
# CRC
###################
data <- read.csv("../CRC/NoBMI/NoSmoking/All - Obsolete/CRC.csv", header = TRUE, stringsAsFactors=FALSE)

## Recoding vital status
data$Vital_status <- as.character(data$status)
data$Vital_status[data$status == "1"] <- "Dead"
data$Vital_status[data$status == "0"] <- "Alive"
data$Vital_status <- factor(data$Vital_status)

## Recoding sex
data$Sex <- as.character(data$sex)
data$Sex[data$sex == "1"] <- "Male"
data$Sex[data$sex == "2"] <- "Female"
data$Sex <- factor(data$Sex)

## Recoding stage
data$Stage <- as.character(data$stage)
data$Stage[data$stage == "1"] <- "I-III"
data$Stage[data$stage == "2"] <- "I-III"
data$Stage[data$stage == "3"] <- "I-III"
data$Stage[data$stage == "4"] <- "IV"
data$Stage[is.na(data$stage)] <- "Missing"
data$Stage <- factor(data$Stage)
table(data$Stage)

## Recoding Comorbidities
data$infarct <- as.character(data$infarct)
data$Infarct <- as.character(data$infarct)
data$Infarct[data$infarct == "1"] <- "Yes"
data$Infarct[data$infarct == "2"] <- "No"
data$Infarct <- factor(data$Infarct)

data$dementia <- as.character(data$dementia)
data$dementia[data$dementia == "1"] <- "Yes"
data$dementia[data$dementia == "2"] <- "No"
data$dementia <- factor(data$dementia)

data$heart_failure <- as.character(data$heart_failure)
data$heart_failure[data$heart_failure == "1"] <- "Yes"
data$heart_failure[data$heart_failure == "2"] <- "No"
data$heart_failure <- factor(data$heart_failure)

data$vascular_disease <- as.character(data$vascular_disease)
data$vascular_disease[data$vascular_disease == "1"] <- "Yes"
data$vascular_disease[data$vascular_disease == "2"] <- "No"
data$vascular_disease <- factor(data$vascular_disease)

data$cerebro_disease <- as.character(data$cerebro_disease)
data$cerebro_disease[data$cerebro_disease == "1"] <- "Yes"
data$cerebro_disease[data$cerebro_disease == "2"] <- "No"
data$cerebro_disease <- factor(data$cerebro_disease)

data$pulmonary_disease <- as.character(data$pulmonary_disease)
data$pulmonary_disease[data$pulmonary_disease == "1"] <- "Yes"
data$pulmonary_disease[data$pulmonary_disease == "2"] <- "No"
data$pulmonary_disease <- factor(data$pulmonary_disease)

data$connective_disease <- as.character(data$connective_disease)
data$connective_disease[data$connective_disease == "1"] <- "Yes"
data$connective_disease[data$connective_disease == "2"] <- "No"
data$connective_disease <- factor(data$connective_disease)

data$diabetes <- as.character(data$diabetes)
data$diabetes[data$diabetes == "1"] <- "Yes"
data$diabetes[data$diabetes == "2"] <- "No"
data$diabetes <- factor(data$diabetes)

data$renal_disease <- as.character(data$renal_disease)
data$renal_disease[data$renal_disease == "1"] <- "Yes"
data$renal_disease[data$renal_disease == "2"] <- "No"
data$renal_disease <- factor(data$renal_disease)

data$hemiplegia <- as.character(data$hemiplegia)
data$hemiplegia[data$liver_grouped == "1"] <- "Yes"
data$hemiplegia[data$liver_grouped == "2"] <- "No"
data$hemiplegia <- factor(data$hemiplegia)

data$liver <- as.character(data$liver)
data$liver[data$liver == "1"] <- "Yes"
data$liver[data$liver == "2"] <- "No"
data$liver <- factor(data$liver)

Table <- compareGroups(Vital_status ~ age + Sex + Stage + dementia + infarct + heart_failure + vascular_disease + cerebro_disease +
                           pulmonary_disease + connective_disease + renal_disease + diabetes + liver, data = data)
TableOne <- createTable(Table, show.all = TRUE, show.p.overall = FALSE); TableOne

Table_One <- strataTable(TableOne, "Stage");Table_One
export2latex(Table_One, file='Table1.tex')

###################
# LUNG
###################

rm(list=ls())
data <- read.csv("../Lung/Smoking - All - Obsolete/lung.csv", header = TRUE, stringsAsFactors=FALSE)

## Recoding vital status
data$Vital_status <- as.character(data$status)
data$Vital_status[data$status == "1"] <- "Dead"
data$Vital_status[data$status == "2"] <- "Alive"
data$Vital_status <- factor(data$Vital_status)

## Recoding sex
data$Sex <- data$gender
data$Sex <- as.character(data$Sex)
data$Sex[data$Sex == "1"] <- "Male"
data$Sex[data$Sex == "2"] <- "Female"
data$Sex <- factor(data$Sex)

## Recoding Metastasis
data$LocAdv <- as.character(data$LocAdv)
data$LocAdv[data$LocAdv == ""] <- "Missing"
data$Stage <- factor(data$LocAdv)

## Recoding Comorbidities
data$Infarct <- as.character(data$infarct)
data$Infarct[data$infarct == "1"] <- "Yes"
data$Infarct[data$infarct == "2"] <- "No"
data$Infarct <- factor(data$Infarct)

data$dementia <- as.character(data$dementia)
data$dementia[data$dementia == "1"] <- "Yes"
data$dementia[data$dementia == "2"] <- "No"
data$dementia <- factor(data$dementia)

data$heart_failure <- as.character(data$heart_failure)
data$heart_failure[data$heart_failure == "1"] <- "Yes"
data$heart_failure[data$heart_failure == "2"] <- "No"
data$heart_failure <- factor(data$heart_failure)

data$vascular_disease <- as.character(data$vascular_disease)
data$vascular_disease[data$vascular_disease == "1"] <- "Yes"
data$vascular_disease[data$vascular_disease == "2"] <- "No"
data$vascular_disease <- factor(data$vascular_disease)

data$cerebro_disease <- as.character(data$cerebro_disease)
data$cerebro_disease[data$cerebro_disease == "1"] <- "Yes"
data$cerebro_disease[data$cerebro_disease == "2"] <- "No"
data$cerebro_disease <- factor(data$cerebro_disease)

data$pulmonary_disease <- as.character(data$pulmonary_disease)
data$pulmonary_disease[data$pulmonary_disease == "1"] <- "Yes"
data$pulmonary_disease[data$pulmonary_disease == "2"] <- "No"
data$pulmonary_disease <- factor(data$pulmonary_disease)

data$connective_disease <- as.character(data$connective_disease)
data$connective_disease[data$connective_disease == "1"] <- "Yes"
data$connective_disease[data$connective_disease == "2"] <- "No"
data$connective_disease <- factor(data$connective_disease)

data$diabetes <- as.character(data$diabetes)
data$diabetes[data$diabetes == "1"] <- "Yes"
data$diabetes[data$diabetes == "2"] <- "No"
data$diabetes <- factor(data$diabetes)

data$renal_disease <- as.character(data$renal_disease)
data$renal_disease[data$renal_disease == "1"] <- "Yes"
data$renal_disease[data$renal_disease == "2"] <- "No"
data$renal_disease <- factor(data$renal_disease)

data$hemiplegia <- as.character(data$hemiplegia)
data$hemiplegia[data$liver_grouped == "1"] <- "Yes"
data$hemiplegia[data$liver_grouped == "2"] <- "No"
data$hemiplegia <- factor(data$hemiplegia)

data$liver_grouped <- as.character(data$liver_grouped)
data$liver_grouped[data$liver_grouped == "1"] <- "Yes"
data$liver_grouped[data$liver_grouped == "2"] <- "No"
data$liver_grouped <- factor(data$liver_grouped)

Table <- compareGroups(Vital_status ~ age + Sex + Stage + Infarct + dementia + heart_failure + vascular_disease + cerebro_disease +
                           pulmonary_disease + connective_disease + renal_disease + diabetes + liver_grouped, data = data)
TableOne <- createTable(Table, show.all = TRUE, show.p.overall = FALSE); TableOne

Table_One <- strataTable(TableOne, "LocAdv");Table_One
export2latex(Table_One, file='Table2.tex')
