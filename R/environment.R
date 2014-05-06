
##
## weather, earthquake, giant radioactive lizard invasion:
##

##' get weather at location
##'
##' get weather
##' 
##' API doc for GNfindNearByWeather is at \url{http://www.geonames.org/export/JSON-webservices.html#findNearByWeatherJSON}
##' 
##' @title weather at location
##' @param lat latitude
##' @param lng longitude
##' @return weather record
##' @examples
##' \dontrun{
##' GNfindNearByWeather(57,-2)
##' }
##' @export
##' @note check capitalisation of 'NearBy'
##' @author Barry Rowlingson
GNfindNearByWeather=function(lat,lng){
  return(getJson("findNearByWeatherJSON",list(lat=lat,lng=lng))$weather)
}

##' weather stations in region
##'
##' get weather stations in region with latest readings
##' @title weather stations in box
##' @param north north bound
##' @param east east bound
##' @param south south bound
##' @param west west bound
##' @param maxRows max records to return
##' @return weather records
##' @export
##' @author Barry Rowlingson
GNweather=function(north,east,south,west,maxRows=10){
  return(gnRaggedDataFrame("weatherJSON",list(north=north,east=east,west=west,south=south,maxRows=maxRows),"weatherObservations"))
}

##' weather record from ICAO station
##'
##' get most recent ICAO station data
##' 
##' API doc for GNweatherIcao is at \url{http://www.geonames.org/export/JSON-webservices.html#weatherIcaoJSON}
##' 
##' @title ICAO weather station data
##' @param ICAO ICAO code
##' @return weather record
##' @export
##' @author Barry Rowlingson
GNweatherIcao=function(ICAO){
  return(as.data.frame(getJson("weatherIcaoJSON",list(ICAO=ICAO))$weatherObservation))
}

##' recent earthquakes
##'
##' get recent earthquakes in a region
##'
##' API doc for GNearthquakes is at \url{http://www.geonames.org/export/JSON-webservices.html#earthquakesJSON}
##' 
##' @title recent earthquakes
##' @param north  north bound
##' @param east east bound
##' @param south south bound
##' @param west west bound
##' @param date optional date
##' @param minMagnitude optional minimal magnitude
##' @param maxRows max records to return
##' @return earthquake records
##' @examples
##' \dontrun{
##' GNearthquakes(north=44.1,south=-9.9,east=-22.4,west=55.2)
##' }
##' @export
##' @author Barry Rowlingson
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

