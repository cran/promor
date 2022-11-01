## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE--------------------------------------------------------------
#  vignette("intro_to_promor")

## ---- eval=FALSE--------------------------------------------------------------
#  vignette("promor_with_techreps")

## ----inputfiles---------------------------------------------------------------
# Load promor
library(promor)
# Let's load the expDesign.txt file
exp_design <- read.csv("https://raw.githubusercontent.com/caranathunge/promor_example_data/main/ed1.txt", sep = "\t")
# Take a peek inside the file
head(exp_design)

## ----createdf, warning=FALSE--------------------------------------------------
#Create a raw_df object with default settings.
raw <- create_df(
prot_groups = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/pg1.txt",
exp_design = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/ed1.txt")
# We can quickly check the dimensions of the data frame
dim(raw)

## ----filterbygroupna, warning = FALSE-----------------------------------------
#Filter out proteins with high levels of missing data in each condition
raw_filtered <- filterbygroup_na(raw, set_na = 0.4)
# We can check the dimensions of the new data frame. Note that the number of rows have changed.
dim(raw_filtered)

## ----heatmapna, warning = FALSE, results = 'hide', out.width= '60%', fig.align = 'center'----
#Visualize missing data in a subset of proteins. 
heatmap_na(raw_filtered, palette = "mako")

## ----heatmapna2, warning = FALSE, results = 'hide', out.width= '60%' , fig.align = 'center'----
# Order proteins by mean intensity.
heatmap_na(raw_filtered, reorder_y = TRUE, palette = "mako")

## ----heatmapna1, warning = FALSE, results = 'hide', out.width= '60%' , fig.align = 'center'----
#Visualize missing data in a subset of proteins. 
heatmap_na(raw_filtered, protein_range = 30:70, palette = "mako")

## ----imputena, warning = FALSE, results='hide'--------------------------------
# Impute missing data with minProb method
imp_df_mp <- impute_na(raw_filtered)

#Alternatively, we can test a different imputation method that allows for missing data of both MAR and MNAR types.
imp_df_knn <- impute_na(raw_filtered, method = "kNN")


## ----imputeplotmp, warning = FALSE, results='hide', fig.align = 'center', dpi = 300----
# Visualize the imputed data with sample-wise density plots.
impute_plot(original = raw_filtered, imputed = imp_df_mp, global = FALSE, n_row = 3, n_col = 3, palette = "mako")

## ----imputeplotrf, warning = FALSE, results='hide', fig.align = 'center', dpi = 300----
# Visualize the imputed data with sample-wise density plots.
impute_plot(original = raw_filtered, imputed = imp_df_knn, global = FALSE, n_row = 3, n_col = 3, palette = "mako")

## ----norm, warning = FALSE, results='hide'------------------------------------
norm_df <- normalize_data(imp_df_knn)

## ----normplot, warning = FALSE, results = 'hide', fig.align = 'center'--------
norm_plot(original = imp_df_knn, normalized = norm_df, palette = "mako")

## ----normplotd, warning = FALSE, results = 'hide', fig.align = 'center'-------
norm_plot(original = imp_df_knn, normalized = norm_df, type = "density", palette = "mako")

## ----finddep, warning = FALSE, results = 'hide'-------------------------------
fit_df <- find_dep(norm_df)

## ----tophits, warning = FALSE, eval = FALSE, results = 'hide'-----------------
#  fit_df <- find_dep(norm_df, save_tophits = TRUE, n_top = 10)

## ----volcanoplot, warning = FALSE, results ='hide', out.width = '70%', fig.align ='center'----
volcano_plot(fit_df, 
             text_size = 5,
             palette = "mako")

## ----heatmapde, warning = FALSE, results ='hide', fig.align = 'center'--------
heatmap_de(fit_df = fit_df, norm_df = norm_df, palette = "mako")

