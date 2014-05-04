
##
## searching...
##

##' search geonames
##'
##' general search call
##' @title search geonames
##' @param ... search parameters
##' @return matched records
##' @export
##' @author Barry Rowlingson
GNsearch=function(...){
  return(gnRaggedDataFrame("searchJSON",list(...),"geonames"))
}

##' find neighbourhood
##'
##' find neighbourhood
##' @title neighbourhood
##' @param lat latitude
##' @param lng longitude
##' @return neighbourhood records
##' @export
##' @author Barry Rowlingson
GNneighbourhood=function(lat,lng){
# US cities only
  return(getJson("neighbourhoodJSON",list(lat=lat,lng=lng))$neighbourhood)
}

##' find nearby entities
##'
##' nearby search 
##' @title nearby search
##' @param ... search parameters
##' @return matched records
##' @export
##' @author Barry Rowlingson
GNfindNearby=function(...){
  warning("Not documented properly yet by geonames")
  return(getJson("findNearbyJSON",list(...)))
}

##' find nearby populated place
##'
##' search for populated places
##' @title populated place search
##' @param lat latitude
##' @param lng longitude
##' @param radius search radius
##' @param maxRows max records returned
##' @param style verbosity of record
##' @return nearby populated place records
##' @author Barry Rowlingson
##' @export
GNfindNearbyPlaceName=function(lat,lng,radius="",maxRows="10",style="MEDIUM"){
  return(gnDataFrame("findNearbyPlaceNameJSON",list(lat=lat,lng=lng,radius=radius,style=style,maxRows=maxRows),"geonames"))
}

##' find nearby streets (US only)
##'
##' for a lat-long, find nearby US streets
##' @title nearby street finding
##' @param lat latitude
##' @param lng longitude
##' @return street records
##' @export
##' @author Barry Rowlingson
GNfindNearbyStreets=function(lat,lng){
  return(gnDataFrame("findNearbyStreetsJSON",list(lat=lat,lng=lng),"streetSegment"))
}

##' find nearest street and address
##'
##' search US for nearest street and address
##' @title nearest address
##' @param lat latitude
##' @param lng longitude
##' @return address record
##' @export
##' @author Barry Rowlingson
GNfindNearestAddress=function(lat,lng){
  return(as.data.frame(getJson("findNearestAddressJSON",list(lat=lat,lng=lng))$address))
}

##' search US for nearest intersection
##'
##' finds nearest intersection
##' @title nearest intersection 
##' @param lat latitude
##' @param lng longitude
##' @return intersection record
##' @export
##' @author Barry Rowlingson
GNfindNearestIntersection=function(lat,lng){
  return(as.data.frame(getJson("findNearestIntersectionJSON",list(lat=lat,lng=lng))$intersection))
}

