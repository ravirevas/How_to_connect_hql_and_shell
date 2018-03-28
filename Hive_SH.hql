## select.hql

create schema ${hiveconf:DB_NAME};
show schemas;
use ${hiveconf:DB_NAME};
CREATE TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME} (ID INT, name STRING, dt STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
show tables;
LOAD DATA LOCAL INPATH '/home/ubuntu/input/raw.txt' OVERWRITE INTO TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME};
select * from ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME};


## select.sh

#!/bin/sh
FILE=/home/ubuntu/input/select.properties
db_name=$(grep -i 'databaseName' $FILE  | cut -f2 -d'=')
table_name=$(grep -i 'tableName' $FILE  | cut -f2 -d'=')
echo "connecting to database - " $db_name
echo  "using table - " $table_name
hive -hiveconf DB_NAME=$db_name -hiveconf TABLE_NAME=$table_name -f /home/ubuntu/input/select.hql


## select.properties

atabaseName=ayodhya
tableName=raghuvamsam


## raw.txt

1,sriram,12-10-2015
2,seetamma,12-09-2015
3,lakshmana,12-11-2015
4,bharatha,12-12-2015
5,Shatrughna,12--2015
6,hanuma,12-11-2015






## run the .sh file:


ubuntu@ubuntu:~$ sh /home/ubuntu/input/select.sh
connecting to database -  ayodhya
using table -  raghuvamsam

Logging initialized using configuration in jar:file:/home/ubuntu/hive-1.2.1/lib/hive-common-1.2.1.jar!/hive-log4j.properties
OK
Time taken: 1.117 seconds
OK
ayodhya
default
hivesh
thanooj
Time taken: 0.183 seconds, Fetched: 4 row(s)
OK
Time taken: 0.012 seconds
OK
Time taken: 0.296 seconds
OK
raghuvamsam
Time taken: 0.036 seconds, Fetched: 1 row(s)
Loading data to table ayodhya.raghuvamsam
Table ayodhya.raghuvamsam stats: [numFiles=1, numRows=0, totalSize=129, rawDataSize=0]
OK
Time taken: 0.799 seconds
OK
1	sriram	12-10-2015
2	seetamma	12-09-2015
3	lakshmana	12-11-2015
4	bharatha	12-12-2015
5	Shatrughna	12--2015
6	hanuma	12-11-2015
Time taken: 0.378 seconds, Fetched: 6 row(s)
ubuntu@ubuntu:~$ 


