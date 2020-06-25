library(tidyverse)
library(dplyr)
df <- read.csv('finaldata.csv')
df <- df %>%  
  mutate(., PctU20 = under_5 + X5_to_9 + X10_to_14 + X15_to_19) %>%
  mutate(., Pct20t45 = X20_to_24 + X25_to_34+ X35_to_44) %>%
  mutate(., Pct45t65 = X45_to_54 + X55_to_59 + X60_to_64) %>%
  mutate(., Pct65plus = X65_to_74 + X75_to_84 + X85_over) %>%
  mutate(., U25k = Less_than_10000 + x10000_to_14999 + x15000_to_24999) %>%
  mutate(., r25k_50k = x25000_to_34999 + x35000_to_49999) %>%
  mutate(., r50k_100k = x50000_to_74999 + x75000_to_99999) %>%
  mutate(., r100k_200k = x100000_to_149999 + x150000_to_199999) %>%
  mutate(., r200kplus = x200000_or_more) %>%
  mutate(., asianpac = asian_pct + pac_isl_pct) %>%
  mutate(., NoHighSchool = less_than_9th + x9th_to_12th_no_dp) %>%
  mutate(., HighSchoolEd = hs_grad) %>%
  mutate(., SomeCollege = some_col_no_deg + associates) %>%
  mutate(., BachelorsOrHigher = bachelors + grad_degree) %>%
  mutate(., ForeignNotCit = foreign_born * (foreign_not_cit/100)) %>%
  mutate(., ForeignCit = foreign_born * (foreign_naturalized/100))
write_csv(df, './cap_data_final2.csv')
