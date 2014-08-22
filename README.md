geonames
========

[![Build Status](https://api.travis-ci.org/ropensci/geonames.png)](https://travis-ci.org/ropensci/geonames)
[![Build status](https://ci.appveyor.com/api/projects/status/20c287nl3tc7lnan/branch/master)](https://ci.appveyor.com/project/sckott/geonames/branch/master)

R package for accessing the geonames.org API

Install from here using `devtools`:

 * `install.packages("devtools")` -- if you don't have devtools yet
 * `require(devtools)`
 * `install.packages("rjson")` -- gets this dependency from CRAN
 * `install_github("geonames","barryrowlingson")`

A version of this will be pushed to CRAN.

To enable all of the functions of this package, register for a geonames.org username at http://www.geonames.org/login/ and then enable access to the geonames free webservices by clicking http://www.geonames.org/enablefreewebservice Once that's done, in your `R` session, run `options(geonamesUsername="myusername")` to authenticate with the webservice. More information about the parameters for many of the functions in this package can be found here: http://www.geonames.org/export/ws-overview.html

[![](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
