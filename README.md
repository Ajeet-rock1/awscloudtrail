# Awscloudtrail

AWS api log will go in cloudtrail and we need to pull these log from cloudtrail to in ELKStack Analytics Enviorment.
How can i achieve these stuff?

1:-  we need to create S3 bucket for cloudtrail log 

2:-  These cloutrail log will export in S3 bucket which i have created

3:-  then we should give the permission on that IAM user whoch i have allow the access for these Cloudtrail S3 bucket.

4:-  After that we need to install AWS ClI or S3cmd in my Local machine or ELK Stack Enviorment.

5:-  We need to connectvity from ELKStack to Cloudtrail S3 Bucket (If your ELK is runnign on the same AWS tenent then we should connect local or if your ELK is running different enviormemt like your own cloud like (Pvt Cloud Openstack) then you access via Internet Proxy which is used by your DevOps Team.

6:-  Then ned to install S3cmd and configure the access key, Secret key, region (s3 bucket resgion) and Proxy details woth ports.

7:-  we need to create script for pull the data from Cloudtrail S3 bucket to your premises

8:-  MOst Important thing which is regarding for Cloudtrail Log becasue cloudtrail log format is json and we need to same thing in your env then you should have any parser or batch file like JQ.

9:- you should install JQ (Java query) in your logstash then no need to write parser etc in your logstash node as input for pull the data from your node which have s3cmd and JQ.


How to Install s3cmd in Linux and Manage Amazon s3 Buckets.

s3cmd is a command line utility used for creating s3 buckets, uploading, retrieving and managing data to Amazon s3 storage. This article will help you to how to use install s3cmd on CentOS, RHEL, OpenSUSE, Ubuntu, Debian & LinuxMint systems and manage s3 buckets via command line in easy steps. 

Install s3cmd Package:-

s3cmd is available in default rpm repositories for CentOS,RHEL and Ubuntu systems, You can install it using simply executing following commands on your system.









