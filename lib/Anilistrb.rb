require_relative 'Anilistrb/version'
require_relative 'Anilistrb/Client'

module Anilistrb


	client = Anilistrb::Client.new(File.dirname(__FILE__))
	
	#test1 = client.get_anime(33)
	#puts "#{test1} \n"

	#test2 = client.search_anime("One Piece")
	#puts "#{test2} \n"

	#test3 = client.get_manga(86864)
	#puts "#{test3} \n"

	#test4 = client.search_manga("Konosuba")
	#puts "#{test4} \n"

	#test5 = client.search_anime_paged(search: "One Piece", perPage:10, page:1)
	#test5.each { |x| puts "#{x}" }

	#test6 = client.search_user("barrettotte")
	#puts "#{test6} \n"
	#puts test6.data

	test7 = client.get_animelist(247578)
	puts test7.current

	#test8 = client.get_mangalist(247578)
	#puts test8

end