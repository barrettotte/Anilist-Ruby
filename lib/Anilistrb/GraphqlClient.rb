
class GraphqlClient

    def initialize(url)
        @url = url
    end

    def execute(query:, variables: nil)
        HTTParty.post(
            @url,
            headers: { 
                'Content-Type' => 'application/json'
            },
            body: { 
                query: query, 
                variables: variables 
            }.to_json
        )
    end

end