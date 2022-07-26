% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/handleTechReps.R
\name{corr_plot}
\alias{corr_plot}
\title{Correlation between technical replicates}
\usage{
corr_plot(
  raw_df,
  rep_1,
  rep_2,
  save = FALSE,
  file_type = "pdf",
  palette = "viridis",
  text_size = 5,
  n_row = 4,
  n_col = 4,
  dpi = 80,
  file_path = NULL
)
}
\arguments{
\item{raw_df}{A \code{raw_df} object (output of \code{\link{create_df}})
containing technical replicates.}

\item{rep_1}{Numerical. Technical replicate number.}

\item{rep_2}{Numerical. Number of the second technical replicate to compare
to \code{rep1}.}

\item{save}{Logical. If \code{TRUE} saves a copy of the plot in the
directory provided in \code{file_path}.}

\item{file_type}{File type to save the scatter plots.
Default is \code{"pdf"}.}

\item{palette}{Viridis color palette option for plots. Default is
\code{"viridis"}. See
\code{\link[viridis:viridis]{viridis}}
for available options.}

\item{text_size}{Text size for plot labels, axis labels etc. Default is
\code{10}.}

\item{n_row}{Numerical. Number of plots to print in a row in a single page.
Default is \code{4}.}

\item{n_col}{Numerical. Number of plots to print in a column in a single
page. Default is \code{4}.}

\item{dpi}{Plot resolution. Default is \code{80}.}

\item{file_path}{A string containing the directory path to save the file.}
}
\value{
A list of \code{ggplot2} plot objects.
}
\description{
This function generates scatter plots to visualize the
correlation between a given pair of technical replicates (Eg: 1 vs 2)
for each sample.
}
\details{
\itemize{\item Given a data frame of log-transformed intensities
(a \code{raw_df} object) and a pair of numbers referring to the technical
replicates, \code{corr_plot} produces a list of scatter plots showing
correlation between the given pair of technical replicates for all the
samples provided in the data frame.
\item Note: \code{n_row} * \code{n_col} should be equal to the number of
samples to display in a single page.
}
}
\examples{
## Use a data set containing technical replicates to create a raw_df object
raw_df <- create_df(
prot_groups = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/pg2.txt",
exp_design = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/ed2.txt",
tech_reps = TRUE
)


\donttest{
## Compare technical replicates 1 vs. 2 for all samples
corr_plot(raw_df, rep_1 = 1, rep_2 = 2)
}

}
\seealso{
\code{create_df}
}
\author{
Chathurani Ranathunge
}
