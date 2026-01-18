## Principal Component Analysis
pca_res <- prcomp(df_scaled, center = TRUE, scale. = TRUE)

## Scree plot (Figure 2b)
png("Figure_2b_PCA_ScreePlot.png", width = 3000, height = 2200, res = 400)
fviz_eig(pca_res, addlabels = TRUE)
dev.off()

## PCA variable contributions (Figure 2a)
png("Figure_2a_PCA_Variable_Contributions.png",
    width = 3000, height = 2500, res = 400)

fviz_pca_var(
  pca_res,
  col.var = "contrib",
  gradient.cols = c("blue", "yellow", "red"),
  repel = TRUE
)

dev.off()

write.csv(
  pca_res$rotation,
  "PCA_Loadings_AllVariables.csv"
)