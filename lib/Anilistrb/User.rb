require_relative './AnilistObj'

module Anilistrb
    class User < AnilistObj
        
        def to_s
            "[#{id}] - #{name}"
        end
    end
end