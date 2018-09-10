## Goal

The Goal of this excercise is to run a differennt version of Spark(Spark 2.1.0) with all the required dependencies(Hail 0.1 and Anaconda in this use case) in a Docker container in HDP 3.0 where the default version of spark is Spark 2.3.0

https://hail.is/docs/stable/getting_started.html


## Below are the instructions for building the docker image with custom version of spark and Hail package:

## Prerequisites for building the docker image:

```
mkdir /root/hail
cd /root/hail
wget https://repo.continuum.io/archive/Anaconda2-5.1.0-Linux-x86_64.sh .
wget https://archive.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz .
wget https://storage.googleapis.com/hail-common/distributions/0.1/Hail-0.1-20613ed50c74-Spark-2.1.0.zip .
git clone --branch 0.1 https://github.com/broadinstitute/hail.git
cd hail
./gradlew -Dspark.version=2.1.0 shadowJar
cd /root/hail/
zip -r hail.zip hail/
```

## Building the Docker image:

* Copy the Dockerfile and environment.yml file to a directory where you will be building your image.
* cd to the directory where the Dockerfile is copied

``docker build -t hail:0.1 .``

#### Make sure you see the image by running the below command and copy the docker image id:

``docker images``

#### Run the docker container by running the below command:

``docker run -dit <Docker image id>``

#### Make sure the container is running by running the below command:

``docker ps -a``

#### Make sure the container is running. Grab the container id
``docker exec -it <:container id>  /bin/bash``

#### You should get into the container now. Copy the container id for reference

#### Copy the environment.yml file from your directory to docker container:

``docker cp environment.yml c6ff86e87d24:/hail/hail/python/hail/environment.yml``

#### Inside the docker container, build your virtual condo environment:

``
/hail/anaconda2/bin/conda env create -n hail -f
$HAIL_HOME/python/hail/environment.yml
``

##### If the above command fails, try running once again

#### Get into the condo environment:

``
source /hail/anaconda2/bin/activate hail
``
### Run the below pyspark shell command:
``
SPARK_HOME=/hail/spark-2.1.0-bin-hadoop2.7/ HAIL_HOME=/hail/hail/ PYTHONPATH="$PYTHONPATH:$HAIL_HOME/build/distributions/hail-python.zip:$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-*-src.zip" $SPARK_HOME/bin/pyspark
``

### Import hail inside the pyspark shell:
``
import hail
``
