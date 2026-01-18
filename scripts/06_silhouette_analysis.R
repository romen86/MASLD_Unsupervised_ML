## Silhouette analysis to determine optimal k
set.seed(123)

sil_width <- sapply(2:10, function(k){
  km <- kmeans(df_scaled, centers = k, nstart = 50)
  ss <- silhouette(km$cluster, dist(df_scaled))
  mean(ss[, 3])
})

sil_df <- data.frame(
  k = 2:10,
  avg_silhouette = sil_width
)

write.csv(
  sil_df,
  "Silhouette_Summary_k2_to_k10.csv",
  row.names = FALSE
)

sil_k2 <- sil_df$avg_silhouette[sil_df$k == 2]
sil_k3 <- sil_df$avg_silhouette[sil_df$k == 3]

png("Figure_2c_Silhouette_vs_k.png", width = 3000, height = 2000, res = 400)

ggplot(sil_df, aes(x = k, y = avg_silhouette)) +
  geom_line(color = "black", linewidth = 0.9) +
  geom_point(size = 3.5, shape = 21, fill = "white") +
  geom_vline(xintercept = 2, linetype = "dashed", color = "#D55E00") +
  geom_hline(yintercept = sil_k2, linetype = "dotted", color = "#D55E00") +
  geom_vline(xintercept = 3, linetype = "dashed", color = "#0072B2") +
  geom_hline(yintercept = sil_k3, linetype = "dotted", color = "#0072B2") +
  theme_classic()

dev.off()
