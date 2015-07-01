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

TBC ...