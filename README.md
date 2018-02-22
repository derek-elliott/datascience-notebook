## Jupyterlab Notebook with CUDA

This Dockerfile is built off a custom Jupyter docker-stack that pulls from [nvidia/cuda:8.0-cudnn7-runtime-ubuntu16.04](https://hub.docker.com/r/nvidia/cuda/).  It also has PyTorch and Tensorflow installed by default.

To start, it would be a good idea to increase the shared memory for the container with the flag `--shm-size`.  Anything more than 8 gigs would should work fine.

In order to use CUDA, the container will need to be started with nvidia-docker.

The command to run the container is:

```
nvidia-docker run -d --shm-size 8G -p 8888:8888 jupyter-datascience:latest jupyter lab
```

The `jupyter lab` command can be left of to use the legacy Jupyter notebook.
