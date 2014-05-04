\name{Searching}
\alias{Searching}
\alias{GNsearch}
\alias{GNneighbourhood}
\alias{GNfindNearby}
\alias{GNfindNearbyPlaceName}
\alias{GNfindNearbyStreets}
\alias{GNfindNearestAddress}
\alias{GNfindNearestIntersection}

\title{Searching}

\description{
 Various geographic searches
}

\usage{
GNsearch(...)
GNneighbourhood(lat,lng)
GNfindNearby(...)
GNfindNearbyPlaceName(lat,lng,radius,maxRows,style)
GNfindNearbyStreets(lat,lng)
GNfindNearestAddress(lat,lng)
GNfindNearestIntersection(lat,lng)
}

\arguments{
  \item{...}{Various search arguments}
  \item{lat}{Decimal latitude. North is positive}
  \item{lng}{Decimal longitude. East is positive}
  \item{radius}{Search radius in km}
  \item{maxRows}{Limit on returned rows}
  \item{style}{Verbosity of returned data}
}
\details{
  These functions query geonames for general spatial
  searches.
  
  See \url{http://www.geonames.org/export/ws-overview.html}
  for a full description of valid arguments and return
  values.
}

\value{
List or data frame objects with the query results.
  }
