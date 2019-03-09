require 'httparty'
require 'json'

require_relative 'Anilistrb/version'
require_relative 'Anilistrb/GraphqlClient'

url = 'https://graphql.anilist.co'
client = GraphqlClient.new(url)

query = " 
	query ($id: Int) {
    	Media (id: $id, type: ANIME) {
    	  	id
    	  	title {
    	    	romaji
    	    	english
    	    	native
    	  	}
    	}
	}
"

response = client.execute(query: query, variables: { id: 15125 })
puts response

