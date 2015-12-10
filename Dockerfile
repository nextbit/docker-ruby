FROM ruby:2.2.3 
MAINTAINER dev@nextbit.com.br

RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs \ 
  libxml2-dev \
  libxslt1-dev \
  libqt4-webkit \
  libqt4-dev \ 
  xvfb
