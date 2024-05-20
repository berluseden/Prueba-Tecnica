# Backend Deployment

## Dockerfile y Manifiestos de Kubernetes

Hemos creado un `Dockerfile` para construir y ejecutar la aplicación. El `Dockerfile` consta de dos etapas: construcción y ejecución. Usamos una imagen de Maven para construir la aplicación y una imagen de Eclipse Temurin JDK para ejecutarla.

##  Los manifiestos de Kubernetes están organizados utilizando Kustomize para gestionar diferentes entornos (desarrollo, staging, producción).

Estructura del Directorio

backend
├── base
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
├── overlays
│   ├── development
│   │   └── kustomization.yaml
│   ├── staging
│   │   └── kustomization.yaml
│   └── production
│       └── kustomization.yaml
