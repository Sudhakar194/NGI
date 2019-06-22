#!/bin/bash

###############
#ExecutionGrop#PortNumber(HTTPS, HTTP)
#EXEGRP1:7843
#eBANK_EXE_GRP: 7846
#EXEGRP_EXT_SERVICES: 7844
#BLISEXEGRP: 7845, 7802
#PORTALPLUS_EXEGRP_DMZ: 7847, 7803
#PORTALPLUS_EXEGRP_BPEL: 7848, 7800
#IVR_EXE_GRP: 7853
#MOBILE_EXE_GRP: 7854
#TawasulV3: 7855, 7810
#KIOSK_EXE_GRP: 7856, 7811
###############

BrokerName=SNGIBRK1
usageText="USAGE: DeploymentScript.sh ExeGrp BarName ChangeDesc RequestedBy"
ExeGrp=$1
BarName=$2
ChangeDesc=$3
RequestedBy=$4

if [ "$1" = "" ]
then
echo "$usageText";
exit 0
fi
if [ "$2" = "" ]
then
echo "$usageText";
exit 0
fi
if [ "$3" = "" ]
then
echo "$usageText";
exit 0
fi
if [ "$4" = "" ]
then
echo "$usageText";
exit 0
fi

mqsiapplybaroverride -b $BarName.bar -p $BarName.properties
sleep 2
mqsideploy $BrokerName -e $ExeGrp -a $BarName.bar

if [ "$1" = "EXEGRP1" ]
then
    echo  $(date) ", 7843, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
	elif [ "$1" = "eBANK_EXE_GRP" ]
then
    echo  $(date) ", 7846, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
	elif [ "$1" = "EXEGRP_EXT_SERVICES" ]
then
    echo  $(date) ", 7844, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
	elif [ "$1" = "BLISEXEGRP" ]
then
    echo  $(date) ", 7845, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
	elif [ "$1" = "PORTALPLUS_EXEGRP_DMZ" ]
then
    echo  $(date) ", 7803, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
	elif [ "$1" = "PORTALPLUS_EXEGRP_BPEL" ]
then
    echo  $(date) ", 7848, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
	elif [ "$1" = "SADAD_IVR_EXE_GRP" ]
then
    echo  $(date) ", 7853, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
	elif [ "$1" = "MOBILE_EXE_GRP" ]
then
    echo  $(date) ", 7854, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
		elif [ "$1" = "TawasulV3" ]
then
    echo  $(date) ", 7855, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
		elif [ "$1" = "KIOSK_EXE_GRP" ]
then
    echo  $(date) ", 7856, $BarName, $RequestedBy, $ChangeDesc, $ExeGrp" >> /NGIScripts/DeploymentScript/DeploymentLog.csv;
else
    echo "Invalid Execution Group Name";
fi
