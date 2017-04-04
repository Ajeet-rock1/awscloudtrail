#!/bin/bash
year=`date +%Y`
month=`date +%m`
day=`date +%d`
filetopull=`/usr/local/bin/s3cmd ls  s3://jc-pd-ct-001/AWSLogs/832198632263/CloudTrail/ap-south-1/$year/$month/$day/* |  tail -1 | awk '{print $4}'`
fileforgunzip=`basename $filetopull`
finalfile=`basename $filetopull .gz`
/usr/local/bin/s3cmd get  $filetopull
gunzip -f $fileforgunzip
cat $finalfile  | /usr/bin/jq -r -M .Records[] -c >> /var/log/cloudtrail/Jiocloud.json
rm -f $finalfile

