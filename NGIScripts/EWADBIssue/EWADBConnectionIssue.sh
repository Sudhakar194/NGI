#!/bin/bash
#telnet 10.39.217.3 1521
if grep -q "XML schema validation error" "/var/log/messages"; then
   echo "DB Connection Error with EWA, Need to Restart EWA DMZ flow";
cd /opt/ibm/mqsi/7.0/bin/
. ./mqsiprofile
mqsistopmsgflow SNGIBRK1 -e PORTALPLUS_EXEGRP_DMZ -m com.ngi.EWAServiceFlow
sleep 5
mqsistartmsgflow SNGIBRK1 -e PORTALPLUS_EXEGRP_DMZ -m com.ngi.EWAServiceFlow
echo "Flow Restarted Successfully";
fi
