require 'wallace/summary/query/split'
require 'wallace/summary/query/split/list'

module Summary
  module Query
    module Splittable
      def splits
        raise NotImplementedError
      end

      def initialize(range)
        list = Split::List.from_list(self.class.splits)
        @queries = list.union(range)
      end

      def run(runner = nil)
        @queries.run
      end
    end
  end
end
