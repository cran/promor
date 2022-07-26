% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modelPlots.R
\name{roc_plot}
\alias{roc_plot}
\title{ROC plot}
\usage{
roc_plot(
  probability_list,
  split_df,
  ...,
  multiple_plots = TRUE,
  text_size = 10,
  palette = "viridis",
  save = FALSE,
  file_path = NULL,
  file_name = "ROC_plot",
  file_type = "pdf",
  plot_width = 7,
  plot_height = 7,
  dpi = 80
)
}
\arguments{
\item{probability_list}{A \code{probability_list} object from performing
\code{test_models} with \code{type = "prob"}.}

\item{split_df}{A \code{split_df} object from performing \code{split_data}}

\item{...}{Additional arguments to be passed on to
\code{\link[pROC:roc]{roc}}.}

\item{multiple_plots}{Logical. If \code{FALSE} plots all ROC curves
representing algorithms included in the \code{probability_list} in a single
plot.}

\item{text_size}{Text size for plot labels, axis labels etc. Default is
\code{10}.}

\item{palette}{Viridis color palette option for plots. Default is
\code{"viridis"}. See
\code{\link[viridis:viridis]{viridis}}
for available options.}

\item{save}{Logical. If \code{TRUE} saves a copy of the plot in the
directory provided in \code{file_path}.}

\item{file_path}{A string containing the directory path to save the file.}

\item{file_name}{File name to save the plot.
Default is \code{"ROC_plot."}}

\item{file_type}{File type to save the plot.
Default is \code{"pdf"}.}

\item{plot_width}{Width of the plot. Default is \code{7}.}

\item{plot_height}{Height of the plot. Default is \code{7}.}

\item{dpi}{Plot resolution. Default is \code{80}.}
}
\value{
A \code{ggplot2} object.
}
\description{
This function generates Receiver Operating Characteristic (ROC)
curves to evaluate models
}
\details{
\itemize{\item \code{roc_plot} first uses probabilities generated
during \code{test_models} to build a ROC object.
\item Next, relevant information is extracted from the ROC object to
plot the ROC curves.}
}
\examples{
\donttest{
## Create a model_df object
covid_model_df <- pre_process(covid_fit_df, covid_norm_df)

## Split the data frame into training and test data sets
covid_split_df <- split_data(covid_model_df)

## Fit models using the default list of machine learning (ML) algorithms
covid_model_list <- train_models(covid_split_df)

# Test a list of models on a test data set and output class probabilities,
covid_prob_list <- test_models(covid_model_list, covid_split_df, type = "prob")

## Plot ROC curves separately for each ML algorithm
roc_plot(covid_prob_list, covid_split_df)

## Plot all ROC curves in one plot
roc_plot(covid_prob_list, covid_split_df, multiple_plots = FALSE)

## Change color palette
roc_plot(covid_prob_list, covid_split_df, palette = "plasma")
}
}
\seealso{
\itemize{
\item \code{test_models}
\item\code{\link[pROC:roc]{roc}}
}
}
\author{
Chathurani Ranathunge
}
