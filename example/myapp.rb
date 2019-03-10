require 'Anilistrb/Client'

client = Anilistrb::Client.new
anime = client.search_anime('Konosuba')
puts anime
