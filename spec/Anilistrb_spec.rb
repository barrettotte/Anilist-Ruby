require_relative '../lib/Anilistrb/Client'

RSpec.describe Anilistrb do
  it 'has a version number' do
    expect(Anilistrb::VERSION).not_to be nil
  end

  it 'gets an Anime by id' do
    client = Anilistrb::Client.new
    anime = client.get_anime(33)
    expect(anime.title).to eq({ 
      'romaji'  => 'Kenpuu Denki Berserk',
      'english' => 'Berserk',
      'native'  => '剣風伝奇ベルセルク' 
    })
  end

  it 'fails properly getting an Anime by an invalid id' do
    client = Anilistrb::Client.new
    anime = client.get_anime(9999999)
    expect(anime).not_to be nil
    anime = client.get_anime(-123456)
    expect(anime).not_to be nil
    anime = client.get_anime('QWERTY')
    expect(anime).to be nil
    anime = client.get_anime(nil)
    expect(anime).to be nil
  end

  it 'searches for an Anime' do
    client = Anilistrb::Client.new
    anime = client.search_anime('One Piece')
    expect(anime.title).to eq({
      'romaji'  => 'One Piece', 
      'english' => 'One Piece', 
      'native'  => 'ワンピース'
    })
    expect(anime.id).to eq(21)
  end

  it 'fails properly searching for an Anime that was not found' do
    client = Anilistrb::Client.new
    anime = client.search_anime('@#$%@$%^%$&')
    expect(anime).not_to be nil
    anime = client.search_anime(nil)
    expect(anime).not_to be nil
  end

  it 'gets a Manga by id' do
    client = Anilistrb::Client.new
    manga = client.get_manga(86864)
    expect(manga.title).to eq({
      'romaji'  => 'Gabriel Dropout', 
      'english' => nil, 
      'native'  => 'ガヴリールドロップアウト'
    })
  end
  
  it 'searches for a Manga' do
    client = Anilistrb::Client.new
    manga = client.search_manga('Konosuba')
    expect(manga.title).to eq({
      'romaji'  => 'Kono Subarashii Sekai ni Shukufuku wo!', 
      'english' => 'KonoSuba – God’s blessing on this wonderful world!!', 
      'native'  => 'この素晴らしい世界に祝福を!'
    })
    expect(manga.id).to eq(85702)
  end

  it 'searches for pages of Anime' do
    client = Anilistrb::Client.new
    pages = client.search_anime_paged(search: 'One Piece', perPage: 10, page: 1)
    expect(pages.length).to eq(10)
  end

  it 'searches for pages of Manga' do
    client = Anilistrb::Client.new
    pages = client.search_manga_paged(search: 'Boku no Hero Academia', perPage: 10, page: 1)
    expect(pages.length).not_to be nil
  end

  it 'searches for a User' do
    client = Anilistrb::Client.new
    user = client.search_user('barrettotte')
    expect(user.id).to eq(247578)
  end

  it 'gets an Anime list by User Id' do
    client = Anilistrb::Client.new
    list = client.get_animelist(247578)
    expect(list.completed.length).to be > 100
  end

  it 'gets a Manga list by User Id' do
    client = Anilistrb::Client.new
    list = client.get_mangalist(247578)
    expect(list.planning.length).to be > 1
  end
end
