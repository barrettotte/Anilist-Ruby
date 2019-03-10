require_relative './GqlClient'
require_relative './Media'

module Anilistrb
    class Client

        def initialize(root)
            @gql_client = Anilistrb::GqlClient.new('https://graphql.anilist.co')
            @gql_dir = File.join(root,"/Anilistrb/GraphQL")
        end

        def get_anime_by_id(id)
            Anilistrb::Media.new(@gql_client.request(
                method:'POST', 
                query: File.read("#{@gql_dir}/media_by_id.gql"), 
                variables: {id: id , type: "ANIME"}
            ))
        end
        
    end
end