require 'Anilistrb/Client'

client = Anilistrb::Client.new
anime = client.search_anime('Konosuba')
puts anime

=begin  OUTPUTS
[ANIME] 21202 - {
    "romaji"=>"Kono Subarashii Sekai ni Shukufuku wo!", 
    "english"=>"KONOSUBA -God's blessing on this wonderful world!", 
    "native"=>"この素晴らしい世界に祝福を！"
}
=end