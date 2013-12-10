require 'active_support/core_ext/hash/indifferent_access'

module Summary
  module Query
    class Split
      def self.from_obj(obj)
        case obj
        when Split
          obj.dup
        when Hash
          self.from_hash(obj)
        else
          raise
        end
      end

      def self.from_hash(hsh)
        indifference = hsh.with_indifferent_access
        query = indifference.fetch("query")
        bound = indifference.fetch("bound")

        self.new(query, bound)
      end

      def initialize(query,bound)
        if query.nil? or bound.nil?
          raise
        end

        @query = query
        @bound = bound
      end

      attr_reader :bound

      def applicable_for_range?(range)
        @bound.within?(range)
      end

      def cut(range)
        bounded_range = @bound.constrain_to(range)
        @query.new(bounded_range)
      end
    end
  end
end
