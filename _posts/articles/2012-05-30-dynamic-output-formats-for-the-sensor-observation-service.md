---
layout: article
title: Dynamic Output Formats for the Sensor Observation Service
modified: 2012-05-30
categories: articles
tags: [52north]
share: true
image:
  teaser: gsoc52north-teaser-450.png
---

{% include toc.html %}

## Abstract

As one of the 52°North Google Summer of Code projects, “Exchangeable Encodings for the 52°North Sensor 
Observation Service (SOS)” aims to implement a customisable result set encoding mechanism. The users would 
then be able to add their own compiled libraries (like plugins), which contain all the necessary code to 
provide the requested data in different formats, such as CSV or GeoJSON,  to the SOS. When that mechanism works, 
we can easily add more encodings, e.g. the planned WaterML2.0 – but for now, where to start?

The internal architecture of the 52°North SOS server is generally well structured. Based on the user request, 
the respective Listener will get the data from the data backend and send it to the corresponding Encoder.  
The response document, very likely a collection of observations, is then returned to the user in the requested 
encoding, also referred to as the response format. The typical application flow of such a request is depicted 
in the comic strip below. Available response formats can be queried from SOS server and are listed in the 
capabilities document. To date the two integrated encoders return XML documents based on the OGC© O&M 
schema and the OGC© SOS versions.

[Link to the 2013 article on the 52°North blog](http://blog.52north.org/2012/05/30/dynamic-output-formats-for-the-sensor-observation-service/)

