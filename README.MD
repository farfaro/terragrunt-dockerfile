
# Terragrunt Dockerfile

El dockerfile contiene las siguientes tools: git, aws cli v2, terraform, terragrunt. Esta basada en una imagen `Ubuntu`.

El dockerfile llama los archivos 'config' y 'credentials' las cuales corresponden a los archivos de credenciales de AWS. 
Por motivos de seguridad los mismos no son subidos al repositorio, pero deberan existir en la misma carpeta que el Dockerfile.

Recientemente se agrego la tool `git-crypt` para el cifrado de datos sensibles (credenciales de BD principalmente). En el Dockerfile se copia el secret necesario para hacer el descifrado de archivos cifrados con esta tool. Desde ya que esto es porque en mi caso necesitaba clonar un repositorio (infrastructure-live) donde algunos archivos estan cifrados. En caso de que no sea necesario, comentar o eliminar del Dockerfile lo siguiente:

```bash
COPY gitcrypt-keys/infraestructure-live /home/
``` 

Por cuestiones de seguridad, esta key no se subirá al repositorio

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
    