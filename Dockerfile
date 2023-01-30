FROM ubuntu

# Setup Repository
RUN apt-get update -y
RUN apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    sudo
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
RUN apt-get update -y

# Install docker ce-cli
RUN apt-get install -y docker-ce-cli 


CMD [ "tail", "-f", "/dev/null" ]