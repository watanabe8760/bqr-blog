library(tidyverse)

# store.csv
#   - remove \n from store_address
#   - double quote character columns
stores <-
  read_csv("csv/stores.csv", col_types = "icccc") %>%
  mutate(store_address = str_replace_all(store_address, "\n", " "))

data.table::fwrite(stores, "csv/store_mod.csv", quote = T)


# sales.csv
#   - double quote character columns
sales <- read_csv("csv/sales.csv",
               col_types = "Tliiciciciciiccid")

data.table::fwrite(sales, "csv/sales_mod.csv",
                   quote = T, dateTimeAs = "ISO")
