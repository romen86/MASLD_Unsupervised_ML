## PCA-based cluster visualization
png("Figure_5_PCA_Clusters_AllVariables.png",
    width = 3800, height = 2800, res = 500)

fviz_cluster(
  km_res,
  data = df_scaled,
  ellipse.type = "norm",
  geom = "point",
  palette = "jco"
)

dev.off()