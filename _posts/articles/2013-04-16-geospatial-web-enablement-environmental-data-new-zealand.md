---
layout: article
title: Geospatial web-enablement for environmental data in New Zealand
modified: 2013-04-16
categories: articles
tags: [eresearch]
share: true
image:
  teaser: main-teaser-450.png
---

{% include toc.html %}

This blog post can be seen as a sequel to a [former blog post](http://www.eresearch.org.nz/content/side-note-geospatial-data-sharing-and-spatial-data-infrastructures-sdi ) on the introduction on geospatial data sharing and spatial 
data infrastructures (SDI), where I explained the basics of OGC standards and web services. Quite some research 
organisations and governmental agencies already employ OGC standards to make data available online, often even 
free of charge for the public. I would like to present some really good examples of interoperable data sharing in New Zealand.

Through the standardised and web-based access to so many data sources, not only traditional geographical 
processing and analysis (GIS) based research is made easier, but also complete new technical and methodological 
research possibilities arise.

## [LINZ - Land Information New Zealand](http://data.linz.govt.nz)

I would like to start with Land Information New Zealand ([LINZ](http://www.linz.govt.nz/about-linz)). LINZ, as a governmental body, has issued and 
maintains [New Zealand’s geospatial strategy](http://www.linz.govt.nz/about-linz/our-location-strategy/sdi-and-open-government-data-programme). LINZ runs the LINZ Data Service, which provide tons of NZ-related 
data sets, topography, maps, place names and much more, almost all of it is available under a 
[NZ Creative Commons license](https://creativecommons.org/licenses/by/3.0/nz/). You can register for free, get an API key and use data directly through web, 
basically as long as you tell that it is LINZ data. LINZ provides standard OGC CSW, WMS and WFS [web service interfaces](https://data.linz.govt.nz/p/web-services/).

[http://data.linz.govt.nz](http://data.linz.govt.nz)

More news about the NZ geospatial strategy can be [found on here](http://www.linz.govt.nz/about-linz/our-location-strategy/geospatial-strategy-and-work-programme).

## [DOC – Department of Conservation](http://geoportal.doc.govt.nz)

Also the New Zealand [Department of Conservation](http://www.doc.govt.nz/) is going towards geospatial web services. 
It looks like they use ESRI software, which supports OGC standards to certain bit already, although 
ESRI (producer of the ArcGIS software) as a commercial closed-source software provider has been known 
to notoriously neglect open standards. However, the Shapefile format is open and besides ESRI REST services, 
the DOC Geoportal also allows for OGC-based access (CSW/ISO 19139 metadata for search and 
discovery and WMS/WFS for map/feature data access)

[http://geoportal.doc.govt.nz](http://geoportal.doc.govt.nz)

## [GNS Science Data](http://data.gns.cri.nz/metadata/)

[The Institute of Geological and Nuclear Sciences](http://www.gns.cri.nz/) 
is one of the 9 New Zealand Crown Research Institutes (CRI), which conduct about one 
half publicly/governmentally funded and the other half commercial research projects and, 
together with the universities of course, can be seen as New Zealand’s main science and research 
providers, each claiming a particular scientific domains. GNS Science is New Zealand’s leading provider of Earth, 
geoscience and isotope research and the geological survey of New Zealand. GNS’s research topics also include volcanoes, 
earthquakes, geothermal features and groundwater.

GNS has published the 1:250 000 Geological Map of New Zealand ([QMAP](http://www.gns.cri.nz/Home/Our-Science/Earth-Science/Regional-Geology/Geological-Maps/1-250-000-Geological-Map-of-New-Zealand-QMAP). 
It is also [digitally accessible](http://www.gns.cri.nz/Home/Our-Science/Earth-Science/Regional-Geology/Geological-Maps/Geological-Information-Exchange) – 
GNS exports the QMAP as OGC WMS and WFS in the OGC format [GeoSciML](http://www.ogcnetwork.net/geosciml). 
An easy way and very interesting example for interoperability is to explore New Zealand’s geology is 
through the [OneGeology project](http://www.onegeology.org/home.html), which sources and displays such services from geological surveys from all over the world.

The GNS-EU collaborative [SMART Acquifer Characterisation programme (SAC)](http://www.gns.cri.nz/Home/Our-Science/Environment-and-Materials/Groundwater/Research/SMART-Aquifer-Characterisation) also aims 
to connect OGC based data sources. Within the research aim "Data Synthesis and Visualisation" the [SMART Data Portal](portal.smart-project.info) aims to develop an integrated OGC framework for discovery, access, processing and visualisation of hydrogeological data.

[http://data.gns.cri.nz/metadata/](http://data.gns.cri.nz/metadata/)

## [NIWA – National Institute of Water and Atmospheric Research](http://ei.niwa.co.nz)

[NIWA](http://www.niwa.co.nz/) NIWA, another CRI, has a strong reputation in climate, 
marine and marine ecosystem and biodiversity sciences.
Whereas a lot of organisations and agencies make data available first and then (if at all) add more 
sophisticated search technology, NIWA started the other way round. They established a discovery portal - 
the Environmental Information Browser, which is basically a catalogue, where one can search by keywords, 
places, data and time. All the data NIWA has, will eventually be listed and can be queried and also harvested 
through the OGC CSW interface. Furthermore NIWA is also moving towards providing OGC web services to their data sets. 
One particular example has been a “[Summer of eResearch](http://www.eresearch.org.nz/soer-projects/sensor-observation-service)” 
project and [its progress documented on the eResearch website](http://www.eresearch.org.nz/content/sos-clidb-mid-term-we-got-data).

[http://ei.niwa.co.nz](http://ei.niwa.co.nz)

## [LRIS - Landcare Research](https://lris.scinfo.org.nz/)

[Landcare Research](http://www.landcareresearch.co.nz/) is also a New Zealand Crown Research Institute and focuses on the management 
of terrestrial biodiversity and land resources in order to both protect and enhance the terrestrial 
environment. I have come across several Landcare projects on soils and land use data, where Landcare 
not only uses OGC standards, but also participates in the development and maturing of some of those standards. 
Like the former parties, Landcare runs a data or geoportal (LRIS), too, which can be accessed and 
queried through CSW, WMS and WFS web interfaces,

[https://lris.scinfo.org.nz/](https://lris.scinfo.org.nz/)

Landcare also hosts a dedicated soil map portal ([S-map](http://smap.landcareresearch.co.nz/home)), which sources the digital soil information 
layers based on WMS. Furthermore they drive the development of a global soil map portal ([http://www.globalsoilmap.net/](http://www.globalsoilmap.net/)), 
which under the hood, of course, uses OGC standards again. To enable international, comparable, interoperable soil 
data exchange Landcare participates in the development of a soil information standard.

## Outlook

Regional councils are on the way, too. Many regional councils already make data accessible on their web sites. 
A quick investigation shows for example Environment Waikato, Horizons, HBRC, BOP or Environment Canterbury. 
However most of these data sources need to be accessed manually and/or do not provide a standardised interface. 
Not to speak of a generalised way to actually find them. In conjunction with the open data initiatives 
([Open and Transparent Government](https://www.ict.govt.nz/programmes-and-initiatives/open-and-transparent-government/) , 
[Open New Zealand](https://wiki.open.org.nz/wiki/display/main)) and catalogues available (
[government datasets online](https://data.govt.nz/), 
[Open Data Catalogue](http://cat.open.org.nz/)), there is massive potential to link diverse datasets, relate and analyse seemingly 
unrelated datasets and gain new insights, find and (re-use) data by type, time and location or just 
enable ubiquitous mobile access to the data you need. However, we might end up needing a catalogue for 
the catalogues, and of course a lot of existing data needs to be geo-located/geo-referenced, so that they 
could be found by location. There is still a way to go and definitely some more research necessary in that space.

---

[Originally posted on the New Zealand eResearch website](http://live-eresearchnz.pantheon.io/content/geospatial-web-enablement-environmental-data-new-zealand) - 16/04/2013