## Data cleaning and preprocessing
str(data)

data$Sex <- as.factor(data$Sex)

df_numeric <- data %>%
  select(where(is.numeric)) %>%
  mutate(across(
    everything(),
    ~ ifelse(is.na(.), median(., na.rm = TRUE), .)
  ))
