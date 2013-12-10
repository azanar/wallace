require File.expand_path('../../test_helper', __FILE__)

require 'wallace/summary/result'

class Summary::ResultTest < Test::Unit::TestCase
  setup do
    @mock_result_klass = Class.new(Summary::Result) do
      def keys
        ["mock_key_1", "mock_key_2"]
      end
    end
  end

  test "write_to" do
    result_hash = {"metric" => "mock_metric", "mock_key_1" => "foo", "mock_key_2" => "bar", "count" => 123}

    mock_model = mock

    condition_hash = {"mock_key_1" => "foo", "mock_key_2" => "bar"}

    mock_arel = mock
    mock_model.expects(:where).with(condition_hash).returns(mock_arel)

    mock_summary_model = mock
    mock_arel.expects(:first_or_initialize).returns(mock_summary_model)

    mock_summary_model.expects(:[]=).with("mock_metric", 123)
    mock_summary_model.expects(:save!)

    result = @mock_result_klass.new(result_hash)

    result.write_to(mock_model)
  end
end

