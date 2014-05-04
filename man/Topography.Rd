\name{Topography}
\alias{Topography}
\alias{GNgtopo30}
\alias{GNsrtm3}

\title{Topographic queries}

\description{
 Get topographic (height) information.
}

\usage{
GNgtopo30(lat,lng)
GNsrtm3(lat,lng)
}

\arguments{
  \item{lat}{Decimal latitude. North is positive}
  \item{lng}{Decimal longitude. East is positive}
}
\details{
  These functions query geonames for information about
  elevations. There are interfaces to SRTM3 and Gtopo30 data.

  See \url{http://www.geonames.org/export/ws-overview.html}
  for a full description of valid arguments and return
  values
}

\value{
List or data frame objects with the query results.
  }
