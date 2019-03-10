require_relative 'Anilistrb/version'
require_relative 'Anilistrb/Client'
require_relative 'Anilistrb/Media'

module Anilistrb


	client = Anilistrb::Client.new(File.dirname(__FILE__))
	
	test_anim1 = client.get_anime_by_id(1234)
	p test_anim1.title



end