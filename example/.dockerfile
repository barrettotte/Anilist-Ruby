FROM ruby:2.6.1-alpine3.8

COPY myapp.rb /app
RUN gem install Anilistrb && ruby myapp.rb