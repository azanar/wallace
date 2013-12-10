require File.expand_path('../../../test_helper', __FILE__)

require 'wallace/summary/query/split'

class Summary::Query::SplitTest < Test::Unit::TestCase
  test '.from_obj(Split)' do
    mock_obj = mock

    Summary::Query::Split.expects(:===).with(mock_obj).returns(true)
    mock_obj.expects(:dup).returns(mock_obj)

    split = Summary::Query::Split.from_obj(mock_obj)
  end

  test '.from_obj(Hash)' do
    mock_obj = {"query" => "foo", "bound" => "bar"}
    
    split = Summary::Query::Split.from_obj(mock_obj)
  end

  test '.from_obj not valid' do
    mock_obj = mock
    
    assert_raise(RuntimeError) {
      Summary::Query::Split.from_obj(mock_obj)
    }
  end
end

