#!/bin/bash

myrule="my-fw-01"
gcloud_cmd="gcloud"  # cloud shell
#gcloud_cmd="./google-cloud-sdk/bin/gcloud" # on your PC

myip=$(curl ifconfig.me)
currentlist=$($gcloud_cmd compute firewall-rules describe $myrule --format="value(sourceRanges.list())")

$gcloud_cmd compute firewall-rules update $myrule --source-ranges="$currentlist,$myip"
