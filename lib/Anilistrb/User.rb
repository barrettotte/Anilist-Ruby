require_relative 'AnilistObj'

module Anilistrb
  class User < AnilistObj
        
    def to_s
      "[USER] #{id} - #{name}"
    end
  end
end
