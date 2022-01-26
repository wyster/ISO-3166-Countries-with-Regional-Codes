FROM ruby:3.0-slim-buster

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y libxml2-dev libxslt1-dev

WORKDIR /app
COPY ./Gemfile* ./
COPY ./scrubber.rb ./
VOLUME ./all ./slim-2 ./slim-3
RUN mkdir ./all ./slim-2 ./slim-3 -p

RUN bundle install -j3
CMD bundle exec ruby scrubber.rb
