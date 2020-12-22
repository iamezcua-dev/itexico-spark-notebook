# iTexico Spark Notebook

## Prerequisites
In order to run this project you must have both **Docker** and **Docker Compose** installed on your machine.

If you have them already, please head up to the following URL https://www.docker.com/ , download and install the latest Docker version for your Operating System.

## Introduction
This project is aimed to anybody interested in making experiments with [Apache Spark](https://spark.apache.org), using languages such as [Scala](https://www.scala-lang.org), [Python](https://www.python.org) or [R Language](https://www.r-project.org/about.html) for writing distributed data manipulation code in a fast and easy way.

Since this project uses [Docker](https://www.docker.com) containers, you don't need to worry for the configuration to start coding.

## Getting Started
1. If you haven't already done so, first build the Docker images:
    ```sh
    docker-compose build
    ```

1. Spin up the Docker containers using Docker Compose:
    ```sh
    docker-compose up
    ```

1. Notice that a Jupyter Notebook URL is generated, which containing a kernel token similar to:<br/>
   ```html
   .
   .
   .
                                Or copy and paste one of these URLs:
   itexico-jupyter-notebook |         http://jupyter:8888/?token=ebda9a2a80bf5ca9e17411163f8b1f5cef78ac186c64f04b
   itexico-jupyter-notebook |      or http://127.0.0.1:8888/?token=ebda9a2a80bf5ca9e17411163f8b1f5cef78ac186c64f04b
   .
   .
   .
   ```
   
   Copy and paste the one that contains **127.0.0.1** or **localhost** in your favorite Web browser

   > Important: The URL shown above is just an example. Please, do not use it!

1. Once Jupyter webpage is loaded, you can create, open and upload a Jupyter Notebook.<br/>
   You can create Notebook files using any of the following languages you can choose from:
   * Spark ( Scala Language )
   * PySpark ( Python )
   * SparkR ( R Language )
   
   <br/>
     
   For instance, you can choose the **Spark** from the dropdown list.<br/><br/>
   <br/>

1. A new browser tab should be opened and you are ready to start coding.<br/>
   For example, let's use the **Pi Estimation** example obtained from the Examples section of the [Apache Spark official webpage](https://spark.apache.org/examples.html).
   <br/><br/>
   Copy and paste the following code in the first cell of your Jupyter Notebook
   ```scala
   val NUM_SAMPLES = 1000000
   
   val count = spark.sparkContext.parallelize( 1 to NUM_SAMPLES ).filter { _ =>
    val x = math.random
    val y = math.random
    x*x + y*y < 1
   }.count()
   
   println( s"Pi is roughly ${4.0 * count / NUM_SAMPLES}" )
   ```

1. Hit ```Shift+Enter``` to run the code. The **"Starting Spark application"** message confirms that the execution is taking place.<br/>

1. The result should be something similar to:
   ```text
   NUM_SAMPLES: Int = 1000000
   count: Long = 784593
   Pi is roughly 3.141368
   ```
1. Feel free to experiment yourself. *Sky is the limit* :D .


## Questions?
Contact us:

* Abhay Agarwal <abhay.agarwal@improving.com>
* Isaac Amezcua <isaac.amezcua@improving.com>
