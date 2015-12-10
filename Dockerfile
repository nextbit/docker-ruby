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

RUN mkdir -p /app 
WORKDIR /app

COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 5000

CMD ["bundle", "exec", "rails", "server", "-p", "5000", "-b", "0.0.0.0"]
