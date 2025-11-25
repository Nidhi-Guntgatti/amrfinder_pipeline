# ================================
# STEP 2 — PLOTTING AMR RESULTS
# ================================

library(tibble)
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)
library(pheatmap)

# -------------------------------
# Load files
# -------------------------------
presence_abs <- read_tsv("AMR_class_presence_absence.tsv")
class_summary <- read_tsv("AMR_class_summary.tsv")
beta_lactams <- read_tsv("beta_lactam_subclasses_summary.tsv")

# ================================
# 1. BAR PLOT — AMR CLASS FREQUENCY
# ================================
png("AMR_class_distribution.png", width = 1600, height = 1000, res = 200)

ggplot(class_summary,
       aes(x = reorder(AMR_class, -No_of_isolates),
           y = No_of_isolates)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_bw() +
  labs(title = "Distribution of AMR Classes Across Isolates",
       x = "AMR Class", y = "Number of Isolates with AMR Genes") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

dev.off()

# ================================
# 2. HEATMAP — AMR PRESENCE/ABSENCE
# ================================
heatmap_data <- presence_abs %>%
  column_to_rownames("isolate") %>%
  as.matrix()

png("AMR_presence_absence_heatmap.png", width = 1800, height = 2000, res = 200)

pheatmap(heatmap_data,
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         color = colorRampPalette(c("white", "red"))(50),
         main = "Presence/Absence of AMR Classes Across Isolates")

dev.off()

# ================================
# 3. BETA-LACTAM SUBCLASSES PLOT
# ================================
png("beta_lactam_subclasses_distribution.png",
    width = 1600, height = 1000, res = 200)

ggplot(beta_lactams,
       aes(x = reorder(Type, -No_of_isolates),
           y = No_of_isolates)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  theme_bw() +
  labs(title = "Distribution of Beta-lactam Subclasses",
       x = "Subclass Type", y = "Number of Isolates") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

dev.off()
