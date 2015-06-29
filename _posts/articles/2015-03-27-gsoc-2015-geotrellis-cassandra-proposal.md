---
layout: article
title: GeoTrellis Cassandra Backend to GeoTrellis-Spark
modified: 2015-03-27
categories: articles
tags: [gsoc]
share: true
image:
  teaser: gsoc2015geocas-teaser-450.png
---

{% include toc.html %}

## Abstract

GeoTrellis is a Scala framework for fast, parallel processing of geospatial data. 
GeoTrellis also supports raster data processing on Apache Spark. GeoTrellis supports Hadoop HDFS and 
Accumulo as Spark backends. Cassandra is another popular distributed data store. 
This project aims to improve the GeoTrellis Catalog prototype implementation for 
Cassandra to allow processing of raster layers via Spark RDDs as well as add vector RDD capabilties, 
with a focus on a performance-based indexing scheme.

[Link to the 2015 GSoC proposal](http://www.google-melange.com/gsoc/proposal/public/google/gsoc2015/allixender/5676830073815040)

## Further info

- [few sentences about my preparations and considerations](http://allixender.blogspot.co.nz/2015/05/google-summer-of-code-2015-with.html) 
- [my Cassandra GeoTrellis contributions on GitHub](https://github.com/allixender/geotrellis)
- [a little support on the GeoTrellis site documentations](https://github.com/allixender/geotrellis-site)
- [integrating a Cassandra benchmark](https://github.com/allixender/benchmark)


