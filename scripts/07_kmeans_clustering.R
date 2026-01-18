## K-means clustering
set.seed(123)
k <- 3

km_res <- kmeans(df_scaled, centers = k, nstart = 50)

data_clustered <- data %>%
  mutate(Cluster = factor(km_res$cluster))

write.csv(
  data_clustered,
  "Clinical_Data_with_Clusters_AllVariables.csv",
  row.names = FALSE
)
