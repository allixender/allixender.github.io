---
layout: article
title: Exchangeable Encodings Getting in Shape
modified: 2012-07-04
categories: articles
tags: [52north]
share: true
image:
  teaser: gsoc52north-teaser-450.png
---

{% include toc.html %}

## Abstract

The time is flying by and soon we reach midway of the Google Summer of Code (GSoC) with 52°North. 
It is the typical time in between – I already managed to meet the first milestones, but there is 
no proper product yet. Catching up with the changes from the SOS main development branch is a constant 
challenge, but the infrastructural changes within the “Exchangeable Encodings for SOS” project are slowly 
but continuously leading towards a robust and standardized, yet limited, encoding plugin API 
(application programming interface).

The main use case is the request for observations (GetObservation request) that could be delivered in CSV 
(comma separated values) format for legacy applications, WaterML2.0, an upcoming OGC (Open Geospatial Consortium) 
data transfer standard for the hydrological domain, possibly netCDF (Network Common Data Form), also an 
OGC standard for meteorological applications, and in O&M (Observations & Measurements) for the generic 
use within sensor networks and spatial data infrastructures.

[Link to the 2013 article on the 52°North blog](http://blog.52north.org/2012/07/04/exchangeable-encodings-getting-in-shape/)
