require 'Anilistrb/Client'

client = Anilistrb::Client.new
anime = client.search_anime('Konosuba')
#puts anime
#puts anime.attributes
user = client.search_user('barrettotte')
#puts user
list = client.get_animelist(247578)
puts list