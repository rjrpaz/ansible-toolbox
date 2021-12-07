FROM debian:bullseye-slim

# Install ansible, ansible-lint, python-pip, sshpass
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get -y install ansible ansible-lint python3-pip sshpass

# Install module to run vmware playbooks
RUN pip install pyvmomi

# Clean apt repository
RUN DEBIAN_FRONTEND=noninteractive apt-get -y clean

# Create ssh key
RUN ssh-keygen -t rsa -N "" -C "ansible key" -f /root/.ssh/id_rsa

# Mount configuration directory for ansible
ADD ./etc /etc/ansible

