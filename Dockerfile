# base conda container
FROM ghcr.io/rasilab/python:1.1.0

RUN mamba install -y -c conda-forge singularity
