# base image
FROM continuumio/miniconda3:4.3.11

# about
LABEL description=""
LABEL version=""
LABEL maintainer=""

# in the paths below substitute paths with your own
# substitue:
#  - flask-restplus-production-skeleton (application name)
#  - conda_env (name of conda environment in environment_docker.yml)

# create virtual environment and clean leftovers
COPY environment_docker.yml /flask-restplus-production-skeleton/environment_docker.yml
RUN conda env create -f /flask-restplus-production-skeleton/environment_docker.yml && \
    conda clean --tarballs --packages -y

# copy application directory to container
COPY app /flask-restplus-production-skeleton/app

# port to run application on
ARG port
EXPOSE $port

# add package to python's path
ENV PYTHONPATH $PYTHONPATH:/flask-restplus-production-skeleton

ENTRYPOINT ["/opt/conda/envs/conda_env/bin/python", "/flask-restplus-production-skeleton/app/run_app.py"]
