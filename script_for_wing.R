#Load tables into R
P_master <- read.csv("/Users/Kiwi/desktop/Contour_cohort/data/P_file.csv", sep=";") 
#this is the file with all patients
contour_cohort <- read.csv("/Users/Kiwi/desktop/Contour_cohort/data/contour_cohort.csv", sep=",")
#this is the file with your cohort. 
#I have removed the first two "header" rows you added - you have to keep a consistent table structure with columns and rows, otherwise R gets confused


#Example: If you want to filter out certain IDs from a column, you can use dplyr
library(dplyr)
help(dplyr)

Filtered_table <- P_master %>% filter(Shorter_ID %in% contour_cohort$Shorter_ID)
#here you filter the "Shorter_ID" column based on the "Shorter_ID" column in the second dataframe

#Second example
list_of_IDs <- c("12", "85", "23")
# say you are interested in these three variables - make a list of here

Filtered_table_II <- P_master %>% filter(Shorter_ID %in% list_of_IDs) 
# and select these patients based on "list_of_IDs"

Filtered_table_contour <- Filtered_table %>% select(NoID, age, sex, ethnicity, NSCLCstage, radiology_N_stage, radiology_T_stage, adjuvant_treatment_given, adjuvant_treatment_YN, Lesion1_site, histology_group, pT_stage, pN_stage, pathologyTNM, pathologyTNM_code, Lesion1_size_pathology, Recurrence_date_use, date_DFS_event, cens_dfs, dfs_time, date_OS, cens_os, os_time)
install.packages("gt")
install.packages("gtsummary")
library(gtsummary)
Filtered_table_III <- Filtered_table %>% select(NOID, age, sex, ethnicity, NSCLCstage, radiology_N_stage, radiology_T_stage, adjuvant_treatment_given, adjuvant_treatment_YN, Lesion1_site, histology_group, pT_stage, pN_stage, pathologyTNM, pathologyTNM_code, Lesion1_size_pathology, Recurrence_date_use, date_DFS_event, cens_dfs, dfs_time, date_OS, cens_os, os_time)
Filtered_table_contour_notrialno <-Filtered_table_contour %>% select(age, sex, ethnicity, NSCLCstage, radiology_N_stage, radiology_T_stage, adjuvant_treatment_given, adjuvant_treatment_YN, Lesion1_site, histology_group, pT_stage, pN_stage, pathologyTNM, pathologyTNM_code, Lesion1_size_pathology, cens_dfs, dfs_time, cens_os, os_time)
table1 <- tbl_summary(Filtered_table_contour_notrialno)
table1
