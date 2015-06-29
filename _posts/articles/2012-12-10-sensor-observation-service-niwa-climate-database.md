---
layout: article
title: A Sensor Observation Service for the NIWA climate database
modified: 2012-12-10
categories: articles
tags: [eresearch]
share: true
image:
  teaser: eresearchniwa-teaser-450.png
---

{% include toc.html %}

The National Institute of Water and Atmospheric Research (NIWA) operates a network of weather and climate 
and other measurement stations, equipped with different sensors, observing a wide range of environmental properties – 
from temperature over rainfall to wind speed and directions. These high frequency measurements are processed 
and stored in the NIWA climate database (CLIDB), which is also listed as a national significant database. 
NIWA has already a web interface in place, where data can be queried and downloaded. Yet this is a manual process.

The Open Geospatial Consortium (OGC) is an international consortium comprising of organisations from industry and 
research that develops geospatial data transfer and encoding standards and specifications in an open and 
consensus based process. The OGC Sensor Observation Service (SOS) is a web service interface specification 
describing access to sensor and time series data – the observations – measured or observed primarily by sensors.

With a Sensor Observation Service in place, the CLIDB could actually be queried like a database, but through the web, 
automagically, from within an application – based on an international standard. Plugins for e.g. R Statistics 
(sos4r), OpenLayers (OL sos demo) or ArcGIS (ArcHydro and 52°North ArcGIS SOS Extension) are already available 
to demonstrate data access from SOS servers.
In this Summer of eReseach project I will build a custom connector to source CLIDB directly, based on the 
sophisticated 52°North SOS server. But the devil is in the details. Although I have already worked with this software 
I will have to learn more about the database structure of the CLIDB and immerse in the latest development 
version of the 52°North SOS server, which will support Hibernate, the quite new OGC SOS 2.0 specification and 
exchangeable output encodings (e.g. CSV, O&M, WaterML2.0 and maybe JSON). Additionally we will discuss and 
demonstrate ways to include SOS data services in a client application.

A lot of work, but worth the effort. I am looking forward to create something new and useful. 
Besides the apparent advantages for New Zealand’s researchers, also consultancies, commercial 
organisations and governmental agencies will profit from such a dynamic, standards-driven and web-based 
geospatial data delivery service that could serve as another good example for environmental data providers.

[Link to the 2012 eResearch blog post](http://live-eresearchnz.pantheon.io/content/sensor-observation-service-niwa-climate-database)
