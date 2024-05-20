# Prueba Técnica

Este repositorio contiene los archivos y configuraciones necesarias para completar la prueba técnica.

## Estructura del Repositorio

- `Ansible/`: Contiene el playbook de Ansible y los roles necesarios para configurar el servidor Oracle Linux v8.
- `Backend/`: Contiene el código y las configuraciones del backend (Java Spring Boot).
- `Frontend/`: Contiene el código y las configuraciones del frontend (Node.js con Vite, React y TypeScript).
- `script/`: Para utilizar el script de compresión de archivos temporales.


## Instrucciones de Uso

### Configuración del Backend

Para configurar y desplegar el backend, sigue las instrucciones en [Backend/README.md](Backend/README.md).
Docker Compose adjuntado para pruebas locales en la ruta Backend\helloworld-api\docker-compose.yml

### Configuración del Frontend

Para configurar y desplegar el frontend, sigue las instrucciones en [Frontend/README.md](Frontend/README.md).

## Despliegue en Kubernetes

Los detalles para desplegar la aplicación en Kubernetes utilizando Argo CD se encuentran en los respectivos directorios del backend y frontend usando kustomize.

Kustomize permite personalizar la configuración de Kubernetes sin modificar los archivos YAML originales. Se recomienda crear diferentes overlays para cada ambiente (desarrollo, staging, producción).

├── backend
│ ├── base
│ │ ├── deployment.yaml
│ │ ├── service.yaml
│ │ └── kustomization.yaml
│ ├── overlays
│ │ ├── development
│ │ │ └── kustomization.yaml
│ │ ├── staging
│ │ │ └── kustomization.yaml
│ │ └── production
│ │ └── kustomization.yaml
└── frontend
├── base
│ ├── deployment.yaml
│ ├── service.yaml
│ └── kustomization.yaml
├── overlays
│ ├── development
│ │ └── kustomization.yaml
│ ├── staging
│ │ └── kustomization.yaml
│ └── production
│ └── kustomization.yaml


# Guía de Instalación de Jenkins y Argo CD en Kubernetes

## Instalación de Argo CD

### 1. Crear Namespace para Argo CD

kubectl create namespace argocd

### 2. Aplicar Manifiestos de Instalación

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

### 3. Cambiar el Servicio a NodePort
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

### 4. Obtener la Contraseña Inicial
Obtén la contraseña inicial del administrador de Argo CD:
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

 ### Instalación de Jenkins
1. Añadir y Actualizar el Repositorio de Helm para Jenkins
Añade el repositorio de Helm para Jenkins y actualiza el repositorio:
helm repo add jenkinsci https://charts.jenkins.io
helm repo update

 ### 2. Crear Namespace para Jenkins
Ejecuta el siguiente comando para crear un namespace para Jenkins:
kubectl create ns jenkins

 ### 4. Crear un Secreto para Docker Hub
Crea un secreto en Kubernetes para las credenciales de Docker Hub:

kubectl create secret docker-registry docker-credentials --docker-username=[userid] --docker-password=[Docker Hub access token] --docker-email=[user email address] --namespace jenkins

### 5. Instalar Jenkins CI
helm upgrade --install jenkins jenkinsci/jenkins -n jenkins --create-namespace

### Documentacion Kaniko
https://github.com/GoogleContainerTools/kaniko
https://docs.cloudbees.com/docs/cloudbees-ci/latest/cloud-admin-guide/using-kaniko