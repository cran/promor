% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modelPlots.R
\name{varimp_plot}
\alias{varimp_plot}
\title{Variable importance plot}
\usage{
varimp_plot(
  model_list,
  ...,
  type = "lollipop",
  text_size = 10,
  palette = "viridis",
  n_row,
  n_col,
  save = FALSE,
  file_path = NULL,
  file_name = "VarImp_plot",
  file_type = "pdf",
  dpi = 80,
  plot_width = 7,
  plot_height = 7
)
}
\arguments{
\item{model_list}{A \code{model_list} object from performing
\code{train_models}.}

\item{...}{Additional arguments to be passed on to
\code{\link[caret:varImp]{varImp}}.}

\item{type}{Type of plot to generate. Choices are "bar" or "lollipop."
Default is \code{"lollipop."}}

\item{text_size}{Text size for plot labels, axis labels etc. Default is
\code{10}.}

\item{palette}{Viridis color palette option for plots. Default is
\code{"viridis"}. See
\code{\link[viridis:viridis]{viridis}}
for available options.}

\item{n_row}{Number of rows to print the plots.}

\item{n_col}{Number of columns to print the plots.}

\item{save}{Logical. If \code{TRUE} saves a copy of the plot in the
directory provided in \code{file_path}.}

\item{file_path}{A string containing the directory path to save the file.}

\item{file_name}{File name to save the plot.
Default is \code{"VarImp_plot."}}

\item{file_type}{File type to save the plot.
Default is \code{"pdf"}.}

\item{dpi}{Plot resolution. Default is \code{80}.}

\item{plot_width}{Width of the plot. Default is \code{7}.}

\item{plot_height}{Height of the plot. Default is \code{7}.}
}
\value{
A list of \code{ggplot2} objects.
}
\description{
This function visualizes variable importance in models
}
\details{
\itemize{\item \code{varimp_plot} produces a list of plots showing
variable importance measures calculated from models generated with different
machine-learning algorithms.
\item Note: Variables are ordered by variable importance in
descending order, and by default, importance values are scaled to 0 and 100.
This can be changed by specifying \code{scale = FALSE}. See
\code{\link[caret:varImp]{varImp}} for more information.}
}
\examples{
\donttest{

## Create a model_df object
covid_model_df <- pre_process(covid_fit_df, covid_norm_df)

## Split the data frame into training and test data sets
covid_split_df <- split_data(covid_model_df)

## Fit models based on the default list of machine learning (ML) algorithms
covid_model_list <- train_models(covid_split_df)

## Variable importance - lollipop plots
varimp_plot(covid_model_list)

## Bar plots
varimp_plot(covid_model_list, type = "bar")

## Do not scale variable importance values
varimp_plot(covid_model_list, scale = FALSE)

## Change color palette
varimp_plot(covid_model_list, palette = "magma")
}
}
\seealso{
\itemize{
\item \code{train_models}, \code{rem_feature}
\item \code{\link[caret:varImp]{varImp}}
}
}
\author{
Chathurani Ranathunge
}
