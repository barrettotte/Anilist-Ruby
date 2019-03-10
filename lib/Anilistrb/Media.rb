require_relative 'AnilistObj'

module Anilistrb
  class Media < AnilistObj
    def to_s
      "[#{type}] #{id} - #{title}"
    end
  end
end
