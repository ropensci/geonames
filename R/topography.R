
##
## Topography (heights)
##

##' height from topo30
##'
##' get height from topo30 data
##' @title topo30 height
##' @param lat latitude
##' @param lng longitude
##' @return height record
##' @export
##' @author Barry Rowlingson
GNgtopo30=function(lat,lng){
  return(as.data.frame(getJson("gtopo30JSON",list(lat=lat,lng=lng))))
}

##' height from srtm3 data
##'
##' get srtm3 height
##' @title srtm3 height
##' @param lat latitude
##' @param lng longitude
##' @return height record
##' @export
##' @author Barry Rowlingson
GNsrtm3=function(lat,lng){
  return(as.data.frame(getJson("srtm3JSON",list(lat=lat,lng=lng))))
}

