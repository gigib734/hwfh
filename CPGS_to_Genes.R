data <- read.csv(file.choose())
transcriptome1 <- data
library(dplyr)
library(tidyr)
transcriptome_long <- transcriptome1 %>%
  separate_rows(Annotated_genes, sep = ";") %>%
  filter(Annotated_genes !="")
gene_level <- transcriptome_long %>%
  mutate(weight = 1 / (SE^2)) %>%
  group_by(Annotated_genes) %>%
  summarise(
    Effect = sum(Effect_size * weight) / sum(weight),
    n_cpgs = n(),
    .groups = "drop"
  )
str(transcriptome1)
transcriptome1$Effect_size <- as.numeric(transcriptome1$Effect_size)
unique(transcriptome1$Effect_size)
transcriptome1$Effect_size <- gsub(",", ".", transcriptome1$Effect_size)   # fix commas
transcriptome1$Effect_size <- trimws(transcriptome1$Effect_size)           # remove spaces
transcriptome1$Effect_size <- as.numeric(transcriptome1$Effect_size)
summary(transcriptome1$Effect_size)
library(dplyr)

transcriptome1 <- transcriptome1 %>%
  filter(!is.na(Effect_size), !is.na(SE))
nrow(transcriptome1)
transcriptome3 <- transcriptome1 %>%
  separate_rows(Annotated_genes, sep = ";") %>%
  filter(Annotated_genes != "")

#hopefully grouping by gene?
gene_level <- transcriptome3 %>%
  mutate(weight = 1 / (SE^2)) %>%
  group_by(Annotated_genes) %>%
  summarise(
    Effect = sum(Effect_size * weight) / sum(weight),
    n_cpgs = n(),
    .groups = "drop"
  )
head(gene_level)

getwd()
write.csv(gene_level, "gene_level_methylation.csv", row.names = FALSE)
