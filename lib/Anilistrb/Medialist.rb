require_relative './AnilistObj'
require_relative './Media'

module Anilistrb
    class Medialist < AnilistObj
        
        attr_reader :current, :planning, :completed, :dropped, :paused, :repeating

        def initialize(d)
            super(d)
            @lists.each do |x|
                case x['name']
                    when "Planning"  ; @planning  = build_list(x)
                    when "Completed" ; @completed = build_list(x)
                    when "Watching"  ; @current   = build_list(x)
                    when "Dropped"   ; @dropped   = build_list(x)
                    when "Paused"    ; @paused    = build_list(x)
                    when "Repeating" ; @repeating = build_list(x)
                end
            end
        end

        def build_list(raw)
            list = []
            raw['entries'].each { |x| list.push(Anilistrb::Media.new(x)) }
            return list
        end

        def to_s
            "[#{user.id}]"
        end
    end
end