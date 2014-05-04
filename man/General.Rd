\name{General}
\alias{General}
\alias{GNcountryCode}
\alias{GNcountryInfo}
\alias{GNcities}
\alias{GNtimezone}

\title{General Queries}

\description{
 Query codes and timezones
}

\usage{
GNcountryCode(lat,lng,lang,radius)
GNcountryInfo(country,lang)
GNcities(north,east,south,west,lang,maxRows)
GNtimezone(lat,lng,radius)
}

\arguments{
  \item{lat}{Decimal latitude. North is positive}
  \item{lng}{Decimal longitude. East is positive}
  \item{radius}{Search radius in km}
  \item{lang}{Language for internationalised returned text}
  \item{country}{Two-character country code}
  \item{north,east,south,west}{Decimal degree bounding box}
  \item{maxRows}{Limit on returned rows}
}
\details{
  These functions query geonames for information about
  various things.
  
  See \url{http://www.geonames.org/export/ws-overview.html}
  for a full description of valid arguments and return
  values.
}

\value{
List or data frame objects with the query results.
  }
