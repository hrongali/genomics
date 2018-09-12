# genomics
Genomics project work on HDP 3.0

Demonstrate the Nifi flow to ingest data to an HDP 3.0 cluster, we show the ingestion of JSON file, we parse the JSON file and pick up the File attributes and other meta data. The Nifi flow invokes an updates to the Data Governance component (Atlas) which enables a search and view of records with their Linage information in a graph database.

This flow focuses on Genomics data and the ability to feed an application running Hail package.
We demonstrate the ability to use a dockerized environment to contain all of Hails dependencies inside a single docker image and run it on the cluster. Such capability allows for easy control over multiple environments and specific dependencies.

The Cluster is buit with Hortonworks’ CloudBreak which allows for auto scaling, so if a team would use multiple versions of Hail each under their own docker image on the same cluster we would be able to scale up the cluster dynamically and support a multi tenancy workload with multiple version of Spark.

