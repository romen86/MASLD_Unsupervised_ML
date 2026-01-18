## Cluster-wise descriptive statistics
cluster_stats <- data_clustered %>%
  pivot_longer(
    cols = where(is.numeric),
    names_to = "Variable",
    values_to = "Value"
  ) %>%
  group_by(Cluster, Variable) %>%
  summarise(
    Mean = mean(Value, na.rm = TRUE),
    SD = sd(Value, na.rm = TRUE),
    .groups = "drop"
  )

write.csv(
  cluster_stats,
  "Cluster_Descriptive_Statistics_Mean_SD.csv",
  row.names = FALSE
)