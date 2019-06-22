#!/bin/bash

###############
#Capture System Resource Utilization
###############

echo  $(date) "::: Disk Space:::" $(df -h) >> /NGIScripts/DeploymentScript/top.txt;
echo  $(date) ":::" $(vmstat -s)  >> /NGIScripts/DeploymentScript/top.txt;