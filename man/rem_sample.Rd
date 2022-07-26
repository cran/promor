% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/handleTechReps.R
\name{rem_sample}
\alias{rem_sample}
\title{Remove user-specified samples}
\usage{
rem_sample(raw_df, rem)
}
\arguments{
\item{raw_df}{A \code{raw_df} object.}

\item{rem}{Name of the sample to remove.}
}
\value{
A \code{raw_df} object.
}
\description{
This function removes user-specified samples from the
data frame.
}
\details{
\itemize{\item\code{rem_sample} assumes that sample names follow the
"Group_UniqueSampleID_TechnicalReplicate" notation (Use \code{head(raw_df)}
to see the structure of the \code{raw_df} object.)
\item If all the technical replicates representing a sample needs to be
removed, provide "Group_UniqueSampleID" as \code{rem}.
\item If a specific technical replicate needs to be removed in case it
shows weak correlation with other technical replicates for example, you can
remove that particular technical replicate by providing
"Group_UniqueSampleID_TechnicalReplicate" as \code{rem}.
}
}
\examples{
## Use a data set containing technical replicates to create a raw_df object
raw_df <- create_df(
prot_groups = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/pg2.txt",
exp_design = "https://raw.githubusercontent.com/caranathunge/promor_example_data/main/ed2.txt",
tech_reps = TRUE
)
# Check the first few rows of the raw_df object
head(raw_df)

## Remove all technical replicates of "WT_4"
raw_df1 <- rem_sample(raw_df, "WT_4")

## Remove only technical replicate number 2 of "WT_4"
raw_df2 <- rem_sample(raw_df, "WT_4_2")

}
\seealso{
\code{\link{corr_plot}}, \code{\link{create_df}}
}
\author{
Chathurani Ranathunge
}
