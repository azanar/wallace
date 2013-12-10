module Summary
  module Writer
    def initialize(results)
      @results = results
    end

    def save!
      @results.each do |r|
        r.write_to(model)
      end
    end

    def transaction
      model.transaction do
        yield
      end
    end
  end
end
