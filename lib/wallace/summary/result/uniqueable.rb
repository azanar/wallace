require 'wallace/summary/result'

module Summary
  class Result
    class Uniqueable < Summary::Result
      def initialize(result)
        if result.has_key?("unique_count")
          @unique_count = result["unique_count"]
        end
        super
      end

      def update(record)
        if @unique_count.present?
          record["unique_#{@metric}"] = @unique_count
        end
        super
      end
    end
  end
end
