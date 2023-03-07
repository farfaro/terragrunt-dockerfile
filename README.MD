
# Terragrunt Dockerfile

El dockerfile contiene las siguientes tools: git, aws cli v2, terraform, terragrunt. Esta basada en una imagen `Ubuntu`.

El dockerfile llama los archivos 'config' y 'credentials' las cuales corresponden a los archivos de credenciales de AWS. 
Por motivos de seguridad los mismos no son subidos al repositorio, pero deberan existir en la misma carpeta que el Dockerfile.


## Build, tag & push to Docker Hub

De la siguiente forma se construye la imagen, se taguea y se sube a docker hub.


```bash
docker login
docker build -t 'registry/nombre:tag' .
docker push -t 'registry/nombre:tag'
```
Adicionalmente, de la siguiente forma es posible crear un contenedor con la imagen construida previamente.    

```bash
docker run -ti 'image_hash' bash
```
    