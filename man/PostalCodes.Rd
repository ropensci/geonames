\name{PostalCodes}
\alias{PostalCodes}
\alias{GNfindNearbyPostalCodes}
\alias{GNpostalCodeLookup}
\alias{GNpostalCodeSearch}
\alias{GNpostalCodeCountryInfo}

\title{Postal code queries}

\description{
 Query geonames for postal codes.
}

\usage{
GNfindNearbyPostalCodes(...)
GNpostalCodeLookup(...)
GNpostalCodeSearch(...)
GNpostalCodeCountryInfo()
}

\arguments{
  \item{...}{Various query arguments. See \url{http://www.geonames.org/}
  for details}
}
\details{
  These functions query geonames for information about
  postal codes. Note that geonames only supports postal code
  lookups in a limited number of countries. The supported
  country info is returned by GNpostalCodeCountryInfo.

  See \url{http://www.geonames.org/export/ws-overview.html}
  for a full description of valid arguments and return
  values.
}

\value{
List or data frame objects with the query results.
  }
