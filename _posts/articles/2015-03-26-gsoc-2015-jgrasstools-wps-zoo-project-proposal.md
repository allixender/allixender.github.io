---
layout: article
title: ZOO-Project Java-API and JGrasstools
modified: 2015-03-26
categories: articles
tags: [gsoc]
share: true
image:
  teaser: gsoc2015jgrass-teaser-450.png
---

{% include toc.html %}

## Abstract

The Zoo-Project is a solid OGC WPS server that works well with many programming languages. 
The Java API has not been tested in advanced configurations or with complex data types. JGrasstools, a 
modular processing library, as well as other Java based GIS toolkits (as JTS, Sextante or Geotools) would benefit a lot 
from the possibility to be used within a WPS environment. The proposal is to bring the ZOO-Project 
Java binding to a mature level and validate them by exposing JGrasstools as WPS.

[Link to the 2015 GSoC proposal](http://www.google-melange.com/gsoc/proposal/public/google/gsoc2015/allixender/5717271485874176)

## Further info

I wrote a [few sentences about my preparations](http://allixender.blogspot.co.nz/2015/03/zoo-project-wps-java-api-and.html) 
for this GSoC proposal. Unfortunately I also didn't have time to drive this further still. 
However, it is just soooo close really :-) Alternatively a 52North WPS implementation based on the super practical 
JGrasstools annotations and Andrea's generator would also be relatively straightforward.

[So I started some more experiments](https://github.com/allixender/jgrasstools/tree/master/wpsgen) ... 
I streamlined the WPS module generation for ZOO-Project and 52°North WPS processes. In fact, for 52N WPS it's even closer now, 
as their WPS implementation is also based on Java.