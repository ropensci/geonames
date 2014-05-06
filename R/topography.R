
##
## Topography (heights)
##

##' height from topo30
##'
##' get height from topo30 data
##' 
##' API doc for GNgtopo30 is at \url{http://www.geonames.org/export/web-services.html#gtopo30}
##'
##' @title topo30 height
##' @param lat latitude
##' @param lng longitude
##' @return height record
##' @examples
##' \dontrun{
##' GNgtopo30(lat=54,lng=-1)
##' }
##' @export
##' @author Barry Rowlingson
GNgtopo30=function(lat,lng){
  return(as.data.frame(getJson("gtopo30JSON",list(lat=lat,lng=lng))))
}

##' height from srtm3 data
##'
##' get srtm3 height
##' 
##' API doc for GNsrtm3 is at \url{http://www.geonames.org/export/web-services.html#srtm3}
##' 
##' @title srtm3 height
##' @param lat latitude
##' @param lng longitude
##' @return height record
##' @examples
##' \dontrun{
##' GNsrtm3(lat=54,lng=-1)
##' }
##' @export
##' @author Barry Rowlingson
GNsrtm3=function(lat,lng){
  return(as.data.frame(getJson("srtm3JSON",list(lat=lat,lng=lng))))
}

