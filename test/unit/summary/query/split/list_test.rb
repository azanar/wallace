require File.expand_path('../../../../test_helper', __FILE__)

require 'wallace/summary/query/split/list'

class Summary::Query::Split::ListTest < Test::Unit::TestCase
  test '.from_obj(Split)' do
    mock_obj = mock

    Summary::Query::Split::List.expects(:===).with(mock_obj).returns(true)

    split = Summary::Query::Split::List.from_list(mock_obj)
  end

  test '.from_obj(Hash)' do
    mock_obj = [
      {"query" => "foo", "bound" => "bar"},
      {"query" => "baz", "bound" => "blarg"}
    ]
    
    split = Summary::Query::Split::List.from_list(mock_obj)
  end

  test '.from_obj not valid' do
    mock_obj = mock
    
    assert_raise(RuntimeError) {
      Summary::Query::Split::List.from_list(mock_obj)
    }
  end

  test "#union" do
    mock_range = mock
    mock_runner = mock

    mock_results = 3.times.map do |t|
      [mock]
    end

    mock_splits = mock_results.map do |r|
      mock_split = mock
      mock_query = mock
      mock_split.expects(:applicable_for_range?).with(mock_range).returns(true)
      mock_split.expects(:cut).with(mock_range).returns(mock_query)
      mock_query.expects(:run).with(mock_runner).returns(r)
      mock_split
    end

    mock_splits += 2.times.map do
      mock_split = mock
      mock_split.expects(:applicable_for_range?).with(mock_range).returns(false)
      mock_split
    end

    split = Summary::Query::Split::List.new(mock_splits)
    result = split.union(mock_range).run(mock_runner)

    assert_equal result, mock_results.flatten
  end

end
