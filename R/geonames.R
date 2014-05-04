
##     Copyright (C) 2008 Barry Rowlingson

##     This program is free software: you can redistribute it and/or modify
##     it under the terms of the GNU General Public License as published by
##     the Free Software Foundation, either version 3 of the License, or
##     (at your option) any later version.

##     This program is distributed in the hope that it will be useful,
##     but WITHOUT ANY WARRANTY; without even the implied warranty of
##     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##     GNU General Public License for more details.

##     You should have received a copy of the GNU General Public License
##     along with this program.  If not, see <http://www.gnu.org/licenses/>.

.onLoad = function(libname,pkgname){
  ## sometimes they take this down and change it...
  if(is.null(options()$geonamesHost)){
    options(geonamesHost="ws.geonames.org")
  }
  if(is.null(options()$geonamesUsername)){
    warning("No geonamesUsername set. See http://geonames.wordpress.com/2010/03/16/ddos-part-ii/ and set one with options(geonamesUsername=\"foo\") for some services to work")
  }
}

##
## useful functions
##

getJson=function(name,plist){
#
# call a geonames JSON service with named args from plist
#
  require(rjson)
  require(utils)
  url=paste("http://",options()$geonamesHost,"/",name,"?",sep="")
  if(!is.null(options()$geonamesUsername)){
    plist[["username"]]=options()$geonamesUsername
  }
  olist = list()
  for(p in 1:length(plist)){
    olist[[p]]=paste(names(plist)[p],"=",URLencode(as.character(plist[[p]])),sep="")
  }
  pstring=paste(unlist(olist),collapse="&")
  url=paste(url,pstring,sep='')  
  u=url(url,open="r")
  d=readLines(u,warn=FALSE)
  close(u)
  data = fromJSON(d)
  if(length(data$status)>0){
    stop(paste("error code ",data$status$value," from server: ",data$status$message,sep=""))
  }
  return(data)
}


gnDataFrame=function(name,params,ename){
#
# return a data frame constructed from a JSON call
# 

###
### this code tried to be more efficient but each column was a list.
### eventually I'll figure out a better way to construct a data frame, until then
### i'll just use the ragged version.
#  json = getJson(name,params)
#  return(as.data.frame(do.call("rbind",json[[ename]])))

### another poss is:  do.call("rbind",lapply(l,data.frame))
### but it errors if the data frame is ragged. We could test for this and
### use gnRaggedDataFrame if it fails
  
  return(gnRaggedDataFrame(name,params,ename))

}

gnRaggedDataFrame=function(name,params,ename){
#
# if the return is a Json list with items of different structure but we want a data frame,
# use this and it will fill missing items with <NA> values.
#
  json = getJson(name,params)[[ename]]
  names=NULL
  for(j in json){
    names=unique(c(names,names(unlist(j))))
  }

  m=data.frame(matrix(NA,ncol=length(names),nrow=length(json)))
  names(m) = names
  row=1
  for(j in json){
    for(ename in names(unlist(j))){
       m[row,ename]=unlist(j)[[ename]]
    }
    row=row+1
  }
  return(m)
}

##
## admin hierarchy structures
## 

GNchildren=function(geonameId,...){
# allows name, lang, others?
  return(gnDataFrame("childrenJSON",list(geonameId=geonameId,...),"geonames"))
}

GNhierarchy=function(geonameId,...){
  return(gnRaggedDataFrame("hierarchyJSON",list(geonameId=geonameId,...),"geonames"))
}

GNsiblings=function(geonameId,...){
  return(gnDataFrame("siblingsJSON",list(geonameId=geonameId,...),"geonames"))
}

GNneighbours=function(geonameId,...){
# works for countries only
  return(gnDataFrame("neighboursJSON",list(geonameId=geonameId,...),"geonames"))
}

GNcountrySubdivision=function(lat,lng,lang="en",radius="",maxRows=10){
# could return >1 record, but only the XML version seems to at the moment...
  return(getJson("countrySubdivisionJSON",list(lat=lat,lng=lng,lang=lang,radius=radius,maxRows=maxRows)))
}

##
## General Info
##

GNcountryCode=function(lat,lng,lang="",radius=""){
# returns a single country
  return(getJson("countryCode",list(lat=lat,lng=lng,radius=radius,lang=lang,type="JSON")))
}

GNcountryInfo=function(country="",lang=""){
# can return many records if no country code given
  return(gnDataFrame("countryInfo",list(country=country,lang=lang,type="JSON"),"geonames"))
}

GNcities=function(north,east,south,west,lang="en",maxRows=10){
  return(gnDataFrame("citiesJSON",list(north=north,east=east,west=west,south=south,lang=lang,maxRows=maxRows),"geonames"))
}

GNtimezone=function(lat,lng, radius=0){
  return(as.data.frame(getJson("timezoneJSON",list(lat=lat,lng=lng, radius=0))))
}


