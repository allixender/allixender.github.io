---
layout: article
title: A side note on geospatial data sharing and spatial data infrastructures (SDI)
modified: 2013-01-21
categories: articles
tags: [eresearch]
share: true
image:
  teaser: main-teaser-450.png
---

{% include toc.html %}

This blog post is dedicated to provide a general overview over the field of geospatial and environmental data sharing. 
The term geospatial is actually tautologous: The prefix "geo" implies geography, which always relates things to 
each other based on their location, where nearer things are stronger related than things further away from each other 
([Tobler’s 1st law of geography](http://en.wikipedia.org/wiki/Tobler's_first_law_of_geography)). And the word "spatial" also means having an extent and location in a space. 
However "geospatial" nowadays is almost exclusively used in the field of digital data with geographical context. 
Therefore software that delivers, analyses, presents, processes, stores and retrieves is also often called 
geospatial software (having its origins in the good old GIS – Geographical Information Systems).

## Part 1: GIS and GI Science intro

Research areas that work on the science behind GIS and spatial data, on the analytical methods, processes 
techniques, on ways of (standardised) spatial data exchange, effective and efficient storage and retrieval, 
are called GI Science, Geoinformatics, Geomatics, Geocomputation, Spatial Computation or Spatial Science … 
There is actually quite some discussion, if the necessity, even an entitlement for such a dedicated mixed 
branch of computer science and geography exists, a similar discussion when geography emerged as an accepted 
field of research ([ref](http://www.britannica.com/science/geography)). 
On the other hand you’ll often find the quote that "80% of data has a spatial component" 
or something like that. Apparently I can get the source right anymore, therefore you might handle this with care. 
It might go back to the 1990s when GIS software for PCs wanted to get their feet into the market 
([gis lounge](http://www.gislounge.com/80-percent-data-is-geographic/)). However  **a lot** of data in the geosciences have a spatial 
context and - a lot - of those data are needed for governmental agencies to manage 
land and water resources properly :smile: Agreed?

## Part 2: The Opengeospatial Consortium, aka OpenGIS, aka OGC

"The Open Geospatial Consortium (OGC) is an international industry consortium of 479 companies, government 
agencies and universities participating in a consensus process to develop publicly available interface standards. 
OGC® Standards support interoperable solutions that ‘geo-enable’ the Web, wireless and location-based services 
and mainstream IT."

The OGC standards framework provides means to build a spatial Data infrastructure (LINZ - Land Information New Zealand) 
– which is "the technology, policies, standards, and human resources necessary to acquire, process, store, 
distribute and improve the usability of geospatial data. (SDI) facilitates the connections between these 
important sources of information, and allows people to find and access them."
Quite some of the OGC standards and web services are also ISO international standards. There are interface 
and service descriptions on the one hand and data encodings/formats and conceptual data models on the 
other side. I will provide a short summary:

### WMS – Web Mapping Service (ISO 19128  WMS v1.3.0)

Essentially provides (web) maps (as images like png or jpg) output data Geographiclly 
correct images, png, jpg, view or portrayal service

Major methods: GetCapabilties and GetMap

### WFS – Web Feature Service (ISO 19142 WFS v2.0)

Provides an interface to access, query, store and retrieve vector “features”, 
aka discrete data – like in ESRI shapefiles. Data is accessible by their data schema, 
which can be soft-typed and values in schema fields and location queries are utilized. 
Output GML (ISO 19136), which is in a particular “domain-specific” XML schema. 
With WFS-T – transactional – there is also support to write back to the WFS server.

GetCapabilities
GetFeature – get the data
DescribeFeatureType – get schema

### WCS – Web Coverage Service

Provides an interface to access, query and retrieve raster imagery and coverages, 
grids (aka “fields”) as in continuous data. eg NetCDF-CF, GeoTIFF, ArcGRID

GetCapabilities
DescribeCoverage
GetCoverage

### CSW – Catalogue Service for Web (ISO 19115 CSW 2.0.2)

Provides an interface to access, query, store and retrieve metadata, aka data about the geospatial data, 
which is accessible through other geospatial webservices. Output is usually XML ISO 19139 metadata or Dublin core.

GetCapabilities
GetRecords – find metadata record by search criteria
GetRecordById – get one record by its unique id
DescribeRecord – metadata type
GetDomain – get range of values and/or keywords

### SOS – Sensor Observation Service

Provides an interface to access, query, store and retrieve time-series based data that has been measured at 
locations, eg through sensors or field surveying/sampling. But the focus is to query on temporal and then 
on spatial or value comparison basis. Standard output formats are O&M, WaterML2.0 time-series and SensorML 
sensor/procedure metadata.

SOS is part of the sensor web enablement initiative (SWE) which advances to its version 2, where a lot of 
things become more flexible, but also moe complicated. I will write about that later ☺ SOS explicitly 
also describes a group of methods to insert sensor and observation data. This is handled through different profiles.

GetCapabilities
GetObservation
DescribeSensor

There are quite some commercial and Open Source software packages and tool kits available, 
for the desktop and server-based for the web that support or where explicitly 
written for OGC webservices and splendid Open Source resources in the web:

OSGeo Foundation: http://www.osgeo.org

### (Spatially enabled) Databases:

- Postgresql/Postgis
- MySQL
- Oracle Database
- Microsoft SQL Server
- ESRI Geodatabase / ArcSDE
- SpatiaLite
- Rasdaman
- GeoCouch

### Data Servers (store data in databases):

- Geoserver (WMS, WFS, WCS)
- Mapserver (WMS, WFS, SOS)
- 52°North SOS server
- Geonetwork (CSW)
- ESRI ArcIMS / ArcServer
- Thredds (WCS, netCDF)

### Web mapping tool kits / frameworks (take data from data servers):

- openlayers
- Mapbender
- MapFish
- Geomajas
- Flash
- Silverlight

### Desktop clients supporting (at least partially) OGC standards:

- QuantumGIS
- uDig
- ESRI ArcGIS
- Intergraph Geomedia

And on it goes ... in the next weeks, I will write about New Zealand and international examples of OGC 
webservices implementations and SDIs for geospatial data publishing (where the data is basically public 
domain and needs to made accessible) and provide some closer insights to OGC SWE and the next generation 
sensor networks initiative SWE 2.0 et al.

---

[Originally posted on the New Zealand eResearch website](http://live-eresearchnz.pantheon.io/content/side-note-geospatial-data-sharing-and-spatial-data-infrastructures-sdi) - 21/01/2013