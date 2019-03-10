@ECHO OFF
SET FILE=lib/Anilistrb.rb
SET CACHE=%CD%
CD ../ & ECHO Running code analysis... & rubocop & ECHO Running %FILE%... & ruby %FILE% & CD %CACHE%
PAUSE