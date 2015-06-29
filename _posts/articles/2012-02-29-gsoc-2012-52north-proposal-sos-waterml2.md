---
layout: article
title: Exchangeable Encodings for SOS - extension support WaterML2
modified: 2012-02-29
categories: articles
tags: [gsoc]
share: true
image:
  teaser: gsoc2012-logo.jpg
---

{% include toc.html %}

## Abstract

The 52°North SOS implements only a subset of the O&M data format, because O&M is too flexible to be supported 
completely. It would be better if users could just implement a simple encoding (for example to support 
their own CSV or JSON data format) and upload a compiled jar file to the SOS with a browser-based user interface. 
Then a client selects the newly available response format to retrieve the data in a new format. As an extension it 
would be very useful to researchers and data maintainers in the hydrological and meteorological domain to have the 
SOS server deliver WaterML2.0 encoded time-series. Based on the SOS adminstrator project, the desired encodings 
could be prepared as .jar-files and added via a web frontend.

[Link to the 2012 GSoC proposal](http://www.google-melange.com/gsoc/proposal/public/google/gsoc2012/allixender/5707702298738688)
