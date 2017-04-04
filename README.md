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


