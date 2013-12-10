module Summary
  class Result
    def initialize(result)
      @result = result


      @metric = result["metric"]
      @count = result["count"]
    end

    def conditions
      @conditions ||= @result.select {
        |k,_| keys.include?(k) 
      }
    end

    def write_to(model)
      m = model.where(conditions).first_or_initialize

      update(m)
      m.save!
    end

    def update(record)
      record[@metric] = @count
    end
  end
end
