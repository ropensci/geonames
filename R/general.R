
##
## General Info
##
##' Get country code
##'
##' country code for location
##' 
##' API doc for GNcountryCode is at \url{http://www.geonames.org/export/web-services.html#countrycode}
##' 
##' @title country code for location
##' @param lat latitude
##' @param lng longitude
##' @param lang language code
##' @param radius radius size
##' @return country record
##' @export
##' @author Barry Rowlingson
GNcountryCode=function(lat,lng,lang="",radius=""){
# returns a single country
    return(getJson("countryCode",list(lat=lat,lng=lng,radius=radius,lang=lang,type="JSON")))
}

##' Get country info
##'
##' country info
##'
##' API doc for GNcountryInfo is at \url{http://www.geonames.org/export/web-services.html#countryInfo}
##' 
##' @title country info
##' @param country country code
##' @param lang language code
##' @return country record info
##' @author Barry Rowlingson
##' @export
GNcountryInfo=function(country="",lang=""){
# can return many records if no country code given
  return(gnDataFrame("countryInfo",list(country=country,lang=lang,type="JSON"),"geonames"))
}

##' Search for cities
##'
##' find cities
##' 
##' API doc for GNcities is at \url{http://www.geonames.org/export/JSON-webservices.html#citiesJSON}
##' 
##' @title find cities
##' @param north north bound
##' @param east east bound
##' @param south south bound
##' @param west west bount
##' @param lang language code
##' @param maxRows max number of records to return
##' @return city records
##' @export
##' @author Barry Rowlingson
GNcities=function(north,east,south,west,lang="en",maxRows=10){
  return(gnDataFrame("citiesJSON",list(north=north,east=east,west=west,south=south,lang=lang,maxRows=maxRows),"geonames"))
}

##' get timezone
##'
##' timezone for location
##' 
##' API doc for GNtimezone is at \url{http://www.geonames.org/export/web-services.html#timezone}
##' 
##' @title timezone for location
##' @param lat latitude
##' @param lng longitude
##' @param radius sesarch radius
##' @return time zone record
##' @author Barry Rowlingson
##' @export
GNtimezone=function(lat,lng, radius=0){
  return(as.data.frame(getJson("timezoneJSON",list(lat=lat,lng=lng, radius=0))))
}

##' country code and admin subdivision
##'
##' looks up country and admin subdivisions
##' 
##' API doc for GNcountrySubdivision is at \url{http://www.geonames.org/export/web-services.html#countrysubdiv}
##' 
##' @title country code and subdivision
##' @param lat latitude
##' @param lng longitude
##' @param lang language code
##' @param radius search radius
##' @param maxRows max number of returned records
##' @return iso country code
##' @export
##' @author Barry Rowlingson
GNcountrySubdivision=function(lat,lng,lang="en",radius="",maxRows=10){
# could return >1 record, but only the XML version seems to at the moment...
  return(getJson("countrySubdivisionJSON",list(lat=lat,lng=lng,lang=lang,radius=radius,maxRows=maxRows)))
}

