library(tidyverse)
library(tibble)

#Load social csv files
social_2018 <- read.csv('/Users/Chase/Downloads/social_2018.csv')
social_2016 <- read.csv('/Users/Chase/Downloads/social_2016.csv') 
social_2014 <- read.csv('/Users/Chase/Downloads/social_2014.csv')

#Select only the desired columns to keep
social_2014 <- social_2014 %>%
  select( 'NAME',
'DP02_0002PE', 'DP02_0010PE', 'DP02_0057PE', 'DP02_0059PE', 'DP02_0060PE', 
'DP02_0061PE', 'DP02_0062PE', 'DP02_0063PE', 'DP02_0064PE', 'DP02_0065PE', 'DP02_0069PE', 
'DP02_0079PE', 'DP02_0080PE', 'DP02_0087PE', 'DP02_0092PE', 'DP02_0094PE', 'DP02_0095PE', 
'DP02_0112PE', 'DP02_0151PE')

#Change column names
social_2014 <- rename(social_2014, c("fam_household"="DP02_0002PE", "non_fam_household"="DP02_0010PE",
                      "college_enroll"="DP02_0057PE", 
                      "less_than_9th"="DP02_0059PE", "9th_to_12th_no_dp"="DP02_0060PE",
                      "hs_grad"="DP02_0061PE", "some_col_no_deg"="DP02_0062PE",
                      "associates"="DP02_0063PE", "bachelors"="DP02_0064PE",
                      "grad_degree"="DP02_0065PE", "vet_percent"="DP02_0069PE",
                      "same_house_1year"="DP02_0079PE", "diff_house_1year"="DP02_0080PE",
                      "native_born"="DP02_0087PE", "foreign_born"="DP02_0092PE",
                      "foreign_naturalized"="DP02_0094PE", "foreign_not_cit"="DP02_0095PE",
                      "home_lang_not_english" = "DP02_0112PE", "own_computer" = "DP02_0151PE"))

#Get rid of first row.  Do this for each dataset by changing social_2014 to _2016 and _2018.
social_2014 <- social_2014[-1,]
rownames(social_2014) <- 1:nrow(social_2014)

#Remove Puerto Rico, DC, and US total rows to only keep 435 US state congressional districts. These
#are located in different rows in different datasets.
social_2018 <- social_2018[-c(201, 257, 438),]
social_2016 <- social_2016[-c(136, 437, 438),]
social_2014 <- social_2014[-c(438, 437, 88),]

#Insert year column into second column position
social_2014 <- add_column(social_2014 , year = 2014, .after = 1)

#Stack datasets on top starting from 2018
social_total <- bind_rows(social_2018, social_2016, social_2014)

#Convert columns from character to numeric for all columns except name and year
columns <- colnames(social_total[3:21])  
social_total[columns] <- sapply(social_total[columns], as.numeric)

#Write final csv file
write.csv(social_total,'social_total.csv')