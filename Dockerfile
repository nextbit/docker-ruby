FROM ruby:2.2.3 
MAINTAINER dev@nextbit.com.br

RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  patch \
  nodejs \ 
  libxml2-dev \
  libxslt1-dev \
  libqt4-webkit \
  libqt4-dev \ 
  xvfb \
  ruby-dev \
  zlib1g-dev


ONBUILD RUN mkdir -p /app 
WORKDIR /app

ONBUILD COPY Gemfile Gemfile.lock ./ 
ONBUILD RUN gem install bundler && bundle install --jobs 20 --retry 5

ONBUILD COPY . ./
