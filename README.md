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
----------------------------------------------------------------

s3cmd is a command line utility used for creating s3 buckets, uploading, retrieving and managing data to Amazon s3 storage. This article will help you to how to use install s3cmd on CentOS, RHEL, Ubuntu, Debian systems and manage s3 buckets via command line in easy steps. 

Install s3cmd Package:-
-----------------------------------------------------------------

s3cmd is available in default rpm repositories for CentOS,RHEL and Ubuntu systems, You can install it using simply executing following commands on your system.

# yum install s3cmd

On Ubuntu/Debian:

$ apt-get install s3cmd


Install Latest s3cmd using Source 

$ wget http://ufpr.dl.sourceforge.net/project/s3tools/s3cmd/1.6.1/s3cmd-1.6.1.tar.gz
$ tar xzf s3cmd-1.6.1.tar.gz

Now install it using below command with source files.
---------------------------------------------------------------

$ cd s3cmd-1.6.1
$ sudo python setup.py install

 Configure s3cmd Environment
 ---------------------------------------------------------------

In order to configure s3cmd we would require Access Key and Secret Key of your S3 Amazon account. Get these security keys from aws securityCredentials page. If will prompt to login to your amazon account.

After getting key files, use below command to configure s3cmd.

# s3cmd --configure (in your ubuntu Platform)

Enter new values or accept defaults in brackets with Enter.
Refer to user manual for detailed description of all options.

Access key and Secret key are your identifiers for Amazon S3
Access Key: xxxxxxxxxxxxxxxxxxxxxx
Secret Key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Encryption password is used to protect your files from reading
by unauthorized persons while in transfer to S3
Encryption password: xxxxxxxxxx
Path to GPG program [/usr/bin/gpg]:

When using secure HTTPS protocol all communication with Amazon S3
servers is protected from 3rd party eavesdropping. This method is
slower than plain HTTP and can't be used if you're behind a proxy
Use HTTPS protocol [No]: Yes

New settings:
  Access Key: xxxxxxxxxxxxxxxxxxxxxx
  Secret Key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  Encryption password: xxxxxxxxxx
  Path to GPG program: /usr/bin/gpg
  Use HTTPS protocol: True
  HTTP Proxy server name:
  HTTP Proxy server port: 0

Test access with supplied credentials? [Y/n] Y
Please wait, attempting to list all buckets...
Success. Your access key and secret key worked fine :-)

Now verifying that encryption works...
Success. Encryption and decryption worked fine :-)

Save settings? [y/N] y
Configuration saved to '/root/.s3cfg'


Uses of s3cmd Command Line
------------------------------------------------------

Once configuration is successfully completed. Now find below command details to how to manage s3 buckets using commands.

1. List All S3 Bucket 

Use following command to list all s3 buckets in your aws account.

# s3cmd ls

2. Creating New Bucket

To create a new bucket in Amazon s3 use below command. It will create bucket named delta in S3 account.

# s3cmd mb s3://delta

Bucket 's3://delta/' created

3. Uploading file in Bucket

Below command will upload file test.txt to s3 bucket using s3cmd command.

# s3cmd put file.txt s3://tecadmin/

file.txt -> s3://delta/test.txt  [1 of 1]
 70119 of 70119   100% in    0s  976.82 kB/s  done
 
 4. Uploading Directory in Bucket

If we need to upload entire directory use -r to upload it recursively like below.

# s3cmd put -r backup s3://delta/

backup/test.txt -> s3://delta/backup/test.txt  [1 of 2]
 9876 of 9876  100% in    0s    12.98 kB/s  done
backup/test1.txt -> s3://delta/backup/test1.txt  [2 of 2]
 0 of 0     0% in    0s     0.00 B/s  done
 
 Make sure you are not adding trailing slash/ in upload directory named backup (eg: backup/), else it will upload only content of backup directory only.
 
 # s3cmd put -r backup/ s3://delta/

backup/test.txt -> s3://delta/test.txt  [1 of 2]
70119 of 70119   100% in    0s    12.98 kB/s  done
backup/test1.txt -> s3://delta/test1.txt  [2 of 2]
 0 of 0     0% in    0s     0.00 B/s  done


5. List Data of S3 Bucket

List the objects of s3 bucket using ls switch with s3cmd.

# s3cmd ls s3://delta/

                       DIR   s3://delta/backup/
2017-04-04 10:58    190216   s3://delta/test.txt

6. Download Files from Bucket

Some times if we need to download files from s3 bucket, Use following commands to download it.

# s3cmd get s3://delta/test.txt

s3://delta/test.txt -> ./test.txt  [1 of 1]
 4 of 4   100% in    0s    10.84 B/s  done
 
 7. Remove Data of S3 Bucket

To remove files are folder from s3 bucket use following commands.

 Removing file from s3 bucket 
# s3cmd del s3://delta/test.txt

File s3://delta/test.txt deleted

 Removing directory from s3 bucket 
# s3cmd del s3://delta/backup

File s3://delta/backup deleted

8. Remove Object in  S3 Bucket

If we don’t need Object in s3 bucket any more, we can simply delete it using following command. Before removing bucket make sure its empty.

s3cmd del -r  s3://delta/test























