# Anilistrb

[![Gem Version](https://badge.fury.io/rb/Anilistrb.svg)](https://badge.fury.io/rb/Anilistrb)
![Gem](https://img.shields.io/gem/dt/Anilistrb.svg)
![GitHub](https://img.shields.io/github/license/barrettotte/Anilist-Ruby.svg)
![GitHub repo size in bytes](https://img.shields.io/github/repo-size/barrettotte/Anilist-Ruby.svg)

A simple API wrapper for AniList's GraphQL APIv2

This is a small side project for a practical introduction to both Ruby and GraphQL,
so its not perfect

Also learned some of the basics of Rubocop, Rspec, Rake, Ruby metaprogramming, and publishing a ruby gem


## Installation
* https://rubygems.org/gems/Anilistrb
* Put in gemfile: ```gem Anilistrb```
* Execute: ```bundle```
* or manually ```gem install Anilistrb```
* Update ```gem update Anilistrb```


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
* ```gem push Anilistrb-x.x.x.gem```


## Sources
* GraphQL Introduction https://graphql.org/learn/
* AniList https://anilist.co/home
* AniList APIv2 Docs https://anilist.gitbook.io/anilist-apiv2-docs/
* Anilist APIv2 Schema Documentation https://anilist.github.io/ApiV2-GraphQL-Docs/
* Ruby Gems https://rubygems.org/
* Ruby Docker https://hub.docker.com/_/ruby
* Publish a Ruby gem https://guides.rubygems.org/publishing/
