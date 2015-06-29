---
layout: article
title: SOS for CLIDB Mid-term - we got data
modified: 2013-02-04
categories: articles
tags: [eresearch]
share: true
image:
  teaser: eresearchniwa-teaser-450.png
---

{% include toc.html %}

## Abstract

Based on the "vanilla" code from the 52North SVN repository I basically added a CLIDBHelper 
class to the "52n-sos-hibernate-core" Maven module that encapsulates the CLIDB database connection 
and re-directed most of the original Hibernate calls from the core DAOs to the helper. 
Especially the Cache Feeder DAO needed a lot of attention, as it would fill the internal 
"capabilities" cache, which is the basic thing that needs to happen before the SOS instance is actually usable. 
Then Describe Sensor DAO and GetObservation DAO are pretty straightforward, as they would "just" do specific queries, 
like give me the sensor description for sensor station XY or give rainfall data for station XY in the time period ...

[Link to the full 2013 eResearch blog post](http://live-eresearchnz.pantheon.io/content/sos-clidb-mid-term-we-got-data)

## Final NZ Summer of eResearch 2012 presentation slides

The final student project presentations were held in Wellington at Victoria University.

[Link to the slides of the final student project presentation](https://drive.google.com/file/d/0ByrRtJZhFedFT3g0N085LWxYOG8/view?usp=sharing)




