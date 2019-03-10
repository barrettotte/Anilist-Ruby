require_relative './GqlClient'
require_relative './AnilistObj'
require_relative './Media'
require_relative './Medialist'
require_relative './User'

module Anilistrb
    class Client

        def initialize(root)
            @gql_client = Anilistrb::GqlClient.new('https://graphql.anilist.co')
            @gql_dir = File.join(root,"/Anilistrb/GraphQL")
            @gql_queries = {
                "media_by_id"       => File.read("#{@gql_dir}/media_by_id.gql"),
                "media_by_pages"    => File.read("#{@gql_dir}/media_by_pages.gql"),
                "media_by_search"   => File.read("#{@gql_dir}/media_by_search.gql"),
                "medialist_by_user" => File.read("#{@gql_dir}/medialist_by_user.gql"),
                "user_by_id"        => File.read("#{@gql_dir}/user_by_id.gql"),
                "user_by_search"    => File.read("#{@gql_dir}/user_by_search.gql")
            }
        end

        def get_anime(id)
            Anilistrb::Media.new(gql_request(
                @gql_queries["media_by_id"], {id: id, type: "ANIME"}
            )['data']['Media'])
        end

        def get_manga(id)
            Anilistrb::Media.new(gql_request(
                @gql_queries["media_by_id"], {id: id, type: "MANGA"}
            )['data']['Media'])
        end

        def get_animelist(userId)
            Anilistrb::Medialist.new(gql_request(
                @gql_queries["medialist_by_user"], {id: userId, type:"ANIME"}
            )['data']['MediaListCollection'])
        end

        def get_mangalist(userId)
            Anilistrb::Medialist.new(gql_request(
                @gql_queries["medialist_by_user"], {id: userId, type:"MANGA"}
            )['data']['MediaListCollection'])
        end

        def search_anime(search)
            Anilistrb::Media.new(gql_request(
                @gql_queries["media_by_search"], {search: search, type: "ANIME"}
            )['data']['Media'])
        end

        def search_manga(search)
            Anilistrb::Media.new(gql_request(
                @gql_queries["media_by_search"], {search: search, type: "MANGA"}
            )['data']['Media'])
        end

        def search_anime_paged(search:, perPage:10, page:1)
            search_media_paged(search: search, type:"ANIME", perPage: perPage, page: page)
        end

        def search_manga_paged(search:, perPage:10, page:1)
            search_media_paged(search: search, type:"MANGA", perPage: perPage, page: page)
        end

        def search_media_paged(search:, type:, perPage:10, page:1)
            media = []
            gql_request(
                @gql_queries["media_by_pages"], 
                {search: search, type: type, perPage: perPage, page: page}
            )['data']['Page']['media'].each { |x| media.push(Anilistrb::Media.new(x)) }
            return media
        end

        def search_user(search)
            Anilistrb::User.new(gql_request(@gql_queries["user_by_search"], {search: search})['data']['User'])
        end

        def gql_request(query, variables)
            @gql_client.request(method:'POST', query: query, variables: variables)
        end
        
    end
end