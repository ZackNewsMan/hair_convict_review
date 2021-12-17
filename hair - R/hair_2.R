library(tidyverse)
hair <- hair_innocence_proj

# To group by the type of offenses people were convicted for: 

hair %>% 
  group_by(offense_cleaned) %>% 
  summarize(count = n())

  # Above worked. 33 people convicted of murder, and 15 of sex assault, are having their cases reviewed. 
      # R can be annoying. You have to have the exact format of summarize(count = n()) in order for the software to count. 
  # Now to rename and export:

convicted_charge <- hair %>% 
  group_by(offense_cleaned) %>% 
  summarize(count = n())

convicted_charge %>% write_csv("convicted_charge.csv", na = "")

# Now for agency: 

hair %>% 
  group_by(agency_first) %>% 
  summarize(count = n())

agency_first_count <- hair %>% 
  group_by(agency_first) %>% 
  summarize(count = n()) %>% 
  View()

  # This worked. Denver PD has the most number of cases under review, 15. 

hair %>% 
  group_by(agency_second) %>% 
  summarize(count = n())

agency_second_count <- hair %>% 
  group_by(agency_second) %>% 
  summarize(count = n())

  # Will export and add this two together. Only a handful needed to be added. 

agency_first_count %>% write_csv("agency_first_count.csv", na = "")
agency_second_count %>% write_csv("agency_second_count.csv", na = "")

  # Multiple agencies can be involved in a case or a conviction. Was curious about the police work of what agency will be called into question.



