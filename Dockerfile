FROM nginx:1.13.9

LABEL maintainer="johannes.wenzel@schoenhofer.de"

ENV http_proxy $http_proxy
ENV https_proxy $https_proxy
ENV no_proxy $no_proxy
ENV PATH /usr/local/bin:$PATH

COPY . /usr/share/nginx/html/

RUN apt-get update && \
    sed -i -e 's/const SINGLE_COMMANDS_AND_NO_VARS = false/const SINGLE_COMMANDS_AND_NO_VARS = true/' /usr/share/nginx/html/scripts/graphConf.js && \
    rm -R /var/lib/apt/lists/*

WORKDIR  /usr/share/nginx/html
