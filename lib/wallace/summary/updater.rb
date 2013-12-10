require 'boundy/domain/anterior'
require 'boundy/domain/posterior'

require 'wallace/manacles/time/beginning_of_day'
require 'wallace/manacles/time/end_of_day'
require 'wallace/manacles/time/utc'

module Summary
  module Updater
    def update_range(range)
      results = query_class.new(range).run

      w = writer_class.new(results)
      w.transaction do
        w.save!
      end
    end

    def update_today
      now_pdt = Time.now.in_time_zone('America/Los_Angeles')

      update_range(Boundy::Domain::Anterior.new(
        Wallace::Manacles::Utc.proxy(
          Wallace::Manacles::BeginningOfDay.proxy(now_pdt)
        )
      )) 
    end

    def update_week_prior
      now_pdt = Time.now.in_time_zone('America/Los_Angeles')
      update_range(Boundy::Domain::Anterior.new(
        Wallace::Manacles::Utc.proxy(
          Wallace::Manacles::BeginningOfDay.proxy(now_pdt - 7.days)
        )
      )) 
    end
  end
end
