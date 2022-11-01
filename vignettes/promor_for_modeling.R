## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE--------------------------------------------------------------
#  vignette("intro_to_promor")

## ---- eval=FALSE--------------------------------------------------------------
#  vignette("promor_no_techreps")

## ---- eval=FALSE--------------------------------------------------------------
#  vignette("promor_with_techreps")

## ----preprocess, warning=FALSE, message=FALSE---------------------------------
# Load promor
library(promor)

#Create a model_df object with the top differentially expressed proteins.
covid_model_df <- pre_process(fit_df = covid_fit_df,
                        norm_df = covid_norm_df)

#Let's take a look at the first few rows of the model_df object
head(covid_model_df)

## ----featureplot, dpi = 300, out.width = '90%', fig.asp=2,  fig.align ='center', warning = FALSE, message = F----
#Box plots (default) to visualize feature variation
feature_plot(model_df = covid_model_df, 
             n_row = 4, 
             n_col = 2)

## ----featureplot_d, dpi = 300, out.width = '90%', fig.asp=2,  fig.align ='center', warning = FALSE, message = F----
#Alternatively, make density plots
feature_plot(model_df = covid_model_df, 
             type = "density",
             n_row = 4,
             n_col = 2)

## ----splitdata, warning = FALSE, message = F----------------------------------
#Create a split_df object by splitting data into training and test data set
covid_split_df <- split_data(model_df = covid_model_df)

## ----accesssplits, eval=FALSE, warning = FALSE, message = FALSE---------------
#  #You can access the items in the training data set as follows,
#  covid_split_df$training
#  #Similarly, access the test data set
#  covid_split_df$test

## ----traindata, warning = FALSE, message = F, eval = TRUE---------------------
#Create a model_list object by training models on the training data set using the default list of algorithms.
covid_model_list <- train_models(split_df = covid_split_df)

## ----customalgo, warning = FALSE, message = F, eval=FALSE---------------------
#  #Alternatively, you may use a custom list of algorithms.
#  covid_model_list <- train_models(split_df = covid_split_df,
#                                     algorithm_list = c("glm", "rf"))

## ----performplot, dpi = 300, out.width = '80%', fig.asp=1,  fig.align ='center', warning = FALSE, message = F----
#Box plots (default) to visualize model performance
performance_plot(model_list = covid_model_list)

## ----performplotd, dpi = 300, out.width = '80%', fig.asp=1,  fig.align ='center', warning = FALSE, message = F----
#Make dot plots
performance_plot(model_list = covid_model_list,
                 type = "dot")

## ----varimpl, dpi = 300, out.width = '80%', fig.asp=1,  fig.align ='center', warning = FALSE, message = F----
#Make lollipop plots (default)
varimp_plot(model_list = covid_model_list, 
            text_size = 7,
            n_row = 2,
            n_col = 2)

## ----varimpb, dpi = 300, out.width = '80%', fig.asp=1,  fig.align ='center', warning = FALSE, message = F----
#Make bar plots
varimp_plot(model_list = covid_model_list, 
            type = "bar",
            text_size = 7,
            n_row = 2,
            n_col = 2)

## ----testdata, warning = FALSE, message = F-----------------------------------
#First we run the function with type = "prob" to get a probability list
covid_prob_list <- test_models(model_list = covid_model_list, 
                               split_df = covid_split_df,
                               type = "prob" )

## ----testdatar, warning = FALSE, message = F, eval = FALSE--------------------
#  #We run the function with type = "raw" to get a prediction list and output a confusion matrix
#  covid_pred_list <- test_models(model_list = covid_model_list,
#                                 split_df = covid_split_df,
#                                 type = "raw",
#                                 save_confusionmatrix = TRUE)

## ----rocplot, dpi = 300, out.width = '80%', fig.asp=1,  fig.align ='center', warning = FALSE, message = F----
#Make bar plots
roc_plot(probability_list = covid_prob_list, 
         split_df = covid_split_df)

