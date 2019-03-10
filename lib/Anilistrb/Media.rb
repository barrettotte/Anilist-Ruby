module Anilistrb
    class Media

        def initialize(json_data)
            data = json_data['data']['Media']
            data.each do |var, val|
                snaked = to_snakecase(var)
                self.class.__send__(:attr_accessor, snaked)
                self.__send__("#{snaked}=", val)
            end
        end

        def to_snakecase(str)
            str.gsub(/::/, '/')
                .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
                .gsub(/([a-z\d])([A-Z])/,'\1_\2')
                .tr("-", "_").downcase()
        end

        def to_s
            "Media {\"id\":#{@id}, \"title\": #{title}"
        end
    end
end