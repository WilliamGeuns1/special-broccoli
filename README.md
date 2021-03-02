[![WGUdacity](https://circleci.com/gh/WilliamGeuns1/effective-octo-pancake.svg?style=svg)](https://app.circleci.com/pipelines/github/WilliamGeuns1/effective-octo-pancake)
## Project Overview


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

# Building, deploying and pushing the container

Use your text editor of choice and replace the `dockerpath` in the following files with your own: `run_kubernetes.sh`, `upload_docker.sh`.

Now first `sh run_docker.sh` this will build and start the container locally.

 If you want to send a payload to it an see the output you'll have to check the port which is defined in the `make_prediction.sh` file, this port has to be the exposed container port so it can communicate with your container.

To upload the built image to the container repo `sh upload_docker.sh`.  This script will prompt you to login with your docker hub credentials.

For the next steps you'll need `virtualbox` and `minikube` installed `sh run_kubernetes.sh` this will pull the image from the remote repo and spin up a k8s pod inside the cluster.

Minikube will output the IP on which you can see the application running in the pod. \
You can also look at the pod output by doing `kubectl logs -f <POD NAME>`, you can get the pod name by doing `kubectl get pods -n default` however this is already shown when you run the script.