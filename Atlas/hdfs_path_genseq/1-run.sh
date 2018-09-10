# --------------- GET --------------
# simple get test
curl -u xxxx:xxxx -i -X GET http://xxxx:21000/api/atlas/v2/types/typedefs

# --------------- PUT --------------
# type via file
curl -u xxxx:axxxx -ik -H "Content-Type: application/json" -X POST http://xxxx:21000/api/atlas/v2/types/typedefs -d "@./1.2-type-geneseq_raw.json"
curl -u xxxx:xxxx -ik -H "Content-Type: application/json" -X POST http://xxxx:21000/api/atlas/v2/types/typedefs -d "@./1.2-type-geneseq-processed.json"

# entity via file
curl -u xxxx:xxxx -ik -H "Content-Type: application/json" -X POST http://xxxx:21000/api/atlas/v2/entity/bulk -d "@./1.3-entity.json"

# entity via json string (the way NiFi will use it)
curl -u xxxx:xxxx -ik -H "Content-Type: application/json" -X POST http://xxxx:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "ztest_hdfs_path_genseq_raw", "attributes": {"qualifiedName": "ztest_hdfs_path_genseq_raw.${sampleID}", "name": "sampleID_${sampleID}", "createdBy": "NiFi", "path":"hdfs://lake/genome/raw/sampleID_${sampleID}", "technician": "${technician}", "instrumentType": "Illumina", "instrumentModel": "${instrumentType}", "instrumentId": "${instrumentId}", "reads": "${reads}", "sampleID": "BF-${sampleID}", "startTimeStamp": "${startTimeStamp}", "endTimeStamp": "${endTimeStamp}"}}]}'

# ---------------DELETE ---------------
# delete type
curl -u xxxx:xxxx -ik -H "Content-Type: application/json" -X POST http://xxxx:21000/api/atlas/v2/types/typedefs/greg-test

# delete type
curl -u xxxx:xxxx -ik -X DELETE http://xxxx:21000/api/atlas/v2/entity/guid/d3f70480-4cf9-42d7-81cd-9bac582308f4
