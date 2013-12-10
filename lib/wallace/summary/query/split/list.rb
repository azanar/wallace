require 'wallace/summary/query/union'

module Summary
  module Query
    class Split
      #XXX: Right now, a Split::List is incredibly stupid about overlapping
      #queries. It will run them all, and the last match is the data that
      #overwrites the table.
      class List
        def self.from_list(split_list)
          case split_list
          when Split::List
            split_list
          when Array
            split_objs = split_list.map do |s|
              Split.from_obj(s)
            end
            self.new(split_objs)
          else
            raise "Can not construct Split::List from type #{split_list.class}"
          end
        end

        def initialize(splits)
          @splits = splits
        end

        def in_range(range)
          @splits.select { |s| s.applicable_for_range?(range) }
        end

        def union(range)
          results = in_range(range).map do |split|
            split.cut(range)
          end
          Summary::Query::Union.new(*results)
        end
      end
    end
  end
end
