@ECHO OFF
CD ../ & bundle exec rspec spec & CD ./dev
PAUSE