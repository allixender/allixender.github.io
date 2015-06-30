---
layout: article
title: Google Cloud Platform SDK Commands to get started
modified: 2015-07-05
categories: articles
tags: [gsoc]
share: true
image:
  teaser: gsoc2015geocas-teaser-450.png
---

{% include toc.html %}

## glcoud

TBD...

```shell

# install
curl https://sdk.cloud.google.com | bash

gcloud config list --all

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


gcloud auth list
gcloud auth login

# given that service account was created and the json file contains the key eyport from creation
gcloud auth activate-service-account  --key-file cloud-project1.json

gcloud compute instances --help

gcloud compute instances list

# with and without project because default project from config
gcloud compute instances describe --project groundwater-cloud --zone us-central1-f sparkcas1
gcloud compute instances describe --zone us-central1-f sparkcas1
  
gcloud compute instances start --zone us-central1-f sparkcas1

gcloud compute instances describe --zone us-central1-f sparkcas1
gcloud compute instances list

gcloud compute --project "groundwater-cloud" ssh --zone "us-central1-f" "sparkcas1"

gcloud compute --project "cloud-project1" copy-files myfile.bin user1@cloud-instance1:~ --zone "us-central1-f"

gsutil cp gs://big-geodata1/tasmax_day_CCSM4_rcp60_r1i1p1_20060101-20401231.nc .


```