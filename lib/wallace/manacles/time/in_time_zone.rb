module Wallace
  module Manacles
    class InTimeZone
      include ::Manacle::Constraint::Lambda
      include Wallace::Manacle

      def self.constrainables
        [ActiveSupport::TimeWithZone, ::Time, ::Date] 
      end

      def constraint
        :in_time_zone
      end
    end
  end
end

