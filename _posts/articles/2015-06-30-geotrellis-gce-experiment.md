---
layout: article
title: A GeoTrellis Spark Cassandra Experiment on Google Compute Engine
modified: 2015-06-30
categories: articles
tags: [gsoc]
share: true
image:
  teaser: gsoc2015geocas-teaser-450.png
---

{% include toc.html %}

TL;DR: I manually created a [GCE](https://cloud.google.com/) instance (8 vCPU, 30 GB RAM, 100 GB SSD) in the Google Web Console and installed Spark, Cassandra and tested a 
spark-submit geotrellis ingest command of a NetCDF climate file into the Cassandra database, using a
a current GeoTrellis 0.10.0-SNAPSHOT with Cassandra support.

[Link to a  GitHub Gist capturing most cmdline stuff](https://gist.github.com/allixender/ccc5831e726f5fc7679d)

## Some thoughts on the process

Initially I had only provided driver memory of 3 GB, because I started first experiments on my laptop. The NetCDF file to ingest at first 
was "only" 1.8 GB, but my local Spark run would always abort and say I don't have sufficient space on my HDD. Maybe it was 
a RAM issue? So I tried with `--conf spark.shuffle.consolidateFiles=true` but it didn't change anything.

So I created the Google Compute Engine instance, with 8 vCpu, 30 GB RAM and a 100 GB local SSD. Then I re-iterated 
the whole lot of install and config manually, to see what needs to be done etc.

I particularly struggled long time with the GDAL Java bindings until I realised, that the Spark workers / executors also 
need to know the LD_LIBRARY-PATH or -Djava-library.path for the native lbraries. So in the meantime I also compiled the whole 
GDAL stack to manually create the GDAL Java bindings, to then compile and link GeoTrellis Gdal modules gainst this 
local install. Not sure if that's actually necessary. The challenge also seemed 

I configured sort of a stand-alone Spark cluster, with starting the local master `sbin/start-master.sh` and starting two 
workers with

```shell
bin/spark-class org.apache.spark.deploy.worker.Worker spark://127.0.0.1:7077 >> worker1.log &
```

This GCE instance would cost roughly 200 USD per month. So for the fun of it I cannot afford to have it running all the time. 
Presumably the whole run incl. installation, compile times, ingests and then benchmark as of now took me maybe already 10-20 hours, 
which would amount to about 20 USD, if I don't push it much further. For a company it's peanuts, for s student it's still great though to 
be as resourceful as possible.

The actual ingest complained also about not having enough memory to cache RRDs. I now believe, that this is because I forgot to eliminate 
the driver and executor memory limits of 3 GB which came from my lapt top tests. Those spark-submit cmdlines grow really long parameter 
lists.

## Future work

For GeoTrellis already exists an [AWS EC2 Cluster deployment](https://github.com/geotrellis/geotrellis-ec2-cluster) project and 
the Cassandra integration is [being developed](https://github.com/geotrellis/geotrellis-ec2-cluster/tree/feature/hmc/cassandra-support). Hmm, I should test that actually :-)

Furthermore, based on some, I'd call them relevant, technology leaders' information on Spark with Mesos on GCE, 
Mesosphere or Docker e.g.

- [Datastax Deployment on GCE](https://academy.datastax.com/demos/datastax-enterprise-deployment-guide-google-compute-engine)
- [Typesafe Spark Kafka Cassandra Akka on Mesos](https://www.typesafe.com/blog/using-spark-kafka-cassandra-and-akka-on-mesos-for-real-time-personalization)
- [Mesosphere Cassandra on Mesos](https://mesosphere.com/blog/2014/02/12/cassandra-on-mesos-scalable-enterprise-storage/)
- [Cake Solutions Cassandra Mesos Docker](http://www.cakesolutions.net/teamblogs/cassandra-mesos-docker)

... it'll be certainly intriguing to get larger GeoTrellis Cassandra Spark clusters up and an running with those automagical mass 
deployment tools together, e.g. with Mesos, not necessarily with Docker, on the [Google Cloud Platform](https://cloud.google.com/).
 
However, as [someone nicely pointed out](http://koeninger.github.io/spark-cassandra-example/#14)

_quote start_

What about other deploy modes?

- *Local mode*: OK for testing, but you can also just run standalone mode with one or two workers on your laptop.

- *EC2 scripts*: A convenience for frequently bring up / shutting down spark, which is probably not what you're doing if you're co-installing spark with cassandra.

- *YARN*: Don't do this unless you have a YARN cluster already

- *Mesos*: Don't do this unless:
  - you have a Mesos cluster already AND
  - need fine-grained sharing of CPU resources, AND
  - like looking through twice as many developer mailing lists when something doesn't work the way you expect.

_quote end_

*yeah, right, hahaha*