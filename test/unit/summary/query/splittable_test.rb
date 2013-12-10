require File.expand_path('../../../test_helper', __FILE__)

require 'wallace/summary/query/splittable'

class Summary::Query::SplittableTest < Test::Unit::TestCase
  setup do

  end
  test "include splittable" do
    klass = Class.new do
      include Summary::Query::Splittable

      def self.splits=(splits)
        @splits = splits
      end

      def self.splits
        @splits
      end
    end
  end
end
