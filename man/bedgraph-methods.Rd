\docType{methods}
\name{bedgraph}
\alias{bedgraph}
\alias{bedgraph,methylDiff-method}
\alias{bedgraph,methylRaw-method}
\alias{bedgraph,methylRawList-method}
\title{Get bedgraph from methylRaw, methylRawList and methylDiff objects}
\usage{
  bedgraph(methylObj,file.name=NULL,col.name,unmeth=FALSE,log.transform=FALSE,negative=FALSE,add.on="")
}
\arguments{
  \item{methylObj}{a \code{methylRaw} or
  \code{methlRawList} object}

  \item{file.name}{Default: NULL. if a string is given a
  bedgraph file will be written, if NULL a data.frame or a
  list of data frames will be returned}

  \item{col.name}{name of the column in \code{methylRaw},
  \code{methylRawList} or \code{methylDiff} objects to be
  used as a score for the bedgraph.  For \code{methylDiff},
  \code{col.name} must be one of the following
  'pvalue','qvalue', 'meth.diff'. For \code{methylRaw} and
  \code{methylRawList} it must be one of the following
  'coverage', 'numCs','numTs', 'perc.meth'}

  \item{unmeth}{when working with \code{methylRaw} or
  \code{methylRawList} objects should you output
  unmethylated C percentage this makes it easier to see the
  unmethylated bases because their % methylation values
  will be zero. Only invoked when file.name is not NULL.}

  \item{log.transform}{Default FALSE, If TRUE the score
  column of the bedgraph wil be in log10 scale. Ignored
  when col.name='perc.meth'}

  \item{negative}{Default FALSE, If TRUE, the score column
  of the bedgraph will be multiplied by -1. Ignored when
  col.name='perc.meth'}

  \item{add.on}{additional string to be add on the track
  line of bedgraph. can be viewlimits,priority etc. Check
  bedgraph track line options at UCSC browser}
}
\value{
  Returns a \code{data.frame} or list of data.frames if
  \code{file.name=NULL}, if a file.name given appropriate
  bed file will be written to that file
}
\description{
  The function converts \code{\link{methylRaw}},
  \code{\link{methylRawList}} or \code{\link{methylDiff}}
  object into a bedgraph format. It either writes as a file
  or returns a \code{data.frame}
}
\examples{
data(methylKit)

# getting a bedgraph file from a methylDiff object containing differential methylation percentages
bedgraph(methylDiff.obj,file.name="test.bed",col.name="meth.diff",unmeth=FALSE,log.transform=FALSE,negative=FALSE,add.on="")

# remove the file
unlink("test.bed")

# getting a bedgraph file from a methylBase object containing percent methylation values
bedgraph(methylRawList.obj[[1]],file.name="test2.bed",col.name="perc.meth",unmeth=FALSE,log.transform=FALSE,negative=FALSE,add.on="")

unlink("test2.bed") # remove the file
}

