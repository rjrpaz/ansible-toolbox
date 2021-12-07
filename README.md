# ansible-toolbox

Container ready to run ansible playbooks

## How to build the container

```console
docker build -t ansible-toolbox .
```

### Upload the image to Docker hub

1. login to the Docker hub

    ```console
    docker login
    ```

    this will request your Docker hub *user* and *password*.

1. Create the image from Dockerfile with proper tags

    ```console
    docker build -t rjrpaz/ansible-toolbox:1.0 -t rjrpaz/ansible-toolbox:latest .
    ```

1. Upload the image to Docker hub

    ```console
    docker push rjrpaz/ansible-toolbox:1.0
    ```

    ```console
    docker push rjrpaz/ansible-toolbox:latest
    ```

## How to run the container

You should have docker running. Also, *ansible-toolbox* image should be downloaded.

1. Change to an directory containing an ansible project:

    ```console
    cd ansible-project
    ```

1. Test ansible from the container:

    ```console
    docker run --mount type=bind,source="$(pwd)"/,target=/ansible rjrpaz/ansible-toolbox:latest ansible -m ping -i /ansible/hosts all
    ```

    this test assumes there is an inventory file named *hosts* as part of the ansible-project.
