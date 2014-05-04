###
### some sample usages
###

### note these aren't in the automated test directory because
### they rely on internet connectivity and a good connection to
### the geonames server.

GNchildren(3175395)

GNcities(north=44.1,south=-9.9,east=-22.4,west=55.2,lang="de")

GNcountryCode(lat=47.03,lng=10.2)

GNcountryInfo()
GNcountryInfo("DE")


GNearthquakes(north=44.1,south=-9.9,east=-22.4,west=55.2)

GNfindNearByWeather(57,-2)

GNfindNearbyStreets(37.45,-122.18)

GNwikipediaSearch("london")
GNfindNearbyWikipedia(postalcode=8775,country="CH",radius=10)
GNwikipediaBoundingBox(north=44.1,south=-9.9,east=-22.4,west=55.2)

GNtimezone(57.01,-2)
GNtimezone(lat=0,lng=-40)

# new radius functionality
GNtimezone(lat=0,lng=-40, radius=200)

GNfindNearbyPostalCodes(lat=47,lng=9)
GNpostalCodeSearch(postalcode=90210,country="FI")
GNpostalCodeSearch(postalcode=90210,country="US")
GNpostalCodeLookup(postalcode="LA1",country="UK")
GNpostalCodeLookup(postalcode="90210")

GNsearch(q="london",maxRows=10)

GNneighbours(3041565)

GNneighbourhood(40.7834,-73.96625)
GNpostalCodeCountryInfo()

# this caused warnings with the timezone being a list:
GNfindNearbyPlaceName(52,-128,300, "30","FULL") 
