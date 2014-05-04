
##
## wikipedia searching
##

##' find nearby wikipedia entries
##'
##' search wikipedia entries by lat/lng or location name parameters
##' @title nearby wikipedia entries
##' @param ... see geonames.org documentation
##' @return wikipedia entries
##' @export
##' @author Barry Rowlingson
GNfindNearbyWikipedia=function(...){
  return(gnRaggedDataFrame("findNearbyWikipediaJSON",list(...),"geonames"))
}

##' wikipedia articles in bounding box
##'
##' find articles in a box
##' @title wikipedia articles in a box
##' @param ... parameters (north, south, east, west etc.)
##' @return wikipedia records
##' @export
##' @author Barry Rowlingson
GNwikipediaBoundingBox=function(...){
  return(gnRaggedDataFrame("wikipediaBoundingBoxJSON",list(...),"geonames"))
}


##' wikipedia fulltext search
##'
##' find geolocated articles in wikipedia
##' @title search wikipedia
##' @param q search string
##' @param maxRows maximum returned records
##' @return wikipedia entries
##' @export
##' @author Barry Rowlingson
GNwikipediaSearch=function(q,maxRows=10){
  return(gnRaggedDataFrame("wikipediaSearchJSON",list(q=q,maxRows=maxRows),"geonames"))
}
