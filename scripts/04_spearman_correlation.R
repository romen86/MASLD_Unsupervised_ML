## Spearman correlation analysis
cor_mat <- cor(df_scaled, method = "spearman")

write.csv(
  cor_mat,
  "Spearman_Correlation_Matrix_AllVariables.csv"
)

png("Figure_1_Spearman_Correlation_Heatmap.png",
    width = 3500, height = 3000, res = 400)

pheatmap(
  cor_mat,
  color = colorRampPalette(c("steelblue", "white", "purple"))(100),
  clustering_distance_rows = "euclidean",
  clustering_distance_cols = "euclidean",
  border_color = NA
)

dev.off()