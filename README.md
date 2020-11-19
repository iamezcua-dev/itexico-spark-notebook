# iTexico Spark Notebook

## Getting Started
1. Build the Docker image:
    ```sh
    docker build --tag spark-notebook-sandbox:latest .
    ```

1. Start up the Docker container:
    ```sh
    docker run -it -p 8888:8888 spark-notebook-sandbox:latest
    ```
1. Copy and paste the generated URL in a Web browser. This URL contains a valid kernel token similar to:
http://127.0.0.1:8888/?token=686461ee0a8ac6284acbce0739ed776e585a35ce8b7b697a

    > Note: The token above is just an example. Please, do not use it!

## Questions?
Contact us at:
* <isaac.amezcua@improving.com>