##
## searching...
##

GNsearch=function(...){
  return(gnRaggedDataFrame("searchJSON",list(...),"geonames"))
}

GNneighbourhood=function(lat,lng){
# US cities only
  return(getJson("neighbourhoodJSON",list(lat=lat,lng=lng))$neighbourhood)
}

GNfindNearby=function(...){
  warning("Not documented properly yet by geonames")
  return(getJson("findNearbyJSON",list(...)))
}

GNfindNearbyPlaceName=function(lat,lng,radius="",maxRows="10",style="MEDIUM"){
  return(gnDataFrame("findNearbyPlaceNameJSON",list(lat=lat,lng=lng,radius=radius,style=style,maxRows=maxRows),"geonames"))
}

GNfindNearbyStreets=function(lat,lng){
  return(gnDataFrame("findNearbyStreetsJSON",list(lat=lat,lng=lng),"streetSegment"))
}

GNfindNearestAddress=function(lat,lng){
  return(as.data.frame(getJson("findNearestAddressJSON",list(lat=lat,lng=lng))$address))
}

GNfindNearestIntersection=function(lat,lng){
  return(as.data.frame(getJson("findNearestIntersectionJSON",list(lat=lat,lng=lng))$intersection))
}


##
## postal codes...
##

GNfindNearbyPostalCodes=function(...){
  return(gnRaggedDataFrame("findNearbyPostalCodesJSON",list(...),"postalCodes"))
}

GNpostalCodeLookup=function(...){
  # only defined for some countries...
  return(gnRaggedDataFrame("postalCodeLookupJSON",list(...),"postalcodes"))
}

GNpostalCodeSearch=function(...){
  return(gnRaggedDataFrame("postalCodeSearchJSON",list(...),"postalCodes"))
}

GNpostalCodeCountryInfo=function(){
#
### now uses the JSON version - used to parse XML here!
###
  return(gnRaggedDataFrame("postalCodeCountryInfoJSON",list(),"geonames"))
}


##
## weather, earthquake, giant radioactive lizard invasion:
##

GNfindNearByWeather=function(lat,lng){
  return(getJson("findNearByWeatherJSON",list(lat=lat,lng=lng))$weather)
}

GNweather=function(north,east,south,west,maxRows=10){
  return(gnRaggedDataFrame("weatherJSON",list(north=north,east=east,west=west,south=south,maxRows=maxRows),"weatherObservations"))
}

GNweatherIcao=function(ICAO){
  return(as.data.frame(getJson("weatherIcaoJSON",list(ICAO=ICAO))$weatherObservation))
}

GNearthquakes=function(north,east,south,west,date,minMagnitude,maxRows=10){
  params = list(north=north,south=south,east=east,west=west,maxRows=maxRows)
  if(!missing(date)){ 
    params$date=date
  }
  if(!missing(minMagnitude)){
    params$minMagnitude=minMagnitude
  }
  return(gnDataFrame("earthquakesJSON",params,"earthquakes"))
}




##
## Topography (heights)
##

GNgtopo30=function(lat,lng){
  return(as.data.frame(getJson("gtopo30JSON",list(lat=lat,lng=lng))))
}

GNsrtm3=function(lat,lng){
  return(as.data.frame(getJson("srtm3JSON",list(lat=lat,lng=lng))))
}


##
## wikipedia searching
##

GNfindNearbyWikipedia=function(...){
  return(gnRaggedDataFrame("findNearbyWikipediaJSON",list(...),"geonames"))
}

GNwikipediaBoundingBox=function(...){
  return(gnRaggedDataFrame("wikipediaBoundingBoxJSON",list(...),"geonames"))
}

GNwikipediaSearch=function(q,maxRows=10){
  return(gnRaggedDataFrame("wikipediaSearchJSON",list(q=q,maxRows=maxRows),"geonames"))
}


gnerrorCodes = function(){
  errorcodes = list()
  errorcodes[["10"]]="Authorization Exception"
  errorcodes[["11"]]="record does not exist"
  errorcodes[["12"]]="other error"
  errorcodes[["13"]]="database timeout"
  errorcodes[["14"]]="invalid parameter"
  errorcodes[["15"]]="no result found"
  errorcodes[["16"]]="duplicate exception"
  errorcodes[["17"]]="postal code not found"
  errorcodes[["18"]]="daily limit of credits exceeded"
  errorcodes[["19"]]="hourly limit of credits exceeded"
  errorcodes[["20"]]="weekly limit of credits exceeded"
  return(errorcodes)
}

gnerrorString=function(code){
  code=as.character(code)
  allCodes = gnerrorCodes()
  if(!is.null(allCodes[[code]])){
    return(allCodes[[code]])
  }else{
    return(paste("Unknown Code: ",code,sep=""))
  }
}

