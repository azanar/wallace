require 'active_support'
require 'manacle/constraint/method'
require 'wallace/manacle'

module Wallace
  module Manacles
    class BeginningOfDay
      include ::Manacle::Constraint::Method
      include Wallace::Manacle

      def self.constrainables
        [ActiveSupport::TimeWithZone, ::Time, ::Date] 
      end

      def constraint
        :beginning_of_day
      end
    end
  end
end

