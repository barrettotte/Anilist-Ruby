module Anilistrb
  class Medialist < AnilistObj
        
    attr_reader :data, :lists, :user, :type
    attr_reader :current, :planning, :completed, :dropped, :paused, :repeating

    def initialize(json, type)
      @data = json
      @lists = json['lists']
      @user = Anilistrb::User.new(json['user'])
      @type = type
      @current = []
      @planning = []
      @completed = []
      @dropped = []
      @paused = []
      @repeating = []
      build_lists
    end

    def build_lists
      @lists.each do |x|
        case x['name']
        when 'Planning'  then @planning  = build_list(x)
        when 'Completed' then @completed = build_list(x)
        when 'Watching'  then @current   = build_list(x)
        when 'Reading'   then @current   = build_list(x)
        when 'Dropped'   then @dropped   = build_list(x)
        when 'Paused'    then @paused    = build_list(x)
        when 'Repeating' then @repeating = build_list(x)
        end
      end
    end

    def build_list(raw)
      list = []
      raw['entries'].each { |x| list.push(Anilistrb::Media.new(x['media'])) }
      list
    end

    def to_s
      " Type: #{@type} list for #{@user}
      Completed: #{list_to_s(@completed)}
      Current:   #{list_to_s(@current)}
      Dropped:   #{list_to_s(@dropped)}
      Paused:    #{list_to_s(@paused)}
      Planning:  #{list_to_s(@planning)}
      Repeating: #{list_to_s(@repeating)}
      "
    end

    def list_to_s(list)
      "#{(list.any? ? list.length : 0).to_s.ljust(5, ' ')} item(s)"
    end
  end
end
