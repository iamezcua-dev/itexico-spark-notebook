import os
import sys

os.environ["PYSPARK_PYTHON"] = "/opt/conda/bin/python"
os.environ["PYLIB"] = os.environ["SPARK_HOME"] + "/python/lib"
sys.path.insert(0, os.environ["PYLIB"] +"/py4j-0.10.9-src.zip")
sys.path.insert(0, os.environ["PYLIB"] +"/pyspark.zip")
os.environ["PYSPARK_SUBMIT_ARGS"] = "--name yarn pyspark-shell"
