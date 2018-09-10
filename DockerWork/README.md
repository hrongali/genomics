
# Below are the instructions for building the docker image:

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
