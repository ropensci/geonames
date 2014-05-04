\name{Wikipedia}
\alias{Wikipedia}
\alias{GNfindNearbyWikipedia}
\alias{GNwikipediaBoundingBox}
\alias{GNwikipediaSearch}

\title{Spatial Query of Wikipedia}

\description{
 Query Wikipedia with a location or area.
}

\usage{
GNfindNearbyWikipedia(...)
GNwikipediaBoundingBox(...)
GNwikipediaSearch(q,maxRows)
}

\arguments{
  \item{...}{Search parameters - see DETAILS}
  \item{q}{Query string}
  \item{maxRows}{Maximum number of rows to return}
}
\details{
  These functions query geonames for information about
  places from Wikipedia.

  See \url{http://www.geonames.org/export/ws-overview.html}
  for a full description of valid arguments and return
  values.
}

\value{
List or data frame objects with the query results.
  }
