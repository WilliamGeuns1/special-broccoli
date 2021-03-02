[![WGUdacity](https://circleci.com/gh/WilliamGeuns1/effective-octo-pancake.svg?style=svg)](https://app.circleci.com/pipelines/github/WilliamGeuns1/effective-octo-pancake)
## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

# Summary
This project covers multiple topics: 
  * We created a virtual environment and a `Makefile` to install the necessary dependencies.
  * A working ML project is provided which can be used to deploy. The next step was to dockerize this application, we created a `Dockerfile` to containerize the app.
  * Multiple scripts were created automate this process.
  * We uploaded this local docker image to a container repository.
  * We used this uploaded docker image to deploy it onto a local kubernetes cluster.
  * Lastly we integrated the project with Circleci and added a status badge in the `readme.md` file.

# How to run
Clone the repository to your local machine and do:
`cd project-ml-microservice-kubernetes/` \
Create a virtual env `python3 -m venv venv` and activate it `source venv/bin/activate`

run `make install`, this will install all the dependencies required to run. This may take a while.

## Building, deploying and pushing the container
Do `docker login` and enter your docker hub credentials, also go to your dockerhub (you'll need an account to create a repo) and create a container repository (copy your ID and project name).

Use your favorite text editor and replace the `dockerpath` in the following files with your own `run_kubernetes.sh`, `upload_docker.sh`.

Now first `sh run_docker.sh` this will build and start the container locally. If you want to send a payload to it an see the output you'll have to check the port which is defined in the `make_prediction.sh` file, this port has to be the exposed container port so it can communicate with your container.

To upload the built image to the container repo `sh upload_docker.sh`

For the next steps you'll need `virtualbox` and `minikube` installed `sh run_kubernetes.sh` this will pull the image from the remote repo and spin up a k8s pod inside the cluster.

Minikube will output the IP on which you can see the application running in the pod. You can also look at the pod output by doing `kubectl logs -f <POD NAME>`, you can get the pod name by doing `kubectl get pods -n default` however this will be outputted already when you run the script.