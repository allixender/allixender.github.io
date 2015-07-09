---
layout: article
title: Google Cloud Platform SDK Commands to get started
modified: 2015-07-05
categories: articles
tags: [gsoc]
share: true
image:
  teaser: gcloud-teaser-450.png
---

{% include toc.html %}

## For beginners, work in progress...

Useful `gcloud`, `gsutil` command lines from the Google Cloud Platform (GCP) SDK to get started immediately.
When you sign up right now for the [Google Cloud Platform](https://cloud.google.com/), you might get a 
300 USD credit to be used within the next 2 montns to play with.

Before starting with the shell and later maybe also API examples, you have to create a project. The easiest is to do 
that is in the [developer console](https://console.developers.google.com/). A project is like a workspace, where all 
used resources are billed. So for different clients or your different projects, particularly if they are 
going to be paid from different sources, you might want to have separate GCP projects. Alternatively if particularly API orchestration, 
would suffer under a strong resource separation, then well, you better have more stuff within one GCP project. To get started one GCP project is enough anyway.

So after you've created the project in the [Google developer console](https://console.developers.google.com/) you'd need 
to enable the different Google Cloud APIs for your project, so you can manage resources from outside the web console.

Keep the console open as a reference to see how you manipulate GCP objects and instances via command line and API.

    # install google cloud sdk
    $> curl https://sdk.cloud.google.com | bash
    
    # list authenticated accounts, will likely ask you to login
    $> gcloud auth list
    
    # will send you to web site to verify credentials and retrieve security token
    $> gcloud auth login
    
    # list config items, important to see you can set default compute region/zone, and project
    $> gcloud config list --all
    
    [app]
    admin_host (unset)
    api_host (unset)
    host (unset)
    hosted_registry (unset)
    [component_manager]
    additional_repositories (unset)
    disable_update_check (unset)
    fixed_sdk_version (unset)
    [compute]
    region (unset)
    zone (unset)
    [container]
    cluster (unset)
    [core]
    account = allixender@googlemail.com
    credentialed_hosted_repo_domains (unset)
    disable_color (unset)
    disable_prompts (unset)
    disable_usage_reporting = False
    project = groundwater-cloud
    user_output_enabled (unset)
    verbosity (unset)
    
    
    
    $> gcloud compute instances --help
    $> gcloud compute instances list
    
    # with and without project because default project from config
    $> gcloud compute instances describe --project cloud-project1 --zone us-central1-f cloud-instance1
    $> gcloud compute instances describe --zone us-central1-f sparkcas1
      
    $> gcloud compute instances start --zone us-central1-f sparkcas1
    
    $> gcloud compute instances describe --zone us-central1-f sparkcas1
    $> gcloud compute instances list
    
    $> gcloud compute --project "cloud-project1" copy-files myfile.bin user1@cloud-instance1:~ --zone "us-central1-f"
    
    $> gcloud compute --project "cloud-project1" ssh --zone "us-central1-f" "cloud-instance1"
    
    # given that service account was created and the json file contains the key export from creation
    # on GCE instances it's better to use service accounts which authenticate the instance to access other resources like 
    # cloud storage buckets
    $> gcloud auth activate-service-account  --key-file cloud-project1.json
    
    # then you can easily access those buckets from the instance
    $> gsutil cp gs://big-geodata1/tasmax_day_CCSM4_rcp60_r1i1p1_20060101-20401231.nc .
    
    # or rsync like with parallel threads
    $> gsutil -m rsync -r _site/ gs://www.maerchenland-rostock.de/

    
### Create full base instance commandline

    $> gcloud compute --project "groundwater-cloud" instances create "mesos1" --description "Mesos Master and Zookeeper" 
    --zone "us-central1-f" --machine-type "g1-small" --network "default" 
    --metadata "mesos=master" "zookeeper=master" "cassandra=seed" "startup-script=#!/bin/bash\u000asudo apt-get update && apt-get upgrade -y" 
    "sshKeys=akmoch:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjHZb0zPCijcfSez05RcW0PhVSzMRKgqYTCeQX5gMzDxxiYoL6TKBEhoqbBxbWg35rgfjqVtgH8ViyncbYUP+XcxIe72qQakbCM0hwMRq7I/yKt3TOmXMdF2uDoY23slNaJSQA2J+CUzohFHNNymYr2SJTwRsQv/XjzCBWmu6zoaUkFZK4CTVKEiQul0T2MjKDpH/ly2l1c1R5p04m7+X1QauX67ESN2Z7u/srF/7irvGRtklPeZartVtpCQYq7NEK0pLOCTRAMZH1po1Mi+oBJt/VUeywbQY8pyzbJYxbrTRpShCfeSfZdTljth2792hQET356S9fmaBr2HuH517Z akmoch@acer1\u000aakmoch:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVIIG7ZCeU5SOIgjmFc9W0MmNferqg1wNgzdvuU+fAp/ZN0UY7p/5V+XQQ3jEVESO8BFHJfhmt38Xca8IwP9FLIYHFWnYUajEH941oWYcQ+5idmBRNWvgYwsU7prlMnc5BeZ+AhZLbrz08xEu1FxncipLdWByrHABCunXaXJzrpggAgJ4ey7pQqzlkWyR9oZCUVJkv/sY+Y6hKMPTvP4/QuSQ2/TLad/32+mAZkvpV+MtpldUwAih8AD6Z40DBSy4lMZvwIKmZ+LlSq2YkDH2z8U5KJTsTXudqSP2c0DSVJIHAwbPSyFjk+2aJzPqZUofVRE/Cw4uWeWRPIpkf9NZ3 akmoch@acer1" 
    --maintenance-policy "MIGRATE" --scopes "https://www.googleapis.com/auth/userinfo.email" "https://www.googleapis.com/auth/devstorage.read_only" 
    "https://www.googleapis.com/auth/logging.write" --tags "http-server" "https-server" "mesos-master" "zk-master" 
    --image "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-1404-trusty-v20150316" 
    --no-boot-disk-auto-delete --boot-disk-type "pd-standard" --boot-disk-device-name "mesos1"
    
or REST

    POST https://www.googleapis.com/compute/v1/projects/groundwater-cloud/zones/us-central1-f/instances
    {
      "name": "mesos1",
      "zone": "https://www.googleapis.com/compute/v1/projects/groundwater-cloud/zones/us-central1-f",
      "machineType": "https://www.googleapis.com/compute/v1/projects/groundwater-cloud/zones/us-central1-f/machineTypes/g1-small",
      "metadata": {
        "items": [
          {
            "key": "mesos",
            "value": "master"
          },
          {
            "key": "zookeeper",
            "value": "master"
          },
          {
            "key": "cassandra",
            "value": "seed"
          },
          {
            "key": "startup-script",
            "value": "#!/bin/bash\nsudo apt-get update && apt-get upgrade -y"
          },
          {
            "key": "sshKeys",
            "value": "akmoch:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjHZb0zPCijcfSez05RcW0PhVSzMRKgqYTCeQX5gMzDxxiYoL6TKBEhoqbBxbWg35rgfjqVtgH8ViyncbYUP+XcxIe72qQakbCM0hwMRq7I/yKt3TOmXMdF2uDoY23slNaJSQA2J+CUzohFHNNymYr2SJTwRsQv/XjzCBWmu6zoaUkFZK4CTVKEiQul0T2MjKDpH/ly2l1c1R5p04m7+X1QauX67ESN2Z7u/srF/7irvGRtklPeZartVtpCQYq7NEK0pLOCTRAMZH1po1Mi+oBJt/VUeywbQY8pyzbJYxbrTRpShCfeSfZdTljth2792hQET356S9fmaBr2HuH517Z akmoch@acer1\nakmoch:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVIIG7ZCeU5SOIgjmFc9W0MmNferqg1wNgzdvuU+fAp/ZN0UY7p/5V+XQQ3jEVESO8BFHJfhmt38Xca8IwP9FLIYHFWnYUajEH941oWYcQ+5idmBRNWvgYwsU7prlMnc5BeZ+AhZLbrz08xEu1FxncipLdWByrHABCunXaXJzrpggAgJ4ey7pQqzlkWyR9oZCUVJkv/sY+Y6hKMPTvP4/QuSQ2/TLad/32+mAZkvpV+MtpldUwAih8AD6Z40DBSy4lMZvwIKmZ+LlSq2YkDH2z8U5KJTsTXudqSP2c0DSVJIHAwbPSyFjk+2aJzPqZUofVRE/Cw4uWeWRPIpkf9NZ3 akmoch@acer1"
          }
        ]
      },
      "tags": {
        "items": [
          "http-server",
          "https-server",
          "mesos-master",
          "zk-master"
        ]
      },
      "disks": [
        {
          "type": "PERSISTENT",
          "boot": true,
          "mode": "READ_WRITE",
          "deviceName": "mesos1",
          "autoDelete": false,
          "initializeParams": {
            "sourceImage": "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-1404-trusty-v20150316",
            "diskType": "https://www.googleapis.com/compute/v1/projects/groundwater-cloud/zones/us-central1-f/diskTypes/pd-standard",
            "diskSizeGb": "10"
          }
        }
      ],
      "canIpForward": false,
      "networkInterfaces": [
        {
          "network": "https://www.googleapis.com/compute/v1/projects/groundwater-cloud/global/networks/default",
          "accessConfigs": [
            {
              "name": "External NAT",
              "type": "ONE_TO_ONE_NAT"
            }
          ]
        }
      ],
      "description": "Mesos Master and Zookeeper",
      "scheduling": {
        "preemptible": false,
        "onHostMaintenance": "MIGRATE",
        "automaticRestart": true
      },
      "serviceAccounts": [
        {
          "email": "default",
          "scopes": [
            "https://www.googleapis.com/auth/userinfo.email",
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write"
          ]
        }
      ]
    }

## Little exercise on Zookeeper and Mesos cluster

Just to be prepared to build anything along mesos, zookeeper, cassandra, spark, geotrellis, gdal ...

    $> sudo apt-get -y install libgdal-java libgdal-dev gdal-bin netcdf-bin libnetcdf-dev openjdk-7-jdk git build-essential autoconf automake 
    libtool zlib1g-dev swig ant libstdc++6-4.6-dev libstdc++5 libstdc++-4.8-dev 
    libc++-dev ruby-dev make autoconf nodejs nodejs-legacy python-dev python-boto libcurl4-nss-dev libsasl2-dev maven libapr1-dev libsvn-dev nginx

Can be factored out into e.g. [Ansible roles](https://gist.github.com/samklr/2faf7ebe0ee64923f35d) or the likes

    # Sourcing out the main install packages to central place in the project.
    $> gsutil -m cp -e -c apache-cassandra-2.1.2-bin.tar.gz,apache-cassandra-2.1.5-bin.tar.gz,cassandra-mesos-2.1.2-1.tgz,jdk-8u45-linux-x64.gz,jdk-8u45-linux-i586.gz,jdk-7u80-linux-x64.tgz,jdk-7u80-linux-i586.tgz gs://install-swd5ef6/
    
Now also those install files can be placed in the machine

    $> gsutil cp gs://install-swd5ef6/{cassandra-mesos-2.1.2-1.tgz,apache-cassandra-2.1.2-bin.tar.gz,jdk-7u80-linux-x64.tgz,mesos-0.22.1.tar.gz,spark-1.2.2-bin-hadoop2.4.tgz}
    
### Zookeeper basics

    $> sudo apt-get -y install zookeeper zookeeper-bin zookeeperd libzookeeper-java
    
    # editing /etc/zookeeper/conf/myId
    # setting up aliases for the cluster members in zoo.cfg and hosts (or via DNS, can always be more automatic certainly)
    # restart services
    # check status
    $> echo stat | nc localhost 2181 | grep Mode
    Mode: follower
    
    # or leader depends, of course
    # extract mesos, spark and cassandra, jdk and create ENV and export PATHs
    $> vi .bash_profile
    JAVA_HOME=/usr/lib/jvm/jdk1.7.0_80
    JRE_HOME=$JAVA_HOMR/jre
    PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
    
    export JAVA_HOME
    export JRE_HOME
    export PATH
    
    MESOS_HOME=/home/akmoch/mesos-0.22.1
    SPARK_HOME=/home/akmoch/spark-1.2.2-bin-hadoop2.4
    CASSANDRA_HOME=/home/akmoch/cassandra-mesos-2.1.2-1
    
    export MESOS_HOME
    export SPARK_HOME
    export CASSANDRA_HOME

### Mesos basics

[gotta install](http://mesos.apache.org/gettingstarted/) it for Ubuntu?!

- unzip, cd into and `./bootstrap
- `mkdir build`, `cd build` and `../configure`
- `make`
- ... wait

Or get a binary [install from Mesosphere](https://mesosphere.com/downloads/) via apt or [package](http://open.mesosphere.com/downloads/mesos/#apache-mesos-0.22.1)

    # Setup
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
    DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
    CODENAME=$(lsb_release -cs)
    
    # Add the repository
    echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | \
      sudo tee /etc/apt/sources.list.d/mesosphere.list
    sudo apt-get -y update
    sudo apt-get -y install mesos marathon

On the one test master start the mesos-master and on the slaves starting the mesos-slaves. Through their local zookeeper instance they'll find the master.
For Marathon, just start `sudo service marathon start` on all nodes, it'll negotiate through zookeeper and mesos-master

    
## create image of a base install

    $> gcloud compute --project "groundwater-cloud" images create "my-mesos-base-image" --description "ubu 14.04 LTS, updated, zookeeper installed, jdk available, mesos, cassandra and spark packages on disk" --source-disk https://www.googleapis.com/compute/v1/projects/groundwater-cloud/zones/us-central1-f/disks/mesos1

    # and fire up 3 instances from that image
    $> gcloud compute --project "groundwater-cloud" instances create "mesos-2" --description "Basic Mesos and Zookeeper" --zone "us-central1-f" 
    --machine-type "g1-small" --network "default" --metadata "mesos=master,zookeeper=master,cassandra=seed,sshKeys=akmoch:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjHZb0zPCijcfSez05RcW0PhVSzMRKgqYTCeQX5gMzDxxiYoL6TKBEhoqbBxbWg35rgfjqVtgH8ViyncbYUP+XcxIe72qQakbCM0hwMRq7I/yKt3TOmXMdF2uDoY23slNaJSQA2J+CUzohFHNNymYr2SJTwRsQv/XjzCBWmu6zoaUkFZK4CTVKEiQul0T2MjKDpH/ly2l1c1R5p04m7+X1QauX67ESN2Z7u/srF/7irvGRtklPeZartVtpCQYq7NEK0pLOCTRAMZH1po1Mi+oBJt/VUeywbQY8pyzbJYxbrTRpShCfeSfZdTljth2792hQET356S9fmaBr2HuH517Z akmoch@acer1\u000aakmoch:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVIIG7ZCeU5SOIgjmFc9W0MmNferqg1wNgzdvuU+fAp/ZN0UY7p/5V+XQQ3jEVESO8BFHJfhmt38Xca8IwP9FLIYHFWnYUajEH941oWYcQ+5idmBRNWvgYwsU7prlMnc5BeZ+AhZLbrz08xEu1FxncipLdWByrHABCunXaXJzrpggAgJ4ey7pQqzlkWyR9oZCUVJkv/sY+Y6hKMPTvP4/QuSQ2/TLad/32+mAZkvpV+MtpldUwAih8AD6Z40DBSy4lMZvwIKmZ+LlSq2YkDH2z8U5KJTsTXudqSP2c0DSVJIHAwbPSyFjk+2aJzPqZUofVRE/Cw4uWeWRPIpkf9NZ3 akmoch@acer1" 
    --maintenance-policy "MIGRATE" --scopes "https://www.googleapis.com/auth/userinfo.email,https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write" 
    --tags "http-server,https-server,mesos-master,zk-master" --image "https://www.googleapis.com/compute/v1/projects/groundwater-cloud/global/images/my-mesos-base-image" 
    --no-boot-disk-auto-delete --boot-disk-type "pd-standard" --boot-disk-device-name "mesos-2-hdd"


TBC ...

## More automation links for advanced playgrounds

- A full [vagrant GCE toolkit](https://github.com/mitchellh/vagrant-google) worthwile looking at
- An [Ansible GCE Gist](https://gist.github.com/samklr/2faf7ebe0ee64923f35d)
- most mesos automation tools are is either mesosphere, loca vagrant and virtualbox or EC2
  - [Playa Mesos](https://github.com/everpeace/vagrant-mesos) helps you quickly create Apache Mesos test environments. This project relies on VirtualBox, Vagrant, and an 
  Ubuntu box image which has Mesos and Marathon pre-installed.
  - [vagrant-mesos](https://github.com/mesosphere/playa-mesos) Spin up your Mesos cluster with Vagrant! (Both Virtualbox and AWS are supported.) 

## Mesos and Cassandra

Mesosphere folks [currently recommend deployment via Marathon](https://github.com/mesosphere/cassandra-mesos#running-the-framework) and  
[provide a marathon.json with a job description](https://teamcity.mesosphere.io/guestAuth/repository/download/Oss_Mesos_Cassandra_CassandraFramework/.lastSuccessful/marathon.json) to deploy Cassandra. 
Their [mesos cassandra framework](http://mesosphere.github.io/cassandra-mesos/docs/) is supposedly intelligent enough 
to bootstrap the cassandra cluster which does initially need known and available seed nodes. Subsequently further nodes can be added to the cluster, because the maximum 
recommended number of seed nodes is only 3.

