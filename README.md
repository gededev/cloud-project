# Cloud Project
> A project for Efrei's Cloud School Subject. OS used making the project: **Windows**
## Minikube
>[Minikube Documentation](https://minikube.sigs.k8s.io/docs/)

>[Kubernetes Documentation](https://kubernetes.io/fr/docs/home/)

To start Minikube, simply run this command in **Powershell**:
```
minikube start --driver docker
```
Show Minikube's Docker environment variables in order to point to your local Docker daemon (where your local images are) ([Inspired by this Medium post](https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d))
```
minikube docker-env
```
Then apply these variables using this command:
```
& minikube -p minikube docker-env --shell powershell | Invoke-Expression
```
A Dashboard giving an overview of the cluster is disponible via:
```
minikube dashboard
```
To stop Minikube:
```
minikube stop
```
To delete all nodes:
```
minikube delete --all
```
### Kubectl
Using kubectl permits the creation of deployments using the command line.

>⚠️ **Warning** : in the same Powershell command tool, cd to the path of the project in order to build the images in the minikube docker daemon using :
>```
>docker build . -t cloud-project:1.0 
>```
>Verify if all the images needed are present on the docker daemon:
>```
>docker images
>```
>Then cd in the configurations folder to follow the next steps

With our configurations file, we can run the following commands (order important): 

```
kubectl apply -f .\mongo-config.yaml
```
```
kubectl apply -f .\mongo-secret.yaml
```
```
kubectl apply -f .\mongo.yaml
```
```
kubectl apply -f .\webapp.yaml
```
Then see the state of your cluster using:
```
kubectl get all
```
To access our clusterized app, retrieve necessary informations using:
```
kubectl get svc
```
```
minikube ip
```
```
kubectl get node -o wide
```
App URL: Minikube IP + service port

Or just run:
```
minikube service cloud-project-service
```
>⚠️ **Warning** : Minikube on windows might have problems regarding the version to access the service. Refer to this [stackoverflow post](https://stackoverflow.com/questions/61305722/why-cant-i-access-a-service-exposed-from-minikube-on-windows) to fix it

## Docker & Docker Compose
>⚠️ **Warning** : index.js file contains all scenarios for several deployment options. To use the docker-compose option, replace in all MongoClient.connect() calls the first attribute (named mongoUrl..) with **mongoUrlDockerCompose** (variable declared in the index.js)

In the root of this project, run the following command to create an image of the web app: 
```
docker build . -t cloud-project:1.0 
```
Then run the command to launch the containerized app and DB together:
```
docker-compose up
```
Then access **localhost:3000** and you should see the app working.

(You can check containers states in docker desktop if you are using Windows)