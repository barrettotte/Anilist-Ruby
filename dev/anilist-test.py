# https://anilist.gitbook.io/anilist-apiv2-docs/overview/graphql/getting-started
import requests
with open('./anilist-test.gql', 'r') as f: query = f.read()
variables = { 'id': 33 }
response = requests.post('https://graphql.anilist.co', json={'query': query, 'variables': variables})
with open('./anilist-test.json', 'w+') as f: f.writelines(str(response.content))