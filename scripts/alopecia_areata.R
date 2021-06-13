# 1.0 Importing Files ----

source("scripts/organize_ukbb.R")

feather_file <- file.path(data_path,"ukbb","ukb_df.feather")

ukbb_df <- arrow::read_feather(feather_file,col_select = c(col_vars$col_name,
                               matches(c("22009"))))

ukbb_aa <- arrow::read_feather(feather_file,
                               col_select = c("eid",
                               matches(c("131778")))) %>% 
  filter(!is.na(date_l63_first_reported_alopecia_areata_f131778_0_0)) %>% 
  full_join(icd10 %>% 
              filter(str_detect(code_icd10 , "^(L63[0-9])")) %>% 
              select("eid"))  



