# I've never done GraphQL queries before, let alone in Ruby...so let me test her out here
# https://anilist.gitbook.io/anilist-apiv2-docs/overview/graphql/getting-started

import requests

url = 'https://graphql.anilist.co'

query = '''
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
'''

variables = {
  'id': 15125
}

response = requests.post(url, json={'query': query, 'variables': variables})

print(response.content)