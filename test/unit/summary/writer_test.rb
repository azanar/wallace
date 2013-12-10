require File.expand_path('../../test_helper', __FILE__)

require 'wallace/summary/writer'

class Summary::WriterTest < Test::Unit::TestCase
  setup do
    @mock_model = mock

    @mock_writer = Class.new do
      include Summary::Writer

      def self.mock_model=(mock)
        @@mock_model = mock
      end

      def model
        @@mock_model
      end

      def keys
        ['obj_id', 'day']
      end
    end

    @mock_writer.mock_model = @mock_model
  end

  test "writing!" do
    mock_results = 10.times.map do |t|
      mock_result = mock

      mock_result.expects(:write_to).with(@mock_model)


      mock_result
    end

    writer = @mock_writer.new(mock_results)

    writer.save!
  end
end

