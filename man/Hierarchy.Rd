\name{Hierarchy}
\alias{Hierarchy}
\alias{GNchildren}
\alias{GNhierarchy}
\alias{GNsiblings}
\alias{GNneighbours}
\alias{GNcountrySubdivision}

\title{Admin area hierarchies}

\description{
  These are functions for administrative hierarchies
}

\usage{
GNchildren(geonameId,...)
GNhierarchy(geonameId,...)
GNsiblings(geonameId,...)
GNneighbours(geonameId,...)
GNcountrySubdivision(lat,lng,lang,radius,maxRows)
}

\arguments{
  \item{geonameId}{A geoname identifier}
  \item{lat}{Decimal latitude. North is positive}
  \item{lng}{Decimal longitude. East is positive}
  \item{lang}{Language for returned text}
  \item{radius}{Search radius}
  \item{maxRows}{Maximum number of rows to return}
  \item{...}{See \url{http://www.geonames.org/export/ws-overview.html} for details of arguments to this function}
}
\details{
  These functions query geonames for information about
  administrative region hierarchies.

  See \url{http://www.geonames.org/export/ws-overview.html}
  for a full description of valid arguments and return
  values
}

\value{
List or data frame objects with the query results.
  }
