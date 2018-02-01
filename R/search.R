
##
## searching...
##

##' search geonames
##'
##' general search call
##' 
##' API doc for GNsearch is at \url{http://www.geonames.org/export/geonames-search.html}
##' 
##' @title search geonames
##' @param ... search parameters
##' @return matched records
##' @examples
##' \dontrun{
##' # Find places called Lancaster and 'geocode' the result
##' (lanc_df <- GNsearch(name = "Lancaster", country = "UK"))
##' lanc_coords <- lanc_df[1, c("lng", "lat")]
##' }
##' @export
##' @author Barry Rowlingson
GNsearch=function(...){
  return(gnRaggedDataFrame("searchJSON",list(...),"geonames"))
}

##' find neighbourhood
##'
##' find neighbourhood
##' 
##' API doc for GNneighbourhood is at \url{http://www.geonames.org/export/web-services.html#neighbourhood}
##' 
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
##' 
##' API doc for GNfindNearby is at \url{http://www.geonames.org/export/web-services.html#findNearby}
##' 
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
##' 
##' API doc for GNfindNearbyPlaceName is at \url{http://www.geonames.org/export/web-services.html#findNearbyPlaceName}
##' 
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
##' 
##' API doc for GNfindNearbyStreets is at \url{http://www.geonames.org/maps/us-reverse-geocoder.html#findNearbyStreets}
##' 
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
##' 
##' API doc for GNfindNearestAddress is at \url{http://www.geonames.org/maps/us-reverse-geocoder.html#findNearestAddress}
##' 
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
##'
##' API doc for GNfindNearestIntersection is at \url{http://www.geonames.org/maps/us-reverse-geocoder.html#findNearestIntersection}
##' 
##' @title nearest intersection 
##' @param lat latitude
##' @param lng longitude
##' @return intersection record
##' @export
##' @author Barry Rowlingson
GNfindNearestIntersection=function(lat,lng){
  return(as.data.frame(getJson("findNearestIntersectionJSON",list(lat=lat,lng=lng))$intersection))
}

