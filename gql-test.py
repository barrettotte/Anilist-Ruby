# I've never done GraphQL queries before, let alone in Ruby...so let me test her out here
# https://anilist.gitbook.io/anilist-apiv2-docs/overview/graphql/getting-started

import requests

url = 'https://graphql.anilist.co'

query = '''
  query ($id: Int) { # Define which variables will be used in the query (id)
    Media (id: $id, type: ANIME) { # Insert our variables into the query arguments (id) (type: ANIME is hard-coded in the query)
      id
      title {
        romaji
        english
        native
      }
    }
  }
'''

variables = {
  'id': 15125
}

print(requests.post(url, json={'query': query, 'variables': variables})).content