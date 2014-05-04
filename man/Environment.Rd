\name{Environment}
\alias{Environment}
\alias{GNfindNearByWeather}
\alias{GNweather}
\alias{GNweatherIcao}
\alias{GNearthquakes}

\title{Environmental queries}

\description{
 General environmental information
}

\usage{
GNfindNearByWeather(lat,lng)
GNweather(north,east,south,west,maxRows)
GNweatherIcao(ICAO)
GNearthquakes(north,east,south,west,date,minMagnitude,maxRows)
}

\arguments{
  \item{lat}{Decimal latitude. North is positive}
  \item{lng}{Decimal longitude. East is positive}
  \item{north, east, south, west}{Bounding box region in decimal
    degrees}
  \item{maxRows}{Limit number of returned rows}
  \item{ICAO}{ICAO weather station code}
  \item{date}{earthquake query date}
  \item{minMagnitude}{Minimum earhtquake magnitude}
}
\details{
  These functions query geonames for information about
  weather and earthquakes.

  Note capitalisation of 'NearBy'...
  
  See \url{http://www.geonames.org/export/ws-overview.html}
  for a full description of valid arguments and return
  values.
}

\value{
List or data frame objects with the query results.
  }
