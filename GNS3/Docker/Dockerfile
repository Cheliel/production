# Use an official Ubuntu base image
FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    sudo \
    && apt-get clean

# Add GNS3 PPA repository and install GNS3
RUN sudo add-apt-repository ppa:gns3/ppa \
    && sudo apt-get update \
    && sudo apt-get upgrade -y \
    && sudo apt-get install -y gns3-server gns3-gui

# Create a non-root user for running GNS3
RUN useradd -ms /bin/bash gns3
RUN echo 'gns3 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the new user
USER gns3
WORKDIR /home/gns3

# Expose the necessary ports
EXPOSE 3080

# Start the GNS3 server
CMD ["gns3server"]

# docker build -t gns3-docker .
# docker run -d -p 3080:3080 --name gns3-container gns3-docker