module Summary
  module Query
    def initialize(opts = {})
      @opts = opts
      puts "Query with #{opts.inspect}"
    end

    def to_sql_arr
      [to_sql]
    end

    def run(r = runner)
      result = nil
      to_sql_arr.each do |stmt|
        result = runner.run(stmt)
      end
      result.map do |r|
        result_class.new(r)
      end
    end
  end
end
