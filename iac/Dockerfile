FROM hashicorp/terraform:1.4

WORKDIR /app

COPY *.tf ./

RUN terraform init

EXPOSE 8081
