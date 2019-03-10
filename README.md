# Anilistrb

A simple API wrapper for AniList's GraphQL APIv2

This is a small side project for a practical introduction to both Ruby and GraphQL,
so its not perfect

Also learned some of the basics of Rubocop, Rspec, Rake


## Installation
* Put in gemfile: ```gem 'Anilistrb```
* Execute: ```$ bundle```
* or manually ```$ gem install Anilistrb```


## API Wrapper - https://graphql.anilist.co
* get_anime(id)
* get_manga(id)
* get_animelist(userId)
* get_mangalist(userId)
* search_anime(search)
* search_manga(search)
* search_anime_paged(search, perPage, page)
* search_manga_paged(search, perPage, page)
* search_user(search)
* gql_request(query string, variables struct)


## Development
* ```bundle install``` to install dependencies
* ```rake spec``` run tests
* ```bundle exec rake install``` install locally 

## Building/Publishing
* commit + push all changes
* ```gem build Anilistrb.gemspec```
* ```gem push Anilistrb-0.1.0.gem```

## To Do
- [x] GraphQL Client and basic get_media(id)
- [x] Rubocop, Unit tests
- [x] All get by id functions
- [x] All search functions
- [x] Test gem usage in a simple program
- [x] Documentation
- [x] Publish gem

## Scrapped out of laziness
* Dockerize, GitLab CI/CD


## Sources
* GraphQL Introduction https://graphql.org/learn/
* AniList https://anilist.co/home
* AniList APIv2 Docs https://anilist.gitbook.io/anilist-apiv2-docs/
* Anilist APIv2 Schema Documentation https://anilist.github.io/ApiV2-GraphQL-Docs/
* Ruby Gems https://rubygems.org/
* Ruby Docker https://hub.docker.com/_/ruby
* Publish a Ruby gem https://guides.rubygems.org/publishing/
