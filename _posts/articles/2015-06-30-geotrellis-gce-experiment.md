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
local install. Not sure if that's actually necessary.

I configured sort of a stand-alone Spark cluster, with starting the local master `sbin/start-master.sh` and starting two 
workers with ..

`bin/spark-class org.apache.spark.deploy.worker.Worker spark://127.0.0.1:7077 >> worker1.log &`


I installed an Nginx reverse proxy to see the spark master web console.


    location / {
          proxy_pass http://127.0.0.1:8080;    
    }


This GCE instance would cost roughly 200 USD per month. So for the fun of it I cannot afford to have it running all the time. 
Presumably the whole run incl. installation, compile times, ingests and then benchmark as of now took me maybe already 10-20 hours, 
which would amount to about 20 USD, if I don't push it much further. For a company it's peanuts, for s student it's still great though to 
be as resourceful as possible.

The actual ingest complained also about not having enough memory to cache RRDs. I now believe, that this is because I forgot to eliminate 
the driver and executor memory limits of 3 GB which came from my lapt top tests. Those spark-submit cmdlines grow really long parameter 
lists. However, in the second run of the ingest I was more careful, but the same messages appeared sometimes:

    [Stage 4:=================================================================>      (23 + 1) / 24]
    11:02:11 MemoryStore: Not enough space to cache rdd_10_23 in memory! (computed 648.7 MB so far)


The second ingest took a bout 30 minutes.

The data size in Cassandra increased a lot.

    user1@cloud-instance1:~$ du -sh apache-cassandra-2.1.7/data/*
    4.0G    apache-cassandra-2.1.7/data/commitlog
    15G     apache-cassandra-2.1.7/data/data\
    396K    apache-cassandra-2.1.7/data/saved_caches

BTW, Cassandra determined its own memory requirements. And as it was written somewhere beyond 8GB heap garbage collection 
in cassandra becomse a real problem. But `ps -ef` shows ` -Xms7540M -Xmx7540M` which seems good (based on the machine with 30 GB RAM overall)

After the second ingest, I could try to run the benchmark and every two to five seconds `top` would basically switch 
between these two views:

... much Cassandra (a short burst)

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    2476 user1     20   0 12.029g 6.373g  30160 S 800.0 21.6  89:14.95 java (i.e. Cassandra)
    4572 user1     20   0 12.633g 614064  34084 S   1.0  2.0   0:12.81 java (i.e. geotrellis spark driver)
    2030 user1     20   0 3515344 256996   7284 S   0.7  0.8   0:24.71 java (spark master)
    2145 user1     20   0 3450064 235220   7244 S   0.3  0.8   0:20.30 java (spark worker)
    2264 user1     20   0 3450064 223608   7204 S   0.3  0.7   0:20.33 java (spark worker)

... no Cassndra, but also the spark workers don't have much to do.

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    2030 user1     20   0 3515344 256996   7284 S   0.7  0.8   0:25.20 java (i.e. Cassandra)
    4572 user1     20   0 12.633g 616512  34084 S   0.7  2.0   0:14.03 java (i.e. geotrellis spark driver)
    2145 user1     20   0 3450064 235220   7244 S   0.3  0.8   0:20.73 java (spark worker)
    2264 user1     20   0 3450064 223608   7204 S   0.3  0.7   0:20.76 java (spark worker)

After maybe half an hour, the driver program ran with about 100% CPU, presumably doing the actual first run of benchmarking. 
First result appeared another 2000 seconds later...

       12:12:28 CasBenchmark$: YEARLY AVERAGE OF DIFFERENCES ArraySeq((2024-01-01T00:00:00.000Z,-5.742096174281091), 
           (2040-01-01T00:00:00.000Z,-4.082999541556946), (2022-01-01T00:00:00.000Z,-6.916643693113496), 
           (2020-01-01T00:00:00.000Z,-0.12434280860278991), (2032-01-01T00:00:00.000Z,-2.076048279608781), 
           (2037-01-01T00:00:00.000Z,-3.251362344770221), (2016-01-01T00:00:00.000Z,-2.9338103677725176), 
           (2008-01-01T00:00:00.000Z,-4.526800691703725), (2025-01-01T00:00:00.000Z,-4.444756317590644), 
           (2015-01-01T00:00:00.000Z,-1.7933621930024923), (2018-01-01T00:00:00.000Z,1.8317703519666457), 
           (2030-01-01T00:00:00.000Z,-11.56568235966663), (2029-01-01T00:00:00.000Z,-5.528298940438058), 
           (2014-01-01T00:00:00.000Z,8.163989162639911), (2012-01-01T00:00:00.000Z,-0.05441557471953986), 
           (2006-01-01T00:00:00.000Z,-2.6361151595649175), (2007-01-01T00:00:00.000Z,-2.2866075483874537), 
           (2010-01-01T00:00:00.000Z,-3.5406655772197655), (2011-01-01T00:00:00.000Z,-5.0540570398991695), 
           (2036-01-01T00:00:00.000Z,-2.0227119828134787), (2023-01-01T00:00:00.000Z,-2.6087549888935255), 
           (2028-01-01T00:00:00.000Z,-9.611160488520209), (2035-01-01T00:00:00.000Z,-6.24592506571773), 
           (2027-01-01T00:00:00.000Z,-4.980359765178967), (2009-01-01T00:00:00.000Z,-1.114338171308529), 
       ...
       12:12:28 CasBenchmark$: Benchmark: {type: MultiModel-localSubtract-Average, 
            name: philadelphia, layers: List(Layer(name = "tasmaxrcp60ccsm4", zoom = 3), Layer(name = "tasmaxrcp60ccsm420", zoom = 3))} in 2050063 ms

The calculated data I realised later, was not really meaningful. However, the setup is going in the right direction :-)

## Future work

Concluding, something is really slow it seems. Rob from Azavea has mentioned that before, too.

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