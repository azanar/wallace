require 'active_support'
require 'manacle/constraint/method'
require 'wallace/manacle'

module Wallace
  module Manacles
    class Utc
      include ::Manacle::Constraint::Method
      include Wallace::Manacle

      def self.constrainables
        [ActiveSupport::TimeWithZone, ::Time, ::Date] 
      end

      def constraint
        :utc
      end
    end
  end
end
