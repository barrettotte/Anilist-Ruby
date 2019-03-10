# Anilistrb

[![pipeline status](https://gitlab.com/barrettotte/Anilist-Ruby/badges/master/pipeline.svg)](https://gitlab.com/barrettotte/Anilist-Ruby/commits/master)
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

## Usage
``` ruby
require 'Anilistrb/Client'

client = Anilistrb::Client.new
anime = client.search_anime('Konosuba')
puts anime
# [ANIME] 21202 - {
#  "romaji"=>"Kono Subarashii Sekai ni Shukufuku wo!", 
#  "english"=>"KONOSUBA -God's blessing on this wonderful world!",
#  "native"=>"この素晴らしい世界に祝福を！" }

p anime.attributes # ["id", "title", "type", "format", "status", "description", "start_date", "end_date", "season", ... ]

puts anime.data # Raw request data as a hash

user = client.search_user('barrettotte') 
puts user # [USER] 247578 - barrettotte

list = client.get_animelist(247578)
puts list
# ANIME list for [USER] 247578 - barrettotte
#       Completed: 244   item(s)
#       Current:   9     item(s)
#       Dropped:   1     item(s)
#       Paused:    0     item(s)
#       Planning:  284   item(s)
#       Repeating: 0     item(s)
```

**Note**: Media, MediaList, and User objects extend from **AnilistObj** which
is an object with properies dynamically built from the fields returned from
a GraphQL query results. To easily get a list of a child's properties: call ```some_obj.attributes ```


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
* commit + push all changes, increment version in ```./lib/Anilistrb/version.rb```
* ```gem build Anilistrb.gemspec && gem push Anilistrb-x.x.x.gem```


## Sources
* AniList https://anilist.co/home
* AniList APIv2 Docs https://anilist.gitbook.io/anilist-apiv2-docs/
* Anilist APIv2 Schema Documentation https://anilist.github.io/ApiV2-GraphQL-Docs/
* GraphQL Introduction https://graphql.org/learn/
* Publish a Ruby gem https://guides.rubygems.org/publishing/
* Ruby Docker https://hub.docker.com/_/ruby
* Ruby Gems https://rubygems.org/
