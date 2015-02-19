##Junior Jump Bart
> Template project for Carbon Five's Junior Jump Event

**Your Task (Should you choose to accept it)**
- Obtain & cache all 45 stations for the BART network from the official XML service (http://api.bart.gov/docs/stn/stns.aspx)
- Expose all the stations in JSON via a /stations.json endpoint
- Expose a single station in JSON via a /stations/:abbr.json endpoint
- Practice BDD development. Create additional specs for any services, models, etc you create
- Get the `stations_integration_spec` passing
- Your implementation should support future expansion to other BART endpoints 

**Requirements**
- Ruby 2.2.0+
- PostgreSQL 9+ (w/ PostGIS)
- Rails 4

**Set up environment**
```
$ git clone https://github.com/carbonfive/jjbart.git && cd jjbart && bundle
$ rake db:setup
$ rspec -f d
```

**Start server**

And eat cake
```
$ rails server
```

**BART API**
 - URL: `http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V`
 - API key: `MW9S-E7SL-26DU-VV8V`
