module Summary
  module Query
    class Union
      def initialize(*queries)
        if queries.first.kind_of?(Array)
          raise
        end
        @queries = queries
      end

      def run(runner = nil)
        @queries.map {|q|
          result = q.run(runner)
          result
        }.inject {|running, cur|
          running + cur
        }
      end

    end
  end
end
