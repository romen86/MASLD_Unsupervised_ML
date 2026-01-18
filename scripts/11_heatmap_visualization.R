## Unsupervised heatmap with cluster annotation
rownames(df_scaled) <- paste0("Sample_", seq_len(nrow(df_scaled)))
rownames(data_clustered) <- rownames(df_scaled)

annotation_col <- data.frame(Cluster = data_clustered$Cluster)
rownames(annotation_col) <- rownames(df_scaled)

annotation_colors <- list(
  Cluster = c(
    Cluster_1 = "#E41A1C",
    Cluster_2 = "#377EB8",
    Cluster_3 = "#4DAF4A"
  )
)

ord <- order(data_clustered$Cluster)

df_scaled_ord <- df_scaled[ord, ]
annotation_col_ord <- annotation_col[ord, , drop = FALSE]
gaps_col <- cumsum(table(annotation_col_ord$Cluster))

png("Figure_6_Heatmap_UnSupervised_AllVariables.png",
    width = 4800, height = 3000, res = 400)

pheatmap(
  mat               = t(df_scaled_ord),
  annotation_col    = annotation_col_ord,
  annotation_colors = annotation_colors,
  show_colnames     = FALSE,
  show_rownames     = TRUE,
  clustering_method = "ward.D2",
  gaps_col          = gaps_col,
  color             = colorRampPalette(c("navy", "white", "firebrick3"))(100),
  border_color      = NA,
  main              = "Unsupervised heatmap of standardized clinical variables"
)

dev.off()

write.csv(
  data_clustered[ord, ],
  "Clinical_Data_with_Clusters_Ordered_For_Heatmap.csv",
  row.names = FALSE
)
