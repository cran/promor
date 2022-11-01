## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE--------------------------------------------------------------
#  vignette("intro_to_promor")

## ---- eval=FALSE--------------------------------------------------------------
#  vignette("promor_no_techreps")

## ----inputfiles---------------------------------------------------------------
# Load promor
library(promor)
# Let's load the expDesign.txt file
exp_design <- read.csv("https://raw.githubusercontent.com/caranathunge/promor_example_data/main/ed2.txt", sep = "\t")
# Take a peek inside the file
head(exp_design, n = 12)

## ----createdf, warning=FALSE--------------------------------------------------
#Create a raw_df object with default settings.
raw <- create_df(
prot_groups = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/pg2.txt",
exp_design = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/ed2.txt",
                 tech_reps = TRUE )
# We can quickly check how the data frame looks like
head(raw)

## ----corrplot, fig.align = 'center', fig.height = 7, warning = FALSE----------
# Let's first check the correlation between tech.replicates 1 and 2
corr_plot(raw, rep_1 = 1, rep_2 = 2, n_row = 3, n_col = 2, text_size = 12)


## ----corrplot1, fig.height = 7, warning = FALSE, fig.align = 'center'---------
# Correlation between tech.replicates 1 and 3.
corr_plot(raw, rep_1 = 1, rep_2 = 3, n_row = 3, n_col = 2, text_size = 12)

## ----avertechreps, warning = FALSE--------------------------------------------
raw_ave <- aver_techreps(raw)

# A quick check on the dimensions of the data frame show that the number of columns is reduced from 18 to 6 as we averaged the tech.replicates.
dim(raw_ave)

## ----filterbygroupna, warning = FALSE-----------------------------------------
#Filter out proteins with high levels of missing data in each condition
raw_filtered <- filterbygroup_na(raw_ave, set_na = 0.40)
# We can check the dimensions of the new data frame. Note that the number of rows has changed.
dim(raw_filtered)

## ----heatmapna1, warning = FALSE, results = 'hide', out.width='50%', fig.align = 'center'----
#Visualize missing data in a subset of proteins. 
heatmap_na(raw_filtered)

## ----heatmapna2, warning = FALSE, results = 'hide', out.width='50%', fig.align = 'center'----
#Visualize missing data in a subset of proteins. 
heatmap_na(raw_filtered, reorder_y = TRUE)

## ----heatmapna3, warning = FALSE, results = 'hide', out.width='50%', fig.align = 'center'----
#Visualize missing data in a subset of proteins. 
heatmap_na(raw_filtered, protein_range = 1:40)

## ----imputena, warning = FALSE, results='hide'--------------------------------
# Impute missing data with minProb method
imp_df_mp <- impute_na(raw_filtered)

#Alternatively, we can test a different imputation method.
imp_df_svd <- impute_na(raw_filtered, method = "SVD")


## ----imputeplotmp, warning = FALSE, results='hide', fig.align = 'center', dpi = 300----
# Visualize the imputed data with sample-wise density plots.
impute_plot(original = raw_filtered, imputed = imp_df_mp, global = FALSE, n_row = 3, n_col = 2)

## ----imputeplotrf, warning = FALSE, results='hide', fig.align = 'center', dpi = 300----
# Visualize the imputed data with a global density plot.
impute_plot(original = raw_filtered, imputed = imp_df_svd, global = FALSE, n_row = 3, n_col = 2)

## ----imputeplotglobal, fig.align='center', warning = FALSE, out.width='50%', results='hide'----
# Visualize the imputed data with a global density plot.
impute_plot(original = raw_filtered, imputed = imp_df_svd, global = TRUE)

## ----norm, warning = FALSE, results='hide'------------------------------------
norm_df <- normalize_data(imp_df_svd)

## ----normplot, warning = FALSE, results = 'hide', fig.align = 'center', out.width='60%'----
norm_plot(original = imp_df_svd, normalized = norm_df, type = "density")

## ----finddep, warning = FALSE, results = 'hide'-------------------------------
fit_df <- find_dep(norm_df)

## ----tophits, warning = FALSE, eval = FALSE, results = 'hide'-----------------
#  fit_df <- find_dep(norm_df, save_tophits = TRUE, n_top = 10)

## ----volcanoplot, warning = FALSE, results ='hide', fig.align = 'center', out.width='60%'----
volcano_plot(fit_df)

## ----heatmapde, warning = FALSE, results ='hide', fig.align = 'center'--------
heatmap_de(fit_df = fit_df, norm_df = norm_df)

