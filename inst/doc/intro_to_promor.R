## ---- echo = FALSE, out.width = "100%"----------------------------------------
knitr::include_graphics("../man/figures/promor_ProtAnalysisFlowChart_small.png")

## ----example, results = 'hide', warning=FALSE, eval = FALSE-------------------
#  # Load promor
#  library(promor)
#  
#  # Create a raw_df object with the files provided in this github account.
#  raw <- create_df(
#    prot_groups = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/pg1.txt",
#    exp_design = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/ed1.txt"
#  )
#  
#  # Filter out proteins with high levels of missing data in either condition/group
#  raw_filtered <- filterbygroup_na(raw)
#  
#  # Impute missing data and create an imp_df object.
#  imp_df <- impute_na(raw_filtered)
#  
#  # Normalize data and create a norm_df object
#  norm_df <- normalize_data(imp_df)
#  
#  # Perform differential expression analysis and create a fit_df object
#  fit_df <- find_dep(norm_df)

## ----volcanoplot, warning = FALSE,  dpi = 300, out.width = '70%', fig.align ='center', eval = FALSE----
#  volcano_plot(fit_df, text_size = 5)

## ---- echo = FALSE, out.width = "100%"----------------------------------------
knitr::include_graphics("../man/figures/promor_ProtModelingFlowChart_small.png")

## ----modeling_example, results = 'hide', warning = FALSE,message = F, eval = FALSE----
#  # First, let's make a model_df object of top differentially expressed proteins.
#  # We will be using example fit_df and norm_df objects provided with the package.
#  covid_model_df <- pre_process(
#    fit_df = covid_fit_df,
#    norm_df = covid_norm_df
#  )
#  # Next, we split the data into training and test data sets
#  covid_split_df <- split_data(model_df = covid_model_df)
#  
#  # Let's train our models using the default list of machine learning algorithms
#  covid_model_list <- train_models(split_df = covid_split_df)
#  
#  # We can now use our models to predict the test data
#  covid_prob_list <- test_models(
#    model_list = covid_model_list,
#    split_df = covid_split_df
#  )

## ----rocplot, warning = FALSE, dpi = 300, out.width = '90%', fig.align ='center', message = F, eval = FALSE----
#  
#  roc_plot(
#    probability_list = covid_prob_list,
#    split_df = covid_split_df
#  )

