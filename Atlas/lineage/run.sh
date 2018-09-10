# --------------- PUT --------------
# type via file
curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/types/typedefs -d "@./2-type.json"

# entity via file
curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d "@./3-bwa-entity.json"
curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d "@./3-gatk-entity.json"
curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d "@./3-hail-entity.json"
curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d "@./3-report-entity.json"



# ------------ put pipeline files to atlas (if hook is not set up in atlas, must do here in api)
curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "hdfs_path_genseq_raw", "attributes": {"qualifiedName": "hdfs_path_genseq_raw.sampleID_AA-23944_201809060132.fq", "name": "sampleID_AA-23944_201809060132.fq", "createdBy": "NiFi", "path":"hdfs:///lake/genome/raw/sampleID_AA-23944_201809060132.fq", "technician": "Amy Collins", "instrumentType": "Illumina", "instrumentModel": "NextSeq 550Dx", "instrumentId": "NS-3042987", "reads": "9", "sampleID": "sampleID_AA-23944_201809060132", "startTimeStamp": "2018-09-04:12:06:59", "endTimeStamp": "2018-09-04:12:06:33", "zone": "raw", "hash": "8743b52063cd84097a65d1633f5c74f5"}}]}'
# raw 351568c5-8c2b-4587-9ae8-f8b060adb56c

curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "hdfs_path_genseq_processed", "attributes": {"qualifiedName": "hdfs_path_genseq_processed.sampleID_AA-23944_201809050947.bam", "name": "sampleID_AA-23944_201809050947.bam", "createdBy": "", "path":"hdfs://lake/genome/aligned/sampleID_AA-23944_201809050947.bam", "zone": "aligned", "hash": "8743b52063cd84097a65d1633f5c74f5"}}]}'
# bam c59d6898-b23c-46d1-8a7d-a1278c5ba08b

curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "hdfs_path_genseq_processed", "attributes": {"qualifiedName": "hdfs_path_genseq_processed.sampleID_AA-23944_201809050947.vds", "name": "sampleID_AA-23944_201809050947.vds", "createdBy": "", "path":"hdfs://lake/genome/variants/sampleID_AA-23944_201809050947.vds", "zone": "variants", "hash": "8743b52063cd84097a65d1633f5c74f5"}}]}'
# variants 798ad96e-7c48-4be3-85b5-5c06b1fac943

curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "hdfs_path_genseq_processed", "attributes": {"qualifiedName": "hdfs_path_genseq_processed.annotations_dis_v1.7.tsv", "name": "annotations_dis_v1.7.tsv", "createdBy": "", "path":"hdfs://lake/genome/annotations/annotations_dis_v1.7.tsv", "zone": "annotations", "hash": "8743b52063cd84097a65d1633f5c74f5"}}]}'
# annotated d727b94d-9812-4603-930e-be39e5d6e5ff

curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "hdfs_path_genseq_processed", "attributes": {"qualifiedName": "hdfs_path_genseq_processed.dis_risk_model_out_sampleID_AA-23944_201809050947.csv", "name": "dis_risk_model_out_sampleID_AA-23944_201809050947.csv", "createdBy": "", "path":"hdfs:///lake/genome/model_output/disease_risk/dis_risk_model_out_sampleID_AA-23944_201809050947.csv", "zone": "model_output", "hash": "8743b52063cd84097a65d1633f5c74f5"}}]}'
# model_output 7f6562bb-f3de-4b21-8ce6-5adb3239ebbe

curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "hdfs_path_genseq_processed", "attributes": {"qualifiedName": "hdfs_path_genseq_processed.report_sampleID_AA-23944_201809060136.txt", "name": "report_sampleID_AA-23944_201809060136.txt", "createdBy": "", "path":"hdfs://lake/genome/reports/report_sampleID_AA-23944_201809060136.txt", "zone": "reports", "hash": "8743b52063cd84097a65d1633f5c74f5"}}]}'
# reports 012fff72-8e71-4d99-8cd5-4d2f9a4198bd



curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "hdfs_path", "attributes": {"qualifiedName": "hdfs_path.spark-2.0.2-bin-hadoop2.7.tgz", "name": "spark-2.0.2-bin-hadoop2.7.tgz", "createdBy": "", "path":"hdfs://lake/genome/model-registry/disease-risk-HAIL-v1.2/spark-2.0.2-bin-hadoop2.7.tgz"}}]}'
curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "hdfs_path", "attributes": {"qualifiedName": "hdfs_path.Hail-0.1-74bf1ebb3edc-Spark-2.0.2.zip", "name": "Hail-0.1-74bf1ebb3edc-Spark-2.0.2.zip", "createdBy": "", "path":"hdfs://lake/genome/model-registry/disease-risk-HAIL-v1.2/Hail-0.1-74bf1ebb3edc-Spark-2.0.2.zip"}}]}'
curl -u admin:admin-password1 -ik -H "Content-Type: application/json" -X POST http://18.215.222.208:21000/api/atlas/v2/entity/bulk -d '{"entities": [{"typeName": "hdfs_path", "attributes": {"qualifiedName": "hdfs_path.jupyter-disease-risk-HAIL-v1.2.json", "name": "jupyter-disease-risk-HAIL-v1.2.json", "createdBy": "", "path":"hdfs://lake/genome/model-registry/disease-risk-HAIL-v1.2/jupyter-disease-risk-HAIL-v1.2.json"}}]}'


