#!/bin/bash
year=`date +%Y`
month=`date +%m`
day=`date +%d`
filetopull=`/usr/local/bin/s3cmd ls  s3://dummy/AWSLogs/987675675963/CloudTrail/us-east-1/$year/$month/$day/* |  tail -1 | awk '{print $4}'`
fileforgunzip=`basename $filetopull`
finalfile=`basename $filetopull .gz`
/usr/local/bin/s3cmd get  $filetopull
gunzip -f $fileforgunzip
cat $finalfile  | /usr/bin/jq -r -M .Records[] -c >> /var/log/cloudtrail/Delta.json
rm -f $finalfile

