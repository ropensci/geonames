
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

#' Query the geonames web API for geographic data
#'
#' www.geonames.org is a service where you can query for global geographic
#' data such as administrative areas, populated places, weather data etc.
#'
#' The functions in this package are mostly thin wrappers to the API
#' calls documented at the geonames web services
#' overview \url{http://www.geonames.org/export/ws-overview.html}.
#'
#' A set of example calls are supplied in a file with the package. Once
#' you have set your geonames username with
#' \code{options(geonamesUsername="myusernamehere")} you can run
#' this with \code{source(system.file("tests","testing.R",package="geonames"),echo=TRUE)}
#' 
#' @docType package
#' @name geonames
NULL

.onLoad = function(libname,pkgname){
  ## sometimes they take this down and change it...
  if(is.null(getOption("geonamesHost"))){
    options(geonamesHost="ws.geonames.org")
  }
  if(is.null(getOption("geonamesUsername"))){
    packageStartupMessage("No geonamesUsername set. See http://geonames.wordpress.com/2010/03/16/ddos-part-ii/ and set one with options(geonamesUsername=\"foo\") for some services to work")
  }
}

##
## useful functions
##

getJson=function(name,plist){
#
# call a geonames JSON service with named args from plist
#
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
  data = rjson::fromJSON(d)
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

