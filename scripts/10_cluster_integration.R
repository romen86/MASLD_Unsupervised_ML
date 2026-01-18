## Inferential statistics across clusters
kw_results <- data_clustered %>%
  pivot_longer(where(is.numeric),
               names_to = "Variable",
               values_to = "Value") %>%
  group_by(Variable) %>%
  kruskal_test(Value ~ Cluster)

effect_sizes <- data_clustered %>%
  pivot_longer(where(is.numeric),
               names_to = "Variable",
               values_to = "Value") %>%
  group_by(Variable) %>%
  kruskal_effsize(Value ~ Cluster)

final_stats <- left_join(kw_results, effect_sizes, by = "Variable")

write.csv(
  final_stats,
  "Cluster_KruskalWallis_EffectSize.csv",
  row.names = FALSE
)

dunn_results <- data_clustered %>%
  pivot_longer(where(is.numeric),
               names_to = "Variable",
               values_to = "Value") %>%
  group_by(Variable) %>%
  do(dunnTest(Value ~ Cluster, data = ., method = "bh")$res)

write.csv(
  dunn_results,
  "Cluster_Dunn_Posthoc_Results.csv",
  row.names = FALSE
)
