
##
## postal codes...
##

##' find postal code by lat long or code
##'
##' find postal code
##' @title find postal code
##' @param ... search parameters, see geonames web docs for details
##' @return postal code records
##' @export
##' @author Barry Rowlingson
GNfindNearbyPostalCodes=function(...){
  return(gnRaggedDataFrame("findNearbyPostalCodesJSON",list(...),"postalCodes"))
}


##' postal code lookup
##'
##' postal code lookup
##' @title postal code lookup
##' @param ... parameters
##' @return list of places for a given input postal code
##' @export
##' @author Barry Rowlingson
GNpostalCodeLookup=function(...){
  # only defined for some countries...
  return(gnRaggedDataFrame("postalCodeLookupJSON",list(...),"postalcodes"))
}

##' search for postal code
##'
##' full text search for postal codes
##' @title postal code search
##' @param ... search parameters
##' @return postal code record
##' @export
##' @author Barry Rowlingson
GNpostalCodeSearch=function(...){
  return(gnRaggedDataFrame("postalCodeSearchJSON",list(...),"postalCodes"))
}

##' countries with postal code info
##'
##' list countries with postal code info
##' @title postal code info
##' @return list of countries with postal codes on geonames
##' @author Barry Rowlingson
##' @export
GNpostalCodeCountryInfo=function(){
#
### now uses the JSON version - used to parse XML here!
###
  return(gnRaggedDataFrame("postalCodeCountryInfoJSON",list(),"geonames"))
}
