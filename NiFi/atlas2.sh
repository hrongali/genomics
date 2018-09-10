#!/bin/bash

sampleID=$1
technician=$2
instrumentType=$3
instrumentModel=$4
instrumentId=$5
reads=$6
startTimeStamp=$7
endTimeStamp=$8


echo "The Params:  $1 $2 $3 $4 $5 $6 $7 $8" > /home/nifi/logtext.txt

C1='/bin/curl  -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://xxxx:21000/api/atlas/v2/entity/bulk -d'
C2='{"entities": [{"typeName": "ztest_hdfs_path_genseq_raw", "attributes": {'

P1='"qualifiedName": "ztest_hdfs_path_genseq_raw.'${sampleID}'",'
P2='"name": "sampleID_'${sampleID}'",'
P3='"createdBy": "NiFi",'
P4='"path":"hdfs://lake/genome/raw/sampleID_'${sampleID}'",'
P5='"technician": "'${technician}'",'
P6='"instrumentType": "'${instrumentType}'",'
P7='"instrumentModel": "'${instrumentModel}'",'
P8='"instrumentId": "'${instrumentId}'",'
P9='"reads": "'${reads}'",'
P10='"sampleID": "'${sampleID}'",'
P11='"startTimeStamp": "'${startTimeStamp}'",'
P12='"endTimeStamp": "'${endTimeStamp}'" '

C3='}}]}'

SQ="'"


#echo $C1 $SQ$C2 $P1 $P2 $P3 $P4 $P5 $P6 $P7 $P8 $P9 $P10 $P11 $P12 $C3 $SQ > /home/nifi/curl.txt:
echo $C1 $SQ$C2 $P1 $P2 $P3 $P4 $P5 $P6 $P7 $P8 $P9 $P10 $P11 $P12 $C3$SQ  > /home/nifi/curl.txt
#$C1 $SQ$C2 $P1 $P2 $P3 $P4 $P5 $P6 $P7 $P8 $P9 $P10 $P11 $P12 $C3 $SQ
#CURLRESPONSE=`$C1 $SQ$C2 $P1 $P2 $P3 $P4 $P5 $P6 $P7 $P8 $P9 $P10 $P11 $P12 $C3 $SQ`
exe() { echo "\$ ${@/eval/}" ; "$@" ; }
exe eval $C1 $SQ$C2 $P1 $P2 $P3 $P4 $P5 $P6 $P7 $P8 $P9 $P10 $P11 $P12 $C3 $SQ
#echo $CURLRESPONSE > /home/nifi/logresponse.txt
