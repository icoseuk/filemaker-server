# FileMaker Server Docker Image

This is a Docker image for FileMaker Server, 

## Usage

### Prerequisites

You only need Docker installed.

### Running the container

To run the container, you can use the following command:

```bash
docker run                  \
    --detach                \
    --hostname   <container_name> \
    --name       <container_name> \
    --privileged            \
    --publish    80:80      \
    --publish    443:443    \
    --publish    2399:2399  \
    --publish    5003:5003  \
    --volume                \
        <shared_FM_dir>:"/opt/FileMaker/FileMaker Server/Data" \
    ghcr.io/icoseuk/filemaker-server:latest
```

Replace `<container_name>` with the name you want to give to the container, and `<shared_FM_dir>` with the path to the directory where you want to store the FileMaker Server data.

## Development

The Dockerfile in this repository is based on Claris official [instructions](https://support.claris.com/s/answerview?anum=000035949&language=en_US#run-container) for creating a Dockerized FileMaker Server Installation.

### Building the installation image

1. Download the FileMaker Server installer from the [Claris website](https://www.claris.com/filemaker-server-trial/).

2. Place the installer in the `installation` directory.

3. Build the image with the following command:

```bash
docker build -t filemaker-server .
```

4. Run the installation container.

To run the installation container, you can use the following command:

```bash
docker run                  \
    --detach                \
    --hostname   fms-prep   \
    --name       fms-prep   \
    --privileged            \
    --publish    80:80      \
    --publish    443:443    \
    --publish    2399:2399  \
    --publish    5003:5003  \
    filemaker-server
```

5. Access the installation container

To access the installation container, you can use the following command:

```bash
docker exec -it fms-prep /bin/bash
```

6. Install FileMaker Server

Inside the installation container, you can install FileMaker Server with the following command:

```bash
FM_ASSISTED_INSTALL=/install apt-get install /install/<filemaker_server>.deb -y
```


7. Commit the changes

After the installation is complete, you can commit the changes to the image with the following command:

```bash
docker commit fms-prep ghcr.io/icoseuk/filemaker-server:<version>
```

Where `<version>` is the version of the FileMaker Server you are creating the image for.

## License

This project is not affiliated with Claris International Inc. or any of its subsidiaries. It is prohibited to use this image for any unauthorized ICOSE projects or any other projects that are not related to ICOSE operations and client projects.
