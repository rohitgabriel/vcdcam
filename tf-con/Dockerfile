#FROM ubuntu:1
FROM nginx:1.15.5

# Install the application
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y net-tools
RUN apt-get install -y telnet
RUN apt-get install -y ssh
RUN apt-get install -y iputils-ping
RUN apt-get install -y dnsutils
RUN mkdir -p /terraform/terraform.d/plugins/linux_amd64 && cd /terraform
ADD terraform /terraform/
ADD vcd_test.tf /terraform/
ADD terraform-provider-vcd_v1.0.0_x4 /terraform/terraform.d/plugins/linux_amd64
RUN chmod 777 /terraform/terraform
#RUN ./terraform init

# Define command to run the application when the container starts
CMD ["nginx", "-g", "daemon off;"]
